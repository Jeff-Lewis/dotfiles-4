FROM ryanjohnston/base:latest

USER root

LABEL vendor=Bespoke\ View\ Consulting\ Incorporated \
      com.bespokeview.version="0.0.1" \
      com.bespokeview.name="ryanjohnston/dotfiles"

RUN chown -R docker:docker /home/docker

VOLUME /workdir/

WORKDIR /workdir/

USER docker

# COPY --from=0 /tmp/certstrap/bin/certstrap-v1.1.1-linux-amd64 /bin/certstrap
# ENTRYPOINT [ "/bin/bash" ]
