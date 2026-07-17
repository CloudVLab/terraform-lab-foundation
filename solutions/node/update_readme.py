#!/usr/bin/env python3
import os
import re

def parse_tf_node(file_path):
    node = {}
    if not os.path.exists(file_path):
        return node
    
    with open(file_path, 'r') as f:
        content = f.read()
    
    block_pattern = re.compile(r'"?([^"\s=]+)"?\s*=\s*\{([^}]+)\}', re.DOTALL)
    kv_pattern = re.compile(r'"?([^"\s=]+)"?\s*=\s*"([^"]+)"')
    
    for block_match in block_pattern.finditer(content):
        key = block_match.group(1)
        inner_content = block_match.group(2)
        
        node_data = {}
        for kv_match in kv_pattern.finditer(inner_content):
            node_data[kv_match.group(1)] = kv_match.group(2)
        
        if node_data:
            node[key] = node_data
            
    return node

def get_node_display(node_data):
    if not node_data:
        return "*Not Available*"
    name = node_data.get("name", "")
    version = node_data.get("version", "")
    command = node_data.get("command", "")
    return f"`{version}`<br>_({name})_<br><br>`{command}`"

def main():
    base_dir = os.path.dirname(os.path.abspath(__file__))
    
    stable_path = os.path.join(base_dir, "stable", "main.tf")
    preview_path = os.path.join(base_dir, "preview", "main.tf")
    dev_path = os.path.join(base_dir, "dev", "main.tf")
    
    stable_node = parse_tf_node(stable_path)
    preview_node = parse_tf_node(preview_path)
    dev_node = parse_tf_node(dev_path)
    
    all_keys = list(set(list(stable_node.keys()) + list(preview_node.keys()) + list(dev_node.keys())))
    all_keys.sort()
    # Ensure 'node' is always the first element in the table
    if "node" in all_keys:
        all_keys = ["node"] + [k for k in all_keys if k != "node"]
    
    # Key descriptions
    descriptions = {
        "node": "A map of all available node details."
    }
    
    # Generate markdown table
    lines = [
        "## Accessing Output Values",
        "",
        "This table compares the configured `name`, `version`, and `command` across the stable, preview, and development channels.",
        "",
        "| Output Field | Description | Stable Channel | Preview Channel | Dev Channel |",
        "|---|---|---|---|---|"
    ]
    
    for key in all_keys:
        if key == "node":
            # The 'node' key itself is the map containing everything, so display special description
            lines.append(f"| `node` | {descriptions.get(key, '')} | *Full Map* | *Full Map* | *Full Map* |")
            continue
            
        desc = descriptions.get(key, f"{key.replace('_', ' ').title()} details.")
        stable_disp = get_node_display(stable_node.get(key))
        preview_disp = get_node_display(preview_node.get(key))
        dev_disp = get_node_display(dev_node.get(key))
        
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
