#!/usr/bin/env python3
import os
import re

def parse_tf_db(file_path):
    db_versions = {}
    if not os.path.exists(file_path):
        return db_versions
    
    with open(file_path, 'r') as f:
        content = f.read()
    
    databases_match = re.search(r'databases\s*=\s*\{(.*)\}', content, re.DOTALL)
    if not databases_match:
        return db_versions
    
    databases_content = databases_match.group(1)
    
    block_pattern = re.compile(r'([a-zA-Z0-9_]+)\s*=\s*\{[^}]*?name\s*=\s*"([^"]+)"[^}]*?version\s*=\s*"([^"]+)"[^}]*?\}', re.DOTALL)
    
    for match in block_pattern.finditer(databases_content):
        key = match.group(1)
        name = match.group(2)
        version = match.group(3)
        db_versions[key] = {
            "name": name,
            "version": version
        }
        
    return db_versions


def get_db_display(db_data):
    if not db_data:
        return "*Not Available*"
    name = db_data.get("name", "")
    version = db_data.get("version", "")
    return f"`{version}`<br>_({name})_"

def main():
    base_dir = os.path.dirname(os.path.abspath(__file__))
    
    stable_path = os.path.join(base_dir, "stable", "main.tf")
    preview_path = os.path.join(base_dir, "preview", "main.tf")
    dev_path = os.path.join(base_dir, "dev", "main.tf")
    
    stable_db = parse_tf_db(stable_path)
    preview_db = parse_tf_db(preview_path)
    dev_db = parse_tf_db(dev_path)
    
    # Collect all unique keys in alphabetical order
    all_keys = list(set(list(stable_db.keys()) + list(preview_db.keys()) + list(dev_db.keys())))
    all_keys.sort()
    
    # Generate markdown table
    lines = [
        "## Accessing Output Values",
        "",
        "This table compares the configured `name` and `version` across the stable, preview, and development channels.",
        "",
        "| Output Field | Description | Stable Channel | Preview Channel | Dev Channel |",
        "|---|---|---|---|---|"
    ]
    
    # We can also document the full map output
    lines.append("| `db_versions` | A map of all configured database versions. | *Full Map* | *Full Map* | *Full Map* |")
    
    for key in all_keys:
        desc = f"{key.replace('_', ' ').title()} database version details."
        # Keep acronyms nice
        desc = desc.replace("Mysql", "MySQL").replace("Postgres", "PostgreSQL").replace("Sqlserver", "SQL Server")
        
        stable_disp = get_db_display(stable_db.get(key))
        preview_disp = get_db_display(preview_db.get(key))
        dev_disp = get_db_display(dev_db.get(key))
        
        lines.append(f"| `{key}` | {desc} | {stable_disp} | {preview_disp} | {dev_disp} |")
        
    lines.append("") # Add a trailing newline
    table_md = "\n".join(lines)
    
    readme_path = os.path.join(base_dir, "README.md")
    with open(readme_path, "r") as f:
        readme_content = f.read()
        
    # Replace the section between "## Accessing Output Values" and "## Adding a Commit"
    pattern = re.compile(r"## Accessing Output Values\n.*?\n(?=## Adding a Commit)", re.DOTALL)
    
    if pattern.search(readme_content):
        new_content = pattern.sub(table_md, readme_content)
        with open(readme_path, "w") as f:
            f.write(new_content)
        print("README.md table updated successfully!")
    else:
        print("Could not find correct placeholder headers in README.md to update.")

if __name__ == "__main__":
    main()
