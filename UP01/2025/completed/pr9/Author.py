class Author:
    def __init__(self, fullname, country):
        self.fullname = fullname
        self.country = country
    
    def display_info(self):
        print(f"ФИО: {self.fullname}, страна: {self.country}")
        
