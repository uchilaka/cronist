FROM httpd:2.4

ENV PORT 3050

# Setup admin group
RUN groupadd admin

# setup init user and add them to new admin group
RUN useradd --user-group --create-home --shell /bin/bash localadmin &&\
usermod -aG admin localadmin && chown -R localadmin:localadmin /home/localadmin

ENV HOME=/home/localadmin

RUN mkdir -p /usr/src/app

COPY . /usr/src/app

# Copy bower configuration file
COPY bower.json /usr/src/app/
COPY .bowerrc /usr/src/app/

WORKDIR /usr/src/app

# Setup ownership via admin group
RUN chown -R root:admin /usr/src/app
RUN chmod -R g+rw /usr/src/app

# Housekeeping, env setup & updates
RUN apt-get update && apt-get upgrade -y
RUN apt-get install git npm nodejs -y
#RUN apt-get install build-essential -y

#RUN ln -s /usr/bin/nodejs /usr/local/bin/node
RUN /usr/src/app/bin/setup_node

# Install bower package manager (for html5)
RUN npm install bower --global

# Switch user for bower updates
USER localadmin 

RUN cd /usr/src/app

# install bower libraries
#RUN bower install --production
RUN bower install

USER root

# Remove unnecessary stuff
RUN apt-get autoremove -y