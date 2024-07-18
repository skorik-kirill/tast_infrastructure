resource "local_file" "inventory" {
  content = <<-EOT
[app]
localhost ansible_connection=local
EOT
  filename = "ansible/ansible_hosts"
}

resource "local_file" "playbook" {
  content = <<-EOT
---
- name: Configure Application Server
  hosts: app
  connection: local
  become: yes
  
  tasks:
    - name: Clone application code to host
      git:
        repo: https://github.com/skorik-kirill/test_task.git
        dest: /tmp/application
        update: yes
    - name: Install Nginx
      apt:
        name: nginx
        state: present
    - name: Start Nginx Service
      service:
        name: nginx
        state: started
    EOT
    filename = "ansible/playbook.yml"

  provisioner "local-exec" {
    command = "ansible-playbook -i ansible/ansible_hosts ansible/playbook.yml"
  }
}