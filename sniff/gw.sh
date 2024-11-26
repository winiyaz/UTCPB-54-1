#!/bin/bash
set -euo pipefail

# Colors
GR='\033[0;32m'
RE='\033[0;31m'
NC='\033[0m'

# Variables
t1='
---
Testing gowitness comand
---
'
w1="www.meanbitches.com"

# Commands
b1() {
    clear
    echo -e "${GR}${t1}${NC}"
}

# Execution
b1
