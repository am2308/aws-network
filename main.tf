module "default-vpc" {
    source                          = "./modules/vpc"
    vpc_name                        = "${var.vpc_name}"
    cidr                            = "${var.cidr}"
    secondary_cidr_blocks           = "${var.secondary_cidr_blocks}"
    tags                            = "${var.additional_tags}"
    enable_internet_gateway         = "${var.enable_internet_gateway}"
}

module "default-public-subnet" {
    source                          = "./modules/subnets/public"
    vpc_id                          = "${module.default-vpc.vpc_id}"
    public_subnet_name              = "${var.public_subnet_name}"
    public_cidrs                    = "${var.public_cidrs}"
    azs                             = "${var.azs}"
    tags                            = "${var.additional_tags}"
    enable_nat_gateway              = "${var.enable_nat_gateway}"
    igw_id                          = "${module.default-vpc.igw_id}"
    destination_cidr                = "${var.destination_cidr}
}

module "default-private-subnet" {
    source                          = "./modules/subnets/private"
    vpc_id                          = "${module.default-vpc.vpc_id}"
    private_subnet_name             = "${var.private_subnet_name}"
    private_cidrs                   = "${var.private_cidrs}"
    azs                             = "${var.azs}"
    tags                            = "${var.additional_tags}"
    enable_nat_gateway              = "${var.enable_nat_gateway}"
    natgw_ids                       = "${module.default-public-subnet.natgw_ids}"
    vpn_gateway                     = "${var.vpn_gateway}"
    destination_cidr                = "${var.destination_cidr}
}

module "default-ec2-sg" {
    source                          = "./modules/security-group"
    vpc_id                          = "${module.default-vpc.vpc_id}"
    security_group_name             = "${var.security_group_name}"
    ingress_cidr                    = "${var.ingress_cidr}"
    tags                            = "${var.additional_tags}"
}

module "default-ec2" {
    source                          = "./modules/ec2"
    instance_type                   = "${var.instance_type}"
    ami                             = "${var.ami}"
    instance_name                   = "${var.instance_name}"
    type_ebs                        = "${var.type_ebs}"
    size_ebs                        = "${var.size_ebs}"
    monitoring_enable               = "${var.monitoring_enable}"
    delete_termination              = "${var.delete_termination}"
    subnet_id                       = "${module.default-private-subnet.private_subnets[0]}"
    security_group_id               = "${module.default-ec2-sg.ec2_security_group}"
    tags                            = "${var.additional_tags}"
}
