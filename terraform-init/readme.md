root@my-tf-instance:/terraform-init# terraform init

Initializing the backend...

Successfully configured the backend "gcs"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- Reusing previous version of hashicorp/google from the dependency lock file
- Using previously-installed hashicorp/google v3.75.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

#################################################################################################

	* The init command runs the backend initialization first and then runs the provider plugin initalization.
	* Once an init is run, terraform first : 
		-> determines the plugins
		-> searches for plugins in the local locations
		-> downloads additional plugins from the terrafrom registry, if not found locally.
		-> If mentioned plugins are not part of registry too, then terraform throws error on init run
	* Once the init runs successfully, terraform locks the versions of all the plugins to be used unless and  until init is run again.

#################################################################################################
