# 7 Days to Docker

An example for [zobees/docker-7daystodie](https://hub.docker.com/r/zobees/7daystodie/), an abstract docker container for 7 Days to Die.

## Quick start

Assuming you have Docker and Docker Compose installed already, the following steps will get a 7 Days to Die server up and running in just a few minutes:

### Building

 1. Clone this repository somewhere.
 2. Copy `credentials.txt.example` to `credentials.txt` and edit it, replacing the example with your own Steam credentials.
 3. Build the image with `docker-compose build` (or use straight `docker build`, it's up to you). **Do not push the image to a public registry**, unless you really want to give away your Steam account.

### Configuring

 1. Copy `data/config.xml.example` to `data/config.xml` and edit it to your liking.
 2. Copy `data/admins.xml.example` to `data/admins.xml` and edit it, adding your own Steam64 ID.
 3. If you're on Linux, you'll need to run `chown -R daemon:daemon ./data` on the host.

### Running

 1. Run `docker-compose up`, or manually using `docker run`.
 2. Fire up 7 Days to Die and connect to your docker ip on port 26900.

## Changelog

 * **0.0.2** Using updated zobees/steamcmd-ubuntu image
 * **0.0.1** Initial release
