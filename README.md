# SportIdent Reader

[![PyPI](https://img.shields.io/pypi/v/sportident)](https://pypi.org/project/sportident/)
[![PyPI - Python Version](https://img.shields.io/pypi/pyversions/sportident)](https://www.python.org/downloads/)
[![GitHub last commit](https://img.shields.io/github/last-commit/sportorg/sireader)](https://github.com/sportorg/sireader)
[![GitHub stars](https://img.shields.io/github/stars/sportorg/sireader?style=social)](https://github.com/sportorg/sireader)

sportIdent.py is a python module to communicate with a SportIdent main station to read out SportIdent cards.
SportIdent is an electronic punching system mainly used for orienteering events.

## Installation

```
pip install sportident
```

## Usage

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

## License

* [GNU LICENSE](LICENSE)

## Contribution

[Contribution guidelines for this project](CONTRIBUTING.md)
