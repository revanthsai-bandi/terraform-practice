variable "name" {
 type = string
 default=""
}
variable "machine_type" {
  type = string
  default=""
}
variable "zone" {
  type = string
  default=""
}
variable "image" {
  type = string
  default=""
}
variable "subnetwork_0" {
  type = string
  default=""
}
variable "subnetwork_1" {
  type = string
  default=""
}
variable "email" {
  type = string
  default = ""
}
variable "tags" {
  type = list(string)
  default = []
}