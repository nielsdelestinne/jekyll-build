FROM jekyll/builder:${INPUT_JEKKYLVERSION}
USER root

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
