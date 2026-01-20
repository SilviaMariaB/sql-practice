-- ===============================
-- SQL Practice: Library Database
-- ===============================

-- 1. Select all clients
SELECT * FROM Clienti;

-- 2. Select all orders
SELECT * FROM Comenzi;

-- 3. Select all clients who have placed orders
SELECT DISTINCT c.Id, c.Nume, c.Email
FROM Clienti c
INNER JOIN Comenzi co ON c.Id = co.Client_Id;

-- 4. LEFT JOIN practice
SELECT c.Id, c.Nume, co.Client_Id
FROM Clienti c
LEFT JOIN Comenzi co ON c.Id = co.Client_Id;

-- 5. Clients who have NOT placed orders
SELECT c.Id, c.Nume, c.Email
FROM Clienti c
LEFT JOIN Comenzi co ON c.Id = co.Client_Id
WHERE co.Client_Id IS NULL;

-- 6. Count practice: number of orders per client
SELECT Client_Id, COUNT(*) AS NrComenzi
FROM Comenzi
GROUP BY Client_Id
HAVING COUNT(*) = 1;

-- 7. Clients who have EXACTLY one order (subquery)
SELECT *
FROM Clienti c
WHERE (
    SELECT COUNT(*)
    FROM Comenzi co
    WHERE co.Client_Id = c.Id
) = 1;

-- 8. Clients who have EXACTLY one order (GROUP BY + HAVING)
SELECT c.Id, c.Nume, c.Email
FROM Clienti c
JOIN Comenzi co ON c.Id = co.Client_Id
GROUP BY c.Id, c.Nume, c.Email
HAVING COUNT(*) = 1;

-- Notes:
-- WHERE filters before grouping
-- HAVING filters after grouping