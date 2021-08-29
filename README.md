# chatserver-ruby

[![Build Status](https://cloud.drone.io/api/badges/frozenfoxx/chatserver-ruby/status.svg?ref=refs/heads/main)](https://cloud.drone.io/frozenfoxx/chatserver-ruby)

A simple chat server written in Ruby.

# Requirements


* [Docker](https://www.docker.io/).

# Build

```
git clone https://github.com/frozenfoxx/chatserver-ruby chatserver-ruby
cd chatserver-ruby
docker build -t frozenfoxx/chatserver-ruby:latest .
```

# Run

```
docker run \
  -it \
  --rm \
  -p 8080:8080 \
  frozenfoxx/chatserver-ruby:latest
```

## Environment Variables

* **HOST**: which IP/FQDN to listen on (default: 0.0.0.0)
* **PORT**: which port to listen on (default: 8080)

# Usage

## Client

* Connect with either netcat or telnet:

> telnet [HOST] [PORT]

## Server

