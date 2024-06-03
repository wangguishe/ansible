# install containerd
ansible-playbook -i hosts install_containerd_roles.yaml

# init ubuntu
ansible-playbook -i hosts init_ubuntu_role.yaml

