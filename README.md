# terraform-nextcloud
In this project I launched a nextcloud on an ec2 instance using terraform to automate the whole process

There are some variables you should change before using the code :
1. Add a pre-made ec2 key to a directory in the repository and edit "private_key" and "key_name" in /infrastructure/main.tf.
2. Add  AWS_ACCESS_KEY_ID , AWS_SECRET_ACCESS_KEY to secrets.
3. Add TERRAFORM_PROVIDER_TOKEN to secrets for a remote backend .
4. Lastly run the workflow (it'll let u know when it's done) then you can access your nextcloud at the address {ec2_public_ip}:8080
<img width="942" alt="nextcloud" src="https://user-images.githubusercontent.com/59322515/130389903-f2fe074f-a03c-48a7-9df4-dc0baaacfac7.png">

