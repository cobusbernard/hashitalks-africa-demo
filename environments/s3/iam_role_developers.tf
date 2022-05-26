# Allow IAM users from the main account to access this role
resource "aws_iam_role" "developers" {
  name = "devops2"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS" : "arn:aws:iam::333438771545:user/amit"
      },
      "Action": "sts:AssumeRole",
      "Condition": {}
    }
  ]
}
EOF
}

# Dev permissions
resource "aws_iam_role_policy_attachment" "developer_dev_s3_full" {
  count      = terraform.workspace == "dev" ? 1 : 0
  role       = aws_iam_role.developers.name
  policy_arn = aws_iam_policy.s3_full.arn
}

# Test permissions
resource "aws_iam_role_policy_attachment" "test_dev_s3_full" {
  count      = terraform.workspace == "test" ? 1 : 0
  role       = aws_iam_role.developers.name
  policy_arn = aws_iam_policy.s3_full.arn
}

# Test add full_access
resource "aws_iam_role_policy_attachment" "test_dev_full" {
  count      = terraform.workspace == "test" ? 1 : 0
  role       = aws_iam_role.developers.name
  policy_arn = aws_iam_policy.full.arn
}
# UAT permissions
resource "aws_iam_role_policy_attachment" "uat_dev_s3_readonly" {
  count      = terraform.workspace == "uat" ? 1 : 0
  role       = aws_iam_role.developers.name
  policy_arn = aws_iam_policy.s3_readonly.arn
}

# Prod permissions
# No special permissions