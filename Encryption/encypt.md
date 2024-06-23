USE db1;

CREATE TABLE Users (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) NOT NULL UNIQUE,
    password_hash varbinary(255) NOT NULL
);

SET @encryption_key = 'c7n2%6';

INSERT INTO Users (email,password_hash)
VALUES
(
'aman.ulla@gmail.com',aes_encrypt('aman@2024',@encryption_key)
);

Select * from Users;

Select email , aes_decrypt(password_hash,@encryption_key) as decrypted_key
FROM Users;