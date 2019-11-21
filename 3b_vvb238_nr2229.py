import numpy as np
import time
import mysql.connector
from mysql.connector import errorcode

datafile = 'emp.txt'

# Function to create a new database
def create_database():
    try:
        mycursor.execute("CREATE DATABASE vvb238_nr229;")
    except mysql.connector.Error as err:
        print("Failed creating database: {}".format(err))
        exit(1)

# Connecting to the MySQL server
cnx = mysql.connector.connect(user='root', password='Fault123$',
                              host='127.0.0.1')
cnx.autocommit = True
mycursor = cnx.cursor()

try:
    mycursor.execute("USE vvb238_nr229;")
except mysql.connector.Error as err:
    print("Database vvb238_nr229 does not exists. So creating it.")
    if err.errno == errorcode.ER_BAD_DB_ERROR:
        create_database()
        cnx.database = "vvb238_nr229"
    else:
        print(err)
        exit(1)

# Reading data from the file
collection = np.genfromtxt(datafile, dtype = None, delimiter = '|', autostrip = True)
# Shuffling the data
np.random.shuffle(collection)

# Creating the table and the indexes on ID and Department
createTable1 = "create table Employee3(ID int, Name varchar(20), Salary int, Manager int, Department varchar(20));"
uniqueIndex = "CREATE UNIQUE INDEX idx_ID ON Employee3 (ID);"
index = "CREATE INDEX idx_Department ON Employee3 (Department);"
mycursor.execute(createTable1)
mycursor.execute(uniqueIndex)
mycursor.execute(index)

# Inserting the shuffled rows into the database one by one
sql = "INSERT INTO Employee3 (ID, Name, Salary, Manager, Department) VALUES (%s, %s, %s, %s, %s)"
start_time = time.time()
for row in collection:
    insert = (int(row['f0']), row['f1'].decode("ascii"), int(row['f2']), int(row['f3']), row['f4'].decode("ascii"))
    mycursor.execute(sql, insert)

# Calculating the total time taken
total_time = time.time() - start_time
answerFile = open("3b_vvb238_nr229_timing.txt", "a")
answerFile.write("The total time taken to execute the commands is : " + str(total_time) + " seconds")
answerFile.close()