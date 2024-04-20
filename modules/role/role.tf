data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
resource "aws_iam_role" "rol_lambda" {
  name               = var.name_rol
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags = {
    Name_Recurso = "Rol_Lambda"
  }
}