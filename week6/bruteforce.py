#!/usr/bin/python3
from string import ascii_letters
import hashlib
import itertools


def get_hash(word):
    wordlistHash = hashlib.sha256(word.encode("utf-8")).hexdigest()
    print(wordlistHash)
    if (wordlistHash == passwordHash):
        print(f"Password has been cracked!")

# hidden password hash
#passwordHash = "a2d4ff9c70b7b884e04e04c184a7bf8a07dca029a68efa4d0477cea0c6f8ac2b" # allo
passwordHash = "8f434346648f6b96df89dda901c5176b10a6d83961dd3c1ac88b59b2dc327aa4" # hi

numbers = "1234567890"
characters = ascii_letters + numbers

def try_password(word):
    # hash the word
    wordlistHash = hashlib.sha256(word.encode("utf-8")).hexdigest()
    print(f"Trying password {word}:{wordlistHash}")
    
    # if the hash is the same as the correct password's hash then we have cracked the password!
    if (wordlistHash == passwordHash):
        print(f"Password has been cracked! It was {word}")
        return True
    return False

# Do brute forcing
done = False
char_count = 1
while not done:
    for word in itertools.product(characters, repeat=char_count):
        done = try_password(''.join(word))
        if done:
            break
    char_count = char_count + 1