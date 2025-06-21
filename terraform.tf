terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.7.1"
    }
  }
}

provider "random" {}

resource "random_id" "example" {
  byte_length = 8
  count = 10
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
  count = 10
}

resource "random_pet" "example" {
  length    = 2
  separator = "-"
  count = 10
}

output "random_id_example" {
  value = random_id.example.hex
}

output "random_password" {
  value     = random_password.password.result
  sensitive = true
}

output "random_pet" {
  value = random_pet.example.id
}

/*resource "aws_db_instance" "example" {
  instance_class    = "db.t3.micro"
  allocated_storage = 64
  engine            = "mysql"
  username          = "someone"
  password          = random_password.password.result
}*/
