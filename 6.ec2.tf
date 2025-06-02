
resource "aws_instance" "public-servers" {
  count                       = var.environment == "dev" || var.environment == "DEV" ? 3 : 1
  ami                         = lookup(var.imagename, var.aws_region)
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.public-subnets[*].id, count.index)
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
     {
    ignore_changes = [user_data, tags]
    #prevent_destroy = true
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
    ignore_changes = [user_data, tags]
  }
}

