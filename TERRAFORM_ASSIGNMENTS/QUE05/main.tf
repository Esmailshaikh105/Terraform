resource "aws_key_pair" "my_key" {
  key_name   = var.aws_key_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKZUeh5ZssVKihdY0IUg7kFehTleZQLsQJQuy6K19Aff0D3j8roAH3pTq9yxJkHsyD62SKOeUqgnIbOfwv9JW0T4LGKSkU7WH5WZ+b1An7tZwA3U827mh0VbgalH0FanO1r46p83b0T2oqy/7K+L699LMD3f6StUcHyQ8GZ7c0E1NZirJbBfzm6lV+gEQchlznykc88ku/OXMQuliCRV24YHentKQhE13psPCXTPhp34JOMJdYlDvSQYHendO/GFsjf7Fq+30rNgdgFUYaFiAxR59tHU2mJIAdA/k+u45cW6LdZp9Ww2XTHg39njGaGc8M6crFbDwbOU46GDz0NtWV"
}


resource "aws_instance" "myec21" {
  count =  3 
  ami     = var.ami_id
  instance_type = var.instance_type      
  key_name = aws_key_pair.my_key.key_name  
}