data "aws_ami" "amazon-linux-2" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}
resource "aws_instance" "app_server" {
  count                  = var.app_server_count
  ami                    = data.aws_ami.amazon-linux-2.id
  instance_type          = var.app_server_instance_type
  vpc_security_group_ids = [aws_security_group.allow-http-access.id]
  monitoring             = true
  user_data              = file("install_webserver.sh")
  tags = {
    Name = "ExampleAppServerInstance ${count.index + 1}"
  }
}

resource "aws_security_group" "allow-http-access" {
  name        = "allow-http-access"
  description = "Allow HTTP access"
  vpc_id      = "vpc-0b4ddeb3848c159cb"
  ingress {
    description = "HTTP access"
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
}
