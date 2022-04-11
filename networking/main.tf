# Declare the data source for AWS AZ
data "aws_availability_zones" "available_zones" {
  state = "available"
}

# VPC
resource "aws_vpc" "gtech_dev_vpc" {
  cidr_block = var.cidr_vpc
  #instance_tenancy = "default"

  tags = merge({ name = "${var.project_name}_${var.environment}_vpc", description = "Creating VPC for Global Tech" }, var.tags)
}

# PUBLIC SUBNET 1
resource "aws_subnet" "gtech_dev_pub_sub_1" {
  vpc_id                  = aws_vpc.gtech_dev_vpc.id
  cidr_block              = var.cidr_pub1
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true

  tags = merge({ name = "${var.project_name}_${var.environment}_pub_sub_1", description = "Creating Public Subnet 1 for Global Tech" }, var.tags)

}

# PUBLIC SUBNET 2
resource "aws_subnet" "gtech_dev_pub_sub_2" {
  vpc_id                  = aws_vpc.gtech_dev_vpc.id
  cidr_block              = var.cidr_pub2
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags = merge({ name = "${var.project_name}_${var.environment}_pub_sub_1", description = "Creating Public Subnet 2 for Global Tech" }, var.tags)
}

# PRIVATE SUBNET 1
resource "aws_subnet" "gtech_dev_priv_sub_1" {
  vpc_id            = aws_vpc.gtech_dev_vpc.id
  cidr_block        = var.cidr_prv1
  availability_zone = data.aws_availability_zones.available_zones.names[0]

  tags = merge({ name = "${var.project_name}_${var.environment}_priv_sub_1", description = "Creating Private Subnet 1 for Global Tech" }, var.tags)
}

# PRIVATE SUBNET 2
resource "aws_subnet" "gtech_dev_priv_sub_2" {
  vpc_id            = aws_vpc.gtech_dev_vpc.id
  cidr_block        = var.cidr_prv2
  availability_zone = data.aws_availability_zones.available_zones.names[1]

  tags = merge({ name = "${var.project_name}_${var.environment}_priv_sub_1", description = "Creating Private Subnet 2 for Global Tech" }, var.tags)

}

# INTERNET GATEWAY
resource "aws_internet_gateway" "gtech_dev_igw" {
  vpc_id = aws_vpc.gtech_dev_vpc.id

  tags = merge({ name = "${var.project_name}_${var.environment}_igw", description = "Creating Internet Gateway for Global Tech" }, var.tags)

}

# # ELASTIC IP
# resource "aws_eip" "gtech_dev_eip" {
#   vpc = true

# tags = merge({name="${var.project_name}_${var.environment}_eip", description="Creating Elastic IP for Global Tech"}, var.tags) 
# }

# # # NAT GATEWAY
# # resource "aws_nat_gateway" "gtech_dev_nat_gw" {
# #   allocation_id     = aws_eip.gtech_dev_eip.id
# #   connectivity_type = "public"
# #   subnet_id         = aws_subnet.gtech_dev_pub_sub_1.id

# # tags = merge({name="${var.project_name}_${var.environment}_nat_gw", description="Creating NAT Gateway for Global Tech"}, var.tags)
# # }

# PUBLIC ROUTE TABLE
resource "aws_route_table" "gtech_dev_pub_rt" {
  vpc_id = aws_vpc.gtech_dev_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gtech_dev_igw.id
  }
  tags = merge({ name = "${var.project_name}_${var.environment}_pub_rt", description = "Creating Public Route-table for Global Tech" }, var.tags)
}

# PUBLIC ROUTE TABLE & SUBNET ASSOCIATION PUBLIC SUBNET 1
resource "aws_route_table_association" "gtech_dev_pub_rt_association_1" {
  subnet_id      = aws_subnet.gtech_dev_pub_sub_1.id
  route_table_id = aws_route_table.gtech_dev_pub_rt.id
}

# PUBLIC ROUTE TABLE & SUBNET ASSOCIATION PUBLIC SUBNET 2
resource "aws_route_table_association" "gtech_dev_pub_rt_association_2" {
  subnet_id      = aws_subnet.gtech_dev_pub_sub_1.id
  route_table_id = aws_route_table.gtech_dev_pub_rt.id
}

# # # PRIVATE ROUTE TABLE
# # resource "aws_route_table" "gtech_dev_priv_rt" {
# #   vpc_id = aws_vpc.gtech_dev_vpc.id

# #   route {
# #     cidr_block = "0.0.0.0/0"
# #     gateway_id = aws_nat_gateway.gtech_dev_nat_gw.id
# #   }
# # tags = merge({name="${var.project_name}_${var.environment}_priv_rt", description="Creating Private Route-table for Global Tech"}, var.tags)
# # }


# # # PRIVATE ROUTE TABLE & SUBNET ASSOCIATION PRIVATE SUBNET 1
# # resource "aws_route_table_association" "gtech_dev_priv_rt_association_1" {
# #   subnet_id      = aws_subnet.gtech_dev_priv_sub_1.id
# #   route_table_id = aws_route_table.gtech_dev_priv_rt.id
# # }

# # # PRIVATE ROUTE TABLE & SUBNET ASSOCIATION PRIVATE SUBNET 2
# # resource "aws_route_table_association" "gtech_dev_priv_rt_association_2" {
# #   subnet_id      = aws_subnet.gtech_dev_priv_sub_1.id
# #   route_table_id = aws_route_table.gtech_dev_priv_rt.id
# # }

