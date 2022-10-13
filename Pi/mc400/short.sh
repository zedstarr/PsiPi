#!/usr/bin/env bash

# Bitly Generic access token
Accesstoken=your-bitly-access-token-goes-here
api=https://api-ssl.bitly.com/v4/shorten

# echo -n "Enter your Long URL: "
# read -r longurl

longurl=$1

  if [[ ! $longurl ]]; then
    echo -e "Error URL Missing"
    exit 1
  fi

# Curl request
curl -s -H Authorization:\ $Accesstoken -H Content-Type: -d '{"long_url": "'"$longurl"\"} $api | cut -f3 -d"," | cut -c9- | cut -f1 -d\"

