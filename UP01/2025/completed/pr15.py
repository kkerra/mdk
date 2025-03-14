import tkinter as tk
import os
from tkinter import filedialog
from tkinter import messagebox

def save_text():
    def save_file():
        file_path = filedialog.asksaveasfilename(
            defaultextension=".txt",
            filetypes=[("Text files", "*.txt"), ("All files", "*.*")]
        )
        if file_path:
            try:
                with open(file_path, "w", encoding='utf-8') as file:
                    file.write(text_area.get("1.0", tk.END))
                messagebox.showinfo("Сохранение", "Файл сохранен")
            except Exception as e:
                messagebox.showerror("Ошибка", e)
    def close_window(event = None):
        window.destroy()

    window = tk.Tk()
    window.title("Текстовый редактор")
    window.geometry("400x500")

    text_area = tk.Text(window)
    text_area.pack()

    save_button = tk.Button(window, text="Сохранить", command=save_file)
    save_button.pack()

    window.bind("<Control-s>", lambda event: save_file())
    window.bind("<Escape>", lambda event: close_window())

    window.mainloop()

def input_fields():
    def on_left_click(event):
        widget_name = event.widget.winfo_class()
        if widget_name == "Entry":
            active_field_label.config(text=f"Активное поле: {event.widget.winfo_name()}")
        else:
            active_field_label.config(text=f"Нажмите на поле ввода")

    def on_right_click(event):
        widget_name = event.widget.winfo_class()
        if widget_name == "Entry":
            print(f"ПКМ в поле: {event.widget.winfo_name()}")
        else:
            print(f"ПКМ вне поля ввода")

    window = tk.Tk()
    window.title("Поля ввода")
    window.geometry("400x500")

    active_field_label = tk.Label(window, text="Нажмите на поле ввода")
    active_field_label.pack()

    entry1 = tk.Entry(window, name="login")
    entry2 = tk.Entry(window, name="password")
    entry3 = tk.Entry(window, name="email")
    entry1.pack()
    entry2.pack()
    entry3.pack()

    window.bind_class("Entry", "<Button-1>", on_left_click)
    window.bind_class("Entry", "<Button-3>", on_right_click)

    window.mainloop()

def mouse_coordinates():
    def update_coordinates(event):
        x = event.x
        y  = event.y
        coordinates_label.config(text=f"х: {x}; y: {y}")

    window = tk.Tk()
    window.title("Координаты")
    window.geometry("400x500")

    coordinates_label = tk.Label(window, text="")
    coordinates_label.pack()

    window.bind("<Motion>", update_coordinates)
    window.mainloop()

def key_press():
    def key_pressed(event):
        char = event.char
        if char:
            pressed_keys_text.set(pressed_keys_text.get() + char)

    window = tk.Tk()
    window.title("Нажатые клавиши")
    window.geometry("400x500")
    pressed_keys_text = tk.StringVar(value="")

    pressed_key_label = tk.Label(window, textvariable=pressed_keys_text)
    pressed_key_label.pack()

    window.bind("<Key>", key_pressed)
    window.mainloop()

save_text()