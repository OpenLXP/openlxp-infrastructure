# OpenLXP - Infrastructure
This repository contains Terraform scripts to deploy necessary resources to run the Enterprise Course Catalog.
# Intended Use
This repository is inteded for System Operators that would use Terraform scripts to deploy and administer the resources.
# Installing Terraform
If Terraform is not installed, run commands below (example shown for Ubuntu OS. For others, navigate here: https://learn.hashicorp.com/tutorials/terraform/install-cli)

Add the HashiCorp GPG Key:
```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```

Add the official HashiCorp Linux repository:
```
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```

Update and Install Terraform:
```
sudo apt-get update && sudo apt-get install terraform
```

Verify:
```
terraform -help
```

# Using Terraform

Clone the openlxp-infrastructure repository:

```
git clone https://github.com/OpenLXP/openlxp-infrastructure.git
```

Navigate to 'openlxp-infrastructure' directory.
```
cd openlxp-infrastructure
```

Initialize the working directory with Terraform configuration templates.
```
terraform init
```

When existing Terraform templates have been modified or new templates are created, it is good practice to format the files. This can be done by running a simple format command.
```
terraform fmt
```

Now it is time to plan out the build using Terraform. Once templates are formatted and directory is initialize, Terraform is ready to plan its deployment. This is a crucial step before applying the templates into the environment. Terraform plan will run through all Terraform configuration templates and output a list of resources that will be launched. It will also output any errors that are identified in the templates whether it is syntax error, missing variables, spelling, etc.
```
terraform plan
```

When Terraform plan output looks as expected and any errors have been fixed, it is time to apply. It is important to understand what is being deployed and plan out the cost of resources being created. Terraform apply will run through the templates and output a list of resources to be created once more and have the system operator running the command confirm with a simple yes or no answer. When ready to deploy, enter yes and Terraform will work its magic and create an entire infrastructure or specified resources that have been defined in the Terraform templates.
```
terraform apply
```
