variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "Nombre de la clave SSH para acceder a la instancia"
  default     = "keyPairCoupons"
}

variable "ami_id" {
  description = "ID de la AMI para la instancia (por ejemplo, Amazon Linux 2)"
  default     = "ami-0166fe664262f664c"
}

variable "github_repository" {
  description = "URL del repositorio GitHub"
  default     = "https://github.com/carlinhos-coder/ms-coupons-solver.git"
}

variable "api_port" {
  description = "Puerto en el que la API escuchará"
  default     = 8080
}
