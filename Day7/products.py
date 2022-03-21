# 1
import mysql.connector  # mysql driver
# 2
mydb = mysql.connector.connect(
    host='localhost',
    user='root',
    password='pass',
    database="productdb"

)

""" print(mydb) """
# instance of cursor class
# 3
mycursor = mydb.cursor()
# 4
mycursor.execute("select * from productdb.products")

""" for i in mycursor:
    print(i) """

print(mycursor.fetchall())
