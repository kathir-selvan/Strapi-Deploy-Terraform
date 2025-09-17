. Generate an AWS key pair:
   ```sh 

   aws ec2 create-key-pair --key-name strapi-key --query "KeyMaterial" --output text > strapi-key.pem
