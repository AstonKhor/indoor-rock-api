\c d1o31vt6s14bc2;

DROP TABLE IF EXISTS gyms CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS keys CASCADE;
DROP TABLE IF EXISTS sessions CASCADE;

CREATE TABLE gyms (
  Id SERIAL PRIMARY KEY,
  GymName VARCHAR(80) NOT NULL,
  Link VARCHAR(270) NOT NULL,
  Country VARCHAR(50),
  Region VARCHAR(100),
  Subregion VARCHAR(50),
  Website VARCHAR(270),
  Phone VARCHAR(40),
  GymAddress VARCHAR(200),
  Rating DECIMAL(2,1),
  Description TEXT,
  Poster VARCHAR(36)
);

CREATE TABLE users (
  Id SERIAL PRIMARY KEY,
  Username VARCHAR(36) UNIQUE,
  Password VARCHAR(100) UNIQUE,
  Salt BIGINT
);

CREATE TABLE sessions (
  Id SERIAL PRIMARY KEY,
  Session_Key VARCHAR(100),
  User_Id int,
  FOREIGN KEY (User_Id) REFERENCES users(Id)
);

CREATE TABLE keys (
  Id SERIAL PRIMARY KEY,
  key VARCHAR(36),
  User_Id int,
  FOREIGN KEY (User_Id) REFERENCES users(Id)
);


-- heroku pg:psql postgresql-solid-31865 --app indoor-rock-api