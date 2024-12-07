import pyjokes

def tell_joke():
    joke = pyjokes.get_joke()
    print(joke)

if __name__ == "__main__":
    tell_joke()
