# Custom Terraform Provider

When creating a Terraform Provider we need to follow a particular naming convention set by **Hashicorp**, for example,

- hashicorp/terraform-provider-azurerm
- aliyun/terraform-provider-alicoud
- hashicorp/terraform-provider-google-beta

## Terratowns Provider

Terraform providers are created using GO programming language.
Since I have never learnt or worked with GO before, so I am just following Andrew on creating the Terratowns Provider.

- When we create any GO apps it will have a `main.go` as the main file.

> [!NOTE]
> According to best standards it is usually said to break up the codes into different files, but we will stick to keeping all the codes in a single file to keep things easy.

## Building Terratowns Provider

- First we need to initialize a `go.mod` in the folder containing the `main.go`.

```go
go mod init terraform-provider-terratowns_v1.0.0
```

- Then we need to download the plugins that are used in our `main.go`.

```go
go get github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema
go get github.com/hashicorp/terraform-plugin-sdk/v2/plugin
```

- To create a binary build of the GO files we need to run the below command.

```go
go build -o terraform-provider-terratowns_v1.0.0
```

- We can also use a Bash Script to create a build of the custom Terratowns Provider in a standard directory to keep build packages.

```bash
#! /usr/bin/bash

PLUGIN_DIR="c:/Users/Baquiur/Documents/terraform-bootcamp/.terraform.d/plugins/local.providers/local/terratowns/1.0.0/"
PLUGIN_NAME="terraform-provider-terratowns_v1.0.0"
PROJECT_ROOT_DIR="c:/Users/Baquiur/Documents/terraform-bootcamp/"

cd $PROJECT_ROOT_DIR/terraform-provider-terratowns
cp $PROJECT_ROOT_DIR/terraformrc $PROJECT_ROOT_DIR/.terraformrc
rm -rf $PROJECT_ROOT_DIR/.terraform.d/plugins
rm -rf $PROJECT_ROOT_DIR/.terraform
rm -rf $PROJECT_ROOT_DIR/.terraform.lock.hcl
go build -o $PLUGIN_NAME
mkdir -p $PLUGIN_DIR/x86_64/
mkdir -p $PLUGIN_DIR/linux_amd64/
cp $PLUGIN_NAME $PLUGIN_DIR/x86_64
cp $PLUGIN_NAME $PLUGIN_DIR/linux_amd64
```

## Using Custom Provider Locally

Terraform downloads providers from public registries (like registry.terraform.io). But when we are developing a custom provider, it only exists locally on our machine and not in any registry yet.

So we create `.terraformrc` file for Terraform to look for for providers locally according to the mentioned directories.

```hcl
provider_installation {
  filesystem_mirror {
    path = "$PWD/.terraform.d/plugins"
    include = ["local.providers/*/*"]
  } 
  direct {
   exclude = ["local.providers/*/*"] 
  }
}
```

## Adding Custom Provider in Main

We need to add our Custom Terratowns Provider in the `main.tf` file.

```hcl
terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
}

provider "terratowns" {
  endpoint = "http://localhost:5000"
  user_uuid = "e328f4ab-b99f-421c-84c9-4ccea042c7d1"
  token = "9b49b3fb-b8e9-483c-b703-97ba88eef8e0"
}
```