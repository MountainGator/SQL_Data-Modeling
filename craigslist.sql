DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;

CREATE TABLE regions (id SERIAL PRIMARY KEY, region_name TEXT);
CREATE TABLE users (id SERIAL PRIMARY KEY, username TEXT, preferred_region INTEGER);
CREATE TABLE categories (id SERIAL PRIMARY KEY, category_name TEXT);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY, 
    title TEXT, 
    body TEXT, 
    users_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
    categories_id INTEGER REFERENCES categories (id) ON DELETE CASCADE, 
    location_name TEXT,
    regions_id INTEGER REFERENCES regions (id) ON DELETE CASCADE
    );