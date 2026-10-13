resource "aws_dynamodb_table" "server_db" {
    name = "${var.env}-infra-table"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = var.hash_key

    attribute {
      name = var.hash_key
      type = "S"
    }

    tags = {
      Name = "${var.env}-state-table"
      env = "${var.env}"
    }
}