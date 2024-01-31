resource "aws_security_group" "sg" {
  name        = "my security group"
  description = "Security group for Nginx"

  dynamic "ingress" {
    for_each = [80, 22]
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}


resource "aws_instance" "test" {
  ami             = "ami-0287a05f0ef0e9d9a"
  key_name        = "ec2_instance_keypair"
  vpc_security_group_ids = [aws_security_group.sg.id]
  
  instance_type = "t2.micro"
  user_data     = file("modules/EC2/user_data.sh")
  tags = {
    Name = "myTFInstance"
  }
}
