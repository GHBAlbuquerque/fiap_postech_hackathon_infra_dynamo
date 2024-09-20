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

  attribute {
    name = "sunday"
    type = "SS"
  }

  attribute {
    name = "monday"
    type = "SS"
  }

  attribute {
    name = "tuesday"
    type = "SS"
  }

  attribute {
    name = "wednesday"
    type = "SS"
  }

  attribute {
    name = "thursday"
    type = "SS"
  }

  attribute {
    name = "friday"
    type = "SS"
  }

  attribute {
    name = "saturday"
    type = "SS"
  }

  #  attribute {
  #    name = "createdAt"
  #    type = "S"
  #  }

  global_secondary_index {
    name               = "TimetableMondayIndex"
    hash_key           = "doctorId"
    range_key          = "monday"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "INCLUDE"
    non_key_attributes = ["id"]
  }

  global_secondary_index {
    name               = "TimetableTuesdayIndex"
    hash_key           = "doctorId"
    range_key          = "tuesday"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "INCLUDE"
    non_key_attributes = ["id"]
  }

  global_secondary_index {
    name               = "TimetableWednesdayIndex"
    hash_key           = "doctorId"
    range_key          = "wednesday"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "INCLUDE"
    non_key_attributes = ["id"]
  }

  global_secondary_index {
    name               = "TimetableThursdayIndex"
    hash_key           = "doctorId"
    range_key          = "thursday"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "INCLUDE"
    non_key_attributes = ["id"]
  }

  global_secondary_index {
    name               = "TimetableFridayIndex"
    hash_key           = "doctorId"
    range_key          = "friday"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "INCLUDE"
    non_key_attributes = ["id"]
  }

  global_secondary_index {
    name               = "TimetableSaturdayIndex"
    hash_key           = "doctorId"
    range_key          = "friday"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "INCLUDE"
    non_key_attributes = ["id"]
  }

  tags = {
    Name        = "timetable-dynamodb-table"
    Environment = "fiap-pos-tech"
  }
}