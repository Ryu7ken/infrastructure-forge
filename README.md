# Terraform Cloud Project Bootcamp

This repository contains the work for the Terraform Cloud Project Bootcamp by Andrew Brown, Chris Williams and Ashish Rajan.

## Table of Contents

### [Week 0: Project Prep](./week0_project_prep/)

*   **[Random Terraform Provider](./week0_project_prep/random_terraform_provider/README.md)**
    *   [Terraform Basics](./week0_project_prep/random_terraform_provider/README.md#terraform-basics)
        *   [Terraform Registry](./week0_project_prep/random_terraform_provider/README.md#terraform-registry)
        *   [Terraform Console](./week0_project_prep/random_terraform_provider/README.md#terraform-console)
        *   [Terraform Init](./week0_project_prep/random_terraform_provider/README.md#terraform-init)
        *   [Terraform Plan](./week0_project_prep/random_terraform_provider/README.md#terraform-plan)
        *   [Terraform Apply](./week0_project_prep/random_terraform_provider/README.md#terraform-apply)
        *   [Terraform Lock Files](./week0_project_prep/random_terraform_provider/README.md#terraform-lock-files)
        *   [Terraform State Files](./week0_project_prep/random_terraform_provider/README.md#terraform-state-files)
        *   [Terraform Directory](./week0_project_prep/random_terraform_provider/README.md#terraform-directory)
*   **[S3 Terraform Provider](./week0_project_prep/s3_terraform_provider/README.md)**
    *   [Terraform AWS Provider](./week0_project_prep/s3_terraform_provider/README.md#terraform-aws-provider)
        *   [S3 Provider](./week0_project_prep/s3_terraform_provider/README.md#s3-provider)
        *   [Terraform Destroy](./week0_project_prep/s3_terraform_provider/README.md#terraform-destory)
*   **[Terraform Alias](./week0_project_prep/terraform_alias/README.md)**
    *   [Terraform Alias](./week0_project_prep/terraform_alias/README.md#terraform-alias)
        *   [Troubleshooting](./week0_project_prep/terraform_alias/README.md#troubleshooting)
*   **[Terraform API Token Script](./week0_project_prep/terraform_api_token_script/README.md)**
    *   [Powershell Script](./week0_project_prep/terraform_api_token_script/README.md#powershell-script)
*   **[Terraform Cloud](./week0_project_prep/terraform_cloud/README.md)**
    *   [Terraform Cloud](./week0_project_prep/terraform_cloud/README.md#terraform-cloud)
        *   [Terraform Organization](./week0_project_prep/terraform_cloud/README.md#terraform-organization)
        *   [Terraform Project](./week0_project_prep/terraform_cloud/README.md#terraform-project)
        *   [Terraform Workspace](./week0_project_prep/terraform_cloud/README.md#terraform-workspace)
        *   [Cloud Integration](./week0_project_prep/terraform_cloud/README.md#cloud-integration)
        *   [Terraform Login](./week0_project_prep/terraform_cloud/README.md#terraform-login)
        *   [Terraform Cloud Variables](./week0_project_prep/terraform_cloud/README.md#terraform-cloud-variables)
        *   [Terraform Apply in Terraform Cloud](./week0_project_prep/terraform_cloud/README.md#terraform-apply-in-terraform-cloud)
        *   [Terraform Destroy in Terraform Cloud](./week0_project_prep/terraform_cloud/README.md#terraform-destroy-in-terraform-cloud)

### [Week 1: Building](./week1_building/)

*   **[Root Module Restructure](./week1_building/root_module_restructure/README.md)**
    *   [Standard Directory Structure](./week1_building/root_module_restructure/README.md#standard-directory-structure)
    *   [Terraform Cloud Variables](./week1_building/root_module_restructure/README.md#terraform-cloud-variables)
    *   [Environment Variables in Terraform Cloud](./week1_building/root_module_restructure/README.md#environment-variables-in-terraform-cloud)
    *   [Migrating to Local](./week1_building/root_module_restructure/README.md#migrating-to-local)
    *   [UUID Validation](./week1_building/root_module_restructure/README.md#uuid-validation)
    *   [Terraform Variable on Terraform Cloud](./week1_building/root_module_restructure/README.md#terraform-variable-on-terraform-cloud)
*   **[Terraform Import and Infra Drift](./week1_building/terraform_import_and_infra_drift/README.md)**
    *   [Terraform Import](./week1_building/terraform_import_and_infra_drift/README.md#terraform-import)
    *   [S3 Bucket Variable](./week1_building/terraform_import_and_infra_drift/README.md#s3-bucket-variable)
    *   [Fix Manual Configuration](./week1_building/terraform_import_and_infra_drift/README.md#fix-manual-configuration)
*   **[Static Website Hosting](./week1_building/static_website_hosting/README.md)**
    *   [Static Website Hosting Bucket](./week1_building/static_website_hosting/README.md#static-website-hosting-bucket)
    *   [Uploading Files for Hosting](./week1_building/static_website_hosting/README.md#uploading-files-for-hosting)
    *   [Working with Files of Website](./week1_building/static_website_hosting/README.md#working-with-files-of-website)
    *   [Bucket Etags](./week1_building/static_website_hosting/README.md#bucket-etags)
    *   [Terraform Variable for Referencing File](./week1_building/static_website_hosting/README.md#terraform-variable-for-referencing-file)
    *   [Fileexists Function](./week1_building/static_website_hosting/README.md#fileexists-function)
*   **[Upload Assets and For-Each](./week1_building/upload_assets_and_for_each/README.md)**
    *   [Uploading Assets](./week1_building/upload_assets_and_for_each/README.md#uploading-assets)
    *   [Terraform Fileset](./week1_building/upload_assets_and_for_each/README.md#terraform-fileset)
    *   [Terraform For-Each](./week1_building/upload_assets_and_for_each/README.md#terraform-for-each)
    *   [Terraform Mime Types](./week1_building/upload_assets_and_for_each/README.md#terraform-mime-types)
    *   [Terraform Path Variable](./week1_building/upload_assets_and_for_each/README.md#terraform-path-variable)
    *   [Troubleshooting](./week1_building/upload_assets_and_for_each/README.md#troubleshooting)
*   **[Content Delivery Network](./week1_building/content_delivery_network/README.md)**
    *   [CloudFront Distribution](./week1_building/content_delivery_network/README.md#cloudfront-distribution)
    *   [Terraform Locals](./week1_building/content_delivery_network/README.md#terraform-locals)
    *   [Terraform Data Sources](./week1_building/content_delivery_network/README.md#terraform-data-sources)
    *   [Working with JSON](./week1_building/content_delivery_network/README.md#working-with-json)
    *   [Troubleshooting](./week1_building/content_delivery_network/README.md#troubleshooting)
*   **[Terraform Data and Content Version](./week1_building/terraform_data_and_content_version/README.md)**
    *   [Terraform Lifecycle](./week1_building/terraform_data_and_content_version/README.md#terraform-lifecycle)
    *   [Changing Lifecycle of Resources](./week1_building/terraform_data_and_content_version/README.md#changing-lifecycle-of-resources)
    *   [Terraform Data](./week1_building/terraform_data_and_content_version/README.md#terraform-data)
    *   [Trigerring Changes using Variable](./week1_building/terraform_data_and_content_version/README.md#trigerring-changes-using-variable)
*   **[Invalidate Cache and Local-Exec](./week1_building/invalidate_cache_and_local_exec/README.md)**
    *   [Terraform Provisioner](./week1_building/invalidate_cache_and_local_exec/README.md#terraform-provisioner)
    *   [Local-Exec](./week1_building/invalidate_cache_and_local_exec/README.md#local-exec)
    *   [Remote-Exec](./week1_building/invalidate_cache_and_local_exec/README.md#remote-exec)
*   **[Terrahouse Module](./week1_building/terrahouse_module/README.md)**
    *   [Custom Terraform Module](./week1_building/terrahouse_module/README.md#custom-terraform-module)
    *   [Creating Module Files](./week1_building/terrahouse_module/README.md#creating-module-files)
    *   [Adding Module](./week1_building/terrahouse_module/README.md#adding-module)
    *   [Passing Variables in Module](./week1_building/terrahouse_module/README.md#passing-variables-in-module)
    *   [Outputs in Module](./week1_building/terrahouse_module/README.md#outputs-in-module)
    *   [Fix using Terraform Refresh](./week1_building/terrahouse_module/README.md#fix-using-terraform-refresh)

## Journal

### Week 0: Project Preparation

| Activity | Description |
| :--- | :--- |
| **Terraform Fundamentals** | Gained an understanding of core Terraform concepts such as the Terraform Registry, providers, and modules. Practiced using essential commands like `init`, `plan`, `apply`, and `destroy`. Learned about the importance of the `.terraform.lock.hcl` and `.terraform.tfstate` files. |
| **AWS S3 Provider** | Configured the AWS provider and used it to create an S3 bucket. Utilized the `random` provider to generate a unique bucket name, ensuring compliance with AWS naming conventions. |
| **PowerShell Alias** | Set up a convenient `tf` alias for the `terraform` command in PowerShell to streamline workflow. |
| **Terraform Cloud** | Explored Terraform Cloud for state management and collaboration. Learned how to configure workspaces, manage variables securely, and execute remote plans and applies. |
| **API Token Management** | Created a PowerShell script to manage the Terraform Cloud API token, automating the process of updating the token from an environment variable. |

### Week 1: Building

| Activity | Description |
| :--- | :--- |
| **Root Module Restructure** | Refactored the project to follow a standard Terraform directory structure, separating resources, variables, and outputs into their own files. This improves organization and maintainability. |
| **Terraform Import** | Learned how to use the `terraform import` command to bring existing infrastructure under Terraform management, and how to recover from a lost state file. |
| **Static Website Hosting** | Configured an S3 bucket for static website hosting, including uploading `index.html` and `error.html` pages. Used `fileexists` and `filemd5` to manage file uploads and track changes. |
| **Asset Uploads with `for_each`** | Utilized the `fileset` function and a `for_each` loop to dynamically upload multiple image assets to the S3 bucket, making the process scalable and efficient. |
| **CloudFront CDN** | Implemented a CloudFront distribution to serve the static website, improving performance and availability. Learned how to use `locals` and data sources to configure the distribution. |
| **Content Versioning** | Introduced a `content_version` variable and the `terraform_data` resource to manually trigger updates to the website content and invalidate the CloudFront cache, providing granular control over deployments. |
| **Cache Invalidation with `local-exec`** | Used a `local-exec` provisioner to automatically invalidate the CloudFront cache upon content updates, streamlining the deployment process. |
| **Custom `terrahouse` Module** | Created a custom module to encapsulate the entire infrastructure, promoting code reuse and simplifying the root configuration. |
