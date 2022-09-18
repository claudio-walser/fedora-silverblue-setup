#!/bin/bash

# put agent into pairable mode
bluetoothctl agent on;
bluetoothctl scan on;
bluetoothctl pairable on;

# allow and pair headset
bluetoothctl trust 74:8F:3C:14:CD:9C;
bluetoothctl pair 74:8F:3C:14:CD:9C;
