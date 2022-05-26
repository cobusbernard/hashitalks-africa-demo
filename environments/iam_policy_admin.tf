resource "aws_iam_policy" "full" {
  name        = "full_access"
  path        = "/"
  description = "Full access policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "*",
      "Resource": "*",
      "Effect": "Allow"
    }
  ]
}
EOF
}