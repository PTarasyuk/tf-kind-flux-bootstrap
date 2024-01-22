output "private_key_pem" {
  sensitive   = true
  value       = tls_private_key.this.private_key_pem
  description = "The generated private key in PEM format"
}

output "public_key_openssh" {
  sensitive   = true
  value       = tls_private_key.this.public_key_openssh
  description = "The generated public key in OpenSSH format"
}