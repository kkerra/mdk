import unittest

def factorial(n):
    if n < 0:
        return -1
    elif n == 0:
        return 1
    else:
        fact = 1
        for i in range(1, n + 1):
            fact = fact * i
        return fact

a = factorial(5)

class TestFactorial(unittest.TestCase):
    def test_factorial_positive(self):
        self.assertEqual(factorial(5), 120)
        self.assertEqual(factorial(0), 1)
        self.assertEqual(factorial(1), 1)

    def test_factorial_negative(self):
        self.assertEqual(factorial(-5), -1)

class Person:
    def __init__(self, name, age):
        self.__name = name
        self.__age = age

    def get_name(self):
        return self.__name

    def get_age(self):
        return self.__age

    def set_name(self, new_name):
        if isinstance(new_name, str):
            self.__name = new_name
        else:
            raise ValueError("Имя должно быть строкой")

    def set_age(self, new_age):
        if isinstance(new_age, int) and new_age >= 0:
            self.__age = new_age
        else:
            raise ValueError("Возраст должен быть числом")

class TestPerson(unittest.TestCase):
    def setUp(self):
        self.person = Person("abc", 18)

    def test_get_name_positive(self):
        self.assertEqual(self.person.get_name(), "abc")

    def test_get_age_positive(self):
        self.assertEqual(self.person.get_age(), 18)

    def test_set_name_positive(self):
        self.person.set_name("cde")
        self.assertEqual(self.person.get_name(), "cde")

    def test_set_age_positive(self):
        self.person.set_age(20)
        self.assertEqual(self.person.get_age(), 20)

    def test_set_name_value_error(self):
        with self.assertRaises(ValueError):
            self.person.set_name(1234)

    def test_set_age_value_error(self):
        with self.assertRaises(ValueError):
            self.person.set_age("1234")

    def test_set_age_negative(self):
        with self.assertRaises(ValueError):
            self.person.set_age(-7)
            
if __name__ == "__main__":
    unittest.main()