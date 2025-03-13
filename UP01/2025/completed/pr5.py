#task1
str = input("Введите строку: ")
print(str)
print(str)
print(str)
print(str)
print(str)

print(f"Длина строки: {len(str)}")

for i, char in enumerate(str):
    print(f"{i} - {char}")

for i in range(1, len(str), 2):
    print(f"Символ {str[i]} находится на позиции {i + 1}")


#Task2
start = int(input("Введите начальную позицию: "))
end = int(input("Введите конечную позицию: "))

print(str[start-1:end])

#Task3
print(f"#{str[1:-1]}#")

#Task4
if str.isdigit():
    print("строка состоит из цифр")
elif str.isalpha():
    if str.isupper():
        print("строка состоит из прописных букв")
    elif str.islower():
        print("строка состоит из строчных букв")
    else:
        print("строка состоит из букв")
elif str.isalnum():
    print("строка состоит из букв и цифр")
else:
    print("строка содерджит и другие символы")

#Task5
str = input("Введите строку: ")
words = str.split()
new_string = ','.join(words)
print(f"Объединенная строка: {new_string}")

#Task6
str1 = input("Введите первую строку: ")
str2 = input("Введите вторую строку: ")
positions = []
start = 0
while True:
    start = str2.find(str1, start)
    if start == -1:
        break
    positions.append(start)
    start += len(str1)
if positions:
    print(f"Первая строка встречается во второй: {len(positions)}")
else:
    print("Первая строка не встречается во второй")

#Task7
str = input("Введите слово: ")
processed_word = str.lower()
reversed_word = processed_word[::-1]

if processed_word == reversed_word:
    print("Слово - палиндром")
else:
    print("Слово не является палиндромом")

#Task8
str = input("Введите строку: ")
while '  ' in str:
    str = str.replace('  ', ' ')
print(f"результат: {str}")

#Task9
answer = input("текущий месяц - март? ")

if answer.lower() == 'да':
    print("ответ правильный")
else:
    print("ответ неправильный")