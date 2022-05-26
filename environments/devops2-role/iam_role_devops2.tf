# Allow IAM users from the main account to access this role

# This temporary deveops2 role
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

# add full_access i.e. create devops2 role with full_access policy
resource "aws_iam_role_policy_attachment" "test_dev_full" {
  count      = terraform.workspace == "test" ? 1 : 0
  role       = aws_iam_role.developers.name
  policy_arn = aws_iam_policy.full.arn
}