import sqlite3
con = sqlite3.connect('./conference-app/conference.db') # Warning: This file is created in the current directory
con.execute("CREATE TABLE tickets (id INT PRIMARY KEY, name CHAR(100) NOT NULL, email VARCHAR(100) NOT NULL, quantity INT NOT NULL, comments TEXT)")
con.commit()