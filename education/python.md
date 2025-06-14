# Python

* Python — это интерпретируемый, высокоуровневый и универсальный язык программирования с динамической типизацией.
* Он также является объектно-ориентированным, модульно-ориентированным и языком сценариев.
* В Python всё считается объектом.
* Файл Python имеет расширение `.py`.
* Python использует отступы для разделения блоков кода вместо фигурных скобок `{}`.
* Мы можем запустить файл Python с помощью следующей команды в cmd (Windows) или shell (mac/linux):

    ```bash
    $ python <имя_файла.py>
    ```
    или
    ```bash
    $ python3 <имя_файла.py>
    ```

#### По умолчанию Python не требует импорта библиотек для запуска файла.

## Создание и выполнение программы

1. Откройте терминал/cmd.
2. Создайте программу: `nano/cat > имя_программы.py`.
3. Напишите программу и сохраните её.
4. Запустите программу: `python имя_программы.py`.

<br>

### Основные типы данных

| Тип данных | Описание |
| --------- | ----------- |
| `int` | Целочисленные значения [0, 1, -2, 3] |
| `float` | Числа с плавающей точкой [0.1, 4.532, -5.092] |
| `char` | Символы [a, b, @, !, `] |
| `str` | Строки [abc, AbC, A@B, sd!, `asa] |
| `bool` | Логические значения [True, False] |
| `complex` | Комплексные числа [2+3j, 4-1j] |

<br>

## Ключевые слова

- Начиная с Python 3.8, существует 35 ключевых слов.

| Ключевое слово | Описание  | Категория |
|---------- | ---------- | --------- |
| `True`      | Логическое значение, эквивалентное "истина" или 1 | Значение |
| `False`     | Логическое значение, эквивалентное "ложь" или 0 | Значение |
| `None`      | Отсутствие значения | Значение |
| `and`       | Возвращает True, если оба операнда истинны (аналог `&&` в других языках) | Оператор |
| `or`        | Возвращает True, если хотя бы один операнд истинен (аналог `\|\|` в других языках) | Оператор |
| `in`        | Возвращает True, если элемент содержится в итераторе | Оператор |
| `is`        | Возвращает True, если идентификаторы переменных совпадают | Оператор |
| `not`       | Возвращает противоположное логическое значение | Оператор |
| `if` | Выполняет блок, если условие истинно | Условные |
| `elif` | Используется для дополнительных проверок после `if` | Условные |
| `else` | Выполняет блок, если условие ложно | Условные |
| `for` | Используется для циклов | Итерации |
| `while` | Используется для циклов | Итерации |
| `break` | Выход из цикла | Итерации |
| `continue` | Пропуск текущей итерации цикла | Итерации |
| `def` | Создание пользовательской функции | Структуры |
| `class` | Создание пользовательских классов | Структуры |
| `lambda` | Создание анонимной функции | Структуры |
| `with` | Выполнение кода в контексте менеджера | Структуры |
| `as` | Псевдоним для чего-либо | Структуры |
| `pass` | Используется для создания пустых структур (объявление) | Структуры |
| `return` | Возвращает значение(я) из функции и завершает её выполнение | Возврат |
| `yield` | Возвращает значения по мере их генерации (генераторы) | Возврат |
| `import` | Импорт библиотек/модулей/пакетов | Импорт |
| `from` | Импорт конкретных функций/классов из модулей/пакетов | Импорт |
| `try` | Блок, который будет выполнен с попыткой | Обработка исключений |
| `except` | Выполняется, если произошла ошибка/исключение | Обработка исключений |
| `finally` | Выполняется в любом случае, независимо от возникновения исключения | Обработка исключений |
| `raise` | Вызывает определённую ошибку/исключение | Обработка исключений |
| `assert` | Вызывает `AssertionError`, если условие ложно | Обработка исключений |
| `async` | Используется для определения асинхронных функций/корутин | Асинхронное программирование |
| `await` | Указывает точку, когда управление возвращается | Асинхронное программирование |
| `del` | Удаляет/сбрасывает пользовательские данные | Управление переменными |
| `global` | Используется для доступа к переменным, определённым вне функции | Управление переменными |
| `nonlocal` | Изменяет переменные из других областей видимости | Управление переменными |

<br>

## Операторы

| Оператор | Описание |
|-|-|
| `( )` | Группировка, вызов функции, объявление кортежа |
| `[ ]` | Индексация массива, объявление списков и т.д. |
| `!` | Логическое НЕ, инверсия, `!a` возвращает `True` или `False` |
| `~` | Побитовое НЕ, инверсия битов, `~a` |
| `-` | Унарный минус, `-a` |
| `+` | Унарный плюс, `+a` |
| `*` | Умножение, `a * b` |
| `/` | Деление, `a / b` |
| `%` | Остаток от деления, `a % b` |
| `+` | Сложение, `a + b` |
| `-` | Вычитание, `a - b` |
| `<<` | Сдвиг влево, левый операнд сдвигается влево на количество битов правого операнда (умножение на 2) |
| `>>` | Сдвиг вправо, левый операнд сдвигается вправо на количество битов правого операнда (деление на 2) |
| `<` | Меньше, результат `True` или `False`, `a < b` |
| `<=` | Меньше или равно, результат `True` или `False`, `a <= b` |
| `>` | Больше, результат `True` или `False`, `a > b` |
| `>=` | Больше или равно, результат `True` или `False`, `a >= b` |
| `==` | Равно, результат `True` или `False`, `a == b` |
| `!=` | Не равно, результат `True` или `False`, `a != b` |
| `&` | Побитовое И, `a & b` |
| `^` | Побитовое исключающее ИЛИ (XOR), `a ^ b` |
| `\|` | Побитовое ИЛИ, `a \| b` |
| `&&`, `and` | Логическое И, результат `True` или `False`, `a < b && c >= d` |
| `\|\|`, `or` | Логическое ИЛИ, результат `True` или `False`, `a < b \|\| c >= d` |
| `=` | Присваивание |
| `+=` | Сложение с присваиванием |
| `-=` | Вычитание с присваиванием |
| `*=` | Умножение с присваиванием |
| `/=` | Деление с присваиванием |
| `%=` | Остаток от деления с присваиванием |
| `<<=` | Сдвиг влево с присваиванием |
| `>>=` | Сдвиг вправо с присваиванием |
| `&=` | Побитовое И с присваиванием |
| `^=` | Побитовое исключающее ИЛИ с присваиванием |
| `\|=` | Побитовое ИЛИ с присваиванием |
| `,` | Разделитель, например: `(y=x, z=++x)` |

### Основные структуры данных

### Список (List)

- Список — это упорядоченная и изменяемая коллекция. Позволяет хранить дублирующиеся элементы.

- Списки создаются с использованием квадратных скобок:

```python
thislist = ["apple", "banana", "cherry"]
```

- Элементы списка упорядочены, изменяемы и могут содержать дублирующиеся значения.

- Элементы списка индексируются, первый элемент имеет индекс [0], второй — [1] и так далее.

- Список является изменяемым, что означает, что мы можем изменять, добавлять и удалять элементы после создания списка.

- Чтобы определить количество элементов в списке, используйте функцию len().

- Список может содержать элементы разных типов данных:
```python
list1 = ["abc", 34, True, 40, "male"]
```
- Также можно использовать конструктор list() для создания нового списка:
```python
thislist = list(("apple", "banana", "cherry"))  # # обратите внимание на двойные круглые скобки
```
- Функция pop() удаляет последний элемент списка по умолчанию.

  ```python
  thislist = ["apple", "banana", "cherry"]

  print(thislist.pop())  # cherry
  print(thislist.pop(0))  #apple

  ```



### Кортеж (Tuple)

- Кортеж — это упорядоченная и неизменяемая коллекция. Позволяет хранить дублирующиеся элементы.

- Кортеж — это коллекция, которая упорядочена и неизменяема.

- Кортежи записываются с использованием круглых скобок.
```python
thistuple = ("apple", "banana", "cherry")
```
- Элементы кортежа упорядочены, неизменяемы и могут содержать дублирующиеся значения.

- Элементы кортежа индексируются, первый элемент имеет индекс [0], второй — [1] и так далее.

- Когда мы говорим, что кортежи упорядочены, это означает, что элементы имеют определённый порядок, который не изменяется.

- Кортежи неизменяемы, что означает, что мы не можем изменять, добавлять или удалять элементы после создания кортежа.

- Поскольку кортежи индексированы, они могут содержать элементы с одинаковыми значениями:

- Кортежи позволяют дублирующиеся значения:
```python
thistuple = ("apple", "banana", "cherry", "apple", "cherry")
```
- Чтобы определить количество элементов в кортеже, используйте функцию len():
```python
thistuple = ("apple", "banana", "cherry")
print(len(thistuple))
```
- Чтобы создать кортеж с одним элементом, необходимо добавить запятую после элемента, иначе Python не распознает его как кортеж.
```python
thistuple = ("apple",)
print(type(thistuple))

# НЕ кортеж
thistuple = ("apple")
print(type(thistuple))
```
- Также можно использовать конструктор tuple() для создания кортежа.
```python

thistuple = tuple(("apple", "banana", "cherry")) # обратите внимание на двойные круглые скобки
print(thistuple)
```

### Множество (Set)
- Множество — это неупорядоченная и неиндексированная коллекция. Не позволяет хранить дублирующиеся элементы.

- Множество — это коллекция, которая неупорядочена и неиндексирована.
```python
thisset = {"apple", "banana", "cherry"}
```
- Элементы множества неупорядочены, неизменяемы и не позволяют дублирующиеся значения.

- Неупорядоченность означает, что элементы множества не имеют определённого порядка.

- Элементы множества могут появляться в разном порядке при каждом использовании, и на них нельзя ссылаться по индексу или ключу.

- Множества неизменяемы, что означает, что мы не можем изменять элементы после создания множества.

- Дублирующиеся значения будут проигнорированы.

- Чтобы определить количество элементов в множестве, используйте метод len().
```python
thisset = {"apple", "banana", "cherry"}

print(len(thisset))
```
- Элементы множества могут быть любого типа данных:
```python
set1 = {"apple", "banana", "cherry"}
set2 = {1, 5, 7, 9, 3}
set3 = {True, False, False}
set4 = {"abc", 34, True, 40, "male"}
```
- Также можно использовать конструктор set() для создания множества.
```python
thisset = set(("apple", "banana", "cherry")) # обратите внимание на двойные круглые скобки
```
- frozenset()   это неизменяемая версия множества. В то время как элементы множества могут быть изменены в любое время, элементы frozenset остаются неизменными после создания.

```python
set1 = {"apple", "banana", "cherry"}
frzset=frozenset(set1)
print(frzset)
```



### Словарь (Dictionary)

- Словарь — это неупорядоченная и изменяемая коллекция. Не позволяет хранить дублирующиеся ключи.
- Словари используются для хранения данных в формате ключ:значение.
- Словари записываются с использованием фигурных скобок и содержат ключи и значения:
```python
thisdict = {
  "brand": "Ford",
  "model": "Mustang",
  "year": 1964
}
```
- Элементы словаря представлены в формате ключ:значение, и к ним можно обращаться по имени ключа.
```python
thisdict = {
  "brand": "Ford",
  "model": "Mustang",
  "year": 1964
}
print(thisdict["brand"])
```
- Словари изменяемы, что означает, что мы можем изменять, добавлять или удалять элементы после создания словаря.

- В словаре не может быть двух элементов с одинаковым ключом.

- Дублирующиеся значения перезапишут существующие.

- Чтобы определить количество элементов в словаре, используйте функцию len().
```python
print(len(thisdict))
```
- Значения в словаре могут быть любого типа данных:
```python
thisdict = {
  "brand": "Ford",
  "electric": False,
  "year": 1964,
  "colors": ["red", "white", "blue"]
}
```

- Функция pop() используется для удаления конкретного значения из словаря. Вы можете использовать только ключ, а не значение. В отличие от списков, вы должны передать значение в эту функцию.

  ```python
   car = {
    "brand": "Ford",
    "model": "Mustang",
    "year": 1964
  }

  x = car.pop("model")

  print(x)# Mustang
  print(car)#{'brand': 'Ford', 'year': 1964}
  ```



### Условные ветвления (Conditional branching)

```python
    if condition:
        pass
    elif condition2:
        pass
    else:
        pass
```
### Циклы (Loops)

 В Python есть два примитивных типа циклов:
1. while
2. for

#### Цикл While
- С помощью цикла while мы можем выполнять набор инструкций, пока условие истинно.
- Пример: Выводить i, пока i меньше 6:
```python
i = 1
while i < 6:
  print(i)
  i += 1
```
- Цикл while требует подготовки соответствующих переменных. В этом примере мы должны определить переменную-индекс i, которую мы установили в 1.

- С помощью оператора break мы можем остановить цикл, даже если условие while истинно.

- С помощью оператора continue мы можем остановить текущую итерацию и продолжить со следующей.

- С помощью оператора else мы можем выполнить блок кода один раз, когда условие больше не истинно.

#### Цикл For
- Цикл for используется для перебора последовательности (это может быть список, кортеж, словарь, множество или строка).

- Он отличается от ключевого слова for в других языках программирования и работает больше как метод итератора, встречающийся в объектно-ориентированных языках программирования.

- С помощью цикла for мы можем выполнять набор инструкций один раз для каждого элемента в списке, кортеже, множестве и т.д.
```python
fruits = ["apple", "banana", "cherry"]
for x in fruits:
  print(x)
```
- Цикл for не требует предварительного задания переменной-индекса.

- Чтобы выполнить набор кода определённое количество раз, мы можем использовать функцию range().

- Функция range() возвращает последовательность чисел, начиная с 0 по умолчанию, с шагом 1 (по умолчанию) и заканчивая указанным числом.

- Функция range() по умолчанию увеличивает последовательность на 1, однако можно указать шаг, добавив третий параметр: range(2, 30, 3).

- Ключевое слово else в цикле for указывает блок кода, который будет выполнен после завершения цикла.

- Вложенный цикл — это цикл внутри цикла.

- "Внутренний цикл" будет выполнен один раз для каждой итерации "внешнего цикла":

```python
adj = ["red", "big", "tasty"]
fruits = ["apple", "banana", "cherry"]

for x in adj:
  for y in fruits:
    print(x, y)
```
- Циклы for не могут быть пустыми, но если по какой-то причине у вас есть цикл for без содержимого, используйте оператор pass, чтобы избежать ошибки.

```python
for x in [0, 1, 2]:
  pass
```

### Определение функции (Function definition)
```python
def function_name():
    return
```
### Вызов функции (Function call)

```python
function_name()
```

* Нам не нужно указывать тип возвращаемого значения функции.

* По умолчанию функции возвращают None.

* Мы можем возвращать любой тип данных.


