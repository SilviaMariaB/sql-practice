-- =====================================
-- SQL Practice - Library DB
-- =====================================

--select * from Comenzi 

-- 1. Top 3 clients with most orders
-- Retrieves the clients who have placed the highest number of orders, limited to 3.
select top 3 c.Id, c.Nume, count(co.Client_Id) as NrComenzi
from Clienti c
join Comenzi co on c.Id = co.Client_Id
group by c.Id, c.Nume
order by NrComenzi desc

-- 2. Total number of orders per month
select MONTH(Data_Comenzii) as luna, YEAR(Data_Comenzii) as an, count(*) as NrComenzi
from Comenzi 
group by MONTH(Data_Comenzii), YEAR(Data_Comenzii)
order by an, luna

-- 3. Clients with exactly one order
-- Identifies clients who have placed only one order in the system.
select c.Id, c.Nume
from Clienti c
join Comenzi co on c.Id = co.Client_Id
GROUP BY c.Id, c.Nume 
having count(co.Client_Id) = 1

-- 4. Clients without orders (LEFT JOIN approach)
select c.Id, c.Nume
from Clienti c
left join Comenzi co on c.Id = co.Client_Id
GROUP BY c.Id, c.Nume 
having count(co.Client_Id) = 0

select c.Id, c.Nume
from Clienti c
left join Comenzi co on c.Id = co.Client_Id
where co.Client_Id is null

-- 4b. Clients without orders (NOT EXISTS approach)
select c.Id, c.Nume
from Clienti c
where not exists (
    select 1 
    from Comenzi co
    where co.Client_Id = c.Id
)
