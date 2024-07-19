# Infrastructure for test task 

## Description

This repo contain terraform code that create ansible infra and apply it 
to remote ec2 in AWS.
Terraform creates ansible `playbook.yml`, `inventory` files, and execute it in local host.
In the `/ansible` folder added `nginx.conf` file, that contain config for nginx service.

## Execute terraform 

For execute terraform clone repo with file to local host
`git clone https://github.com/skorik-kirill/tast_infrastructure.git`


