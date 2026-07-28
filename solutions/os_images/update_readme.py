#!/usr/bin/env python3
import os
import re

def parse_tf_images(file_path):
    images = {}
    if not os.path.exists(file_path):
        return images
    
    with open(file_path, 'r') as f:
        content = f.read()
    
    os_images_match = re.search(r'os_images\s*=\s*\{(.*)\}', content, re.DOTALL)
    if not os_images_match:
        return images
    
    inner_content = os_images_match.group(1)
    
    block_pattern = re.compile(r'([a-zA-Z0-9_"]+)\s*=\s*\{([^}]+)\}', re.DOTALL)
    kv_pattern = re.compile(r'([a-zA-Z0-9_"]+)\s*=\s*"([^"]+)"')
    
    for block_match in block_pattern.finditer(inner_content):
        key = block_match.group(1).strip('"')
        block_body = block_match.group(2)
        
        image_data = {}
        for kv_match in kv_pattern.finditer(block_body):
            image_data[kv_match.group(1).strip('"')] = kv_match.group(2)
        
        if image_data:
            images[key] = image_data
            
    return images

def get_image_display(image_data):
    if not image_data:
        return "*Not Available*"
    image_id = image_data.get("image_id_short", "")
    image_name = image_data.get("image_name_short", "")
    
    if image_id and image_name:
        return f"`{image_id}`<br>_({image_name})_"
    return "*Not Available*"

def main():
    base_dir = os.path.dirname(os.path.abspath(__file__))
    
    stable_path = os.path.join(base_dir, "stable", "main.tf")
    preview_path = os.path.join(base_dir, "preview", "main.tf")
    dev_path = os.path.join(base_dir, "dev", "main.tf")
    
    stable_images = parse_tf_images(stable_path)
    preview_images = parse_tf_images(preview_path)
    dev_images = parse_tf_images(dev_path)
    
    all_keys = list(set(list(stable_images.keys()) + list(preview_images.keys()) + list(dev_images.keys())))
    all_keys.sort()
    
    descriptions = {
        "os_images": "A map of all configured OS images.",
        "centos": "CentOS OS image details.",
        "debian": "Debian OS image details.",
        "ubuntu": "Ubuntu OS image details.",
        "windows": "Windows Server OS image details."
    }
    
    lines = [
        "## Accessing Output Values",
        "",
        "This table compares the configured `image_id_short` and `image_name_short` across the stable, preview, and development channels.",
        "",
        "| Output Field | Description | Stable Channel | Preview Channel | Dev Channel |",
        "|---|---|---|---|---|",
        "| `os_images` | A map of all configured OS images. | *Full Map* | *Full Map* | *Full Map* |"
    ]
    
    for key in all_keys:
        desc = descriptions.get(key, f"{key.replace('_', ' ').title()} OS image details.")
        stable_disp = get_image_display(stable_images.get(key))
        preview_disp = get_image_display(preview_images.get(key))
        dev_disp = get_image_display(dev_images.get(key))
        
        lines.append(f"| `{key}` | {desc} | {stable_disp} | {preview_disp} | {dev_disp} |")
        
    lines.append("")
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
