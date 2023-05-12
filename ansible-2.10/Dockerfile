FROM qsnyder/python-3.10:latest

RUN echo 'PS1="\[\e[36m\]\u\[\e[m\]\[\e[37m\]@\[\e[m\]\[\e[32m\]ansible2.10\[\e[m\]:\[\e[33m\]\w\[\e[m\]\[\e[33m\]\\$\[\e[m\] "' >> /root/.bashrc

COPY requirements.txt .

RUN pip install -r requirements.txt

RUN ansible-galaxy collection install cisco.ios && ansible-galaxy collection install cisco.nxos

WORKDIR /root/mycode

CMD ["/bin/bash"]
