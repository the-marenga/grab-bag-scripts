#!/bin/bash

# This script sets up the blu-ray drive on my server to make it available for makemkv to use. Must be run as root

modprobe sg
chmod a+rw /dev/sg* 
chmod a+rw /dev/sr0
