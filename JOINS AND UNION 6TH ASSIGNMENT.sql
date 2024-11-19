SELECT Country.Id, Country.Country_name AS CountryTable, Persons.Fname, Persons.Lname
FROM Country
INNER JOIN Persons
ON Country.Id = Persons.Country_Id;
SELECT Country.Id, Country.Country_name AS CountryTable, Persons.Fname, Persons.Lname
FROM Country
LEFT JOIN Persons
ON Country.Id = Persons.Country_Id;
SELECT Persons.Id, Persons.Country_name AS PersonsTable, Country.Country_name AS CountryTable
FROM Persons
LEFT JOIN Country
ON Country.Id = Persons.Country_Id;
SELECT Persons.Id, Persons.Country_name AS PersonsTable, Country.Country_name AS CountryTable
FROM Country
RIGHT JOIN Persons
ON Country.Id = Persons.Country_Id;
SELECT DISTINCT Country_name
FROM (
    SELECT Country_name FROM Country
    UNION
    SELECT Country_name FROM Persons
) AS CombinedCountries;
SELECT Country_name
FROM Country
UNION ALL
SELECT Country_name
FROM Persons;
UPDATE Persons
SET Rating = ROUND(Rating);
SELECT Fname, Lname, Rating
FROM Persons;
