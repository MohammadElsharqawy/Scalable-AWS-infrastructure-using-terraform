
resource "aws_security_group" "sg1_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = module.network.vpc_id

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  security_group_id = aws_security_group.sg1_ssh.id
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]

}

resource "aws_security_group_rule" "allow_all_outbound_sg1" {
  type              = "egress"
  security_group_id = aws_security_group.sg1_ssh.id
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}


resource "aws_security_group" "sg2_allow_3000_and_shh_from_vpc" {
  name        = "allow_on_3000_and_shh_from_vpc"
  description = "Allow inbound traffic on port 3000 from myvpc only"
  vpc_id      = module.network.vpc_id
}


resource "aws_security_group_rule" "allow_ingress_on_3000" {
  type              = "ingress"
  security_group_id = aws_security_group.sg2_allow_3000_and_shh_from_vpc.id
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = [module.network.vpc-cidr]

}


resource "aws_security_group_rule" "allow_ssh_from_vpc" {
  type              = "ingress"
  security_group_id = aws_security_group.sg2_allow_3000_and_shh_from_vpc.id
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [module.network.vpc-cidr]
}


resource "aws_security_group" "elasticache_security_group" {
  name        = "elasticache_security_group"
  description = "Security group for ElastiCache cluster"
  vpc_id      = module.network.vpc_id

}


resource "aws_security_group_rule" "allow_redis_inbound_traffic" {
  type              = "ingress"
  security_group_id = aws_security_group.elasticache_security_group.id
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_traffic_to_all" {
  type              = "egress"
  security_group_id = aws_security_group.elasticache_security_group.id
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}
