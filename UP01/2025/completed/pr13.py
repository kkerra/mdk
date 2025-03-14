import json
import os

fruits = {
    "Apple": 50,
    "Banana": 30,
    "Pear": 20,
    "Mango": 70
}
with open("fruits.json", 'w', encoding='utf-8') as file:
    json.dump(fruits, file)

class Cat:
    def __init__(self, name, age, color):
        self.name = name
        self.age = age
        self.color = color

    def save_to_file(self):
        cats = self.load_cats()
        cats.append(self.__dict__)
        with open("cats.json", 'w', encoding='utf-8') as file:
            json.dump(cats, file)

    @staticmethod
    def load_cats():
        try:
            with open("cats.json", 'r', encoding='utf-8') as file:
                return json.load(file)
        except FileNotFoundError as e:
            return []

    @staticmethod
    def delete_cat(name):
        cats = Cat.load_cats()
        cats = [cat for cat in cats if cat["name"] != name]
        with open("cats.json", 'w') as file:
            json.dump(cats, file)

    @staticmethod
    def sort_cats(key = "name", reverse = False):
        cats = Cat.load_cats()
        cats.sort(key = lambda x: x[key], reverse=reverse)
        return cats

sorted_cats = Cat.sort_cats()
for cat in sorted_cats:
    print(f"{cat['name']} - {cat['age']}, {cat['color']}")
print()
sorted_cats = Cat.sort_cats("age")
for cat in sorted_cats:
    print(f"{cat['name']} - {cat['age']}, {cat['color']}")
print()
cat1 = Cat("к1232", 2, "Белый")
cat2 = Cat("кот1", 3, "Черный")
cat3 = Cat("кот2", 6, "Бежевый")
cat1.save_to_file()
cat3.save_to_file()
cat2.save_to_file()

cats = Cat.load_cats()
for cat in cats:
    print(f"{cat['name']} - {cat['age']}, {cat['color']}")
print()
Cat.delete_cat("Муська")
cats = Cat.load_cats()
for cat in cats:
    print(f"{cat['name']} - {cat['age']}, {cat['color']}")