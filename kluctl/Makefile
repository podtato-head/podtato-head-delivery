INSTALL_DIR = $(shell pwd)/.install

KLUCTL_VERSION = 2.19.3
KLUCTL = $(INSTALL_DIR)/kluctl-$(KLUCTL_VERSION)

$(KLUCTL):
	@echo "--------------"
	@echo "Install Kluctl"
	@echo "--------------"
	mkdir -p $(INSTALL_DIR)
	curl -s https://raw.githubusercontent.com/kluctl/kluctl/main/install/kluctl.sh | kluctl_VERSION=$(KLUCTL_VERSION) bash -s $(INSTALL_DIR)
	mv $(INSTALL_DIR)/kluctl $(KLUCTL)

.PHONY: install
install: $(KLUCTL)

.PHONY: uninstall
uninstall: delete-app
	cd app && $(KLUCTL) delete -t test --yes || true
	rm $(KLUCTL)

.PHONY: deploy-app
deploy-app:
	cd app && $(KLUCTL) deploy -t test --yes

.PHONY: delete-app
delete-app:
	cd app && $(KLUCTL) delete -t test --yes

.PHONY: test
test: install deploy-app
	make delete-app
