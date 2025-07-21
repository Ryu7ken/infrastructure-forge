# Custom Terraform Module

```text
.
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
├── ...
├── modules/
│   ├── terrahouse/
│   │   ├── README.md
│   │   ├── variables.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── LICENSE
```

## Creating Module Files

- We will move the `main.tf` contents to the module's `main.tf`.

- When creating custom modules we also need to keep the providers in its `main.tf` file, otherwise it will show error.

- We will remove the `provider.tf` from the root of the project as we have provided them in the module's `providers.tf`.

- We will move all the varibles from root of the project `variables.tf` to the module's `variables.tf`.

- We will move all the contents of `outputs.tf` from root of the project to the module's `outputs.tf`.

## Adding Module 

We need to add the terrahouse module to the `main.tf` file in the root of the project.

Using the source we can import the module from various places eg:
- Locally
- GitHub
- Terraform Registry

## Passing Variables in Module

We can pass input variables to our modules.
The module has to declare the terraform variables in its own `variables.tf`.

```hcl
module "terrahouse" {
  source = "./modules/terrahouse"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```

> [!NOTE]
> The variables that are present in the Module needs to be declared in the root level as well, otherwise it will show error.

## Outputs in Module

We need to specify the outputs of the module in the root level as well to be able to get the module outputs because it is in nested structure.

```hcl
output "bucket_name" {
    description = "Bucket name for our static website hosting"
    value = module.terrahouse.bucket_name
}
```

## Fix using Terraform Refresh

```sh
terraform apply -refresh-only -auto-approve
```