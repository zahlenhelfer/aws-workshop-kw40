variable "region" {
  type        = string
  default     = "eu-central-1"
  description = "set the region for aws deployment"
}

variable "app_server_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The aws instance-type"
}

variable "app_server_count" {
  type        = number
  description = "The number of app servers to create"
}

variable "ami_id" {
  type = map(string)
  default = {
    eu-central-1 = "ami-05ff5eaef6149df49"
    us-west-1    = "image-4567"
  }
}

