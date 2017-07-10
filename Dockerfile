FROM nginx:stable-alpine

ARG BASEURL=https://cafe-chaos-fulda.de

COPY . /app

RUN apk add --no-cache --virtual build-dependencies \
        libatomic readline readline-dev libxml2 libxml2-dev \ 
        ncurses-terminfo-base ncurses-terminfo \ 
        libxslt libxslt-dev zlib-dev zlib \ 
        ruby ruby-dev yaml yaml-dev \ 
        libffi-dev build-base git nodejs \ 
        ruby-io-console ruby-irb ruby-json ruby-rake ruby-rdoc wget \
    && wget -O /bin/yaml  https://github.com/mikefarah/yaml/releases/download/1.11/yaml_linux_amd64 \
    && chmod +x /bin/yaml \
    && gem install jekyll \
    && cd /app \
    && yaml w -i _config.yml "baseurl" "$BASEURL" \
    && jekyll build \
    && cp -r /app/_site/* /usr/share/nginx/html/ \
    && rm -r /app \
    && rm /bin/yaml \
    && gem uninstall jekyll \
    && apk del build-dependencies
