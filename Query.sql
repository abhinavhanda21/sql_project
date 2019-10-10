CREATE TABLE Employee(
  Emp_ID int PRIMARY KEY,
  Name varchar(255),
  Type varchar(255),
  Project int,
  address varchar(255),
  Current_address varchar(255)
  );

CREATE TABLE Project(
  Proj_ID int PRIMARY KEY,
  Name varchar(255),
  sen_consultants int,
  consultants int,
  programmers int,
  contractors int
  );


CREATE TABLE employee_project_junction 
(
  Emp_ID int,
  Proj_ID int
  );

alter table employee_project_junction add primary key (Emp_ID, Proj_ID);

ALTER TABLE employee_project_junction ADD CONSTRAINT emp_proj_junction_pk FOREIGN KEY (Emp_ID) REFERENCES Employee (Emp_Id);

CREATE TABLE Attendance
(
  Emp_ID   INT,
  date    DATE,
  begin_time INT,
  end_time  INT,
  HOLIDAY  INT,
  Leaves   INT,
  CONSTRAINT FK_emp_id
    FOREIGN KEY (Emp_ID)
      REFERENCES Employee (Emp_ID)
);

CREATE TABLE Leaves
(
  Emp_ID INT,
  L_Type VARCHAR(255),
  date  DATETIME,
  CONSTRAINT FK_attendance
    FOREIGN KEY (Emp_ID)
      REFERENCES Attendance (Emp_ID)
);

CREATE TABLE Billable_hours
(
  Emp_ID INT,
  Proj_ID INT,
  Hours  INT,
  date  DATE,
  CONSTRAINT fk_employee
    FOREIGN KEY (Emp_ID)
      REFERENCES Employee (Emp_ID),
  CONSTRAINT FK_project
    FOREIGN KEY (Proj_ID)
      REFERENCES Project (Proj_ID)

);



CREATE TABLE Billable_rate
(
  Proj_ID     INT PRIMARY KEY,
  sen_consultants INT,
  consultants   INT,
  programmers   INT,
  contractors   INT,
  CONSTRAINT FK_project
    FOREIGN KEY (Proj_ID)
      REFERENCES Project (Proj_ID)
);
