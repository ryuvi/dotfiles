!#/bin/bash


#THEMES_LIST=(blocks cuts forest grayblocks hack material panels shapes)
#NUMBER=$(( 0 + $RANDOM % 7 ))
#THEMES_LIST=(blocks cuts grayblocks hack)
#NUMBER=$(( 0 + $RANDOM % 4 ))
#RAND_THEME=${THEMES_LIST[$NUMBER]}

#bash $HOME/.config/polybar/launch.sh --$RAND_THEME
bash $HOME/.config/polybar/launch.sh --hack
#bash $HOME/.config/polybar/$RAND_THEME/scripts/random.sh
bash $HOME/.config/polybar/hack/scripts/random.sh
