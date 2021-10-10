variable "name" {
 type = string
}
variable "machine_type" {
  type = string
}
variable "zone" {
  type = string
}
variable "image" {
  type = string
}
variable "network" {
  type = string
}
variable "email" {
  type = string
}
variable "tags" {
  type = list(string)
}