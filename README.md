# Requisitos.
## Instalar Virtuabox.
Se puede obtener la última versión de VirtualBox desde la web: https://www.virtualbox.org/wiki/Linux_Downloads.

## Instalar plugin de VirtualBox de Ansible.
```
ansible-galaxy collection install -r requirements.yml
```

# Comandos.
## Crear máquinas virtuales.
```
make create_vms
```

##  Eliminar máquinas virtuales.
```
make destroy_vms
```