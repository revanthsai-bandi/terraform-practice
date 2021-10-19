resource "google_compute_instance" "vm_instance" {
	name  = var.name
	machine_type = var.machine_type
	zone = var.zone
	
	boot_disk {
		initialize_params {
			image = var.image
		}
	}

	network_interface {
		subnetwork = var.subnetwork_0
	}
	network_interface {
		subnetwork = var.subnetwork_1
	}
	scheduling {
		on_host_maintenance = "MIGRATE"
	}
	
  	service_account {
    		email  = var.email
    		scopes = ["cloud-platform"]
  	}
	tags = var.tags
}