#!/bin/bash

shell=(/bin/zsh /bin/fish)

doas usermod -s ${ shell[ $RANDOM % ${#shell[@]} ] } ryuvi
