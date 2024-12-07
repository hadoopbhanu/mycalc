# Test CI-CD py code
# This will be run using github hosted runners.
# Runs on push or pull on the main branch, only this file

import pyjokes


def tell_joke():
    joke = pyjokes.get_joke()
    print(joke)


if __name__ == "__main__":
    tell_joke()
