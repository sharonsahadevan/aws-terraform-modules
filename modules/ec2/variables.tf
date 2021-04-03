variable "instance_name" {}
variable "instance_count" {}
variable "instance_ami" {}
variable "instance_type" {}
variable "security_group_ids" {}
variable "subnet_id" {}
variable "associate_public_ip_address" {}
variable "key_name" {}
variable "iam_instance_profile" {}
variable "volume_type" {}
variable "volume_size" {}
variable "device_name" {}
variable "environment" {}
variable "app_name" {}
variable "encrypted" {}
variable "pvt_key" {
  default = ""
}
variable "user" {
  default = "centos"
}
variable "type" {
  default = "ssh"
}
variable "user_data" {}
variable "disable_api_termination" {}
