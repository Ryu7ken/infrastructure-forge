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

## Journal

### Week 0: Project Preparation

| Activity | Description |
| :--- | :--- |
| **Terraform Fundamentals** | Gained an understanding of core Terraform concepts such as the Terraform Registry, providers, and modules. Practiced using essential commands like `init`, `plan`, `apply`, and `destroy`. Learned about the importance of the `.terraform.lock.hcl` and `.terraform.tfstate` files. |
| **AWS S3 Provider** | Configured the AWS provider and used it to create an S3 bucket. Utilized the `random` provider to generate a unique bucket name, ensuring compliance with AWS naming conventions. |
| **PowerShell Alias** | Set up a convenient `tf` alias for the `terraform` command in PowerShell to streamline workflow. |
| **Terraform Cloud** | Explored Terraform Cloud for state management and collaboration. Learned how to configure workspaces, manage variables securely, and execute remote plans and applies. |
| **API Token Management** | Created a PowerShell script to manage the Terraform Cloud API token, automating the process of updating the token from an environment variable. |
