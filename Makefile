NAME = ryanjohnston/dotfiles

all:: build

build:
	docker build --no-cache --rm --tag=$(NAME) .

push:
	docker push $(NAME)

shell:
	docker run -u 501:1000 --interactive --rm --tty -v $(shell pwd):/workdir -w /workdir $(NAME) /bin/bash
