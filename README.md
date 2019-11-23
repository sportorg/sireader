# SportIdent Reader

[![Build Status](https://api.travis-ci.org/sportorg/sireader.svg)](https://travis-ci.org/sportorg/sireader)

sportIdent.py is a python module to communicate with a SportIdent main station to read out SportIdent cards. 
SportIdent is an electronic punching system mainly used for orienteering events.

```python
from time import sleep
from sportident import SIReaderReadout

# connect to base station, the station is automatically detected,
# if this does not work, give the path to the port as an argument
# see the pyserial documentation for further information.
si = SIReaderReadout()

# wait for a card to be inserted into the reader
while not si.poll_sicard():
    sleep(1)

# some properties are now set
card_number = si.sicard
card_type = si.cardtype

# read out card data
card_data = si.read_sicard()

# beep
si.ack_sicard()
```