# Terraform AWS Provider

## S3 Provider

We Installed and configured the AWS Provider first and then added the S3 resource.

For the S3 bucket name we used the previous Random String Resource of the Random Provider and configured it to only output **Lower Case characters** as AWS does not allow Upper Case characters in S3 Bucket name.

### Terraform Destory

`terraform destory`

This will destory resources.

> [!NOTE]
> We can also use the `terraform apply --auto-approve` to skip the manual approving prompt.