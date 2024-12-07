import pytest
from mypy import tell_joke

def test_tell_joke(capsys):
    # Call the function
    tell_joke()
    # Capture the printed output
    captured = capsys.readouterr()
    # Assert that output is not empty
    assert len(captured.out.strip()) > 0
