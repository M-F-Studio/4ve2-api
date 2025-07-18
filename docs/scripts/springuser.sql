USE [4ve2];
GO
CREATE USER springuser FOR LOGIN springuser;
EXEC sp_addrolemember 'db_owner', 'springuser';

SELECT name FROM sys.databases WHERE name = '4ve2';

SELECT name FROM sys.sql_logins WHERE name = 'springuser';