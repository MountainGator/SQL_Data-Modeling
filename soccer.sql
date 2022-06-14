DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;

CREATE TABLE cities (
    id SERIAL PRIMARY KEY, 
    city_name TEXT
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY, 
    first_name TEXT,
    last_name TEXT,
    team_name_id INTEGER REFERENCES teams (id) ON DELETE CASCADE
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT 
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY, 
    team_name TEXT,
    city_name_id REFERENCES cities (id) ON DELETE CASCADE
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    played_on DATE,
    season_id INTEGER REFERENCES seasons (id),
    played_in INTEGER REFERENCES cities (id),
    winner_score INTEGER,
    loser_score INTEGER,
    winner INTEGER REFERENCES teams (id),
    loser INTEGER REFERENCES teams (id),
    ref TEXT REFERENCES referees (id)
)

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    scored_by INTEGER REFERENCES players (id) ON DELETE CASCADE,
    scored_in INTEGER REFERENCES matches (id) ON DELETE CASCADE
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    start_date_val DATE,
    end_date DATE,
    year_val INTEGER
);

--standings --
SELECT team_name, COUNT(winner) AS wins, COUNT(loser) AS losses, season_id AS season
    FROM teams t
    JOIN matches m ON m.winner = t.id AND m.loser = t.id
    GROUP BY season_id
    ORDER BY COUNT(winner) desc;
