# Import libraries required for connecting to mysql
import mysql.connector

# Import libraries required for connecting to DB2 or PostgreSql
import psycopg2

# Connect to MySQL
connection = mysql.connector.connect(user='root', password='Y4ZUNNIHH85PPUJacn46X2xS',host='172.21.27.176',database='sales')
# create cursor
cursor = connection.cursor()

# Connect to DB2 or PostgreSql
# connectction details

dsn_hostname = 'localhost'
dsn_user='postgres'        # e.g. "abc12345"
dsn_pwd ='MTczNDItYmVrcnll'      # e.g. "7dBZ3wWt9XN6$o0J"
dsn_port ="5432"                # e.g. "50000" 
dsn_database ="postgres"           # i.e. "BLUDB"


# create connection

conn = psycopg2.connect(
   database=dsn_database, 
   user=dsn_user,
   password=dsn_pwd,
   host=dsn_hostname, 
   port= dsn_port
)

#Crreate a cursor object using cursor() method

cursorpg = conn.cursor()

# Find out the last rowid from DB2 data warehouse or PostgreSql data warehouse
# The function get_last_rowid must return the last rowid of the table sales_data on the IBM DB2 database or PostgreSql.

def get_last_rowid():
    SQL = "SELECT rowid FROM sales_data"

    cursorpg.execute(SQL)

    for row in cursorpg.fetchall():
        row_id = row[-1]

    return row_id


last_row_id = get_last_rowid()
print("Last row id on production datawarehouse = ", last_row_id)

# List out all records in MySQL database with rowid greater than the one on the Data warehouse
# The function get_latest_records must return a list of all records that have a rowid greater than the last_row_id in the sales_data table in the sales database on the MySQL staging data warehouse.

def get_latest_records(rowid):
    
    latest_record = []
    SQL = f"""SELECT * FROM sales_data WHERE rowid > {rowid}"""

    cursor.execute(SQL)
    
    for row in cursor.fetchall():
        latest_record.append(row)

    return latest_record	

new_records = get_latest_records(last_row_id)

print("New rows on staging datawarehouse = ", len(new_records))

# Insert the additional records from MySQL into DB2 or PostgreSql data warehouse.
# The function insert_records must insert all the records passed to it into the sales_data table in IBM DB2 database or PostgreSql.

def insert_records(records):
    for record in records:
        SQL = f"INSERT INTO sales_data(rowid,product_id,customer_id,quantity) values {record}" 
        cursorpg.execute(SQL,record);
        conn.commit()

insert_records(new_records)
print("New rows inserted into production datawarehouse = ", len(new_records))

# disconnect from mysql warehouse
connection.close()

# disconnect from DB2 or PostgreSql data warehouse 
conn.commit()
conn.close()

# End of program