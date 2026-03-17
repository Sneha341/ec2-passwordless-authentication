resource "aws_instance" "ec2_server" {

  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  user_data = templatefile("${path.module}/user_data.sh", {
    username   = var.username
    public_key = var.public_key
  })

  tags = {
    Name = var.instance_name
  }
}
