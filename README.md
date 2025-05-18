# VPN Stack with Gluetun, qBittorrent, and Jellyseerr

This repository contains a Docker Compose configuration for running:
- **Gluetun** - A VPN client in a container
- **qBittorrent** - Torrent client running through the VPN
- **Jellyseerr** - Media request manager

## Features
- Automatic VPN connection using Mullvad and Wireguard
- Secure torrenting through VPN
- Media request system for Jellyfin/Plex
- Traefik integration for domain routing

## Deployment with Coolify

This repository is configured to be deployed with Coolify from a Git repository:

1. Fork or clone this repository to your own GitHub account
2. In Coolify, create a new service
3. Select "Docker Compose" as the service type
4. Connect your GitHub account and select this repository
5. Configure any environment variables (see `.env.example`)
6. Deploy the stack

## Configuration

### VPN Settings (Important)
- The VPN is configured for Mullvad with Wireguard
- You should update the following in environment variables:
  - `WIREGUARD_PRIVATE_KEY`
  - `WIREGUARD_ADDRESSES`

### Data Storage
The service uses the following paths:
- `/data/downloads` - qBittorrent downloads directory
- `/data/jellyseerr-config` - Jellyseerr configuration

Make sure these directories exist on your host or modify the paths in the docker-compose.yml file.

### Domain Configuration
The default domains are:
- qBittorrent: `qbit.jannah.help`
- Jellyseerr: `see.jannah.help`

Update these in environment variables if needed.

## Environment Variables
See `.env.example` for all available configuration options.

## Security Notes
- In a production environment, never hardcode sensitive keys or credentials
- Use environment variables in Coolify for sensitive information
- The Wireguard private key included in this configuration is for example purposes only