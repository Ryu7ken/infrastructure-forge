# Powershell Script

We will create a Powershell scirpt using any LLM. I used Claude to create the script.

The script follows the standard practice of create the directory structure and file if they are not present. It also take the API Token from the Environment Variable and updates it eveytime the Environment Variable changes.

```powershell
#To set the Environment Variable with the Terraform Cloud API Token
setx TERRAFORM_CLOUD_TOKEN "your-token-here"
```

Run the script after the Environment Variable is set.

```powershell
.\TerraformTokenManager.ps1 -Verbose
```