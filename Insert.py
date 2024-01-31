import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="root"
)

print(mydb)

mycursor = mydb.cursor()

import tkinter as tk
from tkinter import messagebox

window = tk.Tk()
window.title("Personal Ecnonomical bullet")
window.resizable(True, True)
window.configure(background="Black")
window.state('zoomed')
window.columnconfigure(20, weight=1)
window.rowconfigure(20, weight=1)


Expence_select = tk.Radiobutton(window, text="Expense", value=1)
Expence_select.grid(column=21, row=0, sticky=tk.W, padx=5, pady=5)
Income_select = tk.Radiobutton(window, text="Income ", value=2)
Income_select.grid(column=21, row=1, sticky=tk.W, padx=5, pady=5)
Movement_description_label = tk.Label(window, text="Movement Description  ")
Movement_description_label.grid(column=0, row=0, sticky=tk.W, padx=5, pady=5)
Movement_description = tk.Entry(window, bd =5)
Movement_description.grid(column=0, row=1, sticky=tk.W, padx=5, pady=5)
Movement_amount_label = tk.Label(window, text="Movement Amount  ")
Movement_amount_label.grid(column=12, row=0, sticky=tk.W, padx=7, pady=5)
Movement_amount = tk.Entry(window, bd =5)
Movement_amount.grid(column=12, row=1, sticky=tk.W, padx=5, pady=5)
Movement_quantity_label = tk.Label(window, text="Quantity  ")
Movement_quantity_label.grid(column=15, row=0, sticky=tk.W, padx=7, pady=5)
Movement_quantity = tk.Entry(window, bd =5)
Movement_quantity.grid(column=15, row=1, sticky=tk.W, padx=5, pady=5)
Movement_date_label = tk.Label(window, text="Date  ")
Movement_date_label.grid(column=18, row=0, sticky=tk.W, padx=7, pady=5)
Movement_date = tk.Entry(window, bd =5)
Movement_date.grid(column=18, row=1, sticky=tk.W, padx=5, pady=5)
def helloCallBack():
   msg=messagebox.showinfo("","Datas correctly inserted")
B_insert = tk.Button(window, text ="Send datas", command = helloCallBack)
B_insert.grid(column=10, row=21, sticky=tk.W, padx=5, pady=5)

window.mainloop()

mycursor = mydb.cursor()

if Expence_select==True:
    sql = "INSERT INTO expence(Desciption, Date, Amount, Quantity) VALUES (Movement_description, Movement_date, Movement_amount, Movement_quantity)"
    val = (Movement_description, Movement_date, type(int(Movement_amount)), type(int(Movement_quantity)))
    mycursor.execute(sql, val)
    print("Expence inserted correctly")
else:
    sql = "INSERT INTO expence(Desciption, Date, Amount, Quantity) VALUES (Movement_description, Movement_date, Movement_amount, Movement_quantity)"
    val = (Movement_description, Movement_date, type(int(Movement_amount)), type(int(Movement_quantity)))
    mycursor.execute(sql, val)
    print("income inserted correctly")

mydb.commit()