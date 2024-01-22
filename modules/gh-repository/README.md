# GitHub Repository Terraform Module

This Terraform module creates a private repository on GitHub, and adds a deploy key to it.

## Usage

```hcl
module "github_repository" {
  source                   = "./modules/github-repository"
  github_owner             = var.github_owner
  github_token             = var.github_tken
  repository_name          = var.flux_github_repo
  public_key_openssh       = module.hc_tls_key.public_key_openssh
  public_key_openssh_title = "flux0"
}
module "hc_tls_key" {
  source = "./modules/hc-tls-keys"
}
```

## Inputs

| Name                       | Description                                                           | Type   | Default       |
| -------------------------- | --------------------------------------------------------------------- | ------ | ------------- |
| `github_owner`             | The name of the GitHub account that will own the repository           | string |               |
| `github_token`             | A GitHub personal access token with the repo scope                    | string |               |
| `repository_name`          | The name of the repository to create                                  | string | test-provider |
| `public_key_openssh_title` | The title of the public key to use as a deploy key for the repository | string |               |
| `public_key_openssh`       | The public key to use as a deploy key for the repository              | string |               |

## Outputs

None.

## Requirements

This module requires the following provider:

[`integrations/github` version >= 5.9.1](https://registry.terraform.io/providers/integrations/github/)

## License

This module is licensed under the MIT License. See the LICENSE file for details.