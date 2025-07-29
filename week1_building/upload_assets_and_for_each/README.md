# Uploading Assets

When we want to upload multiple files using Terraform, then we need to iterate through the files using `for_each`.

## Terraform Fileset

[fileset Function](https://developer.hashicorp.com/terraform/language/functions/fileset)

This is used to enumerate through all files or specific files from a directory.

```hcl
fileset("${path.root}/public/assets","*.{jpg,jpeg,png,gif}")
```

## Terraform For-Each

[for_each Meta-Argument](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each)

This is used to manage similar objects of a particular type rather than create different resource block for each of them.

```hcl
for_each = fileset("${path.root}/public/assets","*.{jpg,jpeg,png,gif}")
```