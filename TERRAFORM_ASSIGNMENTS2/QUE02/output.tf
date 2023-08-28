output "public-ip" {
  value = aws_instance.this.public_ip
}

output "public-dns" {
  value = aws_instance.this.public_dns
}

output "private-ip" {
  value = aws_instance.this.private_ip
}

output "private-dns" {
  value = aws_instance.this.private_dns
}

