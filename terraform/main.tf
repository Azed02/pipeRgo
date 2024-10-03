resource "aws_instance" "infra-instance" {
    ami           = "ami-0c94855ba95c71c99"
    instance_type = "t2.micro"
    key_name               = "key"
    subnet_id     = data.aws_subnet.default.id
    security_groups = [ aws_security_group.instance-sg.id ]
    associate_public_ip_address = true

    tags = {
    Name = "MyInstance"
  }
}

resource "aws_security_group" "instance-sg" {
    name        = "instance-sg"
    vpc_id      = data.aws_vpc.default.id

    ingress {
        from_port   = 22         
        to_port     = 22         
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1" 
        cidr_blocks = ["0.0.0.0/0"]
    }
    }