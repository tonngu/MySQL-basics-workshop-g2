# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
SELECT * FROM city WHERE `Name` like 'ping%' ORDER BY Population ASC;
#
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
SELECT * FROM city where `Name` like 'ran%' ORDER BY population DESC;
#
#
# 3: Count all cities
SELECT count(*) as number_of_cities from city;
#
#
# 4: Get the average population of all cities
SELECT avg(population) as average_population from city;
#
#
# 5: Get the biggest population found in any of the cities
SELECT max(population) as biggest_population from city;
#
#
# 6: Get the smallest population found in any of the cities
SELECT min(population) as smallest_population from city;
#
#
# 7: Sum the population of all cities with a population below 10000
SELECT sum(population) as population_sum from city where population<10000;
#
#
# 8: Count the cities with the countrycodes MOZ and VNM
SELECT count(*) as city_from_MOZ_and_VNM from city where countrycode in ('MOZ', 'VNM');
#
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
SELECT CountryCode,  COUNT(*) AS city_count from city where countrycode in ('MOZ','VNM') group by CountryCode;
#
#
# 10: Get average population of cities in MOZ and VNM
SELECT avg(population) from city where countrycode in ('MOZ','VNM');
SELECT countrycode, avg(population) from city where countrycode in ('MOZ','VNM') group by countrycode;
#
#
# 11: Get the countrycodes with more than 200 cities
SELECT countrycode, count(*) AS city_count from city group by countrycode having city_count >200;
SELECT countrycode
FROM (
    SELECT countrycode, COUNT(*) AS city_count
    FROM city
    GROUP BY countrycode
) AS subquery
WHERE city_count > 200;
#alternative solution by chatGPT
#
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
SELECT countrycode, count(*) AS city_count from city group by countrycode having city_count >200 ORDER BY city_count ASC;
#
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
SELECT c.countrycode, cl.`language` from city c join countrylanguage cl ON c.countrycode = cl.countrycode where c.population between 400 and 500;
#
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
SELECT c.`name`, cl.`language` from city c join countrylanguage cl ON c.countrycode = cl.countrycode where c.population between 500 and 600;
#
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
SELECT `Name` from city where countrycode = (SELECT countrycode from city where population = 122199);
SELECT c1.* from city c1 join city c2 ON c1.countrycode = c2.countrycode where c2.population = 122199;
#
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
SELECT c1.* from city c1 join city c2 ON c1.countrycode = c2.countrycode where c2.population = 122199 AND c1.ID != c2.ID;
#
#
# 17: What are the city names in the country where Luanda is capital?
SELECT c1.`Name` from city c1 join city c2 ON c1.countrycode = c2.countrycode where c2.`Name` like 'Luanda';
SELECT c1.`Name` from city c1 join country c2 ON c1.CountryCode = c2.`Code` where c2.Capital = (SELECT ID FROM city WHERE `Name` = 'Luanda');
#
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
select c1.`Name` from city c1 join country c2 ON c1.countrycode = c2.`Code` where c2.region = 
(select region from country where code = 
(select countrycode from city where `name` = 'Yaren')
);


#
#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
#
#
# 20: Get the name of the most populous city
#
