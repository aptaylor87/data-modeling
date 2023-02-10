DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;
\c soccer_league;

CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  name TEXT,
  team_id INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE seasons
(
  id SERIAL PRIMARY KEY,
  start_date DATE,
  end_date DATE
);

CREATE TABLE matches
(
  id SERIAL PRIMARY KEY,
  team_1 INTEGER REFERENCES teams ON DELETE SET NULL,
  team_2 INTEGER REFERENCES teams ON DELETE SET NULL,
  winner TEXT NOT NULL,
  season_id INTEGER REFERENCES seasons ON DELETE SET NULL
);

CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES players ON DELETE SET NULL,
  match_id INTEGER REFERENCES matches ON DELETE SET NULL,
  team_id INTEGER REFERENCES teams ON DELETE SET NULL
);


CREATE TABLE referees 
(
  id SERIAL PRIMARY KEY,
  match_id INTEGER REFERENCES matches ON DELETE SET NULL,
  referee_name TEXT NOT NULL
);


INSERT INTO teams (name)
VALUES
('The Rainbow Dragons'),
('The Blue Baracudas');

INSERT INTO players (name, team_id)
VALUES
('Roy Kent', 1),
('Ted Lasso', 1),
('Vinne Jones', 2),
('Alex Taylor', 2);

INSERT INTO seasons (start_date, end_date)
VALUES
('2022-10-03', '2023-02-04');

INSERT INTO matches (team_1, team_2, winner, season_id)
VALUES
(1,2,'team1', 1),
(1,2,'team1', 1),
(1,2,'draw', 1);

INSERT INTO goals (player_id, match_id, team_id)
VALUES
(1,1,1),
(4,1,1),
(4,2,1);


INSERT INTO referees  (match_id, referee_name)
VALUES
(1,'Bob Sagat'),
(1,'Bob Sagat'),
(1,'Bob Sagat');
