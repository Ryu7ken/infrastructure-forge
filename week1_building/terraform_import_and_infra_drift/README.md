# Terraform Import

`terraform import`

This is used to bring existing resources into Terraform. It can also be used when the `terraform.tfstate` might not be present.

We can either use the `import` block or the `terraform import` command. We will use the command.

```sh
terraform import aws_s3_bucket.example "bucket_name"
```

The above command only imported the AWS S3 bucket resource but the **random** resource is still missing from the `terraform.tfstate` file.

```sh
#Importing random resource
terraform import random_string.bucket_name "bucket_name"
```

But we are still not successful to restore the original `terraform.tfstate` file. So, from here on we will remove the **random** resource.

> [!IMPORTANT]
> Never keep sensitive data in the `terraform.tfvars.example` file.

> [!NOTE]
> What happens if we lose our State file ?
> If we lose our state file, we will most likely have to tear down all our cloud resources manually.
> `terraform import` won't work for all cloud resources. We need to check the Terraform providers' documentation to check which resources support **import**.

## S3 Bucket Variable

We removed the **random** resource an created a variable to input and validate the AWS S3 Bucket naming.

## Fix Manual Configuration

If someone goes and deletes or modifies cloud resource manually through ClickOps, if we run `terraform plan`, it will attempt to put our infrastructure back into the expected state fixing Configuration Drift.