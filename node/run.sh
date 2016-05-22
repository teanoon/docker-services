#!/bin/bash
if [ ! -d "/usr/local/lib/node_modules/npm" ]; then
  cp /tmp/node_modules /usr/local/lib/ -Rf
fi
