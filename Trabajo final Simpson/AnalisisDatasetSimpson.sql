/*RAZONES PARA ELEGIR EL TEMA "Los Simpson"*/

/*El dataset es uno de los que tiene mayor usabilidad en Kaggle y se puede trabajar en SQL
https://www.kaggle.com/datasets/jonbown/simpsons-episodes-2016*/

/*Es un tema que no solo es interesante para mí, los Simpson es una serie muy popular*/
/*Vamos a justificar esta información basándonos en datos. Usemos la base de datos "Disney", de otro de los ejercicios propuestos
https://www.kaggle.com/datasets/victorsoeiro/disney-tv-shows-and-movies?select=titles.csv*/
SELECT RANK() OVER (ORDER BY total_score DESC, tmdb_popularity DESC) 
AS score_and_popularity_ranking, 
title, total_score, ROUND(tmdb_popularity, 2) AS tmdb_popularity
FROM
	(SELECT title, ROUND(((imdb_score+tmdb_score)/2), 2) 
    AS total_score, tmdb_popularity
	FROM disney.titles)r;
/*Si tomamos la media de puntuación entre imdb y tmdb además de la popularidad de todas las 1.017 producciones del catálogo de disney, los Simpson ocupan el puesto 42*/

/*Revisamos la informacion de las tablas*/

SELECT *
FROM simpson.episodes
ORDER BY id ASC;

SELECT *
FROM simpson.scores
ORDER BY season ASC;


/*Vamos a crear una view de los rating de los capítulos y sus temporadas
Tenemos en cuenta:
El número del capítulo
El título del capítulo
Total telespectadores que han visto ese capítulo
Número de críticos de Rotten Tomatoes que han calificado la temporada a la que pertenece ese capítulo
Número de espectadores de Rotten Tomatoes que han calificado la temporada a la que pertenece ese capítulo
Calificación del capítulo según los usuarios en imdb
Calificación de la temporada en Rotten Tomatoes según los críticos
Calificación de la temporada en Rotten Tomatoes según los usuarios */
CREATE VIEW simpson.scores_comparison AS
SELECT e.id, s.season, e.title, 
e.us_viewers_in_millions, s.rt_critic_count, 
s.rt_user_count, e.imdb_rating, 
s.rt_critic_score, rt_user_score
FROM simpson.episodes e
JOIN simpson.scores s
ON e.season = s.season;

/*Vamos a ver la valoración media de todas las temporadas*/
SELECT ROUND(AVG(e.imdb_rating), 2) AS avg_rating_imdb , ROUND(AVG(e.rt_user_score), 2) 
AS avg_rt_user_score_tr, 
ROUND(AVG(e.rt_critic_score), 2) AS avg_rt_critic_score_tr, 
ROUND(AVG(((r.rating_imdb_pro_season+r.rt_user_score_tr)/2)), 2) AS avg_total_user_rating, 
ROUND(AVG(CASE
WHEN e.rt_critic_score != "" THEN ((e.rt_critic_score+e.rt_user_score)/2)
WHEN e.rt_critic_score = "" THEN e.rt_user_score 
END), 2) AS total_avg_rt_score #Esto lo hacemos porque hay temporadas sin esta puntuación
FROM 
	(
    SELECT season, ROUND(AVG(imdb_rating), 2) AS rating_imdb_pro_season, 
    ((rt_critic_score)/10) AS rt_critic_score_tr, 
    ((rt_user_score)/10) AS rt_user_score_tr
	FROM simpson.scores_comparison
	GROUP BY season, rt_critic_score_tr, rt_user_score_tr
	HAVING rt_critic_score_tr > 0
	ORDER BY season ASC
    )r
JOIN simpson.scores_comparison e
ON e.season = r.season;
#avg_rating_imdb es la media de la puntuación de los episodios en imdb
#avg_rt_user_score_tr es la media de la puntuación de los usuarios por temporadas en Rotten Tomatoes
#avg_rt_critic_score_tr es la media de la puntuación de los críticos por temporadas en Rotten Tomatoes
#avg_total_user_rating es la media del rating de los usuarios de imdb y Rotten Tomatoes por temporada
#total_avg_rt_score es la media de puntuación de críticos y usuarios de Rotten Tomatoes

/*Vamos a ver cuál es la temporada más valorada por los usuarios*/
SELECT r.season, YEAR(MIN(e.original_air_date)) AS year_released, r.rating_imdb_pro_season, r.rt_user_score_tr, 
r.rt_critic_score_tr, ROUND(((r.rating_imdb_pro_season + r.rt_user_score_tr + r.rt_critic_score_tr)/3), 2) AS total_rating
FROM
	(
    SELECT season, ROUND(AVG(imdb_rating), 2) AS rating_imdb_pro_season, ((rt_critic_score)/10) AS rt_critic_score_tr, 
    ((rt_user_score)/10) AS rt_user_score_tr
	FROM simpson.scores_comparison
	GROUP BY season, rt_critic_score_tr, rt_user_score_tr
	HAVING rt_critic_score_tr > 0 # Con esto eliminamos las temporadas sin puntuación de los críticos
	ORDER BY season ASC
    )r
JOIN simpson.episodes e
ON e.season = r.season
GROUP BY r.season, total_rating, r.rating_imdb_pro_season, r.rt_user_score_tr, r.rt_critic_score_tr
ORDER BY total_rating DESC;
#rating_imdb_pro_season es el rating de imdb por temporada de los usuarios
#rt_user_score_tr es el rating de Rotten Tomatoes por temporada de los usuarios
#rt_critic_score_tr es el rating de Rotten Tomatoes por temporada de los críticos
#total_rating es la media de los tres ratings

/*Identificamos la media de los episodios 
según imdb*/
SELECT ROUND(AVG(imdb_rating), 2) AS avg_imdb
FROM simpson.episodes;

/*Vamos a identificar cuáles son los capítulos 
que tengan una calificación superior a la media 
en imdb*/
SELECT id, title, season, imdb_rating
FROM simpson.episodes
WHERE imdb_rating > 
				(SELECT AVG(imdb_rating)
				FROM simpson.episodes)
ORDER BY imdb_rating DESC;

/*Vamos a identificar cuáles son los capítulos 
que tengan una calificación inferior a la media 
en imdb*/
SELECT id, title, season, imdb_rating
FROM simpson.episodes
WHERE imdb_rating < 
				(SELECT AVG(imdb_rating)
				FROM simpson.episodes)
ORDER BY imdb_rating ASC;

/*Vamos a calcular las ponderaciones sólo de usuarios y críticos según 
Rotten Tomatoes*/
SELECT sc.season, YEAR(MIN(e.original_air_date)) AS year_released, 
sc.rt_critic_score, sc.rt_user_score, 
CASE
WHEN sc.rt_critic_score != "" THEN ((sc.rt_critic_score+sc.rt_user_score)/2)
WHEN sc.rt_critic_score = "" THEN rt_user_score
END AS total_avg_rt_score
FROM simpson.scores_comparison sc
JOIN simpson.episodes e
ON e.season = sc.season
GROUP BY sc.season,  sc.rt_critic_score, sc.rt_user_score
ORDER BY total_avg_rt_score DESC;

/*Vamos a estudiar la evolución de los distintos ratings por año*/
SELECT YEAR(e.original_air_date) AS year_released, ROUND(AVG(sc.imdb_rating), 2) AS avg_rating_imdb, 
ROUND(AVG(sc.rt_user_score), 2) AS avg_rt_user_score_tr, 
ROUND(AVG(sc.rt_critic_score), 2) AS avg_rt_critic_score_tr, 
ROUND(AVG(((r.rating_imdb_pro_season+r.rt_user_score_tr)/2)), 2) AS avg_total_user_rating,
ROUND(AVG(CASE
WHEN sc.rt_critic_score != "" THEN ((sc.rt_critic_score+sc.rt_user_score)/2)
WHEN sc.rt_critic_score = "" THEN sc.rt_user_score 
END), 2) AS total_avg_rt_score #Esto lo hacemos porque hay temporadas sin esta puntuación
FROM 
	(
    SELECT season, ROUND(AVG(imdb_rating), 2) AS rating_imdb_pro_season, 
    ((rt_critic_score)/10) AS rt_critic_score_tr, 
    ((rt_user_score)/10) AS rt_user_score_tr
	FROM simpson.scores_comparison
	GROUP BY season, rt_critic_score_tr, rt_user_score_tr
	ORDER BY season ASC
    )r
JOIN simpson.scores_comparison sc
ON sc.season = r.season
JOIN simpson.episodes e
ON e.season = sc.season
GROUP BY year_released
ORDER BY year_released ASC;
#avg_rating_imdb es la media de la puntuación de los episodios en imdb
#avg_rt_user_score_tr es la media de la puntuación de los usuarios por temporadas en Rotten Tomatoes
#avg_rt_critic_score_tr es la media de la puntuación de los críticos por temporadas en Rotten Tomatoes
#avg_total_user_rating es la media del rating de los usuarios de imdb y Rotten Tomatoes por temporada
#total_avg_rt_score es la media de puntuación de críticos y usuarios de Rotten Tomatoes

/*Estudiaremos la evolucuión del número de espectadores por año*/
SELECT YEAR(original_air_date) AS year_viewers, ROUND(AVG(us_viewers_in_millions), 2) avg_viewers_pro_episode
FROM simpson.episodes
GROUP BY year_viewers
ORDER BY year_viewers;


/*Veremos cual es el episodio con más espectadores*/
SELECT id, title, us_viewers_in_millions, season
FROM simpson.episodes
WHERE us_viewers_in_millions >
						(SELECT ROUND(AVG(us_viewers_in_millions), 2)
						FROM simpson.episodes)
ORDER BY us_viewers_in_millions DESC;



/*Vamos a hacer una consulta que incluya, que compare ratings de usuarios
con el número de espectadores en EEUU por temporada*/
SELECT YEAR(MIN(e.original_air_date)) AS year_released, r.viewers,  
ROUND(((r.rating_imdb_pro_season+r.rt_user_score_tr)/2), 2) AS total_user_rating
FROM
	(
    SELECT season, ROUND(AVG(imdb_rating), 2) AS rating_imdb_pro_season, 
	((rt_user_score)/10) AS rt_user_score_tr, 
    ROUND(AVG(us_viewers_in_millions), 2) AS viewers
	FROM simpson.scores_comparison
	GROUP BY season, rt_user_score_tr
	ORDER BY season ASC
    )r
JOIN simpson.episodes e
ON e.season = r.season
GROUP BY total_user_rating, r.viewers
ORDER BY total_user_rating DESC;


/*Nos interesa ver el ranking total de la puntuación que dan los espectadores, 
frente a la de los críticos. Para calular la puntuación de los usuarios hacemos
una media entre la puntuación de imdb y Rotten Tomatoes*/
SELECT r.season, YEAR(MIN(e.original_air_date)) AS year_released, 
ROUND(((r.rating_imdb_pro_season+r.rt_user_score_tr)/2), 2) AS total_user_rating, 
r.rt_critic_score_tr
FROM
	(
    SELECT season, ROUND(AVG(imdb_rating), 2) AS rating_imdb_pro_season, 
    ((rt_critic_score)/10) AS rt_critic_score_tr, 
    ((rt_user_score)/10) AS rt_user_score_tr
	FROM simpson.scores_comparison
	GROUP BY season, rt_critic_score_tr, rt_user_score_tr
	HAVING rt_critic_score_tr > 0
	ORDER BY season ASC
    )r
JOIN simpson.episodes e
ON e.season = r.season
GROUP BY r.season, total_user_rating, r.rt_critic_score_tr
ORDER BY r.season ASC;


/*Los directores que han dirigido más de un capítulo
los ordenamos por capitulos dirigidos*/
SELECT directed_by, ROUND(AVG(imdb_rating), 2) AS avg_director_rating, 
COUNT(id) AS episodes_directed
FROM simpson.episodes
GROUP BY directed_by
HAVING episodes_directed > 1
ORDER BY episodes_directed DESC;

/*Los Guionistas que han escrito más de un capítulo
los ordenamos por capítulos escritos*/
SELECT written_by, ROUND(AVG(imdb_rating), 2) AS avg_writer_rating, 
COUNT(id) AS episodes_written
FROM simpson.episodes
GROUP BY written_by
HAVING episodes_written > 1
ORDER BY episodes_written DESC;

/*Directores que han dirigido más de un capítulo cuya media de capítulos 
dirigidos es superior a la media*/
SELECT directed_by, ROUND(AVG(imdb_rating), 2) AS avg_director_rating, 
COUNT(id) AS episodes_directed
FROM simpson.episodes
GROUP BY directed_by
HAVING avg_director_rating > 
							(SELECT AVG(imdb_rating)
							FROM simpson.episodes)
		AND episodes_directed > 1
ORDER BY avg_director_rating DESC;

/*Guionistas que han escrito más de un capítulo cuya media de capítulos 
escritos es superior a la media*/
SELECT written_by, ROUND(AVG(imdb_rating), 2) AS avg_writer_rating, 
COUNT(id) AS episodes_written
FROM simpson.episodes
GROUP BY written_by
HAVING avg_writer_rating > 
							(SELECT AVG(imdb_rating)
							FROM simpson.episodes)
	AND episodes_written > 1
ORDER BY avg_writer_rating DESC;

/*Los directores que mayor éxito han cosechado han sido Jeffrey Lynch y Rich Moore
Mientras que de gionistas podemos destacar a Dan McGrath y Conan O'Brien*/

SELECT MAX(original_air_date) AS oldest_episode_by_Lynch
FROM simpson.episodes
WHERE directed_by LIKE "%Lynch%";

SELECT MAX(original_air_date) AS oldest_episode_by_R_Moore
FROM simpson.episodes
WHERE directed_by LIKE "%Rich%%Moore%"
ORDER BY original_air_date DESC;

/*No obstante, parece ser que los directores Jeffrey Lynch y Rich Moore no participan en los
Simpson desde los años 90
Podría ser una buena idea que regresaran y así comprobar si la valoración de los episiodios sube*/

SELECT MAX(original_air_date) AS oldest_episode_by_Grath
FROM simpson.episodes
WHERE written_by LIKE "%McGrath%"
ORDER BY original_air_date DESC;

SELECT MAX(original_air_date) AS oldest_episode_by_Obrien
FROM simpson.episodes
WHERE written_by LIKE "%Conan%%Brien%"
ORDER BY original_air_date DESC;


/*Lo mismo puede decirse del trabajo de Dan McGrath y Conan O'Brien como gionistas de los Simpson*/


/*OTRAS QUERIES QUE NO APARECEN EN LA PRESENTACIÓN*/



/*Vamos a evaluar la valoración de los capítulos en imbd por año. */
SELECT YEAR(original_air_date) AS year_on_air , ROUND(AVG(imdb_rating), 2) AS avg_imdb_year, 
COUNT(us_viewers_in_millions) AS millions_viewers_year
FROM simpson.episodes
GROUP BY year_on_air
ORDER BY year_on_air;
/*Si sólo tenemos en cuenta el rating de usuarios por año de imdb (sin hacer media con el de Rotten tomatoes), 
tenemos también una bajada importante a partir del año 1999*/




/*Sería interesante ver si podemos incluir el número de temporadas a las 
Querys anteriores por si obtenemos una mayor información*/
SELECT season, COUNT(id) AS total_episodes
FROM simpson.scores_comparison
GROUP BY season
ORDER BY season ASC;
/*El número de capítulos por temporada ha rondado en torno a unos 20, excepto en la primera temporada y la última 
(esto no es vinculante puesto que no están todos los episodios de la última temporada en la BD)*/



/*Y también los que han tenido un número de espectadores*/
SELECT id, title, season, us_viewers_in_millions, directed_by, written_by
FROM simpson.episodes
WHERE us_viewers_in_millions > 
							(SELECT AVG(us_viewers_in_millions)
							FROM simpson.episodes)
ORDER BY us_viewers_in_millions DESC;

/*A la vista de estos datos si que podemos sospechar que los episodios más vistos no tienen que ser necesariamente los más populares.
Puede que las cadenas que emiten los Simpson EEUU se centren en repetir capítulos antiguos
No obstante, nos faltarían datos para apoyar esta hipótesis*/




