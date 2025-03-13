from Author import *
from Book import *
from BookAuthor import *

def create_authors(n):
    authors = []
    for _ in range(n):
        fullname = input("введите фио: ")
        country = input("введите страну: ")
        author = Author(fullname, country)
        authors.append(author)
    return authors

def show_authors(authors):
    for author in authors:
        author.display_info()

def show_russian_authors(authors):
    russian_authors = [author for author in authors if author.country.lower() == "россия"]
    if russian_authors:
        for author in russian_authors:
            author.display_info()
    else:
        print("русских авторов нет")

def main_books():
    book = Book("abc")
    book.add_content("a1")
    book.add_content("a2")
    print(f"Количество произведений в книге: {book.get_content_count()}")
    book.add_content("a3")
    print(f"Количество произведений в книге: {book.get_content_count()}")

    book.display_book_info()

    book_author = BookAuthor("Автор", "Страна", "Книга1")
    book_author.add_content("Глава 1")
    book_author.add_content("Глава 2")
    book_author.add_content("Глава 3")
    book_author.add_content("Глава 4")
    book_author.add_content("Глава 5")

    book_author.display_book_info()


if __name__ == "__main__":
    n = int(input("Введите количество авторов: "))
    authors = create_authors(n)
    show_authors(authors)
    print("")
    show_russian_authors(authors)
    main_books()