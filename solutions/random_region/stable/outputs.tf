## ---------------------------------------------------------------------------
## REGION LIST ITEM
# Create an output variable for the random zone
output "gcp_primary_region" {
  value = var.gcp_region 
}

output "gcp_secondary_region" {
  value = element(local.filtered_regions, 0)
}

output "gcp_tertiary_region" {
  value = element(local.filtered_regions, 1)
}

## ---------------------------------------------------------------------------
## REGION LISTS
# Create an output variable for filtered_zones list
output "gcp_region_list" {
  value = local.filtered_regions
}

# Create an output variable for filtered_zones list
output "gcp_region_list2" {
  value = local.filtered_regions2
}
