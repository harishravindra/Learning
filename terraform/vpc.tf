######### create  a vpc ########

resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
}
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_instance" "server" {
  count = 4 
  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"
   subnet_id     = aws_subnet.main.id

  tags = {
    Name = "Server ${count.index}"
  }
}


resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow  http inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description      = "http from VPC"
    from_port        =  80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.my_vpc.cidr_block]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }
}

