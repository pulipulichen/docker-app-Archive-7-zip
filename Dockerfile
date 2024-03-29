FROM sitespeedio/node:ubuntu-20.04-nodejs-12.14.1

RUN apt-get update

RUN apt-get install -y \
    p7zip-full locales locales-all

RUN locale-gen zh_TW.UTF-8  
ENV LC_ALL=zh_TW.UTF-8
ENV LC_LAGNlo=zh_TW.UTF-8
RUN echo "export LANG=zh_TW.UTF-8" >> /etc/profile

# COPY package.json /
# RUN npm install

RUN localedef -c -f UTF-8 -i zh_TW zh_TW.utf8


RUN apt-get install -y unzip
RUN mkdir -p /app/
# COPY ./app /app

RUN apt-get update
RUN apt-get install -y python3 python3-pip
RUN pip install ZipUnicode

CMD ["node", "/app/index.js"]

ENTRYPOINT [ ]
