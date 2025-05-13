data "aws_ami" "my_custom_ami" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["manoj"]
  }
}

output "found_ami_id" {
  value = data.aws_ami.my_custom_ami.id
}


resource "aws_instance" "web-1" {
  ami = "ami-0d98e5e498bdaa6a2"
  #availability_zone = "us-east-1a" # no need as we have already given the subnet
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name  = "Server-1"
    Env   = var.environment
    Owner = var.owner
  }
  user_data = <<-EOF
		    #!/bin/bash
        sudo apt-get update
        sudo apt-get install -y nginx jq net-tools unzip
        echo "<h1>$(cat /etc/hostname)</h1>" | sudo tee -a /var/www/html/index.nginx-debian.html
    EOF
  lifecycle {
    ignore_changes = [ user_data ]
  }
}

resource "aws_instance" "web-2" {
  ami                         = data.aws_ami.my_custom_ami.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.subnet2-public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name  = "Server-2"
    Env   = var.environment
    Owner = var.owner
  }
  user_data = <<-EOF
		    #!/bin/bash
        sudo apt-get update
        sudo apt-get install -y nginx jq net-tools unzip
        echo "<h1>$(cat /etc/hostname)</h1>" | sudo tee -a /var/www/html/index.nginx-debian.html
    EOF
  lifecycle {
    ignore_changes = [ user_data ]
  }
}