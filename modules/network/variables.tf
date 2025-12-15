variable "project_id"     { type = string }
variable "environment"    { type = string }
variable "network_name"   { type = string }
variable "region"         { type = string }
variable "cidr_block"     { type = string }    // ex: 10.20.0.0/16
variable "labels" {
    type    = map(string)
    default = {}
}
