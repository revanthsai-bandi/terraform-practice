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
        access_config {
          
        }
	}
	scheduling {
		on_host_maintenance = "MIGRATE"
	}
	
  	service_account {
    		email  = "terraform-deployed-sa1@revanth-gcp-2020.iam.gserviceaccount.com"
    		scopes = ["cloud-platform"]
  	}
	tags = ["allow-ssh-from-pc"]

    connection {
        type     = "ssh"
        user     = var.user
        private_key = file(var.privatekeypath)
        host = self.network_interface[0].access_config[0].nat_ip
    } 

    provisioner "file" {
        source      = "${var.filename}"
        destination = "/tmp/${var.filename}"
    }

    provisioner "local-exec" {
      command = "echo ${self.network_interface[0].access_config[0].nat_ip} > local-exec.log"
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/${var.filename}",
            "/tmp/${var.filename} revanth sai > /tmp/remote-exec.log"
        ]
    }
}

variable "user" {
  
}

variable "publickeypath" {
  
}

variable "privatekeypath" {
  
}

variable "filename" {
  
}