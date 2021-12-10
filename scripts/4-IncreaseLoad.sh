#!/bin/bash

for a in `seq 1 50`; do ab -rSqd -c 200 -n 20000 127.0.0.1:3000/;done
