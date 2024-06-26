# pylint: disable=protected-access
import sportident as si


def test_crc_beep() -> None:
    assert si._crc(si.SIReader.C_BEEP + b"\x01\x02") == b"\x14\x0a"


def test_returned_crc_beep() -> None:
    assert si._crc(b"\xF9\x03\x00\x04\x01") == si._crc(b"\xF5\x0F")


def test_bytes2int() -> None:
    assert si._to_int(b"\x14\x0a") == 5130
