# Run self-hosted agent in a docker container
# to build the image: docker build --tag=azp-agent .
# to create the container and run it: docker run -it --name azp-agent azp-agent:latest
# to run it: docker run -it azp-agent:latest


FROM ubuntu:22.04

RUN apt update && apt upgrade -y && apt install -y curl libicu70 git

RUN mkdir -p /opt/azp
WORKDIR /opt/azp

RUN curl -fkSL -o vstsagent.tar.gz https://vstsagentpackage.azureedge.net/agent/3.227.2/vsts-agent-linux-x64-3.227.2.tar.gz
RUN tar -zxvf vstsagent.tar.gz

ENV AGENT_ALLOW_RUNASROOT=1
ENV ENV_AZP_URL=https://dev.azure.com/diegocairone
ENV ENV_AZP_TOKEN=
ENV ENV_AZP_AGENT_NAME=my-own-agent

RUN ./config.sh --acceptteeeula --url $ENV_AZP_URL --auth PAT --token $ENV_AZP_TOKEN --agent $ENV_AZP_AGENT_NAME --pool Default --work _work

ENTRYPOINT ./run.sh; 
