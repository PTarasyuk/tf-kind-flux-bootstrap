# TLS Private Key Terraform Module

This Terraform module generates a private key for Transport Layer Security (TLS).

## Usage

```hcl
module "tls_private_key" {
  source = "./modules/hashicorp-tls-keys"

  algorithm   = var.algorithm
  ecdsa_curve = var.ecdsa_curve
}

output "private_key_pem" {
  value = module.tls_private_key.private_key_pem
}

output "public_key_openssh" {
  value = module.tls_private_key.public_key_openssh
}
```

## Inputs

| Name          | Description                              | Type   | Default |
| ------------- | ---------------------------------------- | ------ | ------- |
| `algorithm`   | The algorithm to use for the private key | string | ECDSA   |
| `ecdsa_curve` | The curve to use for ECDSA               | string | P256    |

## Outputs

- `private_key_pem` - The generated private key in PEM format
- `public_key_openssh` - The generated public key in OpenSSH format

## Requirements

This module requires the following provider:

[`hashicorp/tls` version 4.0.4](https://registry.terraform.io/providers/hashicorp/tls/)

## License

This module is licensed under the MIT License. See the LICENSE file for details.