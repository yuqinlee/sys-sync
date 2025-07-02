#!/bin/bash

stow \
    --target ~ . \
    --adopt \
    --ignore stow-on.sh \
    --ignore stow.off.sh \

