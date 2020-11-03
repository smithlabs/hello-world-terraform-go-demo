#!/bin/bash

curl -LJO https://github.com/smithlabs/go-example-servers/raw/main/01-hello-world/bin/main
chmod +x main
nohup ./main &
