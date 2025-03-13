import os

#Task1
def display_and_execute_file():
    filename = input("Введите название файла: ")
    try:
        if not os.path.exists(filename):
            raise FileNotFoundError("Файл не найден")
        with open(filename, 'r', encoding='utf-8') as file:
            content = file.read()
            print(content)

            root, ext = os.path.splitext(filename)
            if ext == '.py':
                print("Выполнение скрипта:")
                exec(content)
    except FileNotFoundError as e:
        print(e)

#display_and_execute_file()

#Task2
def write_to_file():
    filename = input("Введите название файла: ")
    mode = 'a'

    if os.path.exists(filename):
        while True:
            mode = input("Дописать (а) или перезаписать (w): ").lower()
            if mode in ('a', 'w'):
                break
            else:
                print("Некорректный ввод")

    try:
        with open(filename, mode, encoding='utf-8') as file:
            print("Введите текст для записи. Для конца - end")
            while True:
                line = input()
                if line.lower() == 'end':
                    break
                file.write(line + '\n')
        print("Текст записан")
    except Exception as e:
        print(e)

#write_to_file()

#Task3
def file_operation():
    filename = input("Введите имя файла: ")
    try:
        if not os.path.exists(filename):
            raise FileNotFoundError("Файл не найден")
        while True:
            print("Выберите операцию: ")
            print("1. Вывод содержимого")
            print("2. Удаление файла")
            print("3. Переименование файла")
            print("4. Выход")

            mode = input("Введите номер операции:")

            if mode == '1':
                with open(filename, 'r', encoding='utf-8') as file:
                    print(file.read())
            elif mode == '2':
                os.remove(filename)
                print("Файл удален")
                break
            elif mode == '3':
                new_name = input("Введите новое имя файла: ")
                os.rename(filename, new_name)
                print("Файл переименован")
                filename = new_name
            elif mode == '4':
                break
            else:
                print("неверный выбор")
    except FileNotFoundError as e:
        print(e)

#file_operation()

#Task4
def read_lines(filename = "123.txt"):
    try:
        if os.path.exists(filename):
            with open(filename, 'r', encoding='utf-8') as file:
                lines = file.readlines()
                if lines:
                    print(f"Первая строка: {lines[0].strip()}")
                else:
                    print("Файл пуст")

                if len(lines) >= 5:
                    print(f"Пятая строка: {lines[4].strip()}")
                else:
                    print("В файле меньше 5 строк")

                print("Первые 5 строк:")
                for i, line in enumerate(lines[:5]):
                    print(f"{i + 1} строка: {line.strip()}")

                while True:
                    try:
                        s1 = int(input("Введите номер начальной строки: "))
                        s2 = int(input("Введите номер конечной строки: "))

                        if 1 <= s1 <= s2 <= len(lines):
                            break
                        else:
                            print(f"Номера строк должны быть в диапазоне от 1 до {len(lines)}")
                    except ValueError as e:
                        print(e)
                print(f"Строки с {s1} по {s2}")
                for i, line in enumerate(lines[s1-1:s2]):
                    print(f"{i + 1} - {line.strip()}")

                print("Весь файл:")
                for line in lines:
                    print(line.strip())
    except FileNotFoundError as e:
        print(e)

#read_lines("123.txt")

#Task5
def sum_num_in_file(filename = "test.txt"):
    try:
        with open(filename, 'r', encoding='utf-8') as file:
            for line in file:
                line_sum = 0
                for num in line.split():
                    line_sum += int(num)
                print(line_sum)
    except FileNotFoundError as e:
        print(e)

sum_num_in_file()