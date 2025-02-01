import mysql.connector  
from mysql.connector import errorcode  

def create_database():  
    try:  
        # Connect to MySQL server  
        connection = mysql.connector.connect(  
            host='localhost', # Change if needed  
            user='your_username', # Change to your MySQL username  
            password='your_password' # Change to your MySQL password  
        )  
        
        cursor = connection.cursor()  
        
        # Create database  
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")  
        print("Database 'alx_book_store' created successfully!")  
        
        # Execute SQL script to create tables  
        with open('alx_book_store.sql', 'r') as file:  
            sql_script = file.read()  
            cursor.execute(sql_script, multi=True)  
        
        print("Tables created successfully!")  
    except mysql.connector.Error as err:  
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:  
            print("Something is wrong with your user name or password")  
        elif err.errno == errorcode.ER_BAD_DB_ERROR:  
            print("Database does not exist")  
        else:  
            print(err)  
    finally:  
        # Close database connection  
        cursor.close()  
        connection.close()  

if __name__ == "__main__":  
    create_database()
