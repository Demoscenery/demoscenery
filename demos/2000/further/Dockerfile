FROM demoscenery

USER user

WORKDIR /home/user

## Retrieve and extract demoscene files
RUN wget https://files.scene.org/get/parties/2000/assembly00/demo/further_.zip -O demo.zip && \
    unzip demo.zip && \
    rm demo.zip

# RUN winetricks -q mfc42

## Run Xpra
CMD xpra start \
    --html=on \
    --daemon=no \
    --notifications=no \
    --dbus-proxy=no \
    --no-microphone \
    --speaker=on \
    --encoding=rgb \
    --quality=100 \
    --no-tray \
    --mdns=no \
    --bind-tcp=0.0.0.0:${PORT} \
    --resize-display=${RESOLUTION} \
    --bandwidth-detection=false \
    --start-child="wine further.exe" \
    --exit-with-children
