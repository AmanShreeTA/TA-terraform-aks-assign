# Terraform Assignment

## Assignment Problem Statement:
 ### AKS Cluster Creation:-
Create a AKS cluster with Azure Scale Set enabled . Store the state file in cloud storage ( for 2 envs like dev, qa)

*Instructions-*

  Create Reusable terraform modules. Code for creating AKS and its components. Should able to use the same code for creating a AKS cluster with different configurations. Use variable for passing input.

  ### Create a stack of resources ADF, Databricks, ADLS, Azure SQL DB:-
  Databricks workspaces , Vnet, IAM role, Resource group, Data sources, Azure Data Factory Linked Service, azure-key-vault, Service Principal , Storage Account, Security Group etc.

## Solution:
 - The repository contains the aks module inside the modules folder.
 - There are two folders named 'dev' and 'qa' which uses the module named "aks" to create the Azure Kubernetes Service cluster in azure cloud.
 - To run the code, create a file named 'terraform.tfvars' in the 'dev' or 'qa' folder, so that the variables defined in the code can be assigned the required values. The terrform.tfvars file will look something like this(the value to the variables can be assigned as per limitations provided by azure):

                 aks-name  = "aks-cluster-tf-sample"
                 reso-loc  = "East US"
                 rsgp-name = "" #Resource Group Name
                 dflt-nodes = 3
                 max-no-nodes = 5
                 min-no-nodes = 2
                 no-o-pods = 45
                 vm-size-type = "Standard_D2s_v3"
                 env = "dev"
                 your-name = "Aman"
 - The description of the variables is provided in the variables.tf file.
 - Also in the providers.tf file, enter the values for "resource_group_name", "storage_account_name", "container_name" in the backend block to use azure storage account as the backend for storing the terraform state file.
 - After all this configuration is done, save the files and run terraform init, terraform plan, and terrform apply in the 'dev' or 'qa' folder to create the resources.
