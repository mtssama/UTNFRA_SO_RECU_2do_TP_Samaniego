cd ~/UTNFRA_SO_RECU_2do_TP_Samaniego/202411/ansible
ansible-galaxy init roles/2PRecuperatorio
ansible-galaxy init roles/Crea_Carpetas_msamaniego
ansible-galaxy init roles/Cambia_Propiedad_msamaniego
ansible-galaxy init roles/Sudoers_msamaniego
cat <<EOY > punto_d.yml
---
- name: Playbook Punto D
  hosts: localhost
  become: true

  roles:
    - 2PRecuperatorio
    - Crea_Carpetas_msamaniego
    - Cambia_Propiedad_msamaniego
    - Sudoers_msamaniego
EOY
ansible-playbook -i hosts punto_d.yml --ask-become-pass
