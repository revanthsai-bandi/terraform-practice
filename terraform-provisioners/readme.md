# Terraform provisioners

* connection
    * a "connection" block is required for "file" or "remote-exec" provisioner to work.
    * You can declare a connection block 
        * Within resource block => which applies to all the provisioners inside the resource
        * Within a provisioner block => which applies to a particular provisioner that is nested into and overwrites any resource level connection blocks.

* file
    * The file provisioner is used to copy files or directories from the machine executing Terraform to the newly created resource. 
    * It supports both "SSH" and "WinRM" connections.

* local-exec
    * used to do computations in the local system where Terraform is running.

* remote-exec
    * used to do computations on a remote system created using terraform.

# Points to remember

* Provisioners are executed in the order they are written in the config files.
* Provisioners can me made to run either while creating/destroying a resource seperately.
    * use 'when = destroy' inside provisioner block
* Provisioner configurations are not stored in state file.
* If a provisioner execution fails the resource is marked as "tainted".
    