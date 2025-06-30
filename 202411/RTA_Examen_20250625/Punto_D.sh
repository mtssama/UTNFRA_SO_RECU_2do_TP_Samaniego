cd ~/UTNFRA_SO_RECU_2do_TP_Samaniego/202411/ansible
ansible-playbook punto_d.yml
mkdir -p roles/Crea_Carpetas_msamaniego/tasks
nano roles/Crea_Carpetas_msamaniego/tasks/main.yml
mkdir -p roles/Cambia_Propiedad_msamaniego/tasks
nano roles/Cambia_Propiedad_msamaniego/tasks/main.yml
mkdir -p roles/Sudoers_msamaniego/tasks
nano roles/Sudoers_msamaniego/tasks/main.yml
mkdir -p roles/Sudoers_msamaniego/tasks
cat << EOF > roles/Sudoers_msamaniego/tasks/main.yml
- name: Permitir sudo sin contraseña al usuario msamaniego
  copy:
    dest: /etc/sudoers.d/msamaniego
    content: 'msamaniego ALL=(ALL) NOPASSWD:ALL'
    owner: root
    group: root
    mode: '0440'
EOF
mkdir -p roles/2PRecuperatorio/tasks
cat << EOF > roles/2PRecuperatorio/tasks/main.yml
(contenido del archivo con tareas)
EOF
ansible-playbook punto_d.yml
mkdir -p roles/Crea_Carpetas_msamaniego/tasks
cat << EOF > roles/Crea_Carpetas_msamaniego/tasks/main.yml
- name: Crear estructura de carpetas para msamaniego
  file:
    path: "/home/msamaniego/{{ item }}"
    state: directory
    mode: '0755'
  with_items:
    - proyectos
    - documentos
    - descargas
EOF
mkdir -p roles/Cambia_Propiedad_msamaniego/tasks
nano roles/Cambia_Propiedad_msamaniego/tasks/main.yml
mkdir -p roles/Sudoers_msamaniego/tasks
nano roles/Sudoers_msamaniego/tasks/main.yml
