FROM docker.iscinternal.com/intersystems/iris:2020.3.0-latest

USER root

RUN apt-get update && apt-get install -y \
	nano \
    arping \
	sudo && \
	/bin/echo -e ${ISC_PACKAGE_MGRUSER}\\tALL=\(ALL\)\\tNOPASSWD: ALL >> /etc/sudoers && \
	sudo -u ${ISC_PACKAGE_MGRUSER} sudo echo enabled passwordless sudo-ing for ${ISC_PACKAGE_MGRUSER}

COPY session.sh /

RUN mkdir /opt/demo && \
    chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/demo

USER ${ISC_PACKAGE_MGRUSER}

WORKDIR /opt/demo

ARG IRIS_MIRROR_ROLE=master

COPY Installer.cls .
COPY src src

SHELL [ "/session.sh" ]

RUN \
do $SYSTEM.OBJ.Load("Installer.cls", "ck") \
set sc = ##class(Demo.Installer).setup()

COPY init_mirror.sh /
