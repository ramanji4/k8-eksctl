module "workstation" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "workstation"
  ami = data.aws_ami.DevOps-Practice.id

  instance_type          = "t3.micro"
  vpc_security_group_ids = [var.sg_id]
  subnet_id              = var.public_subnet_id
  user_data = file("workstation.sh") 

  tags = {
    Name = "workstation"
  }
}