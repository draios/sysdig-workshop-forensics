USE employees;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_name varchar(100) NOT NULL,
  password varchar(100) NOT NULL,
  supersecret varchar(100) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO users
    (user_name, password, supersecret)
VALUES 
    ("bob","foobar", "this is supersecret information"),
    ("alice","foobar", "this is supersecret information"),
    ("john","foobar", "this is supersecret information");
