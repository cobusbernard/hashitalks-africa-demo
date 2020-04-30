resource "aws_iam_user" "bob" {
  name = "bob"
  path = "/users/"
}

resource "aws_iam_user_group_membership" "bob_developers" {
  user = aws_iam_user.bob.name

  groups = [
    aws_iam_group.developers.name
  ]
}

resource "aws_iam_user" "cobus" {
  name = "cobus"
  path = "/users/"
}

resource "aws_iam_user_group_membership" "cobus_developers" {
  user = aws_iam_user.cobus.name

  groups = [
    aws_iam_group.developers.name
  ]
}