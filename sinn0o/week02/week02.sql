**16강
USE market_db;
SELECT * FROM member;

SHOW INDEX FROM member;

SHOW TABLE STATUS LIKE 'member';

CREATE INDEX idx_member_addr 
   ON member (addr);

SHOW INDEX FROM member;

SHOW TABLE STATUS LIKE 'member';

ANALYZE TABLE member;
SHOW TABLE STATUS LIKE 'member';

CREATE UNIQUE INDEX idx_member_mem_weight
    ON member (mem_weight); -- 오류 발생(중복 값 존재)

CREATE UNIQUE INDEX idx_member_mem_name
    ON member (mem_name);

SHOW INDEX FROM member;

INSERT INTO member VALUES('MEE', '미나', 66, '미국', '001', '12341234', 172, '2003-8-4'); -- 오류 발생(중복 이름)

ANALYZE TABLE member;  -- 지금까지 만든 인덱스를 모두 적용
SHOW INDEX FROM member;

SELECT * FROM member;

EXPLAIN FORMAT=TRADITIONAL
   SELECT * FROM member;

SELECT mem_id, mem_name, addr FROM member;

EXPLAIN FORMAT=TRADITIONAL
	SELECT mem_id, mem_name, addr FROM member;

EXPLAIN FORMAT=TRADITIONAL
	SELECT mem_id, mem_name, addr 
		FROM member 
		WHERE mem_name = '쯔위';
        
CREATE INDEX idx_member_mem_weight
    ON member (mem_weight);
ANALYZE TABLE member; -- 인덱스 적용

SELECT mem_name, mem_weight 
    FROM member 
    WHERE mem_weight >= 49; 

EXPLAIN FORMAT=TRADITIONAL
	SELECT mem_name, mem_weight 
		FROM member 
		WHERE mem_weight >= 49;     
    
    
SELECT mem_name, mem_weight 
    FROM member 
    WHERE mem_weight >= 1; 
 
EXPLAIN FORMAT=TRADITIONAL
	SELECT mem_name, mem_weight 
		FROM member 
		WHERE mem_weight >= 1; 
 
SELECT mem_name, mem_weight 
    FROM member 
    WHERE mem_weight*2 >= 98;     

EXPLAIN FORMAT=TRADITIONAL  
	SELECT mem_name, mem_weight 
		FROM member 
		WHERE mem_weight*2 >= 98;    

SELECT mem_name, mem_weight 
	FROM member 
	WHERE mem_weight >= 98/2;   
        
EXPLAIN FORMAT=TRADITIONAL  
	SELECT mem_name, mem_weight 
		FROM member 
		WHERE mem_weight >= 98/2;   
    
SHOW INDEX FROM member;

DROP INDEX idx_member_mem_name ON member;
DROP INDEX idx_member_addr ON member;
DROP INDEX idx_member_mem_weight ON member;

ALTER TABLE member 
    DROP PRIMARY KEY;   -- 오류 발생(외래 키로 참조 중)

SELECT table_name, constraint_name
    FROM information_schema.referential_constraints
    WHERE constraint_schema = 'market_db';

ALTER TABLE buy 
    DROP FOREIGN KEY buy_ibfk_1;
ALTER TABLE member 
    DROP PRIMARY KEY;

    
SELECT mem_id, mem_name, mem_weight, addr 
    FROM member 
    WHERE mem_name = '쯔위';

**18강

USE market_db;

DROP PROCEDURE IF EXISTS user_proc;
DELIMITER $$
CREATE PROCEDURE user_proc()
BEGIN
    SELECT * FROM member; -- 스토어드 프로시저 내용
END $$
DELIMITER ;

CALL user_proc();

DROP PROCEDURE IF EXISTS user_proc1;
DELIMITER $$
CREATE PROCEDURE user_proc1(IN userName VARCHAR(10))
BEGIN
    SELECT * FROM member WHERE mem_name = userName; 
END $$
DELIMITER ;

CALL user_proc1('정연');


DROP PROCEDURE IF EXISTS user_proc2;
DELIMITER $$
CREATE PROCEDURE user_proc2(
    IN userWeight INT, 
    IN userHeight FLOAT
)
BEGIN
    SELECT * FROM member 
        WHERE mem_weight > userWeight AND height > userHeight;
END $$
DELIMITER ;

CALL user_proc2(46, 165);


DROP TABLE IF EXISTS noTable;

DROP PROCEDURE IF EXISTS user_proc3;
DELIMITER $$
CREATE PROCEDURE user_proc3(
    IN txtValue CHAR(10),
    OUT outValue INT
)
BEGIN
    INSERT INTO noTable VALUES(NULL, txtValue);
    SELECT MAX(id) INTO outValue FROM noTable; 
END $$
DELIMITER ;

DESC noTable;

CREATE TABLE noTable(
    id INT AUTO_INCREMENT PRIMARY KEY, 
    txt CHAR(10)
);

CALL user_proc3('테스트1', @myValue);
SELECT CONCAT('입력된 ID 값 ==>', @myValue);


DROP PROCEDURE IF EXISTS ifelse_proc;
DELIMITER $$
CREATE PROCEDURE ifelse_proc(
    IN memName VARCHAR(10)
)
BEGIN
    DECLARE birthYear INT; -- 출생연도
    SELECT YEAR(birth_date) INTO birthYear FROM member
        WHERE mem_name = memName;

    IF (birthYear >= 1997) THEN
        SELECT '동생 가수네요. 화이팅 하세요.' AS '메시지';
    ELSE
        SELECT '언니 가수네요. 그동안 수고했어요.' AS '메시지';
    END IF;
END $$
DELIMITER ;

CALL ifelse_proc('지효');

SELECT YEAR(CURDATE()), MONTH(CURDATE()), DAY(CURDATE());


DROP PROCEDURE IF EXISTS while_proc;
DELIMITER $$
CREATE PROCEDURE while_proc()
BEGIN
    DECLARE hap INT; -- 합계
    DECLARE num INT; -- 1부터 100까지 증가
    SET hap = 0; -- 합계 초기화
    SET num = 1; 
    
    WHILE (num <= 100) DO
        SET hap = hap + num;
        SET num = num + 1; -- 숫자 증가
    END WHILE;
    SELECT hap AS '1~100 합계';
END $$
DELIMITER ;

CALL while_proc();

DROP PROCEDURE IF EXISTS dynamic_proc;
DELIMITER $$
CREATE PROCEDURE dynamic_proc(
    IN tableName VARCHAR(20)
)
BEGIN
    SET @sqlQuery = CONCAT('SELECT * FROM ', tableName);
    PREPARE myQuery FROM @sqlQuery;
    EXECUTE myQuery;
    DEALLOCATE PREPARE myQuery;
END $$
DELIMITER ;

CALL dynamic_proc('member');

**19강
SET GLOBAL log_bin_trust_function_creators = 1;

USE market_db;
DROP FUNCTION IF EXISTS sumFunc;
DELIMITER $$
CREATE FUNCTION sumFunc(number1 INT, number2 INT)
    RETURNS INT
BEGIN
    RETURN number1 + number2;
END $$
DELIMITER ;

SELECT sumFunc(100, 200) AS '합계';


DROP FUNCTION IF EXISTS calcYearFunc;
DELIMITER $$
CREATE FUNCTION calcYearFunc(dYear INT)
    RETURNS INT
BEGIN
    DECLARE runYear INT; -- 경과 연도
    SET runYear = YEAR(CURDATE()) - dYear;
    RETURN runYear;
END $$
DELIMITER ;

SELECT calcYearFunc(1995) AS '경과 햇수';

SELECT calcYearFunc(1995) INTO @birth1995;
SELECT calcYearFunc(1999) INTO @birth1999;
SELECT @birth1995 - @birth1999 AS '1995와 1999 차이';

SELECT mem_id, mem_name, calcYearFunc(YEAR(birth_date)) AS '경과 햇수'
    FROM member; 


SHOW CREATE FUNCTION calcYearFunc;

DROP FUNCTION IF EXISTS calcYearFunc;


USE market_db;
DROP PROCEDURE IF EXISTS cursor_proc;
DELIMITER $$
CREATE PROCEDURE cursor_proc()
BEGIN
    DECLARE memWeight INT; -- 회원의 몸무게
    DECLARE cnt INT DEFAULT 0; -- 읽은 행의 수
    DECLARE totWeight INT DEFAULT 0; -- 몸무게 합계
    DECLARE endOfRow BOOLEAN DEFAULT FALSE; -- 행의 끝 여부(기본 FALSE)

    DECLARE memberCursor CURSOR FOR
        SELECT mem_weight FROM member;

    DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET endOfRow = TRUE;

    OPEN memberCursor;

    cursor_loop: LOOP
        FETCH memberCursor INTO memWeight;

        IF endOfRow THEN
            LEAVE cursor_loop;
        END IF;

        SET cnt = cnt + 1;
        SET totWeight = totWeight + memWeight;
    END LOOP cursor_loop;

    SELECT (totWeight / cnt) AS '회원의 평균 몸무게';

    CLOSE memberCursor;
END $$
DELIMITER ;

CALL cursor_proc();

**20강
USE market_db;

DROP TABLE IF EXISTS trigger_table;
CREATE TABLE trigger_table (id INT, txt VARCHAR(10));

INSERT INTO trigger_table VALUES(1, '다현');
INSERT INTO trigger_table VALUES(2, '쯔위');
INSERT INTO trigger_table VALUES(3, '정연');

DROP TRIGGER IF EXISTS myTrigger;
DELIMITER $$ 
CREATE TRIGGER myTrigger
    AFTER DELETE
    ON trigger_table
    FOR EACH ROW
BEGIN
    SET @msg = '회원이 삭제됨';
END $$ 
DELIMITER ;

SET @msg = '';
INSERT INTO trigger_table VALUES(4, '진영');
SELECT @msg;

UPDATE trigger_table SET txt = '채영' WHERE id = 3;
SELECT @msg;

DELETE FROM trigger_table WHERE id = 4;
SELECT @msg;


DROP TABLE IF EXISTS singer;
CREATE TABLE singer
    SELECT mem_id, mem_name, mem_weight, addr FROM member;

DROP TABLE IF EXISTS backup_singer;
CREATE TABLE backup_singer
( mem_id      CHAR(8) NOT NULL, 
  mem_name    VARCHAR(10) NOT NULL, 
  mem_weight  INT NOT NULL, 
  addr        CHAR(2) NOT NULL,
  modType     CHAR(2), -- 변경된 타입. '수정' 또는 '삭제'
  modDate     DATE, -- 변경된 날짜
  modUser     VARCHAR(30) -- 변경한 사용자
);

DROP TRIGGER IF EXISTS singer_updateTrg;
DELIMITER $$
CREATE TRIGGER singer_updateTrg
    AFTER UPDATE
    ON singer
    FOR EACH ROW 
BEGIN
    INSERT INTO backup_singer VALUES(
        OLD.mem_id, OLD.mem_name, OLD.mem_weight,
        OLD.addr, '수정', CURDATE(), CURRENT_USER()
    );
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS singer_deleteTrg;
DELIMITER $$
CREATE TRIGGER singer_deleteTrg
    AFTER DELETE
    ON singer
    FOR EACH ROW 
BEGIN
    INSERT INTO backup_singer VALUES(
        OLD.mem_id, OLD.mem_name, OLD.mem_weight,
        OLD.addr, '삭제', CURDATE(), CURRENT_USER()
    );
END $$
DELIMITER ;


UPDATE singer SET addr = '영국' WHERE mem_id = 'JEO';
DELETE FROM singer WHERE mem_weight >= 49;

SELECT * FROM backup_singer;

TRUNCATE TABLE singer;

SELECT * FROM backup_singer;