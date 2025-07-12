# Terraform Alias

We will setup a 'tf' alias for terraform in our system.

I am using Powershell to run terraform commands, so below are the steps I followed to setup the alias.

```powershell
#Open Profile script to set the alias
notepad $PROFILE
```

After Profile script opens in Notepad we will write the below config, save and close it.

```text
Set-Alias tf terraform
```

Then reload the Profile.

```powershell
. $PROFILE
```

## Troubleshooting

Faced an error to setup the alias as Windows by default doesn't allow to run scripts for security reasons. So we will make some configuration changes on Windows to allow to load the Profile script and accept the alias.

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
. $PROFILE
```

Now the Profile script we created with the alias config will be accepted and we can check by simply typing - **tf**