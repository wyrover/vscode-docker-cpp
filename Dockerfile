FROM ubuntu:latest

RUN apt-get -y update && apt-get install -y
RUN apt-get -y install clang

COPY . /usr/src/dockertest1

WORKDIR /usr/src/dockertest1

RUN clang++ -o Test main.cpp

CMD ["./Test"]

