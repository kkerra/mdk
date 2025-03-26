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
        cursor.execute("SELECT 1")
        result = cursor.fetchone()
        print("успешное подключение")
        print("результат запроса: ", result)
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
