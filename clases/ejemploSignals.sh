#!/bin/bash

handler() {
    echo "se ejecuto contrl+c!"
}

trap "handler" 15