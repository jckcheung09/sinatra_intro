DROP TABLE IF EXISTS card;

CREATE TABLE card (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body TEXT

);

INSERT INTO card (title , body) VALUES ('Card 1' , 'Body text 1');
INSERT INTO card (title , body) VALUES ('Card 2' , 'Body text 2');
INSERT INTO card (title , body) VALUES ('Card 3' , 'Body text 3');
INSERT INTO card (title , body) VALUES ('Card 4' , 'Body text 4');
-- reseeding psql -d blog -f seed2.sql
