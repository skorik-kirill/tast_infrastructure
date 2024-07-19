# Infrastructure for test task 

## Description

This repo contain terraform code that create ansible infra and apply it 
to remote ec2 in AWS.
Terraform creates ansible `playbook.yml`, `inventory` files, and execute it in local host.
In the `/ansible` folder added `nginx.conf` file, that contain config for nginx service.

## Additional configuration on local host
For execute ansible playbooks to remote host, configure ssh connection between local host and
remote hosts. Locate ansible configuration file on local host `/etc/ansible/hosts`, add:
```
[server]
<SERVER IP ADDRESS>
[server:vars]
ansible_python_interpreter=/usr/bin/python3
ansible_ssh_private_key_file=<YOUR PRIVATE KEY>

```

## Terraform execute file with description

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
- `inventory`: ansible inventory file with destination hosts.

In `/test_task/terraform` run `terraform init` for init terraform working directory, apply all providers and verify files.
Run `terraform plan` that shows which resources will be created. 
Run `terraform apply` that apply configuration from `main.tf`
After resources created, terraform execute command for apply ansible playbook. 
