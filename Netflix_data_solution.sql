-- PROBLEM & SOLUTIONS

-- 1. How many are Movies and how many are TV Shows?

SELECT type, COUNT(*) AS count FROM netflix_data GROUP BY type;

-- 2. List all distinct countries represented in the dataset

SELECT DISTINCT country FROM netflix_data WHERE country IS NOT NULL;

-- 3. How many titles are available from India?

SELECT COUNT(*) AS indian_titles FROM netflix_data WHERE country = 'India';

-- 4. What is the most recent year a title was added to Netflix?

SELECT  MAX(date_added) AS recent_added FROM netflix_data;

-- 5. Show number of titles added each year.

SELECT YEAR(STR_TO_DATE(date_added, '%M %d, %Y')) AS year_added, 
COUNT(*) AS titles_count
FROM netflix_data
WHERE date_added IS NOT NULL
GROUP BY year_added
ORDER BY year_added;

 -- 6. Show the oldest release year of any movie/show in the dataset.

SELECT MIN(release_year) AS oldest_release_year FROM netflix_data;

-- 7. Which genres/categories appear most often?

SELECT listed_in, COUNT(*) AS count
FROM netflix_data
GROUP BY listed_in
ORDER BY count DESC
LIMIT 10;

-- 8. How many comedies are available on Netflix?

SELECT COUNT(*) AS Comedies FROM netflix_data WHERE listed_in LIKE "%comedies%";

-- 9. List all distinct genres.

SELECT DISTINCT listed_in FROM netflix_data;

-- 10. How many movies vs shows are there in the United States?

SELECT type, COUNT(*) AS count
FROM netflix_data
WHERE country = "United States"
GROUP BY type;

-- 11. List all movies from India released after 2015.

SELECT title, release_year
FROM netflix_data
WHERE country="India" AND type="Movie" AND release_year > 2015;

-- 12. Find all TV shows where ‘David Attenborough’ is listed in the cast.
SELECT title, type
FROM netflix_data
WHERE cast LIKE "%David Attenborough%" AND type="TV Show";

-- 13. Who  the top 10 most frequent directors?

SELECT director,COUNT(*) AS count
FROM netflix_data
WHERE director IS NOT NULL
GROUP BY director
ORDER BY count DESC
LIMIT 10;

-- 14. How many titles don’t have a country listed?

SELECT COUNT(*) AS no_country
FROM netflix_data
WHERE country IS NULL OR country= '';

-- 15. Find the average duration of movies.

SELECT ROUND(AVG(CAST(REPLACE(duration,' min',' ') AS UNSIGNED)),2) AS Avg_duration
FROM netflix_data
WHERE type= 'Movie';

-- 16. Find five titles with the longest durations.

SELECT title, duration
FROM netflix_data
WHERE type= 'Movie'
ORDER BY CAST(REPLACE(duration, ' min', ' ')AS UNSIGNED) DESC
LIMIT 5;

-- 17. Titles added each month (seasonal trend).

SELECT MONTH(STR_TO_DATE(date_added, '%M %d, %Y')) AS month,
COUNT(*) AS titles_added
FROM netflix_data
WHERE date_added IS NOT NULL
GROUP BY month
ORDER BY month;

-- 18. TOP 10 TV Shows with the most seasons.

SELECT title, duration 
FROM netflix_data
WHERE type= 'TV Show'
ORDER BY CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) DESC
LIMIT 10;

-- 19. Which genres are increasing over time?

SELECT YEAR(STR_TO_DATE(date_added, '%M %d, %Y')) AS year, listed_in, COUNT(*) AS total
FROM netflix_data
WHERE date_added IS NOT NULL
GROUP BY year, listed_in
ORDER BY year ASC, total DESC;

-- 20. Find specific genere increasing over time? (Documentaries, Comedies, Dramas)

SELECT YEAR(STR_TO_DATE(date_added, '%M %d, %Y')) AS year,  COUNT(*) AS Documentaries
FROM netflix_data
WHERE date_added IS NOT NULL 
	AND listed_in LIKE '%Documentaries%'			-- If u want to find other genere replace Documentaries with Comedies, Dramas, etc. 
GROUP BY year
ORDER BY year;