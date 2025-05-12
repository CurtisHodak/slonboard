resource "aws_instance" "test" {
    ami = "ami-058a8a5ab36292159"
    instance_type = "t2.micro"
}