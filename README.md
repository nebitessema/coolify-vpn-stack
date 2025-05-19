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

### Note About Compose Files

This repository includes multiple versions of the Docker Compose file to ensure compatibility:
- `docker-compose.yml` - Standard format
- `docker-compose.yaml` - Alternative extension
- `compose.yaml` - New standard format

All files contain identical configurations. Coolify should detect one of these files.

### Domain Configuration

The stack is pre-configured with the following domains:
- qBittorrent: `qbit.jannah.help`
- Jellyseerr: `see.jannah.help`

These domains are set using Coolify's special `SERVICE_FQDN_*` environment variables. If you need to use different domains, update the following variables in the compose files:

```yaml
# For qBittorrent
- SERVICE_FQDN_QBIT=qbit.jannah.help

# For Jellyseerr
- SERVICE_FQDN_JELLYSEERR=see.jannah.help
```

Make sure your DNS records are properly configured to point to your Coolify server.

### Volume Configuration for Coolify

The Docker Compose files use named volumes that are optimized for Coolify:

```yaml
volumes:
  gluetun-config: null
  qbittorrent-config: null
  downloads: null
  jellyseerr-config: null
```

These named volumes will show up in the Coolify UI under "Persistent Storage" with the correct formats. Avoid using absolute paths like `/data/downloads` directly in the compose file as they can cause issues with Coolify deployments.

After deploying to Coolify, you can map these volumes to specific paths on your host machine through the Coolify UI if needed.

## Configuration

### VPN Settings (Important)
- The VPN is configured for Mullvad with Wireguard
- You should update the following in environment variables:
  - `WIREGUARD_PRIVATE_KEY`
  - `WIREGUARD_ADDRESSES`

### Data Storage
The service uses named volumes for data persistence:
- `downloads` - qBittorrent downloads directory
- `jellyseerr-config` - Jellyseerr configuration

These can be managed through the Coolify UI after deployment.

## Environment Variables
See `.env.example` for all available configuration options.

## Security Notes
- In a production environment, never hardcode sensitive keys or credentials
- Use environment variables in Coolify for sensitive information
- The Wireguard private key included in this configuration is for example purposes only