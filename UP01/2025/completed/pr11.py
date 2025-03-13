import re

#Task1
def split_into_sentences(text):
    sentences = re.split(r'[.?!...]+', text)
    for sentence in sentences:
        sentence = sentence.strip()
        if sentence:
            print(sentence)

split_into_sentences("dkfkdf. dfjdkfjdkf. dkfjkjds. sdhfihfiewhriuew. df")

#Task2
def replace_words(text):
    redis_pattern = r'\bредис[а-яё]*\b'
    bad_people_pattern = r'\bнехорош[а-яё]*\sчеловек[а-яё]*\b'
    text = re.sub(redis_pattern, 'давайте жить дружно', text)
    text = re.sub(bad_people_pattern, 'давайте жить дружно', text)

    return text

print(replace_words("праправпр редиска ывлщуцкцушк редиски авылоавы нехорошие человеки"))

#Task3
def extract_date(text):
    date_pattern = r'\b(0?[1-9]|[12][0-9]|3[01])\.(0?[1-9]|1[0-2])\.(\d{2}|\d{4})\b'
    dates = re.findall(date_pattern,text)
    for date in dates:
        print(".".join(date))

extract_date("02.04.05 выфололывоыфв 04.03.2000 ыовылво 33.33.3333 аыватвылоа 123.11.23")

#Task4
def validate_password():
    while True:
        password = input("Ввежите пароль: ")
        if (len(password) >= 6 and
            re.search(r'\d', password) and
            re.search(r'[a-z]', password) and
            re.search(r'[A-Z]', password)):
            print("Пароль надежный")
            break
        else:
            print("Пароль не соответствует требованиям, введите снова: ")

validate_password()