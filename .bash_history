git clone https://github.com/sofiasartori/UTN-FRA_SO_Examenes.git
cd ~/UTN-FRA_SO_Examenes/202411/
ls
git clone https://github.com/mtssama/UTNFRA_SO_RECU_2do_TP_Samaniego.git
cd ~
git clone https://github.com/mtssama/UTNFRA_SO_RECU_2do_TP_Samaniego.git
ls UTNFRA_SO_RECU_2do_TP_Samaniego/
cd ~/UTNFRA_SO_RECU_2do_TP_Samaniego/docker
git clone https://github.com/mtssama/UTNFRA_SO_RECU_2do_TP_Samaniego.git
ls ~/UTNFRA_SO_RECU_2do_TP_Samaniego
cd ~/UTNFRA_SO_RECU_2do_TP_Samaniego/docker
mkdir -p ~/UTNFRA_SO_RECU_2do_TP_Samaniego/docker
cd ~/UTNFRA_SO_RECU_2do_TP_Samaniego/docker
cat > index.html <<EOF
<html>
  <body>
    <ul>
      <li>Nombre: mtssama</li>
      <li>Apellido: Samaniego</li>
      <li>División: 116</li>
    </ul>
  </body>
</html>
EOF

cat > Dockerfile <<EOF
FROM nginx
COPY . /usr/share/nginx/html
EOF

docker build -t mtssama/web2-samaniego .
sudo systemctl start docker
exit
cd ~/UTNFRA_SO_RECU_2do_TP_Samaniego/202411/ansible
ansible-playbook punto_d.yml
mkdir -p roles/2PRecuperatorio/tasks
echo "mkdir -p roles/2PRecuperatorio/tasks" >> RTA_Examen_20250629/Punto_D.sh
cat << EOF > roles/2PRecuperatorio/tasks/main.yml
- name: Crear grupo GProfesores
  group:
    name: GProfesores

- name: Crear grupo GAlumnos
  group:
    name: GAlumnos

- name: Crear usuario profesor
  user:
    name: profesor
    group: GProfesores
    shell: /bin/bash
    create_home: yes

- name: Crear usuario alumno
  user:
    name: alumno
    group: GAlumnos
    shell: /bin/bash
    create_home: yes
EOF

echo "cat << EOF > roles/2PRecuperatorio/tasks/main.yml" >> RTA_Examen_20250629/Punto_D.sh
echo "(contenido del archivo con tareas)" >> RTA_Examen_20250629/Punto_D.sh
echo "EOF" >> RTA_Examen_20250629/Punto_D.sh
ansible-playbook punto_d.yml
echo "ansible-playbook punto_d.yml" >> RTA_Examen_20250629/Punto_D.sh
mkdir -p roles/Crea_Carpetas_msamaniego/tasks
echo "mkdir -p roles/Crea_Carpetas_msamaniego/tasks" >> RTA_Examen_20250629/Punto_D.sh
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

echo "cat << EOF > roles/Crea_Carpetas_msamaniego/tasks/main.yml" >> RTA_Examen_20250629/Punto_D.sh
echo "- name: Crear estructura de carpetas para msamaniego" >> RTA_Examen_20250629/Punto_D.sh
echo "  file:" >> RTA_Examen_20250629/Punto_D.sh
echo "    path: \"/home/msamaniego/{{ item }}\"" >> RTA_Examen_20250629/Punto_D.sh
echo "    state: directory" >> RTA_Examen_20250629/Punto_D.sh
echo "    mode: '0755'" >> RTA_Examen_20250629/Punto_D.sh
echo "  with_items:" >> RTA_Examen_20250629/Punto_D.sh
echo "    - proyectos" >> RTA_Examen_20250629/Punto_D.sh
echo "    - documentos" >> RTA_Examen_20250629/Punto_D.sh
echo "    - descargas" >> RTA_Examen_20250629/Punto_D.sh
echo "EOF" >> RTA_Examen_20250629/Punto_D.sh
ansible-playbook punto_d.yml
mkdir -p roles/Cambia_Propiedad_msamaniego/tasks
echo "mkdir -p roles/Cambia_Propiedad_msamaniego/tasks" >> RTA_Examen_20250629/Punto_D.sh
cat << EOF > roles/Cambia_Propiedad_msamaniego/tasks/main.yml
- name: Cambiar propietario de /home/2p a msamaniego
  file:
    path: /home/2p
    owner: msamaniego
    group: msamaniego
    recurse: yes
EOF

echo "nano roles/Cambia_Propiedad_msamaniego/tasks/main.yml" >> RTA_Examen_20250629/Punto_D.sh
ansible-playbook punto_d.yml
mkdir -p roles/Sudoers_msamaniego/tasks
echo "mkdir -p roles/Sudoers_msamaniego/tasks" >> RTA_Examen_20250629/Punto_D.sh
cat <<EOF > roles/Sudoers_msamaniego/tasks/main.yml
- name: Permitir sudo sin contraseña al usuario msamaniego
  lineinfile:
    path: /etc/sudoers
    state: present
    regexp: '^msamaniego'
    line: 'msamaniego ALL=(ALL) NOPASSWD:ALL'
    validate: '/usr/sbin/visudo -cf %s'
EOF

echo "nano roles/Sudoers_msamaniego/tasks/main.yml" >> RTA_Examen_20250629/Punto_D.sh
ansible-playbook punto_d.yml
tree
history -a
mv ~/UTNFRA_SO_RECU_2do_TP_Samaniego/202411/ansible/RTA_Examen_20250629 ~/UTNFRA_SO_RECU_2do_TP_Samaniego/
history -a
mv ~/UTNFRA_SO_RECU_2do_TP_Samaniego/202411/ansible/RTA_Examen_20250629 ~/UTNFRA_SO_RECU_2do_TP_Samaniego/
cd ~/UTNFRA_SO_RECU_2do_TP_Samaniego
tree -a -L 3
rm -rf ~/UTNFRA_SO_RECU_2do_TP_Samaniego/202411/RTA_Examen_202406
rm -rf ~/UTNFRA_SO_RECU_2do_TP_Samaniego/RTA_Examen_20250629/RTA_Examen_20250629
history -a
ls -l ~/.bash_history
cp ~/.bash_history ~/UTNFRA_SO_RECU_2do_TP_Samaniego/
rm -rf ~/UTNFRA_SO_RECU_2do_TP_Samaniego/202411/RTA_Examen_202406
rm -rf ~/UTNFRA_SO_RECU_2do_TP_Samaniego/RTA_Examen_20250629/RTA_Examen_20250629
history -a
cp ~/.bash_history ~/UTNFRA_SO_RECU_2do_TP_Samaniego/
cd ~/UTNFRA_SO_RECU_2do_TP_Samaniego
tree -a -L 4
cd ~/UTNFRA_SO_RECU_2do_TP_Samaniego
tree -a -L 5
cd ~
git clone https://github.com/mtssama/UTNFRA_SO_RECU_2do_TP_Samaniego.git puntos_antiguos
cp ~/puntos_antiguos/202411/RTA_Examen_*/Punto_A.sh ~/UTNFRA_SO_RECU_2do_TP_Samaniego/RTA_Examen_20250629/
cp ~/puntos_antiguos/202411/RTA_Examen_*/Punto_B.sh ~/UTNFRA_SO_RECU_2do_TP_Samaniego/RTA_Examen_20250629/
tree ~/puntos_antiguos/202411
cd ~
git clone https://github.com/mtssama/UTNFRA_SO_RECU_2do_TP_Samaniego.git puntos_antiguos
cd ~/UTNFRA_SO_RECU_2do_TP_Samaniego
cp ~/puntos_antiguos/Punto_A.sh .
cp ~/puntos_antiguos/Punto_B.sh .
cp -r ~/puntos_antiguos/docker .
ls Punto_A.sh Punto_B.sh docker/index.html docker/Dockerfile
history -a
