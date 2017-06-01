----Query 1 Display the revenue generated per square feet.


select (select sum(Amount) as Rev from F15_11_tbla_amount_paid)/
(select sum(Area) as Area from F15_11_tbla_apartment) as Revenue_Per_SQ_FT from dual;





-----Query 2 Determine which employee processed the highest rent payments.


SELECT First_name
FROM F15_11_tbla_person 
WHERE P_ID IN (
	SELECT E_P_ID
	FROM F15_11_tbla_amount_paid 
	GROUP BY E_P_ID
	HAVING COUNT(amount) >= ALL(
		SELECT COUNT(amount)
		FROM F15_11_tbla_amount_paid 
		GROUP BY E_P_ID)
	);




--------Query 3 Determine which apartment type generated the highest revenue.

select * from (select A.Apt_no,sum(AP.Amount) as Revenue from F15_11_tbla_amount_paid AP inner join F15_11_tbla_tenant T on T.T_P_ID=AP.T_P_ID
 inner join F15_11_tbla_apartment A on A.Apt_no = T.Ten_Apt_no 
group by A.Apt_no order by Revenue desc) where rownum=1;





--------Query 4 Determine which apartment type generated the highest revenue.

SELECT U_Type,sum(Cost_per_unit*(End_reading-Start_reading)) as Cost_Of_utility
	FROM F15_11_tbla_utility 
	GROUP BY U_Type
	HAVING sum(Cost_per_unit*(End_reading-Start_reading)) >= ALL(
		SELECT sum(Cost_per_unit*(End_reading-Start_reading))
		FROM F15_11_tbla_utility 
		GROUP BY U_Type);




--------Query 5 Determine what type of apartments the residents prefer the most.

SELECT Type
FROM F15_11_tbla_apartment
WHERE Apt_no IN (
	SELECT Ten_Apt_no
	FROM F15_11_tbla_tenant 
	GROUP BY Ten_Apt_no
	HAVING count(T_P_ID) >= ALL(
		SELECT count(T_P_ID)
		FROM F15_11_tbla_tenant 
		GROUP BY Ten_Apt_no)
	);






--------Query 6 Determine if the resident prefer furnished apartments or unfurnished also the number of tenants for the option.
select Furnished as type, count(T_P_ID) as number_of_tenants from F15_11_tbla_tenant inner join F15_11_tbla_apartment on Ten_Apt_no = Apt_no
group by Furnished;







--------Query 7 Determine the number of residents on each floor.
Select Floor_no,count(T_P_ID) as number_of_residents from F15_11_tbla_apartment 
inner join F15_11_tbla_tenant on Apt_no=Ten_Apt_no
group by Floor_no order by Floor_no;







--------Query 8 Determine the total number of furnished or unfurnished apartments on the whole property


update F15_11_tbla_apartment set Furnished = 'Unfurnished' where Apt_no in (103,303,203,403);



select Furnished, count(Apt_no) as number_of_apt from F15_11_tbla_apartment  group by Furnished;

	
update F15_11_tbla_apartment set Furnished = 'Furnished' where Apt_no in (103,303,203,403);








--------Query 9 Determine which employee processed the maintenance requests and how many.

select First_name, count(RD.E_P_ID) as number_of_req from F15_11_tbla_request_details RD 
inner join F15_11_tbla_employee E on E.E_P_ID=RD.E_P_ID 
inner join F15_11_tbla_person on P_ID=E.E_P_ID
 group by First_name;



