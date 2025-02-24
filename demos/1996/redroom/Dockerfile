FROM demoscenery

USER user

WORKDIR /home/user/

## Retrieve and extract demoscene files
RUN wget https://archive.org/download/demoscene_RedRoom-jamm/redroom.zip -O demo.zip && \
    unzip demo.zip && \
    rm demo.zip

## Run Xpra
CMD xpra start \
    --html=on \
    --bind-tcp=0.0.0.0:${PORT} \
    --resize-display=${RESOLUTION} \
    --bandwidth-detection=false \
    --daemon=no \
    --notifications=no \
    --dbus-proxy=no \
    --no-microphone \
    --speaker=on \
    --encoding=rgb \
    --quality=100 \
    --no-tray \
    --mdns=no \
    --exit-with-children \
    --start-child="dosbox REDROOM.COM"
