from Author import *
from Book import *


class BookAuthor(Book, Author):
    def __init__(self, fullname, country, book_name):
        Author.__init__(self, fullname, country)
        Book.__init__(self, book_name)
        
    def display_book_author_info(self):
        print(f"Автор: {self.fullname}")
        self.display_book_info()