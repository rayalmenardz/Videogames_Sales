SELECT * FROM videogames.videogames_sales;
-- Para hallar el top 7 según MySQL:
SELECT name, year, global_sales as most_sold_games
FROM videogames_sales
ORDER BY global_sales DESC
LIMIT 7;
-- Para hallar las diferentes versiones de GTA V:
SELECT *
FROM videogames_sales
WHERE name = 'Grand Theft Auto V';
-- Para unir todas las ventas globales de GTA V:
SELECT name, SUM(global_sales) AS total_sales
FROM videogames_sales
WHERE name = 'Grand Theft Auto V';
-- Ventas por año:
SELECT year, SUM(global_sales) AS total_sales_per_year
FROM videogames_sales
GROUP BY year
ORDER BY total_sales_per_year desc; 
SELECT year, SUM(global_sales) AS total_sales_per_year
FROM videogames_sales
GROUP BY year
ORDER BY year; 
-- Plataformas populares
SELECT platform, SUM(global_sales) AS total_sales_per_year
FROM videogames_sales
GROUP BY platform
ORDER BY total_sales_per_year desc
LIMIT 7;
-- Géneros más populares
SELECT genre, SUM(global_sales) AS total_sales_per_year
FROM videogames_sales
GROUP BY genre
ORDER BY total_sales_per_year desc;
-- Preferencias por región
-- (Para Norteamérica):
SELECT genre, SUM(na_sales) AS genre_sales_per_region
FROM videogames_sales
GROUP BY genre
ORDER BY genre_sales_per_region desc;
-- (Para Europa):
SELECT genre, SUM(eu_sales) AS genre_sales_per_region
FROM videogames_sales
GROUP BY genre
ORDER BY genre_sales_per_region desc;
-- (Para Japón): 
SELECT genre, SUM(jp_sales) AS genre_sales_per_region
FROM videogames_sales
GROUP BY genre
ORDER BY genre_sales_per_region desc;
-- Desarrolladoras con más títulos
SELECT publisher, count(distinct name) as names_per_publisher
FROM videogames_sales
GROUP BY publisher
ORDER BY names_per_publisher desc
LIMIT 10;
-- Correlación Ventas - Desarrolladoras: 
SELECT publisher, sum(global_sales) as sales_per_publisher
FROM videogames_sales
GROUP BY publisher
ORDER BY sales_per_publisher desc
LIMIT 10;
-- Desarrolladoras con más ventas: 
SELECT publisher, sum(global_sales) AS sales_per_publisher
FROM videogames_sales
GROUP BY publisher
ORDER BY sales_per_publisher DESC
LIMIT 7;
-- Popularidad de los géneros por décadas:
SELECT
    CONCAT(FLOOR(year / 10) * 10, '-', FLOOR(year / 10) * 10 + 9) AS decade,
    genre,
    SUM(global_sales) AS total_sales
FROM
    videogames_sales
GROUP BY
    decade, genre
ORDER BY
    decade, total_sales DESC;
-- Popularidad de las consolas a lo largo de los años:
SELECT
    CONCAT(FLOOR(year / 10) * 10, '-', FLOOR(year / 10) * 10 + 9) AS decade,
    platform,
    SUM(global_sales) AS total_sales_by_platform
FROM
    videogames_sales
GROUP BY
    decade, platform
ORDER BY
    decade, total_sales_by_platform DESC;


