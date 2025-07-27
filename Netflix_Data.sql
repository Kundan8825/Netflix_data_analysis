DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix_data (
    show_id VARCHAR(10),
    type VARCHAR(20),
    title VARCHAR(255),
    director VARCHAR(255),
    cast TEXT,
    country VARCHAR(200),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(50),
    listed_in VARCHAR(255),
    description TEXT
);

SELECT * FROM netflix_data;

SELECT COUNT(*) AS total FROM netflix_data;

SELECT DISTINCT type FROM netflix_data;









