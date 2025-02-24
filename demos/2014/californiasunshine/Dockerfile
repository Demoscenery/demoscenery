FROM demoscenery

## Log in as non-superuser
USER user

## Change directory to ~user
WORKDIR /home/user/

## Retrieve and extract demoscene files
RUN wget https://files.scene.org/get/parties/2014/nvscene14/pc_demo/nd-caniforniasunshine-rc3.zip -O demo.zip && \
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
    --start-child="uxterm -e 'cd ND-CaniforniaSunshine-RC3 && wine CaliforniaSunshine.exe || exit'"
