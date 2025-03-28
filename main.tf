provider "aws" {

  region = "SA-EAST-1"  
}

resource "aws_instance" "vmtesteprint01" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t2.nano"
  
  vpc_security_group_ids = [aws_security_group.id]
  
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install nginx1 -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              echo '<h1>Eu quero ser um Printer</h1>' | sudo tee /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "Printer"
  }
}

resource "aws_security_group" "printer-sg" {
  name        = "printer-sg"
  description = "liberando acesso total"

  ingress {
    description = "acesso http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "printer-sg"
  }
}

output "public_ip" {
  value = aws_instance.printer_server.public_ip
  description = "liberacao de ip"
}