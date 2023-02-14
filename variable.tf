## VPC details
# 1.1. Create a VPC
variable "vpc_name" {
  type = string
  default = "NEW_VPC"
}
variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}
variable "public_source_cidr" {
  type = list(string)
  default = ["10.0.0.0/16"]
}
variable "public_source_cidr_v6" {
  type = list(string)
  default = ["::/0"]
}


# 2. Create a Internet Gateway
variable "ig_name" {
  type = string
  default = "NEW_IG"
}

# 1.3. Create 2 Route tables
variable "public_rt" {
  type = string
  default = "Public_RT"
}
variable "private_rt" {
  type = string
  default = "Private_RT"
}

# 1.4. Create 3 Public Subnets
variable "public_sn_count" {
  type = number
  default = 1
}
variable "public_subnets" {
  type = list(string)
  default = ["10.0.1.0/24"]
}

# 1.5. Create 3 Private Subnets
variable "private_sn_count" {
  type = number
  default = 1
}
variable "private_subnets" {
  type = list(string)
  default = ["10.0.2.0/24"]
}

# 1.6. Create Public access Security Group
variable "public_access_sg_ingress_rules" {
  type = list(object({
    from_port = number
    to_port = number
    protocol = string
  }))
  default = [
    {
      protocol = "tcp"
      from_port = 80
      to_port = 80
    },
    {
      protocol = "tcp"
      from_port = 443
      to_port = 443
    },
    {
      protocol = "tcp"
      from_port = 22
      to_port = 22
    },
    {
      protocol = "-1"
      from_port = 0
      to_port = 0
    }
  ]
}

## EKS Roles
variable "eks_cluster_role_name" {
  type = string
  default = "eksClusterRole"
}