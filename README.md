# FFT-Based DTMF Decoder in MATLAB

## Overview

This project implements a Dual-Tone Multi-Frequency (DTMF) decoder using the Fast Fourier Transform (FFT) in MATLAB. The system detects frequency pairs corresponding to telephone keypad inputs, replicating in-band telephony signal processing.

## Features

* FFT-based frequency analysis of input signals
* Detection of standard DTMF frequency pairs
* Mapping of frequency pairs to keypad digits (0–9, *, #)
* Signal processing pipeline for tone identification
* Modular MATLAB implementation for easy testing and extension

## How It Works

DTMF signaling encodes each keypress as a combination of two sinusoidal tones:

* One frequency from a low-frequency group
* One frequency from a high-frequency group

The decoder:

1. Accepts an input signal (audio or generated tones)
2. Applies FFT to extract frequency components
3. Identifies the dominant frequencies present
4. Matches detected frequency pairs to known DTMF values
5. Outputs the corresponding keypad digit

## DTMF Frequency Table

| Key | Low Freq (Hz) | High Freq (Hz) |
| --- | ------------- | -------------- |
| 1   | 697           | 1209           |
| 2   | 697           | 1336           |
| 3   | 697           | 1477           |
| 4   | 770           | 1209           |
| 5   | 770           | 1336           |
| 6   | 770           | 1477           |
| 7   | 852           | 1209           |
| 8   | 852           | 1336           |
| 9   | 852           | 1477           |
| *   | 941           | 1209           |
| 0   | 941           | 1336           |
| #   | 941           | 1477           |

## Technologies Used

* MATLAB
* Signal Processing (FFT)
* Frequency-domain analysis

## Applications

* Telephony signal decoding
* Embedded tone detection systems
* DSP education and experimentation
