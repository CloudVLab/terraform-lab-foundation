#!/usr/bin/env python3
import os
import re

def parse_tf_node(file_path):
    node = {}
    if not os.path.exists(file_path):
        return node
    
    with open(file_path, 'r') as f:
        content = f.read()
    
    kv_pattern = re.compile(r'([a-zA-Z0-9_"]+)\s*=\s*"([^"]+)"')
    
    for kv_match in kv_pattern.finditer(content):
        key = kv_match.group(1).strip('"')
        val = kv_match.group(2)
        node[key] = val
            
    return node

def get_node_display(node_data):
    if not node_data:
        return "*Not Available*"
    name = node_data.get("name", "")
    version = node_data.get("version", "")
    gcp_runtime = node_data.get("gcp_runtime", "")
    nvm_command = node_data.get("nvm_command", "")
    docker_image = node_data.get("docker_image", "")
    
    return f"`{version}`<br>_({name})_<br><br>Runtime: `{gcp_runtime}`<br>NVM: `{nvm_command}`<br>Docker: `{docker_image}`"

def main():
    base_dir = os.path.dirname(os.path.abspath(__file__))
    
    stable_path = os.path.join(base_dir, "stable", "main.tf")
    preview_path = os.path.join(base_dir, "preview", "main.tf")
    dev_path = os.path.join(base_dir, "dev", "main.tf")
    
    stable_node = parse_tf_node(stable_path)
    preview_node = parse_tf_node(preview_path)
    dev_node = parse_tf_node(dev_path)
    
    stable_disp = get_node_display(stable_node)
    preview_disp = get_node_display(preview_node)
    dev_disp = get_node_display(dev_node)
    
    lines = [
        "## Accessing Output Values",
        "",
        "This table compares the configured Node.js runtime details across the stable, preview, and development channels.",
        "",
        "| Output Field | Description | Stable Channel | Preview Channel | Dev Channel |",
        "|---|---|---|---|---|",
        f"| `node` | Node.js runtime configuration object. | {stable_disp} | {preview_disp} | {dev_disp} |",
        ""
    ]
    
    table_md = "\n".join(lines)
    
    readme_path = os.path.join(base_dir, "README.md")
    with open(readme_path, "r") as f:
        readme_content = f.read()
        
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
