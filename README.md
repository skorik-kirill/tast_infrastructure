# Infrastructure for test task 

## Description

This repo contain terraform code that create ansible infra and apply it 
to remote ec2 in AWS.
Terraform creates ansible `playbook.yml`, `inventory` files, and execute it in local host.
In the `/ansible` folder added `nginx.conf` file, that contain config for nginx service.

## terraform files description

For execute terraform clone repo with file to local host
`git clone https://github.com/skorik-kirill/tast_infrastructure.git`
Two folders created `/ansible` and `/terraform`. All configuration locate in `/terraform/main.tf` file
Change IP address of destination host, username who has access via ssh to remote host  in `main.tf` file
Optional IP address of remote host on local machine in default inventory `/etc/ansible/hosts`.
Application locate in `https://github.com/skorik-kirill/test_task.git` git repo.
When all changes applied, `main.tf` ready to execute

`main.tf` containt two resource creation:
- `playbook.yml`: ansible playbook with configuration that will be apply on remote host(our case AWS EC2)
It install nginx, start nginx, install pip, copy configuration for nginx.conf, copy application script to remote host.
- `inventory`: ansible inventory file with destination hosts



## Execute terraform

In `/test_task/terraform` run `terraform init` for init terraform working directory, apply all providers and verify files.
Run `terraform plan` that shows which resources will be created. 
Run `terraform apply` that apply configuration from `main.tf`

