-- =====================================
-- Advanced SQL Practice - Library DB
-- =====================================

-- 1. Clients with more than one order
select Clienti.Nume, count(Comenzi.Client_Id) 
from Clienti 
join Comenzi on Clienti.Id = Comenzi.Client_Id
GROUP BY Clienti.Id, Clienti.Nume 
having count(Comenzi.Client_Id) > 1

-- 2. Total number of orders per client (including clients with zero orders)
select Clienti.Id, Clienti.Nume, count(Comenzi.Client_Id) 
from Clienti 
left join Comenzi on Clienti.Id = Comenzi.Client_Id
GROUP BY Clienti.Id, Clienti.Nume

-- 3. Clients who placed orders in the last 30 days
--SELECT GETDATE();
--select DATEADD(DAY, -30, GETDATE())
--
select distinct Clienti.Id, Clienti.Nume, Comenzi.Data_Comenzii
from Clienti 
join Comenzi on Clienti.Id = Comenzi.Client_Id
WHERE data_Comenzii >= DATEADD(DAY, -30, GETDATE())


-- 4. Clients without orders
select Clienti.Id, Clienti.Nume
from Clienti 
left join Comenzi on Clienti.Id = Comenzi.Client_Id
GROUP BY Clienti.Id, Clienti.Nume
having count(Comenzi.Client_Id) = 0

-- alternative approach using NOT EXIST
select Id, Nume from Clienti
where not exists (select Id from Comenzi where Client_Id = Clienti.Id)
