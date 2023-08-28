// IAM USER
resource "aws_iam_user" "user01" {
  name = var.username
}

// IAM GROUP

resource "aws_iam_group" "group01" {
  name = var.groupname
}


//aws_iam_group_membership

resource "aws_iam_user_group_membership" "team" {
  user = aws_iam_user.user01.name

  groups = [
    aws_iam_group.group01.name,
  ]
}