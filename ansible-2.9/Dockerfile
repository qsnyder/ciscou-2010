FROM qsnyder/python-3.7:latest

RUN echo 'PS1="\[\e[36m\]\u\[\e[m\]\[\e[37m\]@\[\e[m\]\[\e[32m\]ansible2.9\[\e[m\]:\[\e[33m\]\w\[\e[m\]\[\e[33m\]\\$\[\e[m\] "' >> /root/.bashrc

COPY requirements.txt .

RUN pip install -r requirements.txt

RUN ansible-galaxy collection install ansible.netcommon

WORKDIR /root/mycode

CMD ["/bin/bash"]
