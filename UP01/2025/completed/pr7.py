import random
#Task1
def power_function(a: 'Число, которое нужно возвести в степень',
                   x: 'Степень, в которую возводится число' = 2):
    """
    :param a: Число, которое нужно возвести в степень
    :param x: Степень, в которую возводится число (по умолчанию 2)
    :return: Результат возведения в степень
    """
    return a**x

print(f"2 ** 3 = {power_function(2, 3)}")
print(f"5 ** 2 = {power_function(5)}")
print(f"2 ** 0 = {power_function(2, 0)}")
print(f"2 ** 6 = {power_function(2, 6)}")

#Task2
def factorial_recursive(n):
    if not isinstance(n, int) or n < 0:
        return -1
    if n == 0:
        return 1
    else:
        return n * factorial_recursive(n - 1)

print(f"Факториал 5: {factorial_recursive(5)}")
print(f"Факториал 3: {factorial_recursive(3)}")
print(f"Факториал -5: {factorial_recursive(-5)}")
print(f"Факториал 0: {factorial_recursive(0)}")
print(f"Факториал abc: {factorial_recursive("abc")}")

#Task3
def calculate_statistics(*numbers):
    if not numbers:
        print("Нет данных для вычисления")
        return

    print("Данные:")
    print(f"Сумма: {sum(numbers)}")
    print(f"Минимальное: {min(numbers)}")
    print(f"Максимум: {max(numbers)}")
    print(f"Среднее: {sum(numbers) / len(numbers)}")
    print(f"Количество: {len(numbers)}")

calculate_statistics(1,2,3,4,5,6,7)
print("")
calculate_statistics(3,4,5,6)

#Task4
def multiply_list(list, multipier = -1):
    return [x * multipier for x in list]

numbers_list = [1,2,3,4,5,6]
print(multiply_list(numbers_list, 4))
print(multiply_list(numbers_list))

#Task5
linear_func = lambda a, x, b: a * x + b

print(linear_func(2,3,4))
print(linear_func(1,2,3))

#Task6
def create_new_list(names, math_scores, rus_scores, info_scores):
    return list(zip(names, math_scores, rus_scores, info_scores))

math_scores = [random.randint(40, 100) for i in range(20)]
rus_scores = [random.randint(40, 100) for i in range(20)]
info_scores = [random.randint(40, 100) for i in range(20)]
names = [f"Абитуриент {i + 1}" for i in range(20)]
print(create_new_list(names, math_scores, rus_scores, info_scores))