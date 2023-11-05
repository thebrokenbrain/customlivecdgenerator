all:

.PHONY: create_vm
create_vm:
	@echo "Creating virtual machines"
	ansible-playbook main.yml --tags create_vm

.PHONY: destroy_vm
destroy_vm:
	@echo "Destroying virtual machines"
	ansible-playbook main.yml --tags destroy_vm
