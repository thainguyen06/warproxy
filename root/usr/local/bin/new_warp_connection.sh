#!/bin/bash

# Disconnect existing Warp connection
warp-cli disconnect

# Connect to Warp to get a new IP
warp-cli connect

# Start the proxy server
exec wireproxy
