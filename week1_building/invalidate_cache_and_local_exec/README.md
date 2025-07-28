# Terraform Provisioner

[Provisioners](https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax)

Provisioners allow you to execute commands on a compute instance. Eg - AWS CLI commands.

They are not recommended to use by Hashicorp because Configuration Management tools such as **Ansible** are a better fit, but the functionality exists.

```hcl
provisioner "local-exec" {
# https://developer.hashicorp.com/terraform/language/expressions/strings
    interpreter = ["PowerShell", "-Command"]
    command = "aws cloudfront create-invalidation --distribution-id ${aws_cloudfront_distribution.s3_distribution.id} --paths '/*'"
}
```

## Local-Exec

This will execute commands on the machine running Terraform commands. Eg - `terraform apply`.

## Remote-Exec

This will execute commands on a machine which you target. You will need to provide credentials such as **SSH** to get into the machine.

```hcl
resource "aws_instance" "web" {
  # ...

  # Establishes connection to be used by all
  # generic remote provisioners (i.e. file/remote-exec)
  connection {
    type     = "ssh"
    user     = "root"
    password = var.root_password
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "puppet apply",
      "consul join ${aws_instance.web.private_ip}",
    ]
  }
}
```