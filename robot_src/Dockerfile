FROM python:3.8

# install google chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get -y update
RUN apt-get install -y google-chrome-stable

# install chromedriver
RUN apt-get install -yqq unzip
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

RUN chmod 777 /usr/local/bin/chromedriver

# install font for other language
RUN apt-get update && \
    apt-get install -y \
        fonts-ipafont-gothic fonts-ipafont-mincho \
        ttf-wqy-microhei fonts-wqy-microhei       \
        fonts-tlwg-loma fonts-tlwg-loma-otf       \
    && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN python3 -m pip install --upgrade pip
COPY ./robot_src/requirements.txt /tmp/requirements.txt
RUN  pip3 install -r /tmp/requirements.txt

# ENV HTTP_PROXY="http://outappl.pnet.ch:3128"
# ENV HTTPS_PROXY="http://outappl.pnet.ch:3128"
# ENV NO_PROXY="localhost,artifactory.tools.post.ch,pnet.ch,post.ch,pnetcloud.ch,pextint.ch"

COPY ./robot_src /etc/robot
WORKDIR /etc/robot

ENTRYPOINT robot -d results test.robot

