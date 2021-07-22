# RESOURCE LIFECYCLE 

=> ignore_changes : Ignores all the changes mentioned in "configuration files" or changes made to "the resource from outside terraform" while performing a deployment. These differences may include the changes in config files or changes made to resource from outside terraform. 

* ignore_changes also takes care of changes that need restarting the recreating the resources.
* In this example : 
                ** (update)    changes that are updated on-the-fly : labels, tags, ssh_keys
                ** (update)    changes that need restarting : metadata, machine_type, service_account
                ** (replace)    changes that need re-creation : vm name, OS

