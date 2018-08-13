#!/bin/bash

docker run -it norman12556/manjaro-music:test bash -c "python search.py" | youtube-dl

# Pass required sockets
docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    --device /dev/snd \
    --name music \
    norman12556/manjaro-music:test \
    /bin/bash
