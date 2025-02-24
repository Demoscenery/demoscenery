FROM demoscenery

USER user

WORKDIR /home/user/

## Retrieve and extract demoscene files
RUN wget https://files.scene.org/get/parties/2008/evoke08/demo/feestje.zip -O demo.zip && \
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
    --microphone=no \
    --speaker=on \
    --encoding=rgb \
    --tray=no \
    --mdns=no \
    --start-child="wine FEEST.EXE" \
    --exit-with-children
