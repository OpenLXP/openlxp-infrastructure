# OpenLXP - Infrastructure
This repository contains Terraform scripts to deploy necessary resources to run the Enterprise Course Catalog.
# Intended Use
This repository is inteded for System Operators that would use Terraform scripts to deploy and administer the resources.
# Directions for Use
Clone the openlxp-infrastructure repository:

```
git clone https://github.com/OpenLXP/openlxp-infrastructure.git
```

Navigate to 'openlxp-infrastructure' directory. Ensure Terraform is installed on the working machine. If Terraform is not installed, run commands below (example shown for Ubuntu OS. For others, navigate here: https://learn.hashicorp.com/tutorials/terraform/install-cli)

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

WIP
