resource "aws_dynamodb_table" "patient-dynamodb-table" {
  name           = "Patient"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "id"
  #  range_key      = "email"

  attribute {
    name = "id"
    type = "S"
  }

  #  attribute {
  #    name = "name"
  #    type = "S"
  #  }

  #  attribute {
  #    name = "birthday"
  #    type = "S"
  #  }

  attribute {
    name = "cpf"
    type = "S"
  }

  attribute {
    name = "email"
    type = "S"
  }

  #  attribute {
  #    name = "password"
  #    type = "S"
  #  }

  #  attribute {
  #    name = "contactNumber"
  #    type = "S"
  #  }

  #  attribute {
  #    name = "creationTimestamp"
  #    type = "S"
  #  }

  #  attribute {
  #    name = "updateTimestamp"
  #    type = "S"
  #  }

  #  attribute {
  #    name = "isActive"
  #    type = "BOOL"
  #  }

  global_secondary_index {
    name               = "EmailIndex"
    hash_key           = "email"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "INCLUDE"
    non_key_attributes = ["id"]
  }

  global_secondary_index {
    name               = "CpfIndex"
    hash_key           = "cpf"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "INCLUDE"
    non_key_attributes = ["id"]
  }

  tags = {
    Name        = "patient-dynamodb-table"
    Environment = "fiap-pos-tech"
  }
}