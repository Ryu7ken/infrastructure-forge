# Terraform Cloud

![Terraform Cloud Overview](/assets/tc.png)

## Terraform Organization

We first need to create a Organization which has to be globally unique.

## Terraform Project

We need to create Project inside the Organization. We can have multiple Projects inside an Organization.

## Terraform Workspace

We need to create a Workspace inside the Project. We can have multiple Workspaces inside a Project.

## Cloud Integration

```hcl
terraform { 
  cloud { 
    
    organization = "terraform_bootcamp_2025" 

    workspaces { 
      name = "terra-house" 
    } 
  } 
}
```

We need to provide this in the **main.tf** file for the Terraform Cloud integration to keep the state file.

The old way for Terrafrom Cloud integration we had to use this:

```hcl
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "company"

    workspaces {
      name = "my-app-prod"
    }
  }
}
```

We can still use this if we have our state file in AWS S3.

## Terraform Login

`terraform login`

We need to login to Terraform Cloud by running the `terraform login` command which will open a link to Terraform Cloud to generate an API Token.

Since there was an issue with `terraform login`, we manually created the file at the specified location with the below contents.

```json
{
    "credentials": {
        "app.terraform.io": {
            "token": "YOUR_GENERATED_API_TOKEN"
        }
    }
}
```

> [!IMPORTANT]
> The version of Terraform on our system and the version of Terraform choosen in the Terraform Cloud Workspace should be the same. If not then we need to change the version of the Terraform in the Workspace to same as on our system.