output "elb_dns_name" {
  value       = module.elb.elb_dns_name
  description = "The DNS name for the Elastic Load Balancer"
}
