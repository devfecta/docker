FROM ubuntu
RUN apt-get -y update
RUN apt-get install -y curl vim nano
WORKDIR /home
RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install -y nodejs
RUN rm nodesource_setup.sh
RUN npm install -g serve
COPY ./build /home/app
# EXPOSE 5000 <-- Exposes port to other containers in an image
# RUN serve -s app
# ENTRYPOINT devfecta=/home serve -s app
CMD serve -s app