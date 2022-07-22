output "alb_dns" {
  value = aws_lb.test-lb.dns_name
}

output "vpc_id" {
  value = aws_vpc.vpc1.id
}

