FROM demoscenery

USER user

WORKDIR /home/user

## Retrieve the demoscene's files
RUN wget https://files.scene.org/get/parties/2001/slach01/demo/01-dafirst-cymagine.zip -O demo.zip && \
    unzip demo.zip && \
    rm demo.zip

## Run Xpra
EXPOSE 10000
CMD xpra start \
    --html=on \
    --daemon=no \
    --notifications=no \
    --dbus-proxy=no \
    --microphone=no \
    --speaker=on \
    --encoding=rgb \
    --quality=100 \
    --mdns=no \
    --tray=no \
    --bind-tcp=0.0.0.0:${PORT} \
    --resize-display=${RESOLUTION} \
    --bandwidth-detection=false \
    --exit-with-children \
    --start-child="wine dafirst.exe"
