resource "aws_iam_policy" "s3_full" {
  name        = "s3_full_access"
  path        = "/"
  description = "S3 Full access policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.user_data.arn}",
        "${aws_s3_bucket.user_data.arn}/*"
      ]
        
    }
  ]
}
EOF
}