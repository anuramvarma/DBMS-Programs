CREATE TABLE Sailors(sid number(2) primary key,sname varchar(10),rating number(2),age number(5,2));
CREATE TABLE Reserves(sid number(2), bid number(3), Day date, PRIMARY KEY(sid,bid));
CREATE TABLE Boats(bid number(3) primary key,bname varchar(10),colour varchar(6));

INSERT INTO Sailors VALUES(22,'Dustin',7,45.0);
INSERT INTO Sailors VALUES(29,'Brutus',1,33.0);
INSERT INTO Sailors VALUES(31,'Lubber',8,55.5);
INSERT INTO Sailors VALUES(32,'Andy',8,25.5);
INSERT INTO Sailors VALUES(58,'Rusty',10,35.0);
INSERT INTO Sailors VALUES(64,'Horatio',7,35.0);
INSERT INTO Sailors VALUES(71,'Zorba',10,16.0);
INSERT INTO Sailors VALUES(74,'Horatio',9,35.5);
INSERT INTO Sailors VALUES(85,'Art',3,25.5);
INSERT INTO Sailors VALUES(95,'Bob',3,63.5);

INSERT INTO Boats VALUES(101,'Interlake','Blue');
INSERT INTO Boats VALUES(102,'Interlake','Red');
INSERT INTO Boats VALUES(103,'Clipper','Green');
INSERT INTO Boats VALUES(104,'Marine','Red');

INSERT INTO Reserves VALUES(22,101,to_date('10-10-1998','dd-mm-yyyy'));
INSERT INTO Reserves VALUES(22,102,to_date('10-10-1998','dd-mm-yyyy'));
INSERT INTO Reserves VALUES(22,103,to_date('10-08-1998','dd-mm-yyyy'));
INSERT INTO Reserves VALUES(22,104,to_date('10-07-1998','dd-mm-yyyy'));
INSERT INTO Reserves VALUES(31,102,to_date('11-10-1998','dd-mm-yyyy'));
INSERT INTO Reserves VALUES(31,103,to_date('11-06-1981','dd-mm-yyyy'));
INSERT INTO Reserves VALUES(31,104,to_date('17-12-1998','dd-mm-yyyy'));
INSERT INTO Reserves VALUES(64,101,to_date('09-05-1998','dd-mm-yyyy'));
INSERT INTO Reserves VALUES(64,102,to_date('09-05-1998','dd-mm-yyyy'));
INSERT INTO Reserves VALUES(74,103,to_date('09-08-1998','dd-mm-yyyy'));

SELECT *from Sailors;

SELECT *from Boats;

SELECT *from Reserves;
