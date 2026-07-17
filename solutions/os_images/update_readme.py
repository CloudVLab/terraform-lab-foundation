#!/usr/bin/env python3
import os
import re

def parse_tf_images(file_path):
    images = {}
    if not os.path.exists(file_path):
        return images
    
    with open(file_path, 'r') as f:
        content = f.read()
    
    block_pattern = re.compile(r'"([^"]+)"\s*=\s*\{([^}]+)\}', re.DOTALL)
    kv_pattern = re.compile(r'"([^"]+)"\s*=\s*"([^"]+)"')
    
    for block_match in block_pattern.finditer(content):
        key = block_match.group(1)
        inner_content = block_match.group(2)
        
        image_data = {}
        for kv_match in kv_pattern.finditer(inner_content):
            image_data[kv_match.group(1)] = kv_match.group(2)
        
        if image_data:
            images[key] = image_data
            
    return images

def get_image_display(image_data):
    if not image_data:
        return "*Not Available*"
    image_id = image_data.get("image_id_short", "")
    image_name = image_data.get("image_name_short", "")
    image_id_long = image_data.get("image_id_long", "")
    image_name_long = image_data.get("image_name_long", "")
    
    display = ""
    if image_id and image_name:
        display += f"`{image_id}`<br>_({image_name})_"
    if image_id_long and image_name_long:
        if display:
            display += "<br><br>"
        display += f"`{image_id_long}`<br>_({image_name_long})_"
    return display if display else "*Not Available*"

def main():
    base_dir = os.path.dirname(os.path.abspath(__file__))
    
    stable_path = os.path.join(base_dir, "stable", "main.tf")
    preview_path = os.path.join(base_dir, "preview", "main.tf")
    dev_path = os.path.join(base_dir, "dev", "main.tf")
    
    stable_images = parse_tf_images(stable_path)
    preview_images = parse_tf_images(preview_path)
    dev_images = parse_tf_images(dev_path)
    keys_order = [
        "os_images",
        "debian"
    ]
    
    all_keys = list(set(list(stable_images.keys()) + list(preview_images.keys()) + list(dev_images.keys())))
    
    # Sort by keys_order first, then alphabetically for any others
    ordered_keys = [k for k in keys_order if k in all_keys]
    other_keys = [k for k in all_keys if k not in keys_order]
    other_keys.sort()
    all_keys = ordered_keys + other_keys
    
    # Key descriptions
    descriptions = {
        "os_images": "A map of all configured OS images.",
        "debian": "Debian OS image details."
    }
    
    # Generate markdown table
    lines = [
        "## Accessing Output Values",
        "",
        "This table compares the configured `image_id_short`, `image_name_short`, `image_id_long`, and `image_name_long` across the stable, preview, and development channels.",
        "",
        "| Output Field | Description | Stable Channel | Preview Channel | Dev Channel |",
        "|---|---|---|---|---|"
    ]
    
    for key in all_keys:
        if key == "os_images":
            # The 'os_images' key itself is the map containing everything, so display special description
            lines.append(f"| `os_images` | {descriptions.get(key, '')} | *Full Map* | *Full Map* | *Full Map* |")
            continue
            
        desc = descriptions.get(key, f"{key.replace('_', ' ').title()} details.")
        stable_disp = get_image_display(stable_images.get(key))
        preview_disp = get_image_display(preview_images.get(key))
        dev_disp = get_image_display(dev_images.get(key))
        
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
