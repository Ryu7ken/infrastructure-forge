# CloudFront Distribution

We need to create separate resouce files for S3 and CloudFront in the Module.

## Terraform Locals

Allows us to define local variables.

It can be very useful when we need to transform data into another format and have referenced as a variable

[Local Values](https://developer.hashicorp.com/terraform/language/values/locals)

```hcl
locals {
  s3_origin_id = "MyS3Origin"
}
```

## Terraform Data Sources

This allows to source data from cloud resources.

This is useful when we want to reference cloud resources without importing them.

```hcl
data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
```

[Data Sources](https://developer.hashicorp.com/terraform/language/data-sources)

We can check all the availabe Data Sources for every Provider at [registry.terraform.io](https://registry.terraform.io)

## Working with JSON

We use the `jsonencode` to create the json Bucket Policy inline in the file terraform file.

[jsonencode Function](https://developer.hashicorp.com/terraform/language/functions/jsonencode)

```hcl
> jsonencode({"hello"="world"})

{"hello":"world"}
```

## Troubleshooting

- When opening the CloudFront Distribution URL on browser, instead of showing the webpage the **html** files gets downloaded. So we need to explcitly mention the content type in the S3 Resource block.

- After providing the content type, the webpage does not show up and still the **html** files gets downloaded. This because CloudFront caches the content and we need to clear the Caches to get the new changes applied.

> [!NOTE]
> To clear the CloudFront caches we need to go to the CloudFront Console on AWS and go to **Invalidations** and mention `/*` and then click on **Clear Invalidations**.