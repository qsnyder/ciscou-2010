SHELL := /usr/bin/env bash
.PHONY: build-python-3.7 build-python-3.10 build-ansible-2.9 build-ansible-2.10 python-3.7 python-3.10 ansible-2.9 ansible-2.10

build-python-3.7:
			docker build -t qsnyder/python-3.7 ./python-3.7/

build-python-3.10:
			docker build -t qsnyder/python-3.10 ./python-3.10/

build-ansible-2.9:
			docker build -t qsnyder/ansible-2.9 ./ansible-2.9/

build-ansible-2.10:
			docker build -t qsnyder/ansible-2.10 ./ansible-2.10/

python-3.7:
			docker run -it --rm --privileged -e "TERM=xterm-256color" -v $$(pwd)/python-3.7:/root/mycode qsnyder/python-3.7

python-3.10:
			docker run -it --rm --privileged -e "TERM=xterm-256color" -v $$(pwd)/python-3.10:/root/mycode qsnyder/python-3.10

ansible-2.9:
			docker run -it --rm --privileged -e "TERM=xterm-256color" -v $$(pwd)/ansible-2.9:/root/mycode qsnyder/ansible2.9

ansible-2.10:
			docker run -it --rm --privileged -e "TERM=xterm-256color" -v $$(pwd)/ansible-2.10:/root/mycode qsnyder/ansible2.10