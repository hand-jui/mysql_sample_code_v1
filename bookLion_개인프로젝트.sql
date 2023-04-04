CREATE DATABASE BookLion;
use BookLion;

CREATE TABLE user(
	no INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    id VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
	phone VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL
);
drop table user;

SELECT * FROM user;

INSERT INTO user(name, id, password, phone, email)
VALUE("손주이", "jui", "8282", "01068123812", "jui@hand.com");

UPDATE user SET password = '9586', phone='01068123812',email='hand@gmail.com' WHERE id = 'jui' AND password = '8282';

DELETE FROM user WHERE id = '' AND password = '';

CREATE TABLE category (
	c_id INT PRIMARY KEY AUTO_INCREMENT,
    c_name VARCHAR(10) NOT NULL
);

INSERT INTO category(c_name)
VALUES("자기계발"),
		("소설"),
        ("new"),
        ("에세이");

SELECT * FROM category;

drop table booklist;
CREATE TABLE booklist(
	id INT PRIMARY KEY AUTO_INCREMENT,
    category INT NOT NULL,
    img VARCHAR(20) NOT NULL,
    title VARCHAR(50) NOT NULL,
    author VARCHAR(50) NOT NULL,
    publisher VARCHAR(20) NOT NULL,
    pubdate DATE NOT NULL,
    price INT NOT NULL,
    sale INT NOT NULL,
    quantity INT NOT NULL,
	FOREIGN KEY(category) REFERENCES category(c_id)
);
SELECT * FROM booklist;

INSERT INTO booklist(category, img, title, author, publisher, pubdate, price, sale, quantity)
VALUES (1, "self/sd1" ,"세이노의 가르침", "세이노", "데이원", 20230302, 6480, 0,20),
		(1, "self/sd2" ,"심리학이 제갈량에게 말하다 2", "천위안", "리드리드출판", 20230410, 6480, 0,20),
		(1, "self/sd3" ,"김미경의 마흔수업", "김미경", "어웨이크북스", 20230215, 16200, 0,20),
		(1, "self/sd4" ,"나 자신에게 ‘좋아요’를 눌러주세요", "쓰지 슈이치", "밀리언서재", 20230315, 15120, 0,20),
		(1, "self/sd5" ,"1퍼센트 부자의 법칙", "사이토 히토리", "나비스쿨", 20230130, 15300, 0,20),
		(1, "self/sd6" ,"원씽(The One Thing)(리커버 특별판)", "게리 켈러 외", "비즈니스북스", 20130830, 12600, 0,20),
		(1, "self/sd7" ,"거인의 노트", "김익한", "다산북스", 20230308, 16200, 0,20),
		(1, "self/sd8" ,"세상 끝의 카페", "존 스트레레키", "클레이하우스", 20230224, 14850, 0,20),
		(1, "self/sd9" ,"한밤중의 심리학 수업", "황양밍", "미디어숲", 20230410, 15570, 0,20);
        
INSERT INTO booklist(category, img, title, author, publisher, pubdate, price, sale, quantity)
VALUES (2, "novel/nv1" ,"불편한 편의점(40만부 기념 벚꽃 에디션)", "김호연", "나무옆의자", 20210420, 12600, 0,20),
		(2, "novel/nv2" ,"메리골드 마음 세탁소", "윤정은", "북로망스", 20230306, 13599, 0,20),
		(2, "novel/nv3" ,"불편한 편의점 2(단풍 에디션)", "김호연", "나무옆의자", 20220810, 12600, 0,20),
		(2, "novel/nv4" ,"구의 증명", "최진영", "은행나무", 20150330, 7200, 0,20),
		(2, "novel/nv5" ,"아버지의 해방일지", "정지아", "창비", 20220902, 13500, 0,20),
		(2, "novel/nv6" ,"스즈메의 문단속 스페셜 에디션", "신카이 마코토", "대원씨아이", 20230113, 38700, 0,20),
		(2, "novel/nv7" ,"견딜 수 없는 사랑", "이언 매큐언", "복복서가", 20230316, 15120, 0,20),
		(2, "novel/nv8" ,"세상의 마지막 기차역(리커버 에디션)", "무라세 다케시", "모모", 20220509, 12600, 0,20),
		(2, "novel/nv9" ,"오늘 밤, 세계에서 이 사랑이 사라진다 해도", "이치조 미사키", "모모", 20210628, 12600, 0,20);
        
INSERT INTO booklist(category, img, title, author, publisher, pubdate, price, sale, quantity)
VALUES (3, "new/n1" ,"경우 없는 세계", "백온유", "창비", 20230330, 13500, 0,20),
		(3, "new/n2" ,"맛있게, 저염식", "윤세경", "아퍼블리싱", 20230410, 18000, 0,20),
		(3, "new/n3" ,"벌거벗은 한국사: 권력편", "tvN STORY 〈벌거벗은 한국사〉 제작팀", "프런트페이지", 20230328, 17820, 0,20),
		(3, "new/n4" ,"감람 일러스트집 ROMANCE(로맨스)", "감람", "테라코타", 20230328, 29700, 0,20),
		(3, "new/n5" ,"우울한 마음도 습관입니다", "박상미", "저녁달", 20230330, 16920, 0,20),
		(3, "new/n6" ,"꼬리와 파도", "강석희", "창비교욱", 20230327, 13050, 0,20),
		(3, "new/n7" ,"마트에 간 햄스터", "신형경", "킨더랜드", 20230302, 13500, 0,20),
		(3, "new/n8" ,"오늘은 이렇게 보냈습니다", "무레 요코", "리스컴", 20230320, 15120, 0,20),
		(3, "new/n9" ,"소아라와 마물의 집 1", "Hidenori Yamaji", "서울미디어코믹스(서울문화사)", 20230324, 5400, 0,20);
        
INSERT INTO booklist(category, img, title, author, publisher, pubdate, price, sale, quantity)
VALUES (4, "essay/e1" ,"물고기는 존재하지 않는다", "룰루 밀러", "곰출판", 20211217, 15300, 0,20),
		(4, "essay/e2" ,"모든 것은 기본에서 시작한다", "손웅정", "수오서재", 20211015, 14400, 0,20),
		(4, "essay/e3" ,"생에 감사해", "김혜자", "수오서재", 20221222, 15300, 0,20),
		(4, "essay/e4" ,"빅터 프랭클의 죽음의 수용소에서", "빅터 프랭클", "청아출판사", 20200530, 11700, 0,20),
		(4, "essay/e5" ,"쉽게 읽는 백범일지", "김구", "돌베개", 20051123, 8550, 0,20),
		(4, "essay/e6" ,"품위있게 나이 든다는 것", "김옥림", "미래북(Mirae Book)", 20230410, 16020, 0,20),
		(4, "essay/e7" ,"기분이 태도가 되지 말자", "김수현", "하이스트", 20221125, 14400, 0,20),
		(4, "essay/e8" ,"상실의 기쁨", "프랭크 브루니", "웅진지식하우스", 20230317, 16200, 0,20),
		(4, "essay/e9" ,"꽤 괜찮은 해피엔딩", "이지선", "문학동네", 20220427, 12600, 0,20);


UPDATE booklist SET sale = '', quantity = '' WHERE title = '';

SELECT * FROM booklist INNER JOIN category ON booklist.category = category.c_id WHERE c_name='novel';

UPDATE category SET c_name = 'essay' WHERE c_id= '4';