#variable "key_name" {
 # type        = string
  #description = "The name for ssh key, used for aws_launch_configuration"
#}

variable "cluster_name" {
  type        = string
  default     = "oscar"
  description = "The name of AWS ECS cluster"
}

#variable "aws_access_key" {}

#variable "aws_secret_key" {}

#variable "ami_key_pair_name" {}
