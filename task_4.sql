USE alx_book_store;  

SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE, CHARACTER_MAXIMUM_LENGTH  
FROM INFORMATION_SCHEMA.COLUMNS  
WHERE TABLE_NAME = 'Books' AND TABLE_SCHEMA = 'alx_book_store';
