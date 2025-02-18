aws_region           = "us-west-2"
vpc_cidr             = "172.37.0.0/16"
vpc_name             = "Ansible-Vpc"
key_name             = "keypacker"
public_subnet_cidrs  = ["172.37.1.0/24", "172.37.2.0/24", "172.37.3.0/24"]    #List
private_subnet_cidrs = ["172.37.10.0/24", "172.37.20.0/24", "172.37.30.0/24"] #List
azs                  = ["us-west-2a", "us-west-2b", "us-west-2c"]             #List
environment          = "production"
instance_type = {
  development = "t2.small"
  testing     = "t2.small"
  production  = "t2.small"
}
amis = {
  us-west-2 = "ami-00c257e12d6828491" # Canonical, Ubuntu, 20.04 LTS, amd64 focal image
  us-east-2 = "ami-0430580de6244e02e" # Canonical, Ubuntu, 20.04 LTS, amd64 focal image
}
projid    = "PHOENIX-123"
imagename = "ami-00c257e12d6828491"
