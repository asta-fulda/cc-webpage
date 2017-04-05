FROM nginx:stable-alpine
#FROM alpine:3.5

COPY . /app

RUN apk add --no-cache --virtual build-dependencies \
        libatomic readline readline-dev libxml2 libxml2-dev \ 
        ncurses-terminfo-base ncurses-terminfo \ 
        libxslt libxslt-dev zlib-dev zlib \ 
        ruby ruby-dev yaml yaml-dev \ 
        libffi-dev build-base git nodejs \ 
        ruby-io-console ruby-irb ruby-json ruby-rake ruby-rdoc \
    && gem install jekyll \
    && cd /app \
    && jekyll build \
    && cp -r /app/_site/* /usr/share/nginx/html/ \
    && rm -r /app \
#    && runDeps="$( \
#        scanelf --needed --nobanner /usr/sbin/nginx /usr/lib/nginx/modules/*.so /tmp/envsubst \
#            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
#            | sort -u \
#            | xargs -r apk info --installed \
#            | sort -u \
#    )" \
#    && apk add --no-cache --virtual .nginx-rundeps $runDeps \
    && apk del build-dependencies
