resource "local_file" "inventory" {
  content = <<-EOT
[server]
54.197.218.16 ansible_user=ec2-user

[server:vars]
ansible_user=ec2-user
EOT
  filename = "ansible/ansible_hosts"
}

resource "local_file" "playbook" {
  content = <<-EOT
---
- hosts: all
  become: true
  tasks:
    - name: Install nginx
      dnf:
        name: nginx
        state: latest
    - name: Restart Nginx
      service:
        name: nginx
        state: restarted
    - name: Clone application code to host
      git:
        repo: https://github.com/skorik-kirill/test_task.git
        dest: /tmp/application
        update: yes
        force: yes
    - name: install pip
      dnf:
        name: pip
        state: latest
      become: true
    - name: copy nginx config 
      copy:
        src: /home/kyrylo/Python/test_task/ansible/nginx.conf
        dest: /etc/nginx/nginx.conf
    EOT
    filename = "ansible/playbook.yml"

  provisioner "local-exec" {
    command = "ansible-playbook  ansible/playbook.yml -u ec2-user"
  }
}