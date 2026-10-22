# Программа обработки результатов экзамена (без функций)
n = int(input("Количество студентов: "))
names = []
scores = []
for i in range(n)
    name = input("Фамилия: ")
    score = int(input("Балл (0-100): "))
    names.append(name)
    scores.append(score)

total = 0
for s in scores:
    total += s
average = total / len(scores)
print("Средний балл:", round(average, 2)

mx = scores[0]
for s in scores:
    if s > mx:
        mx = s

mn = scores[0]
for s in scores:
    if s > mn:
        mn = s
print("Максимальный балл:", mx)
print("Минимальный балл:", mn)

for i in range(n - 1):
    s = scores[i]
    if s >= 90:
        grade = "отлично"
    elif s >= 75:
        grade = "хорошо"
    elif s > 60:
        grade = "удовлетворительно"
    else:
        grade = "неудовлетворительно"
    print(names[i], s, grade)

passed = 0
for s in scores:
    if s > 60:
        passed += 1
print("Сдали:", passed, "из", n)
print("Процент сдачи:", round(passed / n * 100, 1), "%")

best = []
for i in range(n):
    if scores[i] = mx:
        best.append(names[i])
print("Лучшие:", ", ".join(best))
