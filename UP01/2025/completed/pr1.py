#task1
import random

a = int(input("Введите число а:"))
b = int(input("Введите число b:"))
print(f"{a} + {b} = {a+b}")
print(f"{a} - {b} = {a-b}")
print(f"{a} * {b} = {a*b}")
print(f"{a} / {b} = {a/b}")
print(f"{a} // {b} = {a//b}")
print(f"{a} % {b} = {a%b}")
print(f"{a} ** {b} = {a**b}")
print(f"min= {min(a,b)}")
print(f"max= {max(a,b)}")

#task2
print("{0} + {1} = {2}".format(a, b, a+b))
print("{0} - {1} = {2}".format(a, b, a-b))
print("{0} * {1} = {2}".format(a, b, a*b))
print("{0} / {1} = {2}".format(a, b, a/b))
print("{0} // {1} = {2}".format(a, b, a//b))
print("{0} % {1} = {2}".format(a, b, a%b))
print("{0} ** {1} = {2}".format(a, b, a**b))
print("min = {0}".format(min(a,b)))
print("max = {0}".format(max(a,b)))

#task3
print("случайное число в диапозоне a и b: ",random.random() * (a - b) + b)

#task4
print ("число a в десятичной: ",a)
print ("число a в двоичной: ",bin(a))
print ("число a в восьмиричной: ",oct(a))
print ("число a в шеснацатиричной: ",hex(a))

print ("десятичная: {0}".format(a))
print ("двоичная: {:b}".format(a))
print ("восьмиричная: {:o}".format(a))
print ("шестнадцатиричная: {:x}".format(a))

#task5
c = float(input("Введите вещественное число:"))
print("3 знака после запятой: {:.3f}".format(c))
n = int(input("До скольких знаков округлить:"))
rounded_number = round(c, n)
print("до {0} знаков после запятой: {1}".format(n, rounded_number))

#task6
year = int(input("Введите год:"))
is_leap = (year % 4 == 0) & ((year % 100 != 0) | (year % 400 == 0))
print(is_leap)

#task7
a, b = b, a
print(f"Обмен чисел: {a} {b}")

#task8
seconds = int(input("Введите секунды: "))
seconds = seconds % (24 * 3600)
hours = seconds // 3600
minutes = (seconds % 3600) // 60
seconds = (seconds % 3600) % 60
print("{:02d}:{:02d}:{:02d}".format(hours,minutes,seconds))