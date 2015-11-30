#!/bin/bash

ping6 -c 1 2604:a880:1:20::6e:f001
ping -c 1 192.241.203.3 >/dev/null 2>&1
ping -c 1 10.104.7.31 >/dev/null 2>&1
