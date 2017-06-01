-----------------Person Table


CREATE TABLE F15_11_tbla_person (
  P_ID int NOT NULL,
  First_name varchar(20) NOT NULL,
  Middle_name varchar(20) DEFAULT NULL,
  Last_Name varchar(20) NOT NULL,
  DOB date DEFAULT NULL,
  Gender varchar(15) NOT NULL,
  PRIMARY KEY(P_ID)
);




-------------------Apartment Table


CREATE TABLE F15_11_tbla_apartment (
  Apt_no int NOT NULL,
  Floor_no int NOT NULL,
  Type varchar(5) DEFAULT NULL,
  Area float DEFAULT NULL,
  Rent_amt float NOT NULL,
  Furnished varchar(15) DEFAULT 'Furnished',
  Bld_no int NOT NULL,
  PRIMARY KEY (Apt_no)
);




-------------------Tenant Table



CREATE TABLE F15_11_tbla_tenant (
  T_P_ID int NOT NULL,
  Major varchar(45) DEFAULT NULL,
  Classification varchar(45) DEFAULT NULL,
  Sign_date date DEFAULT NULL,
  From_date date DEFAULT NULL,
  To_date date DEFAULT NULL,
  Termination_date date DEFAULT NULL,
  Termination_reason varchar(100) DEFAULT NULL,
  Ten_Apt_no int NOT NULL,
  PRIMARY KEY (T_P_ID),
  CONSTRAINT FKK_Ten_Apt FOREIGN KEY (Ten_Apt_no) 
  REFERENCES F15_11_tbla_apartment (Apt_no),
  CONSTRAINT FKK_Ten_Per FOREIGN KEY (T_P_ID) 
  REFERENCES F15_11_tbla_person (P_ID)
);




------------------------Employee Table


CREATE TABLE F15_11_tbla_employee (
  E_P_ID int NOT NULL,
  E_Type varchar(15) DEFAULT NULL,
  Salary int DEFAULT NULL,
  PRIMARY KEY (E_P_ID),
  CONSTRAINT FKK_Emp_Per FOREIGN KEY (E_P_ID)
  REFERENCES F15_11_tbla_person (P_ID)
);




----------------Utility Table


create TABLE F15_11_tbla_utility (
  Month varchar(10) NOT NULL,
  Year int NOT NULL,
  U_Type varchar(15) NOT NULL,
  Cost_per_unit decimal(3,2) NOT NULL,
  Start_reading int,
  End_reading int,
  Remaining_qty int DEFAULT NULL,
  U_P_ID int NOT NULL,
  PRIMARY KEY (Month,Year,U_Type,U_P_ID),
  CHECK (End_reading >= Start_reading),
  CONSTRAINT FKK_Uti_Per FOREIGN KEY (U_P_ID) REFERENCES F15_11_tbla_person (P_ID));





------------------Amount Paid Table


CREATE TABLE F15_11_tbla_amount_paid (
  T_P_ID int NOT NULL,
  E_P_ID int NOT NULL,
  Amount int NOT NULL,
  AP_Date Date NOT NULL,
  CONSTRAINT FKK_Amt_Emp FOREIGN KEY (E_P_ID) REFERENCES F15_11_tbla_employee (E_P_ID),
  CONSTRAINT FKK_Amt_Ten FOREIGN KEY (T_P_ID) REFERENCES F15_11_tbla_tenant (T_P_ID)
);




-------------------------Request_Details


CREATE TABLE F15_11_tbla_request_details (
  T_P_ID int NOT NULL,
  E_P_ID int NOT NULL,
  M_Type varchar(20) NOT NULL,
  M_Date date NOT NULL,
  Description varchar(100) DEFAULT NULL,
  CONSTRAINT FKK_Req_Emp FOREIGN KEY (E_P_ID) REFERENCES F15_11_tbla_employee (E_P_ID),
  CONSTRAINT FKK_Req_Ten FOREIGN KEY (T_P_ID) REFERENCES F15_11_tbla_tenant (T_P_ID)
);

