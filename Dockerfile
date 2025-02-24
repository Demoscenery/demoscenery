FROM ubuntu:24.04

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN dpkg --add-architecture i386

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
    cabextract \
    dosbox \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-ugly \
    mesa-utils \
    pulseaudio \
    pulseaudio-utils \
    python3-cairo \
    python3-gst-1.0 \
    python3-netifaces \
    unrar \
    unzip \
    wine \
    winetricks \
    wget \
    xpra \
    xterm

# RUN mkdir /etc/X11/xorg.conf.d && cp /etc/xpra/xorg.conf /etc/X11/xorg.conf.d/00_xpra.conf && \
RUN cp /etc/xpra/xorg.conf /etc/X11/xorg.conf

# Create user
RUN useradd -m user && \
    mkdir -p /run/user/1001 /run/xpra && \
    chown user /run/user/1001 /run/xpra && \
    echo "xvfb=Xorg -dpi 96 -noreset -nolisten tcp +extension GLX +extension RANDR +extension RENDER" >> /etc/xpra/xpra.conf

## Avoid Wine's Mono and Gecko prompts
ENV WINEDLLOVERRIDES "mscoree,mshtml="

## Get rid of XDG's warning
ENV XDG_RUNTIME_DIR "/home/user/"

## Get rid of xdg menu data error message
RUN mkdir -p  /etc/xdg/menus && echo '<!DOCTYPE Menu PUBLIC "-//freedesktop//DTD Menu 1.0//EN" "http://www.freedesktop.org/standards/menu-spec/1.0/menu.dtd"><Menu></Menu>' > /etc/xdg/menus/kde-debian-menu.menu

EXPOSE 10000

## Default command to run
CMD xpra start \
    --html=on \
    --bind-tcp=0.0.0.0:${PORT} \
    --resize-display=${RESOLUTION} \
    --daemon=no \
    --notifications=no \
    --dbus-proxy=no \
    --microphone=disabled \
    --webcam=no \
    --speaker=on \
    --encoding=rgb \
    --quality=100 \
    --tray=no \
    --mdns=no \
    --exit-with-children \
    --start-child="glxgears"
