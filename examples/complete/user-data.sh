#!/bin/bash
# ------------------------------------------------------------------
# [Sean Smith (smithlabs)] - Run a 'Hello, World! Go web server 
#          Description
#
#          This script downloads and runs a pre-compiled
#          Go web server that prints 'Hello, World!' 
# ------------------------------------------------------------------

# ---------------------------------------------------------------------------------------------------------------------
# Download the Go web server binary
# Make it executable
# ---------------------------------------------------------------------------------------------------------------------
curl -LJO https://github.com/smithlabs/go-example-servers/raw/main/01-hello-world/bin/main
chmod +x main

# ---------------------------------------------------------------------------------------------------------------------
# Run the server
# nohup catches the hangup signal and the ampersand runs the process in the background
# ---------------------------------------------------------------------------------------------------------------------
nohup ./main &
