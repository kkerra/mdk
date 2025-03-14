from collections import Counter
import os.path

#Task1
def find_substr(subst, st):
    subst_lower = subst.lower()
    st_lower = st.lower()
    if subst_lower in st_lower:
        return True
    else:
        return False

print(find_substr ('Пит', 'пИтон'))
print(find_substr ('программирование', 'ПрограммироВаНИЕ'))
print(find_substr ('Довод', 'Повод'))

#Task2
def first_last(let, st):
    first_index = -1
    last_index = -1

    for i, char in enumerate(st):
        if char == let:
            if first_index == -1:
                first_index = i
            last_index = i
    return (first_index, last_index)

print(first_last('a', 'abba'))
print(first_last('a', 'abbaaaab'))
print(first_last('a', 'a'))
print(first_last('a', 'spring'))

#Task3
def most_common_top3(st):
    st = st.replace(" ", "")
    char_counts = Counter(st)
    most_common = char_counts.most_common(3)
    return f", ".join(f"{char} - {count}" for char, count in most_common)

print(most_common_top3('Python — высокоуровневый язык программирования общего назначения с динамической строгой типизацией и автоматическим управлением памятью'))
print(most_common_top3('Тише едешь — дальше будешь'))

#Task4
def add_text_to_file(st):
    filename = "file2.txt"
    file_exists = os.path.exists(filename)

    try:
        with open(filename, "a") as file:
            file.write(st + "\n")
            if not file_exists:
                return "файл был создан"
            else:
                return "строка добавлена"
    except Exception as e:
        return f"Ошибка: {e}"

print(add_text_to_file("Первая строка"))
print(add_text_to_file("Вторая строка"))
print(add_text_to_file("Третья строка"))

#Task5
def read_from_last(lines, file):
    try:
        with open(file, "r", encoding="utf-8") as file:
            all_lines = file.readlines()
            lines_to_read = abs(lines)
            if lines_to_read >= len(all_lines):
                start_index = 0
            else:
                start_index = len(all_lines) - lines_to_read
            last_lines = all_lines[start_index:]

            for line in last_lines:
                print(line.strip())
    except FileNotFoundError:
        print("Файл не найден")
    except Exception as e:
        print(f"Ошибка {e}")

read_from_last(2, "MyFile.txt")
read_from_last(-2, "MyFile.txt")

#Task6
def camel(st):
    result= ""
    upper = True
    for char in st:
        if char.isalpha():
            if upper:
                result += char.upper()
            else:
                result += char.lower()
            upper = not upper
        else:
            result += char
    return result

print(camel('Копейка рубль бережет'))
print(camel('Из огня да в полымя'))
print(camel('КРАСОТА)))'))

#Task7
def remove_braces(st):
    result = ""
    brace_level = 0
    for char in st:
        if char == '(':
            brace_level += 1
        elif char == ')':
            if brace_level > 0:
                brace_level -= 1
        elif brace_level == 0:
            result += char
    return result

print(remove_braces('Шила(лишнее (лишнее) лишнее) в мешке не утаишь (лишнее)'))
print(remove_braces('(лишнее(лишнее))Шила в мешке не (лишнее(лишнее(лишнее)))утаишь'))

#Task8
def delete_backspace(st):
    result = ""
    for char in st:
        if char == "@":
            if result:
                result = result[:-1]
        else:
            result += char
    return result

print(delete_backspace('пп@олс@кр@овт@оде@ец'))
print(delete_backspace('сварка@@@@@лоб@ну@'))

#Task9
def max_length_word(file):
    with open(file, "r", encoding="utf-8") as file:
        text = file.read()
        words = text.split()

    max_len = 0
    max_words = []
    for word in words:
        length = len(word)
        if length > max_len:
            max_len = length
            max_words = [word]
        elif length == max_len:
            max_words.append(word)

    return max_words

print(max_length_word('title.txt'))