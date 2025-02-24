FROM demoscenery

## Log in as non-superuser
USER user

## Change directory to ~user
WORKDIR /home/user/

## Retrieve and extract demoscene files
RUN wget https://files.scene.org/get/parties/2004/assembly04/demo/secret_government_thing_by_nesnausk_.zip -O demo.zip && \
    unzip demo.zip && \
    rm demo.zip

RUN mkdir t_Data

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
    --quality=100 \
    --tray=no \
    --mdns=no \
    --start-child="wine SecretGovThing.exe" \
    --exit-with-children
