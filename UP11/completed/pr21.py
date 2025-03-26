import mysql.connector

try:
    conn = mysql.connector.connect(
        host = "localhost",
        user = "root",
        passwd = "root",
        db = "mydb"
        )

    cursor = conn.cursor()
    try:
        cursor.execute("UPDATE book SET price = price + 100")
        conn.commit()
        print("Цена изменена")
        cursor.execute("SELECT * FROM book")
        result = cursor.fetchall()
        if result:
            for row in result:
                print(row)
        else:
            print("нет книг")
    except mysql.connector.Error as error:
        print("ошибка", error)
    finally:
        if cursor:
            cursor.close();
            print("курсор закрыт")
except mysql.connector.Error as error:
    print("ошибка подключения: ", error)
finally:
    if conn.is_connected() and 'conn' in locals():
        conn.close()
        print("Соединение с бд закрыто")
