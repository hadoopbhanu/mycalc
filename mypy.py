# This will be run using github hosted runners. pytest dependency check added.
# Runs on push or pull on the main branch, only this file. Done
# Super Code

import pyjokes


def tell_joke():
    joke = pyjokes.get_joke()
    print(joke)


if __name__ == "__main__":
    tell_joke()
