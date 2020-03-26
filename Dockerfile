FROM node:10

LABEL version="1.0.0"
LABEL repository="https://github.com/gabrielgrant/docker-node-chrome"
LABEL homepage="https://github.com/gabrielgrant/docker-node-chrome"
LABEL maintainer="Gabriel Grant <g@briel.ca>"

# Borrowed from ianwalter/puppeteer and alexlafroscia/actions-ember-testing
RUN  apt-get update \
  # See https://crbug.com/795759
  && apt-get install -yq libgconf-2-4 \
  # Install latest chrome dev package, which installs the necessary libs to
  # make the bundled version of Chromium that Puppeteer installs work.
  && apt-get install -y wget --no-install-recommends \
  && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
  && apt-get update \
  && apt-get install -y google-chrome-unstable --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*