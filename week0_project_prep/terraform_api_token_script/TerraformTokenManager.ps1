# TerraformTokenManager.ps1
param(
    [switch]$Verbose
)

# Set error action preference
$ErrorActionPreference = "Stop"

# Define paths following Terraform standard practice (AppData\Roaming)
$TerraformDir = Join-Path $env:APPDATA "terraform.d"
$CredentialsFile = Join-Path $TerraformDir "credentials.tfrc.json"
$EnvVarName = "TERRAFORM_CLOUD_TOKEN"

Write-Host "Terraform Cloud Token Manager" -ForegroundColor Cyan
Write-Host "=============================" -ForegroundColor Cyan

try {
    # Check if environment variable exists
    $Token = [System.Environment]::GetEnvironmentVariable($EnvVarName, [System.EnvironmentVariableTarget]::User)
    
    if (-not $Token) {
        Write-Host "ERROR: Environment variable '$EnvVarName' not found!" -ForegroundColor Red
        Write-Host "Please set up the environment variable first using:" -ForegroundColor Yellow
        Write-Host "setx TERRAFORM_CLOUD_TOKEN `"your-token-here`"" -ForegroundColor Yellow
        exit 1
    }
    
    if ($Verbose) {
        Write-Host "SUCCESS: Found environment variable '$EnvVarName'" -ForegroundColor Green
        Write-Host "Token: $($Token.Substring(0, 8))..." -ForegroundColor Gray
    }
    
    # Create terraform.d directory if it doesn't exist
    if (-not (Test-Path $TerraformDir)) {
        Write-Host "INFO: Creating Terraform directory: $TerraformDir" -ForegroundColor Yellow
        New-Item -ItemType Directory -Path $TerraformDir -Force | Out-Null
    }
    
    # Create credentials JSON structure (corrected format)
    $CredentialsObject = @{
        credentials = @{
            "app.terraform.io" = @{
                token = $Token
            }
        }
    }
    
    # Convert to JSON with proper formatting and ensure clean output
    $JsonContent = $CredentialsObject | ConvertTo-Json -Depth 3 -Compress:$false
    
    # Write to credentials file with UTF8 without BOM
    Write-Host "INFO: Writing credentials to: $CredentialsFile" -ForegroundColor Yellow
    [System.IO.File]::WriteAllText($CredentialsFile, $JsonContent, [System.Text.UTF8Encoding]::new($false))
    
    # Verify file was created successfully
    if (Test-Path $CredentialsFile) {
        Write-Host "SUCCESS: Credentials file updated successfully!" -ForegroundColor Green
        
        if ($Verbose) {
            Write-Host "File contents:" -ForegroundColor Gray
            Get-Content $CredentialsFile | ForEach-Object { Write-Host "   $_" -ForegroundColor Gray }
        }
        
        Write-Host "File location: $CredentialsFile" -ForegroundColor Gray
    } else {
        throw "Failed to create credentials file"
    }
    
    Write-Host "COMPLETE: Terraform Cloud token configuration complete!" -ForegroundColor Green
    Write-Host "You can now run terraform commands without manually updating tokens." -ForegroundColor Green
    
} catch {
    Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}