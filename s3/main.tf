# resource "aws_s3_bucket" "s3_bucket" {
#  bucket = var.s3-bucket-name

#  lifecycle {
 #   prevent_destroy = false # false to delete
 # }

  #tags = {
   # Name        = "s3-bucket-as-2"
    #Environment = "Dev"
  #}
#}

#resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  #bucket = aws_s3_bucket.s3_bucket.id
  #versioning_configuration {
    #status = "Enabled"
  #}
#}

#resource "aws_s3_bucket_public_access_block" "tf_state_pab" {
  #bucket                  = aws_s3_bucket.s3_bucket.id
  #block_public_acls       = true
  #ignore_public_acls      = true
  #block_public_policy     = true
  #restrict_public_buckets = true
#}

#resource "aws_dynamodb_table" "terraform_state_lock" {
  #name         = "terraform-state-lock"
  #billing_mode = "PAY_PER_REQUEST"
  #hash_key     = "LockID"

  #attribute {
   # name = "LockID"
    #type = "S"
  #}

  #tags = {
   # Name        = "terraform-state-lock"
    #Environment = "Dev"
  #}
#}

# resource "aws_iam_user" "user-task-2" {
#   name = "task-2-User"

#   tags = {
#     tag-key = "task-2"
#   }
# }

# data "aws_iam_policy_document" "s3_access_document" {
#   statement {
#     effect = "Allow"
    
#     actions = [
#       "s3:ListBucket",
#       "s3:GetObject",
#       "s3:PutObject"
#     ]

#     resources = [
#       aws_s3_bucket.s3_bucket.arn,
#       "${aws_s3_bucket.s3_bucket.arn}/*"
#     ]
#   }
# }

# resource "aws_iam_policy" "s3_access_policy" {
#   name        = "S3BucketAccessPolicy"
#   description = "Grants read and write access to the specific app S3 bucket"
#   policy      = data.aws_iam_policy_document.s3_access_document.json
# }

# resource "aws_iam_user_policy_attachment" "task2-attach" {
#   user       = aws_iam_user.user-task-2.name
#   policy_arn = aws_iam_policy.s3_access_policy.arn 
# }
