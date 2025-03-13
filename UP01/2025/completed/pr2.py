import math
#Task1
x = int(input("введите x: "))
if(x<-10):
    print(f"y(x) = {round(math.pi * x**2, 3)}")
elif(-10<=x<-5):
    print(f"y(x) = {round(x**4, 3)}")
elif(-5<=x<10):
    print(f"y(x) = {round(math.e * math.fabs(x), 3)}")
else:
    print(f"y(x) = {round(1 / math.sin(math.sqrt(x)), 3)}")

# #Task2
a = int(input("введите a "))
b = int(input("введите b "))
c = int(input("введите с "))
middle = a if(a > b and a < c) or (a < b and a > c) else b if(b > a and b < c) or (b < a and b > c) else c
print(f"Среднее значение {middle}")

#Task3
year = int(input("введите год "))
month = int(input("введите месяц "))
is_leap = (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0)
days_in_month = (31 if month in [1,3,5,7,8,10,12]
                 else 30 if month in [4, 6, 9, 11]
                 else 29 if is_leap
                 else 28)
print(f"В месяце {month} дней {days_in_month}. год високосный: {is_leap}")

#Task4
a = int(input("Введите сторону a"))
b = int(input("Введите сторону b"))
c = int(input("Введите сторону c"))

if a + b > c and b + c > a and a + c > b:
    if a == b == c:
        print("Треугольник равносторонний")
    elif a == b or b == c or a == c:
        print("Треугольник равнобедренный")
    elif a**2 + b**2 == c**2 or b**2 + c**2 == a**2 or a**2 + c**2 == b**2:
        print("Треугольник прямоугольный")
    else:
        print("Треуольник разносторонний")
else:
    print("Треугольник невозможно построить")

#Task5
a = int(input("Введите a"))
b = int(input("Введите b"))
operation = input("Введите операцию (and, or, xor, left, right): ")
if operation == "and":
    print(f"Результат and: {a} & {b} = {bin(a & b)}")
elif operation == "or":
    print(f"Результат or: {a} | {b} = {bin(a | b)}")
elif operation == "xor":
    print(f"Результат xor: {a} ^ {b} = {bin(a ^ b)}")
elif operation == "left":
    print(f"Результат left: {a} << {b} = {bin(a << b)}")
else:
    print(f"Результат right: {a} >> {b} = {bin(a >> b)}")
