FROM ubuntu:trusty

MAINTAINER Rich Pelavin rich@reactor8.com

RUN apt-get update

RUN apt-get install -y git

RUN git clone https://github.com/rich-reactor8/dtk-node-agent /tmp/dtk-node-agent

RUN /tmp/dtk-node-agent/install_agent.sh

RUN service mcollective stop

ADD etc/mcollective/server_run_in_foreground.cfg /etc/mcollective/server.cfg

ADD etc/mcollective/facts.yaml /etc/mcollective/facts.yaml
ADD etc/mcollective/ssh /etc/mcollective/ssh
ADD ssh/ /root/.ssh/

CMD ["service","mcollective","start"]
