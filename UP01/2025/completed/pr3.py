import random
#Task1
x = random.randint(1,1000)
is_prime = True
for i in range(2, int(x** 0.5) + 1):
    if x % 2 == 0:
        is_prime = False
        break

if is_prime and x > 1:
    print(f"Число {x} простое")
else:
    print(f"Число {x} составное")

#Task2
secret_number = random.randint(1, 10)
while True:
    guess = int(input("Угадайте число от 1 до 10"))
    if guess == secret_number:
        print("Вы молодец")
        break
    elif guess < secret_number:
        print("Вaше число меньше загаданного ")
    else:
        print("Ваше число больше загаданного ")

#Task3
for i in range(100, -10, -10):
    print(f"{i}C - {i * 1.8 + 32}F")

#Task4

a=int(input("введите внесенную покупателем сумму: "))
while True:
    x = int(input("введите сумму покупки: "))
    if(x <= 0):
        print("Повторите ввод суммы покупки: ")
    elif(x > a):
        print(f"вам не хватает {x-a}")
        a = int(input("введите внесенную покупателем сумму: "))
    elif(x==a):
        print("спасибо за покупку")
        break
    else:
        print(f"Ваша сдача {a - x} спасибо за покупку!")
        break

#Task5
a=float(input("введите a: "))
b=float(input("введите b: "))
x1=float(input("введите x1: "))
x2=float(input("введите x2: "))
N=int(input("введите n: "))
if(x1>x2):
    step = -1
    x1, x2 = x2, x1
else:
    step = 1

print(f"y({x1:.3f}) = {a * x1 + b:.3f}")
for i in range(1, N):
    x = x1 + (i * (x2 - x1) / (N - 1))
    y = a * x + b
    print(f"y({x:.3f}) = {y:.3f}")
print(f"y({x2:.3f}) = {a * x2 + b:.3f}")
