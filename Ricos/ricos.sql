/*EJ 1*/
SELECT * 
FROM ricos01.ricos;

/*EJ 2*/
SELECT DISTINCT country
FROM ricos01.ricos;

/*EJ 3*/
SELECT DISTINCT Industry
FROM ricos01.ricos;

/*EJ 4*/
SELECT Name, net_worth
FROM ricos01.ricos
ORDER BY net_worth DESC
LIMIT 10;

/*EJ 5*/
SELECT AVG(net_worth)
FROM ricos01.ricos;

/*EJ 6*/
SELECT `Rank`, net_worth, Name, country
FROM ricos01.ricos
/*Mejor con símbolos % a ambos lados porque, imaginemos que
se llama "Juan Amancio José Ortega Garona de todos los santos"*/
WHERE (UPPER(Name) LIKE '%AMANCIO%') AND ((UPPER(Name) LIKE '%ORTEGA%'));

/*EJ 7*/
SELECT Name
FROM ricos01.ricos
WHERE (UPPER(Name) LIKE '%ROBERT %') OR (UPPER(Name) LIKE '%ROB %') 
OR (UPPER(Name) LIKE '%BOB %'); #BOB es también diminutivo de Robert

/*EJ 8*/
SELECT Name
FROM ricos01.ricos
WHERE (UPPER(Name) LIKE '%W');

/*EJ 9*/
SELECT Name, Country
FROM ricos01.ricos
WHERE UPPER(Country) LIKE '%SPAIN%';

/*EJ 10*/
SELECT Industry, AVG(net_worth)
FROM ricos01.ricos
GROUP BY Industry;

/*EJ 11*/
SELECT Industry, AVG(net_worth) AS avg_net_worth
FROM ricos01.ricos
GROUP BY Industry
ORDER BY avg_net_worth DESC
LIMIT 5;

/*EJ 12*/
SELECT Country, Industry, SUM(net_worth)
FROM ricos01.ricos
GROUP BY Country, Industry
ORDER BY Country ASC;

/*EJ 13*/
/*Según la consulta anterior ya sabemos que varias personas
entre los más ricos de mundo son del sector tecnológico en china
No obstante hacemos la consulta*/
SELECT Country, Industry
FROM ricos01.ricos
WHERE UPPER(Country) LIKE '%CHINA%';

/*EJ 14*/
SELECT Name, AVG(net_worth)
FROM ricos01.ricos
WHERE UPPER(Name) LIKE 'K%'
GROUP BY Name;