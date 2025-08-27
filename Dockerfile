FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV USER=root
ENV DISPLAY=:1

RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    tightvncserver \
    novnc \
    websockify \
    supervisor \
    wget \
    curl \
    dillo \
    falkon \
    nano \
    vim \
    git \
    dbus-x11 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN mkdir -p /root/.vnc
COPY xstartup /root/.vnc/xstartup
RUN chmod +x /root/.vnc/xstartup

RUN echo 'password' | vncpasswd -f > /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd

RUN DISPLAY=:1 vncserver :1 -geometry 1024x768 -depth 24 && vncserver -kill :1

RUN mkdir -p /shared

# Set Falkon as the default web browser
RUN mkdir -p /root/.config/xfce4 && \
    echo '[Default Applications]' > /root/.config/xfce4/helpers.rc && \
    echo 'WebBrowser=falkon' >> /root/.config/xfce4/helpers.rc

# Create desktop shortcuts for browsers
RUN mkdir -p /root/Desktop && \
    cp /usr/share/applications/falkon.desktop /root/Desktop/ 2>/dev/null || true && \
    cp /usr/share/applications/dillo.desktop /root/Desktop/ 2>/dev/null || true && \
    chmod +x /root/Desktop/*.desktop 2>/dev/null || true

EXPOSE 5901 6080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]