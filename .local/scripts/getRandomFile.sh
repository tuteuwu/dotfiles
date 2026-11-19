#!/bin/sh

DIR=$1

find "$DIR" -type f | shuf -n 1
