SELECT * FROM board;

SELECT * FROM ROLE;

SELECT * FROM room;

select * from member;

SELECT * FROM subscription;

SELECT * FROM member;

SELECT * FROM comment;

update member set password='' where username='phy';

select * from quiz;

ALTER TABLE quiz
DROP COLUMN qz_idx;

ALTER TABLE quiz
DROP COLUMN qz_answer;

ALTER TABLE quiz
DROP COLUMN qz_language;

ALTER TABLE quiz
DROP COLUMN qz_sentence;

ALTER TABLE quiz
DROP COLUMN qz_translate;

delete from member;

drop table member;

drop table board;

drop table comment;

drop table subscription;

delete from board;

delete from member where username = 'phy'

INSERT INTO BOARD (BD_CATEGORY, BD_TITLE, BD_CONTENT, BD_WRITER)
			VALUES('notice','무료기간은 7일입니다.','안녕하세요. 저희 서비스의 무료기간은 7일입니다. 감사합니다.', '관리자');

SELECT * FROM BOARD WHERE BD_CATEGORY = 'notice';

INSERT INTO MEMBER(MB_USERNAME, MB_ADDR, MB_AGE, MB_EMAIL, MB_GENDER, MB_NICK, MB_PASSWORD, MB_PHONE, MB_ROLE)
VALUES('ADMIN','서울특별시 강남구 역상동 727-9', 28, 'admin@admin.kr', 'M', '관리자', '1234', '010-1234-1234', 'ADMIN');

DELETE FROM member WHERE mb_username = 'lyj';

INSERT INTO quiz(qz_idx,qz_language, qz_sentence, qz_trangelate, qz_answer)
VALUES(5, 'ENG', 'Nice to ____ you', '만나서 반가워', 'meet');

INSERT INTO quiz(qz_idx,qz_language, qz_sentence, qz_trangelate, qz_answer)
VALUES(4, 'ENG', 'you are ____ to everyone', '당신은 누구에게나 친절해요', 'kind');

INSERT INTO quiz(qz_idx,qz_language, qz_sentence, qz_trangelate, qz_answer)
VALUES(3, 'ENG', 'What ____ I eat for lunch today?', '오늘 점심은 뭘 먹어야 할까요?', 'should');

INSERT INTO quiz(qz_idx,qz_language, qz_sentence, qz_trangelate, qz_answer)
VALUES(2,'ENG', 'What are you ____ here?', '여기서 뭐하니?', 'doing');

INSERT INTO quiz(qz_idx,qz_language, qz_sentence, qz_trangelate, qz_answer)
VALUES(1, 'ENG', 'What sports do you ____?', '어떤 운동을 좋아하니?', 'like');

SELECT * FROM quiz;
DROP TABLE quiz;