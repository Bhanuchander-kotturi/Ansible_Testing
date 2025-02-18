data "aws_vpc" "ansible_vpc" {
  id = "vpc-0a00d214900e3e870"
}

data "aws_route_table" "ansible_vpc_rt" {
  subnet_id = "subnet-014fc7a652f405342"
  #If subnet_id giving errors use route table id as below
  # route_table_id = data.aws_route_table.ansible_vpc_rt.id
}

resource "aws_vpc_peering_connection" "ansible-vpc-peering" {
  peer_vpc_id = data.aws_vpc.ansible_vpc.id
  vpc_id      = aws_vpc.default.id
  auto_accept = true
  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = {
    Name = "Ansible-${var.vpc_name}-Peering"
  }
}

resource "aws_route" "peering-to-ansible-vpc" {
  route_table_id            = aws_route_table.terraform-public.id
  destination_cidr_block    = "172.31.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.ansible-vpc-peering.id
  # depends_on                = [aws_route_table.terraform-public]
}

resource "aws_route" "peering-from-ansible-vpc" {
  route_table_id            = data.aws_route_table.ansible_vpc_rt.id
  destination_cidr_block    = "172.37.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.ansible-vpc-peering.id
  # depends_on                = [aws_route_table.terraform-public]
}
