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