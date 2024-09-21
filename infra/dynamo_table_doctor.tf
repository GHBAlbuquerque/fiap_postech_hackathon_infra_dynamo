resource "aws_dynamodb_table" "doctor-dynamodb-table" {
  name           = "Doctor"
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
#    name = "isActive"
#    type = "BOOL"
#  }

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

  attribute {
    name = "crm"
    type = "S"
  }

  attribute {
    name = "medicalSpecialty"
    type = "S"
  }

  global_secondary_index {
    name               = "SpecialtyIndex"
    hash_key           = "medicalSpecialty"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "INCLUDE"
    non_key_attributes = ["id"]
  }

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
    Name        = "doctor-dynamodb-table"
    Environment = "fiap-pos-tech"
  }
}