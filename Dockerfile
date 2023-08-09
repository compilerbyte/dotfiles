FROM ubuntu:latest

WORKDIR /app

COPY *.sh /app/

CMD ["/bin/bash"]
