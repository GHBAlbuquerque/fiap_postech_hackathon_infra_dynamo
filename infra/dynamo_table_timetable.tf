resource "aws_dynamodb_table" "timetable-dynamodb-table" {
  name           = "Timetable"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "id"
  range_key      = "doctorId"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "doctorId"
    type = "S"
  }

  #  attribute {
  #    name = "active"
  #    type = "BOOL"
  #  }

  #  attribute {
  #    name = "sunday"
  #    type = "SS"
  #  }
  #
  #  attribute {
  #    name = "monday"
  #    type = "SS"
  #  }
  #
  #  attribute {
  #    name = "tuesday"
  #    type = "SS"
  #  }
  #
  #  attribute {
  #    name = "wednesday"
  #    type = "SS"
  #  }
  #
  #  attribute {
  #    name = "thursday"
  #    type = "SS"
  #  }
  #
  #  attribute {
  #    name = "friday"
  #    type = "SS"
  #  }
  #
  #  attribute {
  #    name = "saturday"
  #    type = "SS"
  #  }

  #  attribute {
  #    name = "createdAt"
  #    type = "S"
  #  }



  tags = {
    Name        = "timetable-dynamodb-table"
    Environment = "fiap-pos-tech"
  }
}