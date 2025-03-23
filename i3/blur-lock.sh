#!/bin/bash

# Take a screenshot
scrot /tmp/lockscreen.png

# Blur the image
#convert /tmp/lockscreen.png -blur 0x8 /tmp/lockscreen-blur.png
convert /tmp/lockscreen.png -filter Gaussian -blur 0x6 /tmp/lockscreen-blur.png

# Lock the screen with the blurred image
i3lock -i /tmp/lockscreen-blur.png

# Remove temporary images after unlocking
rm /tmp/lockscreen.png /tmp/lockscreen-blur.png


