# Docker base images for Java

[![Build Status](https://travis-ci.org/Flaconi/docker-java-base.svg?branch=master)](https://travis-ci.org/Flaconi/docker-java-base)
[![Releases](https://img.shields.io/github/release/flaconi/docker-java-base/all.svg)](https://github.com/Flaconi/docker-java-base/releases)

Base images for Java.


## Options

There are no environment variables, no volumes and no port exposures.


## Defaults

By running any of those Docker images they will simply output their version.

 | ENTRPOINT  | CMD        |
 |------------|------------|
 | `java`     | `-version` |


## Docker images

| Docker Image        | Docker Tag                   | OS                  | Java version  |
|---------------------|------------------------------|---------------------|---------------|
| `flaconi/java-base` | `:stretch-oracle-java8`      | Debian stretch      | Oracle Java 8 |
| `flaconi/java-base` | `:stretch-oracle-java9`      | Debian stretch      | Oracle Java 9 |
| `flaconi/java-base` | `:stretch-slim-oracle-java8` | Debian stretch slim | Oracle Java 8 |
| `flaconi/java-base` | `:stretch-slim-oracle-java9` | Debian stretch slim | Oracle Java 9 |


## License

By using the Oracle Docker images you need to agree to the terms and conditions of the
JDK's [binary code license](http://www.oracle.com/technetwork/java/javase/terms/license/index.html).
