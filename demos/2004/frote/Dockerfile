FROM demoscenery

## Log in as non-superuser
USER user

## Change directory to ~user
WORKDIR /home/user/

## Use winetricks
RUN winetricks -q dotnet48

## Retrieve and extract demoscene files
RUN wget https://files.scene.org/get/parties/2004/marast04/demo/tb2-frote.zip -O demo.zip && \
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
    --microphone=disabled \
    --webcam=no \
    --speaker=on \
    --encoding=rgb \
    --quality=100 \
    --desktop-scaling=on \
    --tray=no \
    --mdns=no \
    --exit-with-children \
    --start-child="wine frote.exe"
