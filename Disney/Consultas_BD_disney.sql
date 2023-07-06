# FUENTE: https://www.kaggle.com/datasets/victorsoeiro/disney-tv-shows-and-movies?select=titles.csv

#EJERCICIOS DISNEY

/*Primero hacemos una vista previa de las tablas*/
SELECT *
	FROM disney.titles
LIMIT 20;

SELECT *
	FROM disney.credits
LIMIT 20;

/*Cada película tiene un campo de primary key en titles llamado id. Este campo nos servirá para
unir con la tabla titles*/

/*Ahora empezamos con los ejercicios*/

#Consulta 1
/*Vamos a ver si hay alguna película de disney en la que España haya participado en la producción*/
SELECT title 
	FROM disney.titles
WHERE production_countries LIKE '%ES%';

#Consulta 2
/*Por ejemplo, vamos a ver los actores o dobladores que han participado 
en esas dos películas y también el personaje que han doblado o interpreptado*/
SELECT c.name, c.character, c.role, t.title, t.production_countries
	FROM disney.titles t
	JOIN disney.credits c
	ON t.id = c.id
WHERE production_countries LIKE '%ES%' AND role = 'ACTOR'
ORDER BY t.title ASC, c.name ASC;

#Consulta 3
/*Cual es la primera producción más antigua de esta base de datos*/
SELECT title, release_year
	FROM disney.titles
ORDER BY release_year ASC
LIMIT 1;

#Consulta 4
/*Mostrar quien dirigió esa película*/
/*Este ejercicio se debería hacer por subconsultas, pero como todavía no lo
hemos dado, y ya sabemos que la película más antigua se estrenó en 1937
ponemos el año directamente en el where.*/
SELECT c.name, c.character, c.role, t.title, t.release_year
	FROM disney.titles t
	JOIN disney.credits c
	ON t.id = c.id
WHERE t.release_year = '1937' AND c.role = 'DIRECTOR';

#Consulta 5
/*Las clasificaciones por edades que tengan más de una película donde aparezca
el personaje de Mickey*/
SELECT t.age_certification, COUNT(t.title) as mickey_titles
	FROM disney.titles t
	JOIN disney.credits c
	ON t.id = c.id
WHERE UPPER(c.character) LIKE ('%MICKEY %')
GROUP BY age_certification
HAVING mickey_titles > 1;

#Consulta 6
/*Directores cuya media de puntuación imbd de las producciones dirigidas para disney 
sea mayor o igual a 5*/
SELECT c.name, c.role, AVG(t.imdb_score) AS avg_imbd_score
	FROM disney.titles t
	JOIN disney.credits c
	ON t.id = c.id
WHERE role = 'DIRECTOR'
GROUP BY c.name, c.role
HAVING avg_imbd_score >= 5 
ORDER BY avg_imbd_score DESC;

#Consulta 7
/*En la consulta anterior, vemos muchos directores que han hecho solo una película.
Eso nos puede desvirtuar un poco el resultado, porque queremos probar que los directores
tengan éxito para disney no solo en una película, si no en varias. Así que reformulamos,
Directores cuya media de puntuación imbd de las producciones dirigidas para disney 
sea mayor o igual a 5 y que hayan dirigido más de una producción*/
SELECT c.name, c.role, AVG(t.imdb_score) AS avg_imbd_score, COUNT(t.title) AS titles_made
	FROM disney.titles t
	JOIN disney.credits c
	ON t.id = c.id
WHERE role = 'DIRECTOR'
GROUP BY c.name, c.role
HAVING avg_imbd_score >= 5 AND titles_made > 1
ORDER BY avg_imbd_score DESC;

#Consulta 8
/*Directores con una media mayor que 5 sacada de de puntuación media entre IMBD y TMBD 
(Es decir, sumamos la puntuación de IMBD y TMBD y la dividimos entre dos) de las producciones 
dirigidas para disney sea mayor o igual a 5 y que hayan dirigido más de una producción*/
SELECT c.name, c.role, AVG(((t.imdb_score + t.tmdb_score)/2)) AS avg_total_score,
COUNT(t.title) AS titles_made
	FROM disney.titles t
	JOIN disney.credits c
	ON t.id = c.id
WHERE role = 'DIRECTOR'
GROUP BY c.name, c.role
HAVING avg_total_score >= 5 AND titles_made > 1
ORDER BY avg_total_score DESC;

#Consulta 9
/*Producciones que ha hecho TIM BURTON*/
SELECT c.person_id, c.name, c.role, t.id, t.title
	FROM disney.titles t
	JOIN disney.credits c
	ON t.id = c.id
WHERE (UPPER(c.name) LIKE '%TIM%') AND (UPPER(c.name) LIKE '%BURTON%') AND role ='DIRECTOR'
ORDER BY name ASC;

#Consulta 10
/*Sumar todos los votos que han recibido en IMBD las producciones hechas por TIM BURTON*/
SELECT SUM(t.imdb_votes) AS sum_imdb_votes
	FROM disney.titles t
	JOIN disney.credits c
	ON t.id = c.id
WHERE (UPPER(c.name) LIKE '%TIM%') AND (UPPER(c.name) LIKE '%BURTON%') AND role ='DIRECTOR';


#Consulta 11
/*Años en los cuales se hayan lanzado más de 1 película de terror (series no)*/
SELECT release_year, COUNT(title) AS num_titles
	FROM disney.titles
WHERE type = 'MOVIE' AND genres LIKE '%horror%'
GROUP BY release_year
HAVING num_titles >1
ORDER BY release_year ASC;

#Consulta 12
/*Selecciona los rangos de edad donde alguna de sus producciones tenga más de 1000 puntos 
de popularidad en tmdb*/
SELECT DISTINCT age_certification, MAX(tmdb_popularity) AS max_tmdb_popularity
	FROM disney.titles
GROUP BY age_certification
HAVING max_tmdb_popularity > 1000;


#Consulta 13
/*Selecciona los actores que hayan participado en más de 4 produciones de amor*/
SELECT c.name, COUNT(t.title) AS titleslove
	FROM disney.titles t
	JOIN disney.credits c
	ON t.id = c.id
WHERE c.role ='ACTOR' AND t.genres LIKE '%romance%'
GROUP BY c.name
HAVING titleslove > 4
ORDER BY titleslove ASC;

#Consulta 14
/*Selecciona los actores que hayan participado películas que hayan participado en alguna
película que haya recibido 8 o menos votos en imdb*/
SELECT c.name, MIN(imdb_votes) AS min_imdb_votes
	FROM disney.titles t
	JOIN disney.credits c
	ON t.id = c.id
WHERE t.type = 'MOVIE'
GROUP BY c.name
HAVING min_imdb_votes <= 8
ORDER BY min_imdb_votes ASC;

#Consulta 15
/*Los años en los que algún director haya lanzado más de un título indicando nombre del director*/
SELECT c.name, t.release_year, COUNT(t.title) AS titles_released
	FROM disney.titles t
	JOIN disney.credits c
	ON t.id = c.id
WHERE role ='DIRECTOR'
GROUP BY c.name, t.release_year
HAVING titles_released > 1
ORDER BY c.name ASC, t.release_year ASC;

#Consulta 16
/*Selecciona todas las películas donde haya aparecido el personaje Darth Vader (Anakin). 
Hay que tener en cuenta que puede tener un actor que lo interprete y/o un doblador que haga
su voz*/
SELECT DISTINCT t.title, t.type
	FROM disney.titles t
	JOIN disney.credits c
	ON t.id = c.id
WHERE ((UPPER(c.character) LIKE ('%VADER%')) OR (UPPER(c.character) LIKE ('%ANAKIN%')))
	AND t.type='MOVIE'
ORDER BY release_year ASC;

#Consulta 17
/*Muestra las películas producidas por un país o grupo de países que no sean, o 
entre los cuales no se encuentre Estasos Unidos que hayan producido películas con una duración
superior a 50 min*/
SELECT production_countries, AVG(runtime) AS avg_runtime
	FROM disney.titles
WHERE (production_countries NOT LIKE '%US%')  AND (production_countries != '[]')
GROUP BY production_countries
HAVING avg_runtime > 50
ORDER BY avg_runtime DESC;

#Consulta 18
/*Selecciona los años donde se hayan lanzado más de una producción en la que haya participado
Miley Cyrus*/
SELECT t.release_year, COUNT(t.title) AS miley_title
	FROM disney.titles t
	JOIN disney.credits c
	ON t.id = c.id
WHERE (UPPER(c.name) LIKE ('%MILEY%')) AND (UPPER(c.name) LIKE ('%CYRUS%'))
GROUP BY(t.release_year)
HAVING miley_title > 1
ORDER BY release_year;

#Consulta 19
/*Selecciona la producción de acción más popular segun la media entre imdb_score e tmdb_score*/
SELECT title, genres, ((imdb_score+tmdb_score)/2) AS total_score
	FROM disney.titles
WHERE genres LIKE('%action%')
ORDER BY total_score DESC
LIMIT 1;

#Consulta 20
/*Selecciona los actores que han participado en más de 17 producciones de disney*/
SELECT c.name, COUNT(t.title) AS titles_disney_made
	FROM disney.titles t
	JOIN disney.credits c
	ON t.id = c.id
WHERE role = 'ACTOR'
GROUP BY c.name
HAVING titles_disney_made >17
ORDER BY titles_disney_made DESC;


/*Consultas compis*/

SELECT release_year, COUNT(title)
	FROM disney.titles
GROUP BY release_year
ORDER BY release_year ASC;

SELECT DISTINCT c.name as "Nombre"
	FROM disney.credits c
	JOIN disney.titles t
		ON c.id = t.id
	WHERE t.seasons > 2 AND c.name LIKE "W%";
    
/*Ordenar a los directores por la duración media de sus películas 
(directores con más de 2 pelicula)*/
SELECT DISTINCT p.name, COUNT(*) AS num_peliculas, 
CONCAT(FORMAT(AVG(t.runtime),2), ' min') as duracion_media
FROM disney.credits p
JOIN disney.titles t 
	ON p.id = t.id
WHERE p.role = 'director' AND t.type = 'MOVIE' 
GROUP BY p.name
HAVING COUNT(*) > 2
ORDER BY duracion_media DESC;

SELECT *
FROM disney.credits
WHERE name LIKE 'Walt Disney'
ORDER BY id;

SELECT c.name, t.release_year, COUNT(t.id) AS "Total Titles"
FROM disney.credits c
JOIN disney.titles t 
	ON c.id = t.id
WHERE name LIKE 'Walt Disney'
GROUP BY c.name, t.release_year;

SELECT c.person_id, c.id, c.name, c.character, c.role
FROM disney.credits c
JOIN disney.titles t 
	ON c.id = t.id
WHERE name LIKE 'Walt Disney';
