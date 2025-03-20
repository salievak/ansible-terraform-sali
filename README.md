# 🛠 Build infrastructure with Terraform and configure the environment with Ansible

# ✒ Preparation:
- registered account in GCP
- installing the gcloud cli and setting up a profile
- install Terraform on your device
- install Ansible on your device
- configured SSH keys for logging into instances

# 📂 Files that describe the creation and configuration of the infrastructure:
```
gcp-terraform-ansible/
├── main.tf 
├── provider.tf
├── ansible/
│   ├── playbook.yml
│   ├── inventory.ini
│   ├── templates/
│   │   ├── index.html.j2
│   │   ├── nginx-debian.conf.j2
│   │   └── nginx-ubuntu.conf.j2
```
