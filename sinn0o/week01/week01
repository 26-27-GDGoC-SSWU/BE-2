SELECT mem_id, mem_name, birth_date 
   FROM member 
   ORDER BY birth_date;

SELECT mem_id, mem_name, birth_date 
   FROM member 
   ORDER BY birth_date DESC;
   
SELECT mem_id, mem_name, birth_date, height
   FROM member 
   ORDER BY height DESC
   WHERE height >= 163;
   
SELECT mem_id, mem_name, birth_date, height
   FROM member 
   WHERE height >= 163
   ORDER BY height DESC;
   
SELECT mem_id, mem_name, birth_date, height
   FROM member 
   WHERE height >= 163
   ORDER BY height DESC, birth_date ASC;
   
SELECT *
   FROM member 
   LIMIT 3;
   
SELECT mem_name, birth_date
   FROM member
   ORDER BY birth_date
   LIMIT 3;
   
SELECT mem_name, height
   FROM member
   ORDER BY height DESC
   LIMIT 5,2;
   
SELECT addr FROM member;

SELECT addr FROM member ORDER BY addr;

SELECT DISTINCT addr FROM member;

SELECT mem_id, amount FROM buy ORDER BY mem_id;

SELECT mem_id, SUM(amount) FROM buy GROUP BY mem_id;

SELECT mem_id "회원 아이디", SUM(amount) "총 구매 개수"
   FROM buy GROUP BY mem_id;

SELECT mem_id "회원 아이디", SUM(price*amount) "총 구매 금액"
   FROM buy GROUP BY mem_id;
   
SELECT AVG(amount) "평균 구매 개수" FROM buy;

SELECT mem_id, AVG(amount) "평균 구매 개수" 
	FROM buy
	GROUP BY mem_id;
    
SELECT COUNT(*) FROM member;

SELECT COUNT(phone1) "연락처가 있는 회원" FROM member;

SELECT mem_id "회원 아이디", SUM(price*amount) "총 구매 금액"
   FROM buy 
   GROUP BY mem_id;

SELECT mem_id "회원 아이디", SUM(price*amount) "총 구매 금액"
   FROM buy 
   WHERE SUM(price*amount) > 1000 
   GROUP BY mem_id;

SELECT mem_id "회원 아이디", SUM(price*amount) "총 구매 금액"
   FROM buy 
   GROUP BY mem_id   
   HAVING SUM(price*amount) > 1000 ;

SELECT mem_id "회원 아이디", SUM(price*amount) "총 구매 금액"
   FROM buy 
   GROUP BY mem_id   
   HAVING SUM(price*amount) > 1000
   ORDER BY SUM(price*amount) ASC;


*8강
USE market_db;
CREATE TABLE hongong1 (toy_id INT, toy_name CHAR(4), age INT);
INSERT INTO hongong1 VALUES (1, '우디', 25);

INSERT INTO hongong1(toy_id, toy_name) VALUES (2, '버즈');

INSERT INTO hongong1(toy_name, age, toy_id) VALUES ('제시', 20, 3);

CREATE TABLE hongong2 ( 
   toy_id INT AUTO_INCREMENT PRIMARY KEY, 
   toy_name CHAR(4), 
   age INT);

INSERT INTO hongong2 VALUES (NULL, '보핍', 25);
INSERT INTO hongong2 VALUES (NULL, '슬링키', 22);
INSERT INTO hongong2 VALUES (NULL, '렉스', 21);
SELECT * FROM hongong2;

SELECT LAST_INSERT_ID(); 

ALTER TABLE hongong2 AUTO_INCREMENT=100;
INSERT INTO hongong2 VALUES (NULL, '재남', 35);
SELECT * FROM hongong2;

CREATE TABLE hongong3 ( 
   toy_id INT AUTO_INCREMENT PRIMARY KEY, 
   toy_name CHAR(4), 
   age INT);
ALTER TABLE hongong3 AUTO_INCREMENT=1000;
SET @@auto_increment_increment=3;

INSERT INTO hongong3 VALUES (NULL, '토마스', 20);
INSERT INTO hongong3 VALUES (NULL, '제임스', 23);
INSERT INTO hongong3 VALUES (NULL, '고든', 25);
SELECT * FROM hongong3;

SELECT COUNT(*) FROM world.city;

DESC world.city;

SELECT * FROM world.city LIMIT 5;

CREATE TABLE city_popul (city_name CHAR(35), population INT);

INSERT INTO city_popul
    SELECT Name, Population FROM world.city;
    
USE market_db;
UPDATE city_popul
    SET city_name = '서울'
    WHERE city_name = 'Seoul';
SELECT * FROM city_popul WHERE city_name = '서울';

UPDATE city_popul
    SET city_name = '뉴욕', population = 0
    WHERE city_name = 'New York';
SELECT * FROM city_popul WHERE city_name = '뉴욕';

-- UPDATE city_popul
--    SET city_name = '서울'

UPDATE city_popul
    SET population = population / 10000;
SELECT * FROM city_popul LIMIT 5;

DELETE FROM city_popul 
    WHERE city_name LIKE 'New%';

DELETE FROM city_popul 
    WHERE city_name LIKE 'New%'
    LIMIT 5;

CREATE TABLE big_table1 (SELECT * FROM world.city, sakila.country); 
CREATE TABLE big_table2 (SELECT * FROM world.city, sakila.country); 
CREATE TABLE big_table3 (SELECT * FROM world.city, sakila.country); 
SELECT COUNT(*) FROM big_table1;

DELETE FROM big_table1;
DROP TABLE big_table2;
TRUNCATE TABLE big_table3;

**10강
USE market_db;
SELECT * 
   FROM buy
     INNER JOIN member
     ON buy.mem_id = member.mem_id
   WHERE buy.mem_id = 'JIH';

SELECT * 
   FROM buy
     INNER JOIN member
     ON buy.mem_id = member.mem_id;
     
SELECT mem_id, mem_name, prod_name, addr, CONCAT(phone1, phone2)  '연락처' 
   FROM buy
     INNER JOIN member
     ON buy.mem_id = member.mem_id;

SELECT buy.mem_id, mem_name, prod_name, addr, CONCAT(phone1, phone2) '연락처' 
   FROM buy
     INNER JOIN member
     ON buy.mem_id = member.mem_id;

SELECT B.mem_id, M.mem_name, B.prod_name, M.addr, 
        CONCAT(M.phone1, M.phone2)  '연락처' 
   FROM buy B
     INNER JOIN member M
     ON B.mem_id = M.mem_id;
          
SELECT M.mem_id, M.mem_name, B.prod_name, M.addr
   FROM buy B
     INNER JOIN member M
     ON B.mem_id = M.mem_id
   ORDER BY M.mem_id;

SELECT DISTINCT M.mem_id, M.mem_name, M.addr
   FROM buy B
     INNER JOIN member M
     ON B.mem_id = M.mem_id
   ORDER BY M.mem_id;
   
SELECT M.mem_id, M.mem_name, B.prod_name, M.addr
   FROM member M
     LEFT OUTER JOIN buy B
     ON M.mem_id = B.mem_id
   ORDER BY M.mem_id;

SELECT M.mem_id, M.mem_name, B.prod_name, M.addr
   FROM buy B
     RIGHT OUTER JOIN member M
     ON M.mem_id = B.mem_id
   ORDER BY M.mem_id;
   
SELECT DISTINCT M.mem_id, B.prod_name, M.mem_name, M.addr
   FROM member M
     LEFT OUTER JOIN buy B
     ON M.mem_id = B.mem_id
   WHERE B.prod_name IS NULL
   ORDER BY M.mem_id;

SELECT * 
   FROM buy 
     CROSS JOIN member ;

SELECT COUNT(*) "데이터 개수"
   FROM sakila.inventory
      CROSS JOIN world.city;

CREATE TABLE cross_table
    SELECT *
       FROM sakila.actor  
          CROSS JOIN world.country;  

SELECT * FROM cross_table LIMIT 5;

USE market_db;
CREATE TABLE emp_table (emp CHAR(4), manager CHAR(4), phone VARCHAR(8));

INSERT INTO emp_table VALUES('대표', NULL, '0000');
INSERT INTO emp_table VALUES('영업이사', '대표', '1111');
INSERT INTO emp_table VALUES('관리이사', '대표', '2222');
INSERT INTO emp_table VALUES('정보이사', '대표', '3333');
INSERT INTO emp_table VALUES('영업과장', '영업이사', '1111-1');
INSERT INTO emp_table VALUES('경리부장', '관리이사', '2222-1');
INSERT INTO emp_table VALUES('인사부장', '관리이사', '2222-2');
INSERT INTO emp_table VALUES('개발팀장', '정보이사', '3333-1');
INSERT INTO emp_table VALUES('개발주임', '정보이사', '3333-1-1');

SELECT A.emp "직원", B.emp "직속상관", B.phone "직속상관연락처"
   FROM emp_table A
      INNER JOIN emp_table B
         ON A.manager = B.emp
   WHERE A.emp = '경리부장';

**12강
CREATE DATABASE naver_db;

CREATE TABLE sample_table (num INT);

DROP DATABASE IF EXISTS naver_db;
CREATE DATABASE naver_db;

USE naver_db;
DROP TABLE IF EXISTS member;  
CREATE TABLE member 
( mem_id        CHAR(8),
  mem_name      VARCHAR(10),
  mem_weight    TINYINT, 
  addr          CHAR(2), 
  phone1        CHAR(3), 
  phone2        CHAR(8), 
  height        TINYINT UNSIGNED, 
  birth_date    DATE  
);

DROP TABLE IF EXISTS member;  
CREATE TABLE member 
( mem_id        CHAR(8) NOT NULL,
  mem_name      VARCHAR(10) NOT NULL, 
  mem_weight    TINYINT NOT NULL, 
  addr          CHAR(2) NOT NULL,
  phone1        CHAR(3) NULL,
  phone2        CHAR(8) NULL,
  height        TINYINT UNSIGNED NULL, 
  birth_date    DATE NULL
);

DROP TABLE IF EXISTS member;  
CREATE TABLE member 
( mem_id        CHAR(8) NOT NULL PRIMARY KEY,
  mem_name      VARCHAR(10) NOT NULL, 
  mem_weight    TINYINT NOT NULL, 
  addr          CHAR(2) NOT NULL,
  phone1        CHAR(3) NULL,
  phone2        CHAR(8) NULL,
  height        TINYINT UNSIGNED NULL, 
  birth_date    DATE NULL
);

DROP TABLE IF EXISTS buy;  
CREATE TABLE buy 
(  num          INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
   mem_id       CHAR(8) NOT NULL,
   prod_name    CHAR(10) NOT NULL, 
   group_name   CHAR(4) NULL , 
   price        INT UNSIGNED NOT NULL,
   amount       SMALLINT UNSIGNED NOT NULL
);

DROP TABLE IF EXISTS buy;
CREATE TABLE buy 
(  num          INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
   mem_id       CHAR(8) NOT NULL, 
   prod_name    CHAR(10) NOT NULL, 
   group_name   CHAR(4) NULL ,
   price        INT UNSIGNED NOT NULL,
   amount       SMALLINT UNSIGNED NOT NULL,
   FOREIGN KEY(mem_id) REFERENCES member(mem_id)
);

INSERT INTO member VALUES('NAY', '나연', 47, '서울', '02',  '11111111', 163, '1995-09-22');
INSERT INTO member VALUES('MOM', '모모', 46, '경남', '055', '22222222',164, '1996-11-09');
INSERT INTO member VALUES('JUN', '정연', 49,  '경기', '031', '33333333', 168, '1996-11-01');

INSERT INTO buy VALUES(NULL, 'MOM', '지갑', NULL, 30, 2);
INSERT INTO buy VALUES(NULL, 'MOM', '맥북프로', '디지털', 1000, 1);
INSERT INTO buy VALUES(NULL, 'CHA', '아이폰', '디지털', 200, 1);

**14강
USE market_db;
SELECT mem_id, mem_name, addr FROM member;

USE market_db;
DROP VIEW IF EXISTS v_member;
CREATE VIEW v_member
AS
    SELECT mem_id, mem_name, addr FROM member;

SELECT * FROM v_member;

SELECT mem_name, addr FROM v_member
   WHERE addr IN ('서울', '경기');

SELECT B.mem_id, M.mem_name, B.prod_name, M.addr, 
        CONCAT(M.phone1, M.phone2) AS '연락처' 
   FROM buy B
     INNER JOIN member M
     ON B.mem_id = M.mem_id;

DROP VIEW IF EXISTS v_memberbuy;
CREATE VIEW v_memberbuy
AS
    SELECT B.mem_id, M.mem_name, B.prod_name, M.addr, 
            CONCAT(M.phone1, M.phone2) AS '연락처' 
       FROM buy B
         INNER JOIN member M
         ON B.mem_id = M.mem_id;

SELECT * FROM v_memberbuy WHERE mem_name = '모모';

USE market_db;
DROP VIEW IF EXISTS v_viewtest1;
CREATE VIEW v_viewtest1
AS
    SELECT B.mem_id 'Member ID', M.mem_name AS 'Member Name', 
            B.prod_name "Product Name", 
            CONCAT(M.phone1, M.phone2) AS "Office Phone" 
       FROM buy B
         INNER JOIN member M
         ON B.mem_id = M.mem_id;
         
SELECT DISTINCT `Member ID`, `Member Name` FROM v_viewtest1;

ALTER VIEW v_viewtest1
AS
    SELECT B.mem_id '회원 아이디', M.mem_name AS '회원 이름', 
            B.prod_name "제품 이름", 
            CONCAT(M.phone1, M.phone2) AS "연락처" 
       FROM buy B
         INNER JOIN member M
         ON B.mem_id = M.mem_id;
         
SELECT DISTINCT `회원 아이디`, `회원 이름` FROM v_viewtest1;

DROP VIEW v_viewtest1;

USE market_db;
CREATE OR REPLACE VIEW v_viewtest2
AS
    SELECT mem_id, mem_name, addr FROM member;

DESCRIBE v_viewtest2;

DESCRIBE member;

SHOW CREATE VIEW v_viewtest2;

UPDATE v_member SET addr = '부산' WHERE mem_id='MOM';

INSERT INTO v_member(mem_id, mem_name, addr) VALUES('BTS','방탄소년단','경기');

DROP VIEW IF EXISTS v_height167;
CREATE VIEW v_height167
AS
    SELECT * FROM member WHERE height >= 167 ;
    
SELECT * FROM v_height167 ;

DELETE FROM v_height167 WHERE height < 167;

INSERT INTO v_height167 VALUES('IU','아이유', 46, '서울', NULL, NULL, 162.2, '1993-5-16');

SELECT * FROM v_height167;

ALTER VIEW v_height167
AS
    SELECT * FROM member WHERE height >= 167
        WITH CHECK OPTION ;
        
INSERT INTO v_height167 VALUES('DOG','리트리버', 40, '영국', NULL, NULL, 90, '2025-1-1');

DROP VIEW IF EXISTS v_complex;
CREATE VIEW v_complex
AS
    SELECT B.mem_id, M.mem_name, B.prod_name, M.addr
        FROM buy B
            INNER JOIN member M
            ON B.mem_id = M.mem_id;

DROP TABLE IF EXISTS buy, member;

SELECT * FROM v_height167;

CHECK TABLE v_height167;