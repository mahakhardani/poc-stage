FROM  vookimedlo/ubuntu-gcc:gcc_bionic
ARG ssh_prv_key
ARG ssh_pub_key


# Authorize SSH Host
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keyscan ach-gitlab > /root/.ssh/known_hosts

# Add the keys and set permissions
RUN echo "$ssh_prv_key" > /root/.ssh/id_rsa && \
    echo "$ssh_pub_key" > /root/.ssh/id_rsa.pub && \
    chmod 600 /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa.pub

RUN apt update && apt-get install -y libasound2-dev
#RUN apt install  cmake
#RUN apt-get install -y git
WORKDIR /scapin/

RUN  git clone --recurse-submodules  git@ach-gitlab:equipements/scapin.git . && ./generer_projet.sh -c -b linux_host && chmod +x TargetLinuxHost/ScapinNoUnityRelease/Scapin
#RUN  generer_projet.sh -c -b linux_host && chmod +x $HOME/scapin/TargetLinuxHost/ScapinNoUnityRelease/Scapin
#RUN git  clone --recurse-submodules  http://ach-gitlab/equipements/scapin.git
#RUN cd scapin
#RUN ./generer_projet.sh -c -b linux_host
CMD ["/bin/sh/TargetLinuxHost/ScapinNoUnityRelease/Scapin"]
