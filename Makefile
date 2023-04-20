NAME ?= "empty"
UNAME := $(shell uname)

.PHONY: test
test:
	find . -mindepth 1 -maxdepth 1 -not -path '*/.*' -type d -exec make -C {} test \;

.PHONY: new-scenario
new-scenario:
	if [[ "$(NAME)" == "empty" ]]; then echo "Please provide a scenario name"; exit 1; fi
	cp -r .delivery_template $(NAME)

	sed "s/<DELIVERY_TOOL_NAME>/$(NAME)/g" $(NAME)/README.md > tmp && mv tmp $(NAME)/README.md


