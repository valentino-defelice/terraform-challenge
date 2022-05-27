# Popular en linea challenge

## How to use it
Inside `variables.tf` replace **default** value of `b64_token` variable with urlscan api token **encoded as Base64**.
1. `terraform init`
2. `terraform plan`
3. `terraform apply --auto-approve`

## Details

This challenge will create an EC2 instance which will consume https://urlscan.io/ API to scan **https://popularenlinea.com**, store result in a file (api_output.json) and store that file into a S3 Bucket.

## Author: Valentino Defelice
