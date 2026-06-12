output "s3-bucket" {
  value = aws_s3_bucket.s3_bucket.id
}

output "s3-arn" {
  value = aws_s3_bucket.s3_bucket.arn
}

output "DB" {
  value = aws_dynamodb_table.terraform_state_lock.id
}