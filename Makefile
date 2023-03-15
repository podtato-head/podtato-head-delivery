.PHONY: test
test:
	find . -not -path '*/.*' -type d -depth 1 | xargs make -C {} test
