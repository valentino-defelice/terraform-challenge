# Getting Instance AMI (Ubuntu)
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Creating EC2 instance with default values (VPC, ..)
resource "aws_instance" "instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  depends_on = [
    aws_s3_bucket.bucket
  ]

  iam_instance_profile = aws_iam_instance_profile.profile.name

  user_data = <<EOF
#!/bin/bash
# Installing ZIP module
apt-get update > /dev/null
apt-get install -y zip > /dev/null

# Installing AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -qq awscliv2.zip 
sudo ./aws/install

# Setting env variables
url="${var.url}"
apikey=$(echo ${var.b64_token} | base64 -d)

# API Request and output to "api_output.json"
curl -X POST "https://urlscan.io/api/v1/scan/" \
      -H "Content-Type: application/json" \
      -H "API-Key: $apikey" \
      -d "{ \
        \"url\": \"$url\", \"visibility\": \"public\"
      }" -o api_output.json

# Move file to S3 bucket
aws s3 cp api_output.json s3://${var.bucket_name}
EOF

}

