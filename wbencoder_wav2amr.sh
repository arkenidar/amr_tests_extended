#!/bin/sh

# Usage: encoder.sh wav_input_file amr_output_file (./wbencoder_wav2amr.sh wave_se_t630.wav amrwb_se_t360.amr)

#sox -t raw -r 8000 -e signed-integer -b 16 --endian little -c 1 se_t630.raw wave_se_t630.wav

sox $1 -t raw -r 16000 -e signed-integer -b 16 --endian little -c 1 $1.sw upsample > /dev/null 2>&1

amrwb-encoder 8 $1.sw $2 > /dev/null 2>&1

rm $1.sw > /dev/null 2>&1

play $2 > /dev/null 2>&1

