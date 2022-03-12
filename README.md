# Haxball - Headless Host - docker

<p align="left">
<a href="https://hub.docker.com/r/ox1de/haxball">
        <img src="https://img.shields.io/badge/Docker%20HUB-haxball-yellow?style=for-the-badge&logo=docker"
            alt="Docker Cloud Image Repo"></a>

<a href="https://hub.docker.com/r/ox1de/haxball/builds">
        <img src="https://img.shields.io/docker/cloud/automated/ox1de/haxball?style=for-the-badge&logo=docker"
            alt="Docker Cloud Automated build"></a>

<a href="https://hub.docker.com/r/ox1de/haxball/builds">
        <img src="https://img.shields.io/docker/cloud/build/ox1de/haxball?style=for-the-badge&logo=docker"
            alt="Docker Cloud Build Status"></a>
</br></br></p>

This is a simple container that creates a permanent room in the haxball game. Based on the HaxBall Headless Host and Haxroomie tool which you can find at this link https://github.com/morko/haxroomie

## Variables

- `ROOMNAME` type: **string**, default: **haxball**
> The name for the room. 
- `AUTOSTART` type: **bool**, default: **true**
> Set to `true` if you want the room to start on startup
- `BOTNAME` type: **string**, default: **Bot**
> The name for the host BOT
- `MAXPLAYERS` type: **int**, default: **12**
> Max number of players the room accepts.
- `PUBLIC` **bool**, default: **false**
> If true the room will appear in the room list.
- `TOKEN` type: **string**, NOdefault,  **REQUIRED**
> You must give the token needed to open the rooms in the config. Generate URL: https://www.haxball.com/headlesstoken
- `ADMINPASS` type: **string**, default: **password123**
> Set admin password to get admin priviledges with `!auth admin ADMINPASS` 
- `HOSTPASS` type: **string**, default: **password123**
> Set host password to get host priviledges with `!auth host HOSTPASS`
- `GEOCODE` type: **string**, default: **PL**
> The code is a country code in two letter ISO format listed in https://countrycode.org/.
- `GEOLAT` type: **string**, default: **52.5192** 
- `GEOLON` type: **string**, default:r **17.038538**
> Geolocation override for the room. You can use https://www.latlong.net/ to find the coordinates easily.

## How to run with docker-compose

Generate haxball token auth https://www.haxball.com/headlesstoken

Create simple file `docker-compose.yml` and fill it.

```
version: '3.4'

services:
  haxball: 
    image: ox1de/haxball
    network_mode: "host"
    stdin_open: true
    tty: true
    environment:
      - ROOMNAME=SET_ROOM_NAME
      - BOTNAME=SET_BOT_NAME
      - TOKEN=SET_TOKEN # Visit https://www.haxball.com/rs/api/getheadlesstoken
      - ADMINPASS=SET_PASSWORD
```

And run container `docker-compose up -d`
To get room link look to container logs `docker-compose logs -f`, you get similar output:


```
LOADING CONFIG from /root/.haxroomie/config.js
STARTING ROOM YOUR_ROOM_NAME
ROOM STARTED YOUR_ROOM_NAME - https://www.haxball.com/play?c=jniwehr23L13 <--- COPY YOUR LINK AND PLAY WITH FRIENDS ;) 
PLUGINS LOADED for YOUR_ROOM_NAME
sav/players (enabled)
haxball_1  | sav/roles (enabled)
haxball_1  | sav/commands (enabled)
haxball_1  | sav/help (enabled)
haxball_1  | sav/chat (enabled)
haxball_1  | hr/always-one-admin (enabled)
haxball_1  | hr/kickban (enabled)
```


You can easily edit the room settings by changing or adding variables to the docker-compose file, after the changes you just need to restart container `docker-compose restart`
