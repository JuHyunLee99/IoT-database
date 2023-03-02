USE sqldb;

SET @myVAR1 = 5;
SELECT @myVar1;
SET @myVar2 = '이름 ==>';

SELECT @myVar2, name
  FROM usertbl
 WHERE height > 170;

SELECT name, height + @myVar1
  FROM usertbl;

-- 형변환
SELECT birthYear FROM usertbl;
SELECT CAST(birthYear AS CHAR) FROM usertbl;
SELECT CONVERT(birthYear, CHAR) FROM usertbl;

SELECT addr FROM usertbl;
SELECT CAST(addr AS DECIMAL) FROM usertbl;
SELECT CONVERT(addr, DECIMAL) FROM usertbl;

SELECT CAST('1000' AS DECIMAL);


-- 암시적 형변환
SELECT 200 + 300;

-- 문자열 합치기
select CONCAT('Hello', 'World');

-- MySQL 이외에서는 '200300'
SELECT '200' + '300'; 

/* 내장함수 리스트 */
-- 흐름함수
-- 100>200 ? '참':'거짓'
SELECT IF(100>200, '참', '거짓');

-- NULL은 계산이 오류(결과도 NULL)
SELECT IFNULL(NULL,0) + 100;

-- NULLIF는 많이 사용안됨
-- 같이 같으면 NULL
SELECT NULLIF(100,100);

-- 쿼리 작성할 대 만이 사용
SELECT name
     , birthYear
     , addr
     , case addr
       WHEN '서울' THEN '수도권'
       WHEN '경기' THEN '수도권'
       WHEN '부산' THEN '광역권'
       WHEN '한양' THEN ' 조선권'
       ELSE '지역권' END AS ' 권역'
  FROM usertbl;

-- 문자열함수
SELECT ASCII('A'), CHAR(65), ASCII('a');
   -- 한글은 사용하면 안됨
SELECT ASCII('안'), CHAR(236);
-- CHAR_LENGTH(글자길이), LENGTH(byte)
SELECT CHAR_LENGTH('ABC'), LENGTH('ABC');
--UTF-8 -- 한글 한글자당 3bytes
SELECT CHAR_LENGTH('가나다'), LENGTH('가나다');

SELECT REPLACE('Hello World', 'Hello', 'Byebye');
-- DB는 인덱스 1부터 시작
SELECT INSTR('안녕하세요, 여러분', '여');
-- LEFT, RIGHT
SELECT LEFT('ABCDEFGHIJKLMN', 3), RIGHT('ABCDEFGHIJKLMN', 3);
-- UPPER, LOWER
SELECT UPPER('Hello World'), LOWER('Hello World');

-- LTRIM, RTRIM,TRIM
SELECT LTRIM('     Hello World!      ') AS 'LTRIM'
     , RTRIM('     Hello World!      ') AS 'RTIM'
     , TRIM('     Hello World!      ') AS 'LITIM';

-- 'Hello' * 3
SELECT REPEAT('Hello',3);

-- substring
SELECT SUBSTRING('대한민국만세', 5, 2);

-- 수학함수
SELECT ABS(-10);

SELECT CEILING(4.3), FLOOR(4.9), ROUND(4.4);

SELECT MOD(157, 10);

-- RANDOM 주사위 놀이
SELECT RAND(), FLOOR(1 + (RAND()*6));

-- 날짜 및 시간함수
SELECT NOW();
SELECT ADDDATE('2023-03-02', INTERVAL - 10 DAY);

SELECT YEAR(NOW());
SELECT DATE(NOW());
SELECT TIME(NOW());
-- 1(일)~7(토)
SELECT DAYOFWEEK(NOW()); 
SELECT LAST_DAY('2023-02-01');

-- 시스템 함수
SELECT USER();

SELECT DATABASE();

-- ROW_COUNT()
USE sqldb;
UPDATE buytbl SET price = price * 2;
SELECT ROW_count();

SELECT VERSION();