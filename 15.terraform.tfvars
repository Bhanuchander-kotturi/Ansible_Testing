aws_region           = "us-west-2"
vpc_cidr             = "172.31.0.0/16"
vpc_name             = "Ansible-Vpc"
key_name             = "keypacker"
public_subnet_cidrs  = ["172.31.1.0/20", "172.31.2.0/20", "172.31.3.0/20"]    #List
private_subnet_cidrs = ["172.31.10.0/20", "172.31.20.0/20", "172.31.30.0/20"] #List
azs                  = ["us-west-2a", "us-west-2b", "us-west-2c"]             #List
environment          = "production"
instance_type = {
  development = "t2.small"
  testing     = "t2.small"
  production  = "t2.small"
}
amis = {
  us-west-2 = "ami-00c257e12d6828491" # Canonical, Ubuntu, 20.04 LTS, amd64 focal image
  # us-east-2 = "ami-0430580de6244e02e" # Canonical, Ubuntu, 20.04 LTS, amd64 focal image
}
projid    = "PHOENIX-123"
imagename = "ami-00c257e12d6828491"
