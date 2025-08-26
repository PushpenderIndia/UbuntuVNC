# Ubuntu VNC Docker Container

This Docker setup provides Ubuntu with VNC and NoVNC access.

## Usage

1. Build and run the container:
```bash
docker-compose up --build
```

2. Access the desktop:
   - VNC Client: `localhost:5901` (password: `password`)
   - Web Browser (NoVNC): `http://localhost:6080`

## Features

- Latest Ubuntu with XFCE desktop
- VNC server on port 5901
- NoVNC web client on port 6080
- Shared folder at `./shared` (mapped to `/shared` in container)
- Pre-installed: Firefox, Git, Nano, Vim

## Default VNC Password
`password`

## Shared Folder
Files in `./shared/` are accessible inside the container at `/shared/`