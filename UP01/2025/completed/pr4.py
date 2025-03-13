import random

#task1
length = int(input("Введите количество элементов списка:"))
new_list = [random.randint(0,100) for _ in range(length)]

for i, item in enumerate(new_list):
    print(f"{i} - {item}")

#task2
second_list = [input(f"Введите элемент {i + 1}: ") for i in range(length)]
print(" ".join(second_list))

#task3
list1 = [1,2,3,4,5,6]
list2 = [7,8,9,2,3]

for item in list2:
    if item % 2 == 0:
        list1.append(item)

print(" ".join(map(str, list1)))

#task4
print(sorted(list1, reverse=True))

#task5
new_list = [1,2,3,4,5,6,7,8,9,10]
number = int(input("введите число для поиска совпадений: "))
print(f"Количество совпадений: {new_list.count(number)}")
new_list = [x for x in new_list if x != number]
print(" ".join(map(str, new_list)))

#task6
new_list = [1,2,3,4,5,6,7,8,9,10]
number = int(input("введите количество элементов для вставки: "))
for i in range(number):
    index = int(input("Введите индекс: "))
    value = int(input("Введите значение: "))
    new_list.insert(index, value)
print(" ".join(map(str, new_list)))

#task7
math_scores = [random.randint(40, 100) for i in range(20)]
rus_scores = [random.randint(40, 100) for i in range(20)]
info_scores = [random.randint(40, 100) for i in range(20)]
names = [f"Абитуриент {i + 1}" for i in range(20)]
total_scores = [math_scores[i] + rus_scores[i] + info_scores[i] for i in range(len(math_scores))]
student_data = [(total_scores[i], i) for i in range(len(total_scores))]
student_data.sort(reverse=True)
accepted_students = min(10, len(student_data))
accepted_students = student_data[:accepted_students]

print("Список зачисленных:")
for total_scores, index in accepted_students:
    print(f"{index}: {names[index]}")

#task8
dictionary = {'книга':6, 'ручки': 3, 'карандаши': 8}
print(f"Список ключей: {list(dictionary.keys())}")
print(f"Список значений: {list(dictionary.values())}")

key = input("Введите ключ:")
if key in dictionary:
    print(f"{key} - {dictionary[key]}")
else:
    print("Ключ не найден")

#task9
regions = {"Архангельская область": ["Архангельск","Новодвинск", "Северодвинск", "Шенкурск",
"Котлас"],
           "Ленинградская область": ["Санкт-Петербург", "Пушкин", "Павловск"]}
input_cities = ["Архангельск", "Пушкин", "Котлас"]
for city in input_cities:
    for region, cities in regions.items():
        if city in cities:
            print(region)
            break