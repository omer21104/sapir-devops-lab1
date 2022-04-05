### submitted by Omer Zano - 315740118

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

####### dev-vpc #######
resource "aws_vpc" "dev-vpc" {
  cidr_block = "11.0.0.0/16"

  tags = {
    Env = "dev"
  }
}

####### web-tier subnet #######
resource "aws_subnet" "web-tier" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = "11.0.0.0/27"

  tags = {
    Env  = "dev"
    Name = "web-tier"
  }
}

####### app-tier subnet #######
resource "aws_subnet" "app-tier" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = "11.0.1.0/27"

  tags = {
    Env  = "dev"
    Name = "app-tier"
  }
}

####### DB-tier subnet #######
resource "aws_subnet" "DB-tier" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = "11.0.2.0/28"

  tags = {
    Env  = "dev"
    Name = "DB-tier"
  }
}
