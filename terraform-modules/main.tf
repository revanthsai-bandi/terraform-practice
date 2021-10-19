module "vm_instance" {
    source = "./modules/gce_vm1"

    name=var.name
    machine_type=var.machine_type
    zone=var.zone
    image=var.image
    subnetwork_0=var.subnetwork_0
    email=var.email
    tags=var.tags
}