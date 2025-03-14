import tkinter as tk
from multiprocessing.resource_tracker import register
from tkinter import ttk

def create_authorization_form():
    window = tk.Tk()
    window.title("Форма авторизации")
    window.geometry("200x300")

    login_label = tk.Label(window, text="Логин: ")
    login_label.pack()

    login_entry = tk.Entry(window)
    login_entry.pack()

    password_label = tk.Label(window, text="Пароль: ")
    password_label.pack()

    password_entry = tk.Entry(window)
    password_entry.pack()

    remember_checkbox = tk.Checkbutton(window, text="Запомнить пароль")
    remember_checkbox.pack()

    autorize_button = tk.Button(window, text="Авторизоваться")
    autorize_button.pack()
    window.mainloop()

def create_registration_form():
    window = tk.Tk()
    window.title("Форма регистрации")
    window.geometry("200x400")
    window.configure(bg="#F0E68C")

    login_label = tk.Label(window, text="Логин: ", bg="#F0E68C")
    login_label.pack()

    login_entry = tk.Entry(window)
    login_entry.pack()

    password_label = tk.Label(window, text="Пароль: ", bg="#F0E68C")
    password_label.pack()

    password_entry = tk.Entry(window)
    password_entry.pack()

    about_label = tk.Label(window, text="О себе", bg="#F0E68C")
    about_label.pack()

    about_text = tk.Text(window, height=5, width=30, bg="#FFA500")
    about_text.pack()

    gender_label = tk.Label(window, text="Пол: ", bg="#F0E68C")
    gender_label.pack()

    gender = tk.StringVar(value="Мужской")
    male_radio = tk.Radiobutton(window, text="Мужской", bg="#F0E68C", variable=gender, value="Мужской")
    female_radio= tk.Radiobutton(window, text="Женский", bg="#F0E68C", variable=gender, value="Женский")
    male_radio.pack()
    female_radio.pack()

    continent_label = tk.Label(window, text="Материк", bg="#F0E68C")
    continent_label.pack()

    continents = ["Африка", "Азия", "Евразия", "Северная Америка", "Южная Америка"]
    continent_combo = ttk.Combobox(window, values=continents)
    continent_combo.pack()
    continent_combo.set(continents[0])

    register_button = tk.Button(window, text="Зарегистрироваться")
    register_button.pack()

    window.mainloop()

def create_widget_binding():
    window = tk.Tk()
    window.title("Привязки")
    window.geometry("200x300")

    entry_text = tk.StringVar()
    checkbox_value = tk.IntVar()
    radio_value = tk.StringVar(value="1")

    enrty_label = tk.Label(window, text="Введите текст:")
    enrty_label.pack()
    enrty = tk.Entry(window, textvariable=entry_text)
    enrty.pack()

    checkbox = tk.Checkbutton(window, text="Флажок", variable=checkbox_value)
    checkbox.pack()

    radio_label = tk.Label(window, text="Значения: ")
    radio_label.pack()
    radio1 = tk.Radiobutton(window, text="1", variable=radio_value, value="1")
    radio2 = tk.Radiobutton(window, text="2", variable=radio_value, value="2")
    radio1.pack()
    radio2.pack()

    result_label = tk.Label(window, text="Значения: ")
    result_label.pack()
    values_label = tk.Label(window, text="")
    values_label.pack()

    def update_label():
        values = [entry_text.get(), checkbox_value.get(), radio_value.get()]
        values_label.config(text=", ".join(map(str,values)))

    update_button = tk.Button(window, text="Обновить", command=update_label)
    update_button.pack()

    window.mainloop()

def create_menu():
    window = tk.Tk()
    window.title("меню")
    window.geometry("500x500")

    frame = tk.Frame(window, width=500, height=500, bg="white")
    frame.pack()

    def change_color_red():
        frame.config(bg="red")
    def change_color_green():
        frame.config(bg="green")
    def change_color_blue():
        frame.config(bg="blue")

    def change_size_500x500():
        window.geometry("500x500")
        frame.config(width=500, height=500)
    def change_size_700x400():
        window.geometry("700x400")
        frame.config(width=700, height=400)

    menu_bar = tk.Menu(window)

    color_menu = tk.Menu(menu_bar, tearoff=0)
    color_menu.add_command(label="Красный",command=change_color_red)
    color_menu.add_command(label="Синий",command=change_color_blue)
    color_menu.add_command(label="Зеленый",command=change_color_green)
    menu_bar.add_cascade(label="Цвет", menu=color_menu)

    size_menu = tk.Menu(menu_bar, tearoff=0)
    size_menu.add_command(label="500х500", command=change_size_500x500)
    size_menu.add_command(label="700x400", command=change_size_700x400)
    menu_bar.add_cascade(label="Размер", menu=size_menu)

    window.bind("<Control-r>", lambda event: change_color_red())
    window.bind("<Control-g>", lambda event: change_color_green())
    window.bind("<Control-b>", lambda event: change_color_blue())
    window.bind("<Control-1>", lambda event: change_size_500x500())
    window.bind("<Control-2>", lambda event: change_size_700x400())

    window.config(menu=menu_bar)
    window.mainloop()

#create_registration_form()
#create_widget_binding()
#create_authorization_form()
create_menu()
