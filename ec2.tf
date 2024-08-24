

// bastion on public subnet 1
resource "aws_instance" "bastion" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.sg1_ssh.id]
  key_name                    = aws_key_pair.deployer.key_name
  subnet_id                   = module.network.public_subnet1_id
  associate_public_ip_address = true


  user_data = <<-EOF
    #!/bin/bash
    echo '${tls_private_key.key.private_key_pem}' > /home/ubuntu/private-key.pem
    chmod 400 /home/ubuntu/private-key.pem
    EOF


  provisioner "local-exec" {
    command = "echo ${self.public_ip} > inventory"
  }



  tags = {
    Name      = "bastion"
    createdBy = "terraform"
  }
  root_block_device {
    delete_on_termination = true
  }


}



// private ec2-instance in private subnet 1

resource "aws_instance" "application1" {
  ami                    = "ami-052efd3df9dad4825"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg2_allow_3000_and_shh_from_vpc.id]
  key_name               = aws_key_pair.deployer.key_name
  subnet_id              = module.network.private_subnet1_id
  tags = {
    Name      = "application"
    createdBy = "terraform"
  }


  root_block_device {
    delete_on_termination = true
  }

}