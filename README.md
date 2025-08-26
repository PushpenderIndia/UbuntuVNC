# Ubuntu VNC Docker Container

A lightweight, ready-to-use Ubuntu desktop environment with VNC and web-based noVNC access. Perfect for remote development, testing, or accessing a Linux desktop from anywhere through your web browser.

## Public Docker Image


[Click Me: Public Ubuntu VNC Image](https://hub.docker.com/r/pushpenderindia/ubuntu-vnc-container)

## 🚀 Features

- **Latest Ubuntu** with XFCE4 desktop environment
- **Dual Access Methods**: Traditional VNC client + Web-based noVNC
- **Zero Configuration**: Auto-starts VNC and noVNC services on container launch
- **Lightweight**: Optimized for minimal resource usage
- **Secure**: Password-protected VNC access
- **Cross-Platform**: Access from Windows, Mac, Linux, or mobile devices

## 🎯 Use Cases

- Remote development environment
- Linux desktop for Windows/Mac users  
- CI/CD testing with GUI applications
- Educational purposes and Linux learning
- Isolated desktop environment for experiments
- Web-based Linux access for Chromebooks/tablets

## ⚡ Quick Start

```bash
# Run the container
docker run -d -p 5901:5901 -p 6080:6080 --name ubuntu-desktop pushpenderindia/ubuntu-vnc-container

# Access via web browser (recommended)
http://localhost:6080/vnc.html

# Or use VNC client: localhost:5901
# Default password: password
```

## 🔧 Configuration

- **VNC Port**: 5901
- **noVNC Web Port**: 6080  
- **Default Resolution**: 1024x768
- **Desktop Environment**: XFCE4
- **Default VNC Password**: `password`

## 🌐 Web Access

Simply open your browser and navigate to `http://localhost:6080/vnc.html` - no VNC client installation required! Works on any device with a modern web browser.

## 📱 Mobile Friendly

Access your Ubuntu desktop from smartphones and tablets through the responsive noVNC web interface.

## 🔒 Security Note

Change the default VNC password in production environments by rebuilding with a custom `VNC_PASSWORD` environment variable.

Perfect for developers, students, and anyone who needs a clean Ubuntu desktop environment accessible from anywhere!

## Usage (Manually Build Docker Image From Scratch)

1. Build and run the container:
```bash
docker-compose up --build
```

2. Access the desktop:
   - VNC Client: `localhost:5901` (password: `password`)
   - Web Browser (NoVNC): `http://localhost:6080/vnc.html`

## Shared Folder
Files in `./shared/` are accessible inside the container at `/shared/`
