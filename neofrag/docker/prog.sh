#!/bin/bash
SHELL=${1:-/bin/bash}

sudo /etc/init.d/apache2 start
${SHELL}

