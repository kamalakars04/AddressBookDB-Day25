--UC 13 Recheck the previous UC
use Address_BookDB

--Rechecking UC 6 - To retrieve data of a particular city or state
select * from contactdetails CD
inner join ZipTable Z on Z.Zip = CD.Zip

--Rechecking UC 7 - Count in Book by city or state
select count(*),city from contactdetails C
inner join ZipTable Z on Z.zip = C.zip
group by Z.city

--Rechecking UC 8- Contacts of a city sorted alphabetically
select * from contactdetails C
Inner join ZipTable Z on Z.Zip = C.Zip
order by C.FirstName,C.LastName 

--Rechecking UC 10- No of contact persons
select count(*) from contactdetails
