import mysql.connector

conn = mysql.connector.connect(
    user='root',
    password='fiona123',
    host='localhost:3306',
    database='database-1'
)

cursor = conn.cursor()

insert_sql = (
    "INSERT INTO KARYAWAN (FIRST_NAME, LAST_NAME, AGE, SEX, INCOME) " "VALUES (%s, %s, %s, %s, %s)"
)
values = ('Fiona','Rachel',22,'F',5000)

try:
    cursor.execute(insert_sql,values)
    conn.commit()

except:
    conn.rollback()

conn.close()