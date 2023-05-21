/*Ashley Morgan
07 Feb 2023
SDEV 350 6380
Professor Haseltine*/

/*Create Profile and select all from it*/
CREATE PROFILE PAshleyMorgan LIMIT
    FAILED_LOGIN_ATTEMPTS 4
    PASSWORD_LIFE_TIME 120
    PASSWORD_REUSE_TIME UNLIMITED
    PASSWORD_REUSE_MAX UNLIMITED
    PASSWORD_GRACE_TIME 7
    PASSWORD_VERIFY_FUNCTION ORA12C_VERIFY_FUNCTION
    PASSWORD_LOCK_TIME 1/24;

SELECT * FROM DBA_PROFILES where PROFILE = 'PAshleyMorgan';

/*Create users*/
CREATE USER U1AshleyMorgan
    IDENTIFIED BY "T3mP0r@ry!"
    DEFAULT TABLESPACE Users
    QUOTA 30M ON Users
    TEMPORARY TABLESPACE temp
    PROFILE PAshleyMorgan;
    PASSWORD EXPIRE;
    
CREATE USER U2AshleyMorgan
    IDENTIFIED BY "T3mP0r@ry!"
    DEFAULT TABLESPACE Users
    QUOTA 30M ON Users
    TEMPORARY TABLESPACE temp
    PROFILE PAshleyMorgan;
    PASSWORD EXPIRE;
    
/*Create role and grant to role*/
CREATE ROLE R1AshleyMorgan;
GRANT CREATE TABLE TO R1AshleyMorgan;
GRANT CONNECT TO R1AshleyMorgan;
GRANT CREATE SESSION TO R1AshleyMorgan;

/*Grant role to users*/
GRANT R1AshleyMorgan TO U1AshleyMorgan;
GRANT R1AshleyMorgan TO U2AshleyMorgan;

/*Create tables*/
CREATE TABLE User1Data(
    FirstName VARCHAR2(30) NOT NULL PRIMARY KEY,
    MiddleName VARCHAR2(30),
    LastName VARCHAR2(30),
    FavoriteColor VARCHAR(30)
);

CREATE TABLE User2Data(
    BookTitle VARCHAR(50) NOT NULL PRIMARY KEY,
    Author VARCHAR(30),
    PageCount NUMBER,
    ReleaseYear NUMBER
);

/*Insert values into tables*/
INSERT INTO User1Data VALUES ('Sally', 'May', 'Smith', 'Red');
INSERT INTO User1Data VALUES ('John', 'David', 'Snow', 'White');
INSERT INTO User1Data VALUES ('Joe', 'John', 'Doe', 'Brown');
INSERT INTO User2Data VALUES ('Book 1', 'Author One', '123', '2021');
INSERT INTO User2Data VALUES ('Book 2', 'Author Two', '234', '2022');
INSERT INTO User2Data VALUES ('Book 3', 'Author Three', '345', '2023');

/*Grant tables to the user*/
GRANT SELECT ON User1Data TO U1AshleyMorgan;
GRANT INSERT ON User1Data TO U1AshleyMorgan;
GRANT SELECT ON User1Data TO U2AshleyMorgan;
GRANT SELECT ON User2Data TO U2AshleyMorgan;

    

    