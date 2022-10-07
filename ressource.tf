resource "aws_instance" "app_server" {
  ami           = "ami-05ff5eaef6149df49"
  instance_type = "t2.micro"
  monitoring    = true
  tags = {
    Name = "ExampleAppServerInstance"
  }
}
