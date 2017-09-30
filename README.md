# Slow DNS Test Fixture

Some Docker code to allow testing how your code behaves when a DNS server is
misbehaving.

## Prerequisites

* [Docker](https://www.docker.com), able to [run as
  you](https://docs.docker.com/engine/installation/linux/linux-postinstall/).
* Make

## Build

```
make
```

## Run

In one terminal start a DNS server:

```
make run-slowdns
```

In another

# Explanation

It's hard to test DNS because almost all services on Linux assume the DNS
server is on port 53, so we can't bring up a test version on a different port
and actually use it from our test code.

We work around this here by starting a Docker container that can be used as a
DNS server, and another Docker container that runs our test code and is
configured to use the first container as a DNS server.

# License

Copyright 2017 Andy Balaam.

Released under the [GNU AGPL](https://www.gnu.org/licenses/agpl.html) version 3
or later.  See [LICENSE.md](LICENSE.md) for details.
