module "workstation" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "workstation"
  ami = data.aws_ami.DevOps-Practice.id

  instance_type          = "t3.micro"
  vpc_security_group_ids = [var.sg_id]
  subnet_id              = var.public_subnet_id
  user_data = file("workstation.sh")

  root_block_device = [
    {
      volume_size = 50          # Size in GiB
      volume_type = "gp3"       # Recommended general purpose volume type
      delete_on_termination = true
    }
  ]

  tags = {
    Name = "workstation"
  }
}