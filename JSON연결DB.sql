create table albums(
	userId INT,
    id int PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);


INSERT INTO albums(userId, title)
VALUES (1,"배고파");



select * from albums;

delete from albums;

drop table albums;