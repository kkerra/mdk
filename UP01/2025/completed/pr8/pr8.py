def hello(name = "World"):
    return f"Hello, {name}"

def convert_to_base_n(num, n):
    digits = "0123456789ABCDEF"
    if num == 0:
        return "0"
    remainder = num % n
    result = convert_to_base_n(num // n, n)
    return result + digits[remainder] if result != "0" else digits[remainder]

def print_sentences(text):
    sentences = text.split('.')
    for sentence in sentences:
        sentence = sentence.strip()
        if sentence:
            print(f"{sentence}.")

def caesar_cipher(text, key = 3):
    result = ''
    for char in text:
        if 'a' <= char <= 'z':
            start = ord('a')
            shifted_char = chr((ord(char) - start + key) % 26 + start)
        elif 'A' <= char <= 'Z':
            start = ord('A')
            shifted_char = chr((ord(char) - start + key) % 26 + start)
        else:
            shifted_char = char
        result += shifted_char
    return result