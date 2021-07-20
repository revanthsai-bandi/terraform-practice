# ################################################################################
#  Using .tfvars.json and .auto.tfvars.json files for variable input/declaration #
# ################################################################################

The files named as ".tfvars" are used to input the variables for the configuration. 
These files are usually named in following ways :
    => terraform.tfvars.json --> Automatically loaded by terraform while running. Needs no explicit mention in commands
    => <name>.tfvars.json --> needs to be mentioned explicitly while running commands with "-var-file" flag

The files named as ".auto.tfvars" are loaded autoamtically by terraform while running and needs no explicit mention in the commands.
These files are automatically loaded and made ready for calling in configuration files.

The files used in this folder are .auto.tfvars.json which are in JSON format and are loaded into config files using "jsondecode" command to be read as map and then iterated logically.