FROM ubuntu
RUN apt -y update
RUN apt install -y curl
RUN apt install -y vim nano
RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt install -y nodejs
RUN rm nodesource_setup.sh
# COPY ./build /app
# ENTRYPOINT devfecta=/app
# CMD npm start