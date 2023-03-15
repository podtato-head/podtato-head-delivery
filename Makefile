.PHONY: test
test:
	find . -mindepth 1 -maxdepth 1 -not -path '*/.*' -type d | xargs make -C {} test
