resource "aws_iam_policy" "s3_readonly" {
  name        = "s3_readonly_access"
  path        = "/"
  description = "S3 Readonly access policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:Get*",
        "s3:List*"
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