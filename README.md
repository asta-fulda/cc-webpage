Café Chaos Webpage
====================

This webpage is based on the [agency theme](https://github.com/y7kim/agency-jekyll-theme) and build with [Jekyll](https://jekyllrb.com/) and [Docker](https://docker.com).

And provides the Webpage for the Café Chaos which is located at the [University of applied science in Fulda](https://hs-fulda.de).

## Setup

To setup the page make sure you have [docker installed](https://www.docker.com/community-edition). Then clone the repository to your server and run the following commands:

```console
cd cc-webpage
docker build -t cc-webpage:local --build-arg BASEURL="http://127.0.0.1" .
```

Now you have the image ready on your local machine. To run it use:

```console
docker run --name cc-page --restart=always -d -p 80:80 cc-webpage:local
```

This will provide the webpage on port 80 (HTTP). For a production-ready setup please make sure to use a reverse proxy to provide the page over HTTPS.



### Traefik

In docker-only environement maybe using Traefik is the easiest way. See official traefik page about details: http://traefik.io/

Traefik includes a way to generate trusted certificates. No additional software needed.


### Apache

See this very details reverse proxy guide: http://www.apachetutor.org/admin/reverseproxies

For TLS checkout https://certbot.eff.org/


### NGINX

See the official docs of NGINX about reverse proxy usage: https://www.nginx.com/resources/admin-guide/reverse-proxy/

For TLS checkout https://certbot.eff.org/




## How to use

If you want to alter the current price lists checkout `_posts` and alter the files in there. All prices are provided as tables.

To change the impress check the impressum.md

For everything else see `_includes`. Keep an eye on `_includes/js.html` everthing script related is done there.

To apply made changes rebuild the docker image and deploy it.


## License

The theme is provided unter Apache-2 license.

This doesn't apply to the texts and prictues provided along with the theme. Please ask for the license if you want to use them.
