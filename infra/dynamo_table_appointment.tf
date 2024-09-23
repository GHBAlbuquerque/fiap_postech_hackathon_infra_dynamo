resource "aws_dynamodb_table" "appointment-dynamodb-table" {
  name           = "Appointment"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "doctorId"
    type = "S"
  }

  attribute {
    name = "patientId"
    type = "S"
  }

  attribute {
    name = "date"
    type = "S"
  }

#  attribute {
#    name = "timeSlot"
#    type = "S"
#  }

  #  attribute {
  #    name = "createdAt"
  #    type = "S"
  #  }

  global_secondary_index {
    name               = "AppointmentPatientIdIndex"
    hash_key           = "patientId"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "INCLUDE"
    non_key_attributes = ["id"]
  }

  global_secondary_index {
    name               = "AppointmentDoctorIdIndex"
    hash_key           = "doctorId"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "INCLUDE"
    non_key_attributes = ["id"]
  }

  global_secondary_index {
    name               = "AppointmentDoctorIdDateIndex"
    hash_key           = "doctorId"
    range_key          = "date"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "INCLUDE"
    non_key_attributes = ["id"]
  }

  tags = {
    Name        = "appointment-dynamodb-table"
    Environment = "fiap-pos-tech"
  }
}