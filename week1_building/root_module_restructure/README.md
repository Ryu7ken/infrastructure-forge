# Root Module Structure

<https://developer.hashicorp.com/terraform/language/modules/develop/structure>

## Standard Directory Structure

We created new files to follow the industry standard of maintaining the Terraform project directory

```text
terraform-bootcamp/
├── main.tf                    # Primary configuration file containing resources
├── providers.tf               # Provider configurations and settings
├── variables.tf               # Input variable definitions
├── terraform.tfvars           # Variable value assignments (often gitignored)
├── outputs.tf                 # Output value definitions
├── .terraform.lock.hcl        # Provider dependency lock file
└── README.md
```

## Terraform Cloud Variables

In Terraform we can set two kind of variables:

- Environment Variables - those that we set in our terminal.
- Terraform Variables - those that we set in our `terraform.tfvars`.

## Environment Variables in Terraform Cloud

We set the Environment Variables for AWS Credentails in the Terraform Cloud to be able to Destory the existing resource - S3 bucket created previously as the `terraform.tfstate` was migrated to Terraform Cloud and the local system AWS credentails was not being captured by Terraform.

## Migrating to Local

We migrated back to Local from Terraform Cloud for a temporary period to make our workflow faster. Also deleted all the providers, state backup and providers lock files to setup from scratch once again and commented out the Terraform Cloud provider.

## UUID Validation

We created a variable to input User UUID and check if its in a valid UUID format. This User UUID will be used a tag for S3 bucket resource. 

We provided the User UUID value in the `terraform.tfvars` file and we can also provide it using the `-var` flag as `terraform apply -var="user_uuid"`

## Terraform Variable on Terraform Cloud

We set the User UUID value as a Terraform Variable in the Terraform Cloud because when we migrate our `terraform.tfstate` file to Terraform Cloud then the `terraform.tfvars` won't be captured by Terraform.