resource "aws_iam_policy" "assume_env_developer_role" {
  count       = length(var.aws_account_ids)
  name        = "assume_${element(keys(var.aws_account_ids), count.index)}_env_developer_role"
  path        = "/"
  description = "Allows assuming the developer role in the ${element(keys(var.aws_account_ids), count.index)} environment"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Resource": "arn:aws:iam::${lookup(var.aws_account_ids, element(keys(var.aws_account_ids), count.index))}:role/developers"
    }
  ]
}
EOF
}