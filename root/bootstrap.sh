#!/bin/bash

### Delete default config file
configdir=/root/.haxroomie
config=config.js
lockfile=/tmp/haxroomie.lock


if test -f "$lockfile"; then
        rm "$lockfile"
fi

if ! test -d "$configdir"; then
        mkdir -p "$configdir"
fi

if test -f "$configdir/$config"; then
        rm "$configdir/$config"
fi

### Generate new config file
cat <<EOF > /root/.haxroomie/config.js
let config = {
  '${ROOMNAME:-haxball}': {
    autoStart: ${AUTOSTART:-true},
    roomName: '${ROOMNAME:-haxball}',
    playerName: '${BOTNAME:-Bot}',
    maxPlayers: ${MAXPLAYERS:-12},
    token: '${TOKEN}',
    geo: { code: '${GEOCODE:-PL}', lat: '${GEOLAT:-52.5192}', lon: '${GEOLON:-17.038538}' },
    public: ${PUBLIC:-false},
    repositories: [
      {
        type: 'github',
        repository: 'morko/hhm-sala-plugins'
      },
      {
        type: 'github',
        repository: 'XHerna/hhm-plugins'
      },
    ],
    pluginConfig: {
      'sav/roles': {
        roles: {
          // get admin priviledges with !auth admin adminpass
          admin: '${ADMINPASS:-password123}',
          // get host priviledges with !auth host hostpass
          host: '${HOSTPASS:-password123}'
        }
      },
      'hr/always-one-admin': {},
      'hr/pause': {
        maxPauseTimes: 0
      },
      'hr/kickban': {},
    }
  }
};
module.exports = config;
EOF

haxroomie
