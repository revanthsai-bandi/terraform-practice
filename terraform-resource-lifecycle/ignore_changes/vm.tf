resource "google_compute_instance" "vm_instance" {
	name  = "test-vm"
	machine_type = "f1-micro"
	zone = "us-central1-a"
	allow_stopping_for_update = true

	boot_disk {
		initialize_params {
			image = "debian-cloud/debian-9"
		}
	}

	network_interface {
		network = "default"
	}
	scheduling {
		on_host_maintenance = "MIGRATE"
	}
	
  	service_account {
    		email  = "terraform-deployed-sa1@revanth-gcp-2020.iam.gserviceaccount.com"
    		scopes = ["cloud-platform"]
  	}
	tags = ["allow-nginx-ingress"]
	labels = { "hi" : "hello" }
	lifecycle {
	  ignore_changes = all
	}
}

