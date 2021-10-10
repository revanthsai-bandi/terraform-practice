module "vm_instance" {
    source = "./modules/"

    name=var.name
    machine_type=var.machine_type
    zone=var.zone
    image=var.image
    network=var.network
    email=var.email
    tags=var.tags
}