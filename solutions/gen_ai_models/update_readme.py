#!/usr/bin/env python3
import os
import re

def parse_tf_models(file_path):
    models = {}
    if not os.path.exists(file_path):
        return models
    
    with open(file_path, 'r') as f:
        content = f.read()
    
    block_pattern = re.compile(r'"([^"]+)"\s*=\s*\{([^}]+)\}', re.DOTALL)
    kv_pattern = re.compile(r'"([^"]+)"\s*=\s*"([^"]+)"')
    
    for block_match in block_pattern.finditer(content):
        key = block_match.group(1)
        inner_content = block_match.group(2)
        
        model_data = {}
        for kv_match in kv_pattern.finditer(inner_content):
            model_data[kv_match.group(1)] = kv_match.group(2)
        
        if model_data:
            models[key] = model_data
            
    return models

def get_model_display(model_data):
    if not model_data:
        return "*Not Available*"
    model_id = model_data.get("model_id", "")
    model_name = model_data.get("model_name", "")
    return f"`{model_id}`<br>_({model_name})_"

def main():
    base_dir = os.path.dirname(os.path.abspath(__file__))
    
    stable_path = os.path.join(base_dir, "stable", "main.tf")
    preview_path = os.path.join(base_dir, "preview", "main.tf")
    dev_path = os.path.join(base_dir, "dev", "main.tf")
    
    stable_models = parse_tf_models(stable_path)
    preview_models = parse_tf_models(preview_path)
    dev_models = parse_tf_models(dev_path)
    
    # Collect all unique keys in a deterministic order
    keys_order = [
        "models",
        "gemini_pro",
        "gemini_pro_image",
        "gemini_flash",
        "gemini_flash_lite",
        "gemini_flash_image",
        "gemini_flash_live",
        "gemini_embedding",
        "multimodal_embedding",
        "text_embedding"
    ]
    
    all_keys = list(set(list(stable_models.keys()) + list(preview_models.keys()) + list(dev_models.keys())))
    # Sort by keys_order first, then alphabetically for any others
    all_keys.sort(key=lambda k: keys_order.index(k) if k in keys_order else len(keys_order) + all_keys.index(k))
    # Ensure 'models' is always the first element in the table
    all_keys = ["models"] + all_keys
    
    # Key descriptions
    descriptions = {
        "models": "A map of all available Generative AI models.",
        "gemini_pro": "Gemini Pro model details.",
        "gemini_pro_image": "Gemini Pro Image model details.",
        "gemini_flash": "Gemini Flash model details.",
        "gemini_flash_lite": "Gemini Flash Lite model details.",
        "gemini_flash_image": "Gemini Flash Image model details.",
        "gemini_flash_live": "Gemini Flash Native Audio model details.",
        "gemini_embedding": "Gemini Embedding model details.",
        "multimodal_embedding": "Embeddings for Multimodal model details.",
        "text_embedding": "Text Embedding model details."
    }
    
    # Generate markdown table
    lines = [
        "## Accessing Output Values",
        "",
        "This table compares the configured `model_id` and `model_name` across the stable, preview, and development channels.",
        "",
        "| Output Field | Description | Stable Channel | Preview Channel | Dev Channel |",
        "|---|---|---|---|---|"
    ]
    
    for key in all_keys:
        if key == "models":
            # The 'models' key itself is the map containing everything, so display special description
            lines.append(f"| `models` | {descriptions.get(key, '')} | *Full Map* | *Full Map* | *Full Map* |")
            continue
            
        desc = descriptions.get(key, f"{key.replace('_', ' ').title()} details.")
        stable_disp = get_model_display(stable_models.get(key))
        preview_disp = get_model_display(preview_models.get(key))
        dev_disp = get_model_display(dev_models.get(key))
        
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
