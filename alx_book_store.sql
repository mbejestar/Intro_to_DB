CREATE DATABASE IF NOT EXISTS alx_book_store;  

USE alx_book_store;  

CREATE TABLE IF NOT EXISTS Authors (  
    author_id INT NOT NULL AUTO_INCREMENT,  
    author_name VARCHAR(215) NOT NULL,  
    PRIMARY KEY (author_id)  
);  

CREATE TABLE IF NOT EXISTS Books (  
    book_id INT NOT NULL AUTO_INCREMENT,  
    title VARCHAR(130) NOT NULL,  
    author_id INT,  
    price DOUBLE NOT NULL,  
    publication_date DATE,  
    PRIMARY KEY (book_id),  
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE SET NULL  
);  

CREATE TABLE IF NOT EXISTS Customers (  
    customer_id INT NOT NULL AUTO_INCREMENT,  
    customer_name VARCHAR(215) NOT NULL,  
    email VARCHAR(215) NOT NULL,  
    address TEXT,  
    PRIMARY KEY (customer_id)  
);  

CREATE TABLE IF NOT EXISTS Orders (  
    order_id INT NOT NULL AUTO_INCREMENT,  
    customer_id INT,  
    order_date DATE NOT NULL,  
    PRIMARY KEY (order_id),  
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE SET NULL  
);  

CREATE TABLE IF NOT EXISTS Order_Details (  
    orderdetailid INT NOT NULL AUTO_INCREMENT,  
    order_id INT,  
    book_id INT,  
    quantity DOUBLE NOT NULL,  
    PRIMARY KEY (orderdetailid),  
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,  
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE  
);
