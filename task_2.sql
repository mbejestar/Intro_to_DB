
USE alx_book_store;  

CREATE TABLE IF NOT EXISTS authors (  
    author_id INT AUTO_INCREMENT PRIMARY KEY,  
    first_name VARCHAR(100) NOT NULL,  
    last_name VARCHAR(100) NOT NULL,  
    birth_date DATE,  
    nationality VARCHAR(50)  
);  

CREATE TABLE IF NOT EXISTS books (  
    book_id INT AUTO_INCREMENT PRIMARY KEY,  
    title VARCHAR(255) NOT NULL,  
    author_id INT,  
    genre VARCHAR(100),  
    publication_year YEAR,  
    price DECIMAL(10, 2) NOT NULL,  
    FOREIGN KEY (author_id) REFERENCES authors(author_id)  
);  

CREATE TABLE IF NOT EXISTS customers (  
    customer_id INT AUTO_INCREMENT PRIMARY KEY,  
    first_name VARCHAR(100) NOT NULL,  
    last_name VARCHAR(100) NOT NULL,  
    email VARCHAR(150) NOT NULL UNIQUE,  
    phone VARCHAR(15),  
    address VARCHAR(255)  
);  

CREATE TABLE IF NOT EXISTS orders (  
    order_id INT AUTO_INCREMENT PRIMARY KEY,  
    customer_id INT,  
    order_date DATETIME NOT NULL,  
    status VARCHAR(50) NOT NULL,  
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)  
);  

CREATE TABLE IF NOT EXISTS order_details (  
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,  
    order_id INT,  
    book_id INT,  
    quantity INT NOT NULL,  
    price DECIMAL(10, 2) NOT NULL,  
    FOREIGN KEY (order_id) REFERENCES orders(order_id),  
    FOREIGN KEY (book_id) REFERENCES books(book_id)  
);
