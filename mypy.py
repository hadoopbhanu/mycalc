# Test CI-CD py code
# This will be run using github hosted runners
#Only run on pull request on Release Branch

import pyjokes

def tell_joke():
    joke = pyjokes.get_joke()
    print(joke)

if __name__ == "__main__":
    tell_joke()
