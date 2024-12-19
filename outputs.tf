output "instance_public_ip" {
  value = aws_instance.api_instance.public_ip
}

output "api_url" {
  value = "http://${aws_instance.api_instance.public_ip}:${var.api_port}"
}
