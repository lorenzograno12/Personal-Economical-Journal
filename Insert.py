import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="root"
)

print(mydb)

mycursor = mydb.cursor()

from tkinter import *

root = Tk()
var = IntVar()
R1 = Radiobutton(root, text="Expence", variable=var, value=1)
R1.pack( anchor = W )
R2 = Radiobutton(root, text="Income", variable=var, value=2)
R2.pack( anchor = W )
label = Label(root)
top = Tk()
L1 = Label(top, text="Movement Description")
L1.pack( side = LEFT)
E1 = Entry(top, bd =5)
E1.pack(side = RIGHT)
label.pack()
root.mainloop()

if R1==True:
    insert_stmt = (
    "INSERT INTO expence(FIRST_NAME, LAST_NAME, AGE, SEX, INCOME)"
    "VALUES (%s, %s, %s, %s, %s)"
    )
    data = ('Ramya', 'Ramapriya', 25, 'F', 5000)
    print("Expence inserted correctly")
else:
    insert_stmt = (
    "INSERT INTO income(FIRST_NAME, LAST_NAME, AGE, SEX, INCOME)"
    "VALUES (%s, %s, %s, %s, %s)"
    )
    data = ('Ramya', 'Ramapriya', 25, 'F', 5000)
    print("income inserted correctly")