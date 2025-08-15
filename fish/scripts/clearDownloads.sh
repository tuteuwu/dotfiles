#!/usr/bin/bash

ls ~/Downloads

echo -n "Do you want to delete all these files? [Y, n] "
read a

if [ "${a,,}" != "n" ]; then
    rm -rf ~/Downloads/.*
    rm -rf ~/Downloads/*
fi