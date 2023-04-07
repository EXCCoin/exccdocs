# Build image
FROM python:3.11

LABEL description="exccdocs build"
LABEL version="1.0"
LABEL maintainer="support@excc.co"

USER root
WORKDIR /root

COPY ./ /root/

RUN pip install --upgrade pip
RUN pip install mkdocs && \
	pip install --user -r requirements.txt

# Install dependencies for generating social cards.
# https://squidfunk.github.io/mkdocs-material/setup/setting-up-social-cards
RUN apt update && \
    apt install libcairo2-dev libfreetype6-dev libffi-dev libjpeg-dev libpng-dev libz-dev && \
	pip install pillow cairosvg

ENV EXCCDOCS_CARDS true

RUN ./bin/build_docs.sh

# Serve image (stable nginx version)
FROM nginx:1.22-alpine

LABEL description="exccdocs serve"
LABEL version="1.0"
LABEL maintainer="support@excc.co"

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=0 ./root/site/ /usr/share/nginx/html
