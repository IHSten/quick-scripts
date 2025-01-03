#!/bin/bash

# Configuration
ZONE_ID="zone_id"
RECORD_ID="record_id"
API_TOKEN="api_token"
EMAIL="email"
DOMAIN="domain"

# Get the current external IP address
IP=$(curl -s ifconfig.me)

# Update the Cloudflare A record
RESPONSE=$(curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD_ID" \
    -H "Authorization: Bearer $API_TOKEN" \
    -H "Content-Type: application/json" \
    --data "{\"type\":\"A\",\"name\":\"$DOMAIN\",\"content\":\"$IP\",\"ttl\":120,\"proxied\":false}")

# Check if the update was successful
if [[ $RESPONSE == *"\"success\":true"* ]]; then
  echo "$(date): DNS record $DOMAIN updated successfully to $IP"
else
  echo "$(date): Failed to update DNS $DOMAIN record."
  echo "$(date): Response: $RESPONSE"
fi