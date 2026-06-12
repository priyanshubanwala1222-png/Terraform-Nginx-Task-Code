# terraform {
#   backend "s3" {
#     bucket         = "as-1-dev-bucket-priyanshu-2026086"
#     key            = "nginx-infra/terraform.tfstate"
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "terraform-state-lock" 
#   }
# }