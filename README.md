# terraform-nextcloud
In this project I launched a nextcloud on an ec2 instance using terraform to automate the whole process

There are some variables you should change before using the code :
1. Add your ec2 key to a directory in the repository and edit "private_key" and "key_name" in /infrastructure/main.tf.
2. Add  AWS_ACCESS_KEY_ID , AWS_SECRET_ACCESS_KEY.
3. Add TERRAFORM_PROVIDER_TOKEN for a remote backend .
4. Run the workflow when it's done   you can access your nextcloud at your ec2 instance public ip address port 8080
<img width="942" alt="nextcloud" src="https://user-images.githubusercontent.com/59322515/130389903-f2fe074f-a03c-48a7-9df4-dc0baaacfac7.png">

