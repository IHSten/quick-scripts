# Dynamic DNS Update Script

## Overview

`update-cloudflare.sh` is a bash script designed to update the DNS records for a domain hosted on Cloudflare. This script is particularly useful for users with dynamic IP addresses who need to keep their DNS records up-to-date automatically.

## Features

- Automatically fetches the current public IP address using ifconfig.me.
- Updates the specified DNS record on Cloudflare with the new IP address.
- Logs the update process for troubleshooting and verification.

## Usage

1. **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/quick-scripts.git
    cd quick-scripts/bash/dynamic-dns
    ```

2. **Configure the script:**
    Edit the `update-cloudflare.sh` file and set the following variables:
    - `ZONE_ID`: The ID of your Cloudflare zone.
    - `RECORD_ID`: The ID of the DNS record to update.
    - `API_TOKEN`: Your Cloudflare API token.
    - `EMAIL`: The name of the DNS record to update.
    - `DOMAIN`: The domain name to update.

3. **Add the script to crontab:**
    Open the crontab file for editing:
    ```bash
    crontab -e
    ```
    Add the following line to run the script once per minute:
    ```bash
    * * * * * quick-scripts/bash/dynamic-dns/update-cloudflare.sh >> quick-scripts/bash/dynamic-dns/cron.log 2>&1
    ```
    This will ensure the script runs every minute and logs output to `cron.log` for troubleshooting.

## Requirements

- Bash shell
- `curl` command-line tool

