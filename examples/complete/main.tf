terraform {
  required_version = ">= 0.13"
}

provider "aws" {
  region = "us-east-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

module "elb" {
  source = "github.com/smithlabs/terraform-aws-elb?ref=v0.0.2"

  elb_name           = var.name
  subnet_ids         = data.aws_subnet_ids.default.ids
}

module "asg" {
  source = "github.com/smithlabs/terraform-asg-rolling-deploy?ref=v0.0.5"

  ami                = "ami-02354e95b39ca8dec" # Amazon Linux
  instance_type      = "t2.micro"
  name               = var.name
  environment        = var.environment
  user_data          = data.template_file.user_data.rendered
  min_size           = 2
  max_size           = 2
  subnet_ids         = data.aws_subnet_ids.default.ids
  load_balancers     = [module.elb.this_elb_name]
}

resource "aws_security_group_rule" "allow_elb_http_inbound" {
  type              = "ingress"
  security_group_id = module.elb.elb_security_group_id

  from_port         = local.http_port
  to_port           = local.http_port
  protocol          = local.tcp_protocol
  cidr_blocks       = local.all_ips
}

resource "aws_security_group_rule" "allow_elb_all_outbound" {
  type              = "egress"
  security_group_id = module.elb.elb_security_group_id

  from_port         = local.any_port
  to_port           = local.any_port
  protocol          = local.any_protocol
  cidr_blocks       = local.all_ips
}

resource "aws_security_group_rule" "allow_server_http_inbound" {
  type              = "ingress"
  security_group_id = module.asg.instance_security_group_id

  from_port         = var.server_port
  to_port           = var.server_port
  protocol          = local.tcp_protocol
  cidr_blocks       = local.all_ips
}

# Allow server to access internet to download files from GitHub in user-data.sh
resource "aws_security_group_rule" "allow_server_all_outbound" {
  type		     = "egress"
  security_group_id  = module.asg.instance_security_group_id

  from_port	     = local.any_port
  to_port	     = local.any_port
  protocol	     = local.any_protocol
  cidr_blocks	     = local.all_ips
}

locals {
  http_port           = 80
  any_port            =  0
  any_protocol        = "-1"
  tcp_protocol        = "tcp"
  all_ips             = ["0.0.0.0/0"]
}

data "template_file" "user_data" {
  template = file("${path.module}/user-data.sh")
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}
