## ---------------------------------------------------------------------------
## REGION LIST ITEM
# Create an output variable for the random zone
output "gcp_primary_region" {
  value = module.la_random_region.gcp_primary_region 
}

output "gcp_secondary_region" {
  value = module.la_random_region.gcp_secondary_region 
}

output "gcp_tertiary_region" {
  value = module.la_random_region.gcp_tertiary_region 
}
