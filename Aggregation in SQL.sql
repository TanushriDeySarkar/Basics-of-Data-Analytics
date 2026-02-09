USE world;
-- Count how many cities are there in each country?
SELECT CountryCode,COUNT(City_ID) Total_city
FROM city
GROUP BY CountryCode 
order by CountryCode;

-- Display all continents having more than 30 countries.
SELECT Continent, COUNT(Code) Total_Country
FROM country
GROUP BY Continent
HAVING Total_Country >30
ORDER BY Continent;

-- List regions whose total population exceeds 200 million.
SELECT Region, Population
FROM country
WHERE population >200000000
ORDER BY Population;

-- Find the top 5 continents by average GNP per country
SELECT Continent, Avg(GNP) Avg_GNP
FROM country
GROUP BY Continent
ORDER BY Avg_GNP DESC
LIMIT 5;

-- Find the total number of official languages spoken in each continent.
select continent,Count(DISTINCT Language) Total_Ofc_Lan
FROM country c
JOIN countrylanguage cl
ON c.code =cl.Countrycode
WHERE IsOfficial = 'T'
GROUP BY continent
ORDER BY Total_Ofc_Lan DESC;

-- Find the maximum and minimum GNP for each continent.
select continent,MIN(GNP)min_GNP,MAX(GNP) max_GNP
FROM country
GROUP BY continent
ORDER BY continent;

--  Find the country with the highest average city population.
SELECT CountryCode,AVG(population) avg_pop
FROM city
GROUP BY CountryCode
ORDER BY avg_pop DESC
LIMIT 1;

-- List continents where the average city population is greater than 200,000.
SELECT continent,AVG(ci.population) Total_Avg_Pop
FROM country c
left join city ci
ON c.code = ci.countrycode
GROUP BY continent
HAVING Total_Avg_Pop >200000;

-- Find the total population and average life expectancy for each continent, ordered by average life expectancy descending.
SELECT continent,SUM(population) total_population,AVG(lifeExpectancy) avg_lifeexp
FROM country
GROUP BY continent
ORDER BY avg_lifeexp DESC;

-- Find the top 3 continents with the highest average life expectancy, but only include those where the total population is over 200 million.
SELECT continent,SUM(population) Total_pop, AVG(lifeexpectancy) Avg_Lifeexp
FROM country
GROUP BY continent
HAVING Total_pop >200000000
ORDER BY Avg_Lifeexp DESC
LIMIT 3;