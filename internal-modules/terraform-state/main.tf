resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.bucket-name}-${var.appenv}"
  
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "versioning_s3_bucket" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "${var.dynamodb-name}-${var.appenv}"
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.dynamodb-hashkey

  attribute {
    name = var.dynamodb-hashkey
    type = var.dynamodb-type
  }
}

resource "aws_s3_bucket_policy" "terraform_state" {
  bucket = "${aws_s3_bucket.terraform_state.id}"
  policy =<<EOF
{
  "Version": "2012-10-17",
  "Id": "RequireEncryption",
   "Statement": [
    {
      "Sid": "RequireEncryptedTransport",
      "Effect": "Deny",
      "Action": ["s3:*"],
      "Resource": ["arn:aws:s3:::${aws_s3_bucket.terraform_state.bucket}/*"],
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
        }
      },
      "Principal": "*"
    },
    {
      "Sid": "RequireEncryptedStorage",
      "Effect": "Deny",
      "Action": ["s3:PutObject"],
      "Resource": ["arn:aws:s3:::${aws_s3_bucket.terraform_state.bucket}/*"],
      "Condition": {
        "StringNotEquals": {
          "s3:x-amz-server-side-encryption": "AES256"
        }
      },
      "Principal": "*"
    }
  ]
}
EOF
}