FROM kasmweb/kali-rolling-desktop:1.18.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########

# Allow using sudo without password
RUN echo 'kasm-user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# run custom stuff when the container starts up
COPY --chown=1000 --chmod=755 ./custom_startup.sh $STARTUPDIR/custom_startup.sh

# shortcut to start OpenVPN for TryHackMe
COPY --chown=root --chmod=755 ./tryhackmevpn.sh /usr/local/bin/
COPY --chown=1000 --chmod=755 ./tryhackmevpn.desktop /home/kasm-default-profile/Desktop

# install openconnect
RUN apt-get update && apt-get install -y openvpn iputils-ping xfce4-terminal \
    python3.13-venv dirb openssh-client tnftp dnsutils \
    && apt-get clean

# Generate Hungarian locale for accented characters to work
RUN sed -i 's/# hu_HU.UTF-8 UTF-8/hu_HU.UTF-8 UTF-8/g' /etc/locale.gen && locale-gen

######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000