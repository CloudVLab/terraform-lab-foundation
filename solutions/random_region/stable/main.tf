## Create a randomised region list

# Define a random string to use as the seed for the shuffle
resource "random_string" "shuffle_seed" {
  length = 16
  lower  = false
}

## ---------------------------------------------------------------------------
# Define a random shuffle using the list of allowed_regions variable
resource "random_shuffle" "custom_regions" {
  input = var.gcp_allowed_locations
  seed = random_string.shuffle_seed.result 
}

## ---------------------------------------------------------------------------
# Create a filtered zone list - minus the current QL allocated zone
# Two options presented:
# Option 1 - Loop and remove the QL allocated region
# Option 2 - Set subtract the QL allocated region
locals {
  # Option 1. For Loop - Create a List 
  filtered_regions =  [
    # for region in var.gcp_allowed_locations:
    for region in random_shuffle.custom_regions.result:
      region if region != var.gcp_region
  ]

  # Option 2. setsubtract - Create a List
  filtered_regions2 = setsubtract(random_shuffle.custom_regions.result, [var.gcp_region])
}
