variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "EC2 Key Pair"
  type        = string
}

variable "username" {
  description = "Linux username"
  type        = string
}

variable "public_key" {
  description = "SSH public key"
  type        = string
}

variable "instance_name" {
  description = "EC2 Name tag"
  type        = string
}
