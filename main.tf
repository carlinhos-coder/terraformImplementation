
# Crear un grupo de seguridad para la instancia EC2
resource "aws_security_group" "api_sg" {
  name        = "api-security-group"
  description = "Permitir trafico HTTP y SSH"

  ingress {
    from_port   = var.api_port
    to_port     = var.api_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permitir acceso HTTP desde cualquier lugar
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Crear la instancia EC2
resource "aws_instance" "api_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [aws_security_group.api_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install docker git -y
              sudo service docker start
              sudo usermod -a -G docker ec2-user

              # Construir y ejecutar la imagen Docker
              docker build -t 1835003/ms-coupons-solve .
              docker run -d -p 8080:8080 1835003/ms-coupons-solve
              EOF

  tags = {
    Name = "API-Instance"
  }
}

