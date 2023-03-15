.PHONY: test
test:
	 find . -mindepth 1 -maxdepth 1 -not -path '*/.*' -type d -exec make -C {} test \;
