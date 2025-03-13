import math
from itertools import count
from random import choice

#Task1
try:
    a = int(input("Введите число а: "))
    b = int(input("Введите число b: "))

    print(f"Результат: {a/b}")
except ZeroDivisionError:
    print("делить на ноль нельзя")

#Task2
a = int(input("Введите число а: "))
while True:
    try:
        b = int(input("Введите число b: "))
        if b == 0:
            print("на ноль делить нельзя")
        else:
            result = a/b
            break
    except ValueError:
        print("введите числа")
    finally:
        try:
            print(f"результат деления: {result}")
        except ZeroDivisionError:
            print("Деление не произведено,тк на ноль делить нельзя")

#Task3,4
try:
    x = int(input("Введите x: "))
    y = int(input("Введите y: "))
    z = int(input("Введите z: "))
    divisible = x + y + z
    divider = (x - y - z)**2
    if divider == 0:
        raise ZeroDivisionError("Делить на ноль нельзя")
    under_root = divisible / divider
    if under_root < 0:
        raise ValueError("Подкоренное выражение не может быть отрицательным")
    print(f"Результат: {math.sqrt(under_root)}")
except ValueError as e:
    print(f"Ошибка ввода: {e}")
except ZeroDivisionError as e:
    print(f"Ошибка вычисления: {e}")

#Task5
books = {}
while True:
    print("Меню:")
    print("1. Добавить книгу")
    print("2. Удаление книги")
    print("3. Просмотреть книгу")
    print("4. Выход")

    point = int(input("Введите пункт меню (1-4): "))
    if point == 1:
        title = input("Введите название книги: ")
        author = input("Введите автора книги: ")
        books[title] = author
        print("Книга добавлена")
    elif point == 2:
        title_to_remove = input("Введите название книги для удаления")
        try:
            del books[title_to_remove]
            print("Книга удалена")
        except KeyError:
            print("Книги с таким названием не существует")
    elif point == 3:
        if books:
            print("Список книг:")
            for title, author in books.items():
                print(f"{title} - {author}")
        else:
            print("Список книг пуст")
    elif point == 4:
        break
    else:
        print("Неверный выбор")