## Oracle Infrastructure Setup
This is a Terraform configuration that creates the Compute service on Oracle Cloud Infrastructure.

Prerequisites for Installing and Using the Provider

Terraform is available for direct download from the HashiCorp download page. Ensure that you download the correct binary file for your system.

After downloading Terraform Install OCI-CLI
```
brew update && brew install oci-cli
```
To configure OCI CLI run the following command:
```
oci setup config
```
Copy the public key and add it to the user

Once OCI CLI is configured, we will copy the public key to add it to the API key of the OCI tenant user. Access the oci folder by running the following
```
cd .oci
ls
```
We can see that it contains :
config (the configuration file containing the profiles) ,
oci_api_key.pem (the private key), 
oci_api_key_public.pem (the public key)

To display the public key to be able to copy it, run :
```
cat oci_api_key_public.pem
```
Copy that key, Go to your user page, scroll down, and click in the left menu on "API keys" and on "Add API key".
Click on "Paste a public key" then paste the public key you copied earlier in the terminal and click "Add".
After adding the public key you can see the content of your default profile in the oci configuration file.
To check your default profile information in the config file, run:
command:-
cat config
We can see that the content is the same as the configuration file preview above in OCI (except that the path to the private key "key_file=" was added automatically).

Applying Configurations
After the Oracle Cloud Infrastructure (OCI) Terraform provider is installed and configured, and you have created Terraform configurations that include the provider and a resource or data source, you can run Terraform against your OCI infrastructure.
Initializing Terraform

Run the following command from a directory that contains your Terraform configuration files to initialize Terraform:-
```
terraform init
```
Reviewing Changes

```
terraform plan
```
Applying Changes
```
terraform apply
```
All configurations of terraform, create VCN, Subnets, Route Table, Internet Gateway, Nat Gateway, and Instance.

To connect with an Instance this command is used:-
```
ssh -i <private_key_path> ubuntu@<public_ip> 
```
