#!/bin/bash

# Setup script for VPN Stack
echo "Setting up directories for VPN Stack with qBittorrent and Jellyseerr..."

# Create data directories if they don't exist
mkdir -p /data/downloads
mkdir -p /data/jellyseerr-config

# Set permissions
chown -R 1000:1000 /data/downloads
chown -R 1000:1000 /data/jellyseerr-config

echo "Directories created and permissions set."
echo "You can now deploy using Coolify!"