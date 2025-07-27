# Terraform Lifecycle

Currently whenever we make changes in our infra that makes causes to change our state file, then the `html` files are re-uploaded everytime.
Also we need to clear the cache in CloudFront when we are making changes in the `html`, so that the new content is being served. But clearing the cache manually form the CloudFront console by `/*` is an expensive call.

We will create and use a `content_version` variable, so that when we explicitely change the number of this variable we will upload the `html` files as well as clear the CloudFront cache to serve the new files.

## Changing Lifecycle of Resources

[Lifecycle Meta-Argument](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)

We will use `lifecycle` to ignore changes to the `etag` of the `html` files to prevent detecting of change in the files.

```hcl
lifecycle {
  ignore_changes = [ etag ]
}
```

## Terraform Data

[Terraform Data Resource](https://developer.hashicorp.com/terraform/language/resources/terraform-data)

We need to use the `content_version` varibable to manually trigger infra changes on changing the variable number.
But we can't use the variable anywhere directly with the existing resources, so we need create a resource which is not a real resource but will help in triggering changes to the infra.

```hcl
resource "terraform_data" "content_version" {
  input = var.content_version
}
```

## Trigerring Changes using Variable

Now for Terraform to be able to catch that we have made changes to the `content_version` variable and it also needs to replace the old `html` files wiht new ones, we need to add `replace_trigger_by` within the `lifecycle block`.

```hcl
lifecycle {
  replace_triggered_by = [ terraform_data.content_version.output ]
  ignore_changes = [ etag ]
}
```