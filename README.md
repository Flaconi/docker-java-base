# Docker base images for Java

[![Build Status](https://travis-ci.org/Flaconi/docker-java-base.svg?branch=master)](https://travis-ci.org/Flaconi/docker-java-base)

Base images for Java.

## Options

There are no environment variables, no volumes and no port exposures.

## Defaults

By running any of those Docker images they will simply output their version.

 | ENTRPOINT  | CMD        |
 |------------|------------|
 | `java`     | `-version` |


## Docker images

| Docker Image        | Docker Tag              | OS             |
|---------------------|-------------------------|----------------|
| `flaconi/java-base` | `:stretch-oracle-java8` | Debian stretch |
| `flaconi/java-base` | `:stretch-oracle-java9` | Debian stretch |
