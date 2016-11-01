#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-d56fbc8e
#
# Your security group ID is:
#
#     sg-57e40c2a
#
# Your AMI ID is:
#
#     ami-c9580bde
#
# Your Identity is:
#
#     datapipe-toucan
#

variable aws_access_key {}

variable aws_secret_key {}

variable aws_region {
  default = "us-east-1"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-east-1"
}

resource "aws_instance" "web" {
  ami                    = "ami-c9580bde"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-d56fbc8e"
  vpc_security_group_ids = ["sg-57e40c2a"]

  tags {
    Identity = "datapipe-toucan"
    NewTag1  = "this-is-another-tag"
    NewTag2  = "this is an example using spaces"
  }

  count = "1"
}

output "public_ip" {
  value = ["${aws_instance.web.*.public_ip}"]
}

output "public_dns" {
  value = ["${aws_instance.web.*.public_dns}"]
}
