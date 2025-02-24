FROM demoscenery

USER user

WORKDIR /home/user/

## Retrieve and extract demoscene files
RUN wget https://files.scene.org/get:jp-http/parties/2008/7d08/demo/point_by_paradox.zip -O demo.zip && \
    unzip demo.zip && \
    rm demo.zip

## Run Xpra
CMD xpra start \
    --html=on \
    --daemon=no \
    --notifications=no \
    --dbus-proxy=no \
    --microphone=no \
    --speaker=on \
    --encoding=rgb \
    --tray=no \
    --mdns=no \
    --bind-tcp=0.0.0.0:${PORT} \
    --resize-display=${RESOLUTION} \
    --bandwidth-detection=false \
    --start-child="wine DEMO.exe" \
    --exit-with-children
