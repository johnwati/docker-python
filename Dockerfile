# FROM ubuntu:18.04

# RUN apt-get update -y ; apt-get upgrade -y
# RUN apt-get install -y apache2 --no-install-recommends; apt-get install -y libapache2-mod-wsgi-py3 --no-install-recommends
# RUN a2enmod wsgi

# RUN mkdir /var/www/BasicFlaskApp
# COPY . /var/www/BasicFlaskApp

# RUN cd /usr/local/bin ; ln -s /usr/bin/python3 python

# # Need to get up to date pip
# RUN apt-get install -y wget --no-install-recommends
# RUN adduser --system --group --disabled-login bflaskappuser ; cd /home/bflaskappuser/
# RUN apt-get update -y ; apt-get upgrade -y
# RUN apt-get install -y python3-pip --no-install-recommends
# RUN wget -O get-pip.py 'https://bootstrap.pypa.io/get-pip.py' ; python get-pip.py --disable-pip-version-check --no-cache-dir
# # pip should be now pip3
# RUN pip --version ; rm -f get-pip.py
# RUN pip install psycopg2-binary

# RUN python -m pip install -U pip
# RUN pip install pynacl 

# RUN python -m pip install --upgrade pip

# RUN   apt-get install -y dh-virtualenv
# RUN   apt-get update -y
# # RUN   apt-get install -y git-buildpackage
# # RUN  apt-get install -y  python3-psycopg2
# # RUN pip3 install psycopg2
# RUN pip install psycopg2-binary

# RUN        pip install -r /var/www/BasicFlaskApp/requirements.txt
# # RUN        python setup.py install
# # RUN  python setup.py build_ext --pg-config /path/to/pg_config build

# RUN   apt-get install build-essential libssl-dev
# RUN libffi-dev python-virtualenv python3-dev git-buildpackage
# RUN python3-pip libpq-dev
# RUN debhelper



# #temp looking for workaround
# #https://github.com/pypa/pip/issues/6158
# RUN pip install --no-cache-dir -r /var/www/BasicFlaskApp/requirements.txt
# RUN pip install -r /var/www/BasicFlaskApp/requirements.txt

# RUN chown -R bflaskappuser:www-data /var/www/BasicFlaskApp

# COPY BasicFlaskApp.conf /etc/apache2/sites-available/BasicFlaskApp.conf
# RUN a2ensite BasicFlaskApp

# RUN python -m pip install --upgrade pip &&  pip install -r requirements.txt && python setup.py install
# RUN rm -rf /etc/apache2/sites-available/000-default.conf
# RUN rm -rf /etc/apache2/sites-enabled/000-default.conf

# RUN rm -rf /var/www/BasicFlaskApp/BasicFlaskApp.conf
# RUN rm -rf /var/www/BasicFlaskApp/Dockerfile
# RUN rm -rf /var/www/BasicFlaskApp/requirements.txt

# RUN service apache2 start
# RUN sleep 10

# RUN chown -R bflaskappuser:www-data /var/www/BasicFlaskApp

# RUN service apache2 stop
# RUN sleep 10

# RUN service apache2 start
# RUN sleep 4

# EXPOSE 80 443

# RUN apt-get clean

# # To get following env arguments filled
# # a) if you build an image manually then set the arguments
# #  example (1):
# #  docker build \
# #  --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
# #  --build-arg VCS_REF=`git rev-parse --short HEAD` \
# #  --build-arg VERSION="latest" \
# #  -t dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu .
# #
# #  example (2) [use this option]:
# #  docker-compose build \
# #  --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
# #  --build-arg VCS_REF=`git rev-parse --short HEAD` \
# #  --build-arg VERSION="latest"
# #
# # b) if you let Docker Hub registry do the autobuild 
# #  then specify build command with arguments in hooks/build
# #

# ARG BUILD_DATE
# ARG VCS_REF
# ARG VERSION

# LABEL org.label-schema.build-date=$BUILD_DATE \
#       org.label-schema.version=$VERSION \
#       org.label-schema.license="MIT" \
#       org.label-schema.name="Docker image with flask app base (using apache2, wsgi, py3, ubuntu)" \
#       org.label-schema.description="Docker image to create docker container from, that accommodates Flask web app which relies on Apache 2, wsgi, Python 3, and Ubuntu." \
#       org.label-schema.vcs-ref=$VCS_REF \
#       org.label-schema.vcs-url="https://github.com/dm4rnde/docker-flask-app-base-apache2-wsgi-py3" \
#       org.label-schema.docker.schema-version="1.0"

# ENTRYPOINT ["/bin/bash", "/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

# =============================================
# RUN  apt-get -y install dh-virtualenv
# RUN apt-get update && \
#   apt-get install -y software-properties-common && \
#   add-apt-repository ppa:jonathonf/python-3.6
# RUN apt-get update

# RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv
# RUN apt-get install -y git

# RUN apt-get update \
#     && apt-get install -y software-properties-common curl \
#     && add-apt-repository ppa:jonathonf/python-3.6 \
#     && apt-get remove -y software-properties-common \
#     && apt autoremove -y \
#     && apt-get update \
#     && apt-get install -y python3.6 \
#     && curl -o /tmp/get-pip.py "https://bootstrap.pypa.io/get-pip.py" \
#     && python3.6 /tmp/get-pip.py \
#     && apt-get remove -y curl \
#     && apt autoremove -y \
#     && rm -rf /var/lib/apt/lists/*

# update pip
# RUN python3.6 -m pip install pip --upgrade
# RUN python3.6 -m pip install wheel


# RUN python -m pip install --upgrade pip
# RUN       pip install -r requirements.txt
# RUN      python setup.py install


FROM ubuntu:bionic
LABEL maintainer="Praveen"

# Install essentials
RUN apt-get update -y \
    && apt-get install -y build-essential software-properties-common curl git

# Install Python 3.6
RUN apt-get install -y python3-pip \
    && apt-get clean \
    && python3 -m pip install --upgrade pip

# Install Node (also installs npm)
#
# Based on official instructions for Ubuntu and Debian
# https://github.com/nodesource/distributions/blob/master/README.md#debinstall
#
# The latest is setup_13.x, but I copied your original command that uses setup10.x.
# It might be better to use setup_13.x instead.
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

# Install Yarn
#
# Based on official instructions for Ubuntu and Debian
# https://yarnpkg.com/lang/en/docs/install/#debian-stable
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn
RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv
 

COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt

EXPOSE 8080 
EXPOSE 80 

