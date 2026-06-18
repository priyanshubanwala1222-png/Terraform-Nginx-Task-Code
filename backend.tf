 terraform {
   backend "s3" {
     bucket         = "demo-26--bucket-priyanshu-2026069"
     key            = "nginx-infra/terraform.tfstate"
     region         = "us-east-1"
     encrypt        = true
     dynamodb_table = "terraform-state-lock" 
   }
}
