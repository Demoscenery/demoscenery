FROM demoscenery

USER user

WORKDIR /home/user/

## Retrieve and extract demoscene files
RUN wget https://files.scene.org/get/parties/2000/assembly00/demo/enlight_.zip -O demo.zip && \
    unzip demo.zip && \
    rm demo.zip

## Run Xpra
CMD xpra start \
    --html=on \
    --opengl=yes:native \
    --daemon=no \
    --notifications=no \
    --dbus-proxy=no \
    --microphone=no \
    --speaker=on \
    --encoding=rgb \
    --quality=100 \
    --tray=no \
    --mdns=no \
    --bind-tcp=0.0.0.0:${PORT} \
    --resize-display=${RESOLUTION} \
    --bandwidth-detection=false \
    --start-child="wine noc_enl.exe" \
    --exit-with-children
