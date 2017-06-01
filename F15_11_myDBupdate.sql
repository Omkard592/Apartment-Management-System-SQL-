--------run a query showing revenue generated per square feet
select (select sum(Amount) as Rev from F15_11_tbla_amount_paid)/(select sum(Area) as Area from F15_11_tbla_apartment) as Rev_Per_SQ_OFF from dual;


------------insert new apartments to show a reduced revenue
insert into F15_11_tbla_apartment(Apt_no,Floor_no,Type,Area,Rent_amt,Furnished,Bld_no) values(501,0,'4BHK',1000,1089,'Furnished',5);
insert into F15_11_tbla_apartment(Apt_no,Floor_no,Type,Area,Rent_amt,Furnished,Bld_no) values(502,0,'4BHK',1000,1089,'Furnished',5);
insert into F15_11_tbla_apartment(Apt_no,Floor_no,Type,Area,Rent_amt,Furnished,Bld_no) values(503,0,'4BHK',1000,1089,'Furnished',5);
insert into F15_11_tbla_apartment(Apt_no,Floor_no,Type,Area,Rent_amt,Furnished,Bld_no) values(504,0,'4BHK',1000,1089,'Furnished',5);
commit;


--------run a query showing changed revenue generated per square feet
select (select sum(Amount) as Rev from F15_11_tbla_amount_paid)/(select sum(Area) as Area from F15_11_tbla_apartment) as Rev_Per_SQ_OFF from dual;


--------update apartments
update F15_11_tbla_apartment set Area=600,Type='1BHK' where Bld_no=5;
commit;

--------run a query showing changed revenue generated per square
select (select sum(Amount) as Rev from F15_11_tbla_amount_paid)/(select sum(Area) as Area from F15_11_tbla_apartment) as Rev_Per_SQ_OFF from dual;


--------delete apartments
delete from F15_11_tbla_apartment where Bld_no=5;
commit;


---------------run a query showing changed revenue generated per square should be same as original value
select (select sum(Amount) as Rev from F15_11_tbla_amount_paid)/(select sum(Area) as Area from F15_11_tbla_apartment) as Rev_Per_SQ_OFF from dual;