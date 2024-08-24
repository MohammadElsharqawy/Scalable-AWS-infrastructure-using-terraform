# Creating subnet groups
resource "aws_elasticache_subnet_group" "elasticahe_subnet_group" {
  name = "elasticahe-subnet-group"
  subnet_ids = [
    module.network.private_subnet1_id,
    module.network.private_subnet2_id
  ]

  tags = {
    Name = "Elasticahe Private Subnet Group"
  }
}

# Create the ElastiCache cluster
resource "aws_elasticache_cluster" "redis_cluster" {
  cluster_id           = "elsharq-redis-cluster"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"
  engine_version       = "7.1"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.elasticahe_subnet_group.name

  security_group_ids = [aws_security_group.elasticache_security_group.id]
}


