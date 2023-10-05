## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------

## Firebase Project Configuration

 output "firebase_project_id" {
   value       = "${google_firebase_project.default.project}"
   description = "Firebase Project identifier."
 }
 
 output "firebase_project_number" {
   value       = "${google_firebase_project.default.project_number}"
   description = "Firebase Project number."
 }
