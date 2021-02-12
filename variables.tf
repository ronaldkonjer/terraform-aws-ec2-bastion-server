variable "zone_id" {
  type        = string
  default     = ""
  description = "Route53 DNS Zone ID"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Bastion instance type"
}

variable "ami" {
  type        = string
//  default     = "ami-efd0428f"
  default     = "ami-084ef34fdfdd7384c"
  description = "AMI to use"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "subnets" {
  type        = list(string)
  description = "AWS subnet IDs"
}

variable "user_data" {
  type        = list(string)
  default     = []
  description = "User data content"
}

variable "key_name" {
  type        = string
  default     = ""
  description = "Key name"
}

variable "ssh_user" {
  type        = string
  description = "Default SSH user for this AMI. e.g. `ec2user` for Amazon Linux and `ubuntu` for Ubuntu systems"
}

variable "enable_proxyless" {
  type = bool
  description = "If true we upload the private_key to the bastion so we can ssh into the bastion and continue from there without proxy ssh request from localhost"
}

variable "bastion_private_key_filename" {
  type        = string
  description = "The location of the private key that is used to ssh into the bastion server"
}

variable "cluster_private_key_filename" {
  type        = string
  description = "The location of the private key that is used to ssh from the bastion server on to other servers normally via a proxied command, if empty use bastion_private_key_filename"
  default     = ""
}

variable "ingress_security_groups" {
  type        = list(string)
  description = "AWS security group IDs allowed ingress to instance"
  default     = []
}

variable "security_groups" {
  type        = list(string)
  description = "AWS security group IDs associated with instance"
  default     = []

}

variable "allowed_cidr_blocks" {
  type        = list(string)
  description = "A list of CIDR blocks allowed to connect"

  default = [
    "0.0.0.0/0",
  ]
}


variable "user_data_file" {
  type        = string
  default     = "user_data.sh"
  description = "User data file"
}

variable "root_block_device_encrypted" {
  type        = bool
  default     = true
  description = "Whether to encrypt the root block device"
}

variable "root_block_device_volume_size" {
  type        = number
  default     = 8
  description = "The volume size (in GiB) to provision for the root block device. It cannot be smaller than the AMI it refers to."
}

variable "metadata_http_endpoint_enabled" {
  type        = bool
  default     = true
  description = "Whether the metadata service is available"
}

variable "metadata_http_put_response_hop_limit" {
  type        = number
  default     = 1
  description = "The desired HTTP PUT response hop limit (between 1 and 64) for instance metadata requests."
}

variable "metadata_http_tokens_required" {
  type        = bool
  default     = true
  description = "Whether or not the metadata service requires session tokens, also referred to as Instance Metadata Service Version 2."
}

variable "associate_public_ip_address" {
  type        = bool
  default     = true
  description = "Whether to associate a public IP to the instance."
}

variable "egress_allowed" {
  type        = bool
  default     = false
  description = "Allow all egress traffic from instance"
}

variable "host_name" {
  type        = string
  default     = "bastion"
  description = "The Bastion hostname created in Route53"
}

