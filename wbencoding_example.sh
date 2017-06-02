#!/bin/sh

# sox's 'play' command (plays audio)
#play -t raw -r 8000 -e signed-integer -b 16 --endian little -c 1 se_t630.raw
#play -t raw -r 16000 -e signed-integer -b 16 --endian little -c 1 wb_out.sw

# sox's 'sox' command (conversion tool) 
## sox -t raw -r 8000 -e signed-integer -b 16 --endian little -c 1 se_t630.raw out.wav

echo "CONVERT raw to .sw (.sw is a sox shorthand for signed word .raw)"
sox -t raw -r 8000 -e signed-integer -b 16 --endian little -c 1 se_t630.raw -r 16000 wb_out.sw upsample > /dev/null 2>&1

echo "PLAY .sw raw audio file"
play -t raw -r 16000 -e signed-integer -b 16 --endian little -c 1 wb_out.sw > /dev/null 2>&1

echo "ENCODE signed word raw(.sw) to wide-band(wb) AMR ..."
amrwb-encoder 8 wb_out.sw wb_out.amr > /dev/null 2>&1
echo "... and PLAY it with sox's play command"
play wb_out.amr > /dev/null 2>&1

# open AMR with VLC
## vlc --intf ncurses se_t630.amr
#vlc --intf ncurses wb_out.amr
