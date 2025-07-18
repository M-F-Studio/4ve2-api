IF NOT EXISTS (
    SELECT name FROM sys.databases WHERE name = N'4ve2'
)
BEGIN
    CREATE DATABASE [4ve2];
END
GO

-- Usar la base de datos recién creada
USE [4ve2];
GO

CREATE TABLE [card] (
  [id_card] integer PRIMARY KEY,
  [number] integer,
  [points] integer,
  [id_card_suit] integer,
  [id_ability] integer
)
GO

CREATE TABLE [card_suit] (
  [id_card_suit] integer PRIMARY KEY,
  [card_suit] nvarchar(255)
)
GO

CREATE TABLE [ability] (
  [id_ability] integer PRIMARY KEY,
  [description] nvarchar(255)
)
GO

CREATE TABLE [user] (
  [id_user] integer PRIMARY KEY,
  [first_name] nvarchar(255),
  [last_name] nvarchar(255),
  [email] nvarchar(255),
  [username] nvarchar(255)
)
GO

CREATE TABLE [game] (
  [id_game] integer PRIMARY KEY,
  [id_status] integer,
  [start_date] datetime,
  [end_date] datetime,
  [limit_points] integer
)
GO

CREATE TABLE [status] (
  [id_status] integer PRIMARY KEY,
  [code] nvarchar(255),
  [description] nvarchar(255)
)
GO

CREATE TABLE [player_type] (
  [id_player_type] integer PRIMARY KEY,
  [description] nvarchar(255)
)
GO

CREATE TABLE [player] (
  [id_player] integer PRIMARY KEY,
  [id_user] integer,
  [id_game] integer,
  [id_player_type] integer
)
GO

CREATE TABLE [card_game] (
  [id_card_game] integer PRIMARY KEY,
  [id_card] integer,
  [id_game] integer,
  [owner] int
)
GO

CREATE TABLE [log] (
  [id_log] integer PRIMARY KEY,
  [id_game] integer,
  [description] nvarchar(255)
)
GO

ALTER TABLE [card] ADD FOREIGN KEY ([id_card_suit]) REFERENCES [card_suit] ([id_card_suit])
GO

ALTER TABLE [card] ADD FOREIGN KEY ([id_ability]) REFERENCES [ability] ([id_ability])
GO

ALTER TABLE [game] ADD FOREIGN KEY ([id_status]) REFERENCES [status] ([id_status])
GO

ALTER TABLE [player] ADD FOREIGN KEY ([id_user]) REFERENCES [user] ([id_user])
GO

ALTER TABLE [player] ADD FOREIGN KEY ([id_game]) REFERENCES [game] ([id_game])
GO

ALTER TABLE [player] ADD FOREIGN KEY ([id_player_type]) REFERENCES [player_type] ([id_player_type])
GO

ALTER TABLE [card_game] ADD FOREIGN KEY ([id_card]) REFERENCES [card] ([id_card])
GO

ALTER TABLE [card_game] ADD FOREIGN KEY ([id_game]) REFERENCES [game] ([id_game])
GO

ALTER TABLE [card_game] ADD FOREIGN KEY ([owner]) REFERENCES [player] ([id_player])
GO

ALTER TABLE [log] ADD FOREIGN KEY ([id_game]) REFERENCES [game] ([id_game])
GO
