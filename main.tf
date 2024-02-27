provider "aws" {
  region = "eu-west-2"  # Change this to your desired region
  # access_key = var.AWS_ACCESS_KEY_ID # removed this as this is already determined in the pipeline
  # secret_key = var.AWS_SECRET_ACCESS_KEY # removed this as this is already determined in the pipeline
}

resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "example_subnet" {
  vpc_id     = aws_vpc.example_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-2a"  # Change this to your desired availability zone
  depends_on = [aws_vpc.example_vpc]
}