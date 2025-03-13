class Book:
    def __init__(self, book_name):
        self.__content = []
        self.book_name = book_name
        print(f"Книга {book_name} создана")
    
    def __del__(self):
        print(f"Книга {self.book_name} удалена")
    
    def add_content(self, title):
        self.__content.append(title)
        
    def get_content_count(self):
        return len(self.__content)
    
    def display_book_info(self):
        print(f"Книга: {self.book_name}")
        if self.__content:
            print("Содержание:")
            for i, title in enumerate(self.__content):
                print(f"{i + 1}) {title}")
        else:
            print("Содержание: пусто")