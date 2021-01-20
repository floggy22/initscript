FROM python
COPY index*.html /usr/local/src/
WORKDIR /usr/local/src
EXPOSE 9999/tcp
CMD echo "port: 9999" && python -m http.server 9999