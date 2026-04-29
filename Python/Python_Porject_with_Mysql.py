import mysql.connector
import os
from flask import Flask, request, jsonify
from dotenv import load_dotenv

app = Flask(__name__)
load_dotenv("db.env")

def get_db_connection(db_name="Rest_API"):
    conn = mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=db_name
    )
    return conn
print ("Connection Done")
#----------------------------------------------------------------------------------------------------

@app.route('/Employees', methods=['POST'])
def create_user():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("Create table Employee(Id int primary key,Name Varchar(100),Age int,Department Varchar(100))")
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({"message": "Employee data created"}), 201
#----------------------------------------------------------------------------------------------------

@app.route('/Employees/insert', methods=['POST'])
def Insert_Employee():
    data = request.get_json()
    Id = data['Id']
    Name = data['Name']
    Age = data['Age']
    Department = data['Department']
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO Employee(Id,Name,Age,Department) VALUES (%s, %s, %s, %s)", (Id,Name,Age,Department))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({"message": "Employee data inserted"}), 201
#----------------------------------------------------------------------------------------------------

@app.route('/Employees', methods=['GET'])
def get_Employee():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Employee")
    Employee = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(Employee)
#----------------------------------------------------------------------------------------------------

conn = get_db_connection()
cursor = conn.cursor(dictionary=True)
cursor.execute("SELECT Name FROM employee;")
rows = cursor.fetchall()

employee_list = [row['Name'] for row in rows]
print("Employee List:", employee_list)
print(100*"-")
cursor.close()
conn.close()
#----------------------------------------------------------------------------------------------------

new_employees = {
    "114": {"Name":"Lee","Age": 30, "Department": "HR"},
    "115": {"Name":"Kavin","Age": 28, "Department": "Finance"},
    "116": {"Name":"Vikram","Age": 35, "Department": "IT"}
}
@app.route('/Employees/insert_dict', methods=['POST'])
def Insert_dict_Employee():
    conn = get_db_connection()
    cursor = conn.cursor()
    for Id, details in new_employees.items():
        cursor.execute(
            "INSERT INTO employee (Id,Name,Age,Department) VALUES (%s,%s,%s,%s)",
            (Id,details["Name"], details["Age"], details["Department"])
    )
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({"message": "Employee data from Dictionary inserted"}), 201
#----------------------------------------------------------------------------------------------------

conn = get_db_connection()
cursor = conn.cursor()
cursor.execute("SELECT * FROM employee;")
Employees = cursor.fetchall()   

for row in Employees:          
    print(row) 
print(100*"-")
cursor.close()

cursor = conn.cursor()
cursor.execute("select Name from employee where Age>=25;")
Above_25 = cursor.fetchall()   

set_rows = [set(row) for row in Above_25]    
print(set_rows)
print(100*"-")
cursor.close()

cursor = conn.cursor()
cursor.execute("select Name from employee where Department LIKE '%Analytics%';")
Department_e = cursor.fetchall()   

list_rows = [list(row) for row in Department_e]  
print(list_rows)
print(100*"-")
cursor.close()

conn.close()
#----------------------------------------------------------------------------------------------------

conn = get_db_connection()
cursor = conn.cursor(dictionary=True)
cursor.execute("SELECT * FROM employee limit 5;")
All_details = cursor.fetchall()

for row in All_details:
    print("Id:", row["Id"])
    print("Name:", row["Name"])
    print("Age:", row["Age"])
    print("Department:", row["Department"])
    print("------")
     
cursor.close()

cursor = conn.cursor(dictionary=True)
cursor.execute("SELECT Id, Name, Age, Department FROM employee;")
Emp_Data=cursor.fetchall()
with open("Employee_details.txt","w") as file:
    file.write("Id,Name,Age,Department\n")
    for row in Emp_Data:    
        line = f"{row['Id']},{row['Name']},{row['Age']},{row['Department']}\n"
        file.write(line)
    
      #  file.write(str(row) + "\n")
print("file employee created")
print(100*"-")

cursor.close()
conn.close()

import pandas as pd

@app.route('/Employees_dict', methods=['GET'])
def get_employee_dict():
    try:
        output = pd.read_csv("Employee_details.txt", sep=",")
        
        result = output.to_dict("records")
        return jsonify(result)

    except Exception as e:
        return jsonify({"error": str(e)}), 500

    finally:
        print("processing Done for Employees_dict request")

if __name__ == '__main__':
    app.run(debug=True)