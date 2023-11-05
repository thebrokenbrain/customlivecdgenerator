all:

.PHONY: create
create_vms:
	@echo "Creating virtual machines"
	ansible-playbook main.yml --tags create_vm

.PHONY: destroy
destroy_vms:
	@echo "Destroying virtual machines"
	ansible-playbook main.yml --tags destroy_vm