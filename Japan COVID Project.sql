SELECT *
FROM japan2022
Order by 1,2;

SELECT *
FROM population
Order by 1;

-- Select data that we are going to be using
SELECT Date, japan2022.Prefecture, population.Population, japan2022.Tested, japan2022.Positive, japan2022.Fatal
FROM japan2022
INNER JOIN population ON japan2022.Prefecture = population.prefecture;

-- Use new combined table
SELECT *
FROM japancovid;

-- Looking at Total Positives vs Total Fatals
-- Shows likelyhood if you contract covid in a prefecture
SELECT Date, Prefecture, Positive, Fatal, (Fatal/Positive)*100 as FatalPercentage
FROM japancovid
ORDER BY 1, 2;

-- Looking at Total Positives vs Population
-- Shows percentage of population who got covid
SELECT date, Prefecture, Population, Positive, (Positive/population)*100 as PositivePercentage
FROM japancovid
ORDER BY 1, 2;

-- Showing prefectures with highest infection rate compared to population
SELECT Prefecture, MAX(Positive) AS HighestPositiveCount, MAX((Positive/population))*100 as PositivePercentage
FROM japancovid
GROUP BY Prefecture, Population
ORDER BY PositivePercentage DESC;

-- Showing prefectures with highest deathcount per population
SELECT Prefecture, MAX(Fatal) AS HighestFatalCount , (MAX(Fatal)/Max(Positive))*100 AS DeathPercentageOfInfected
FROM japancovid
GROUP BY Prefecture, Population
ORDER BY HighestFatalCount DESC;

-- Total Numbers for All of Japan
SELECT date, SUM(positive) AS TotalPositives, SUM(fatal) AS TotalFatals, (SUM(fatal)/SUM(positive))*100 AS FatalPercentage 
FROM japancovid
GROUP BY date;

-- Total Status For the Year (Includes 2021+2020 numbers)
SELECT SUM(positive) AS TotalPositives, SUM(fatal) AS TotalFatals, (SUM(fatal)/SUM(positive))*100 AS FatalPercentage 
FROM japancovid;

-- Creating view to store data for later data visualizations
CREATE VIEW Total_Positive_vs_Total_Fatals AS
SELECT Date, Prefecture, Positive, Fatal, (Fatal/Positive)*100 as FatalPercentage
FROM japancovid
ORDER BY 1, 2;

CREATE VIEW Total_Positives_vs_Population AS
SELECT date, Prefecture, Population, Positive, (Positive/population)*100 as PositivePercentage
FROM japancovid
ORDER BY 1, 2;

CREATE VIEW Prefectures_with_highest_infection_rate AS
SELECT Prefecture, MAX(Positive) AS HighestPositiveCount, MAX((Positive/population))*100 as PositivePercentage
FROM japancovid
GROUP BY Prefecture, Population
ORDER BY PositivePercentage DESC;

CREATE VIEW prefectures_with_highest_deathcount AS
SELECT Prefecture, MAX(Fatal) AS HighestFatalCount , (MAX(Fatal)/Max(Positive))*100 AS DeathPercentageOfInfected
FROM japancovid
GROUP BY Prefecture, Population
ORDER BY HighestFatalCount DESC;

CREATE VIEW total_for_japan AS
SELECT date, SUM(positive) AS TotalPositives, SUM(fatal) AS TotalFatals, (SUM(fatal)/SUM(positive))*100 AS FatalPercentage 
FROM japancovid
GROUP BY date;

CREATE VIEW Total_Status_Year AS
SELECT SUM(positive) AS TotalPositives, SUM(fatal) AS TotalFatals, (SUM(fatal)/SUM(positive))*100 AS FatalPercentage 
FROM japancovid;
