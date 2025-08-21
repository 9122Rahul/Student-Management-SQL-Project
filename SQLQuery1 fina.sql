use coremodule

CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL UNIQUE,
    Industry VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL,
    Contact VARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO Companies (CompanyID, Name, Industry, Location, Contact) 
VALUES
(1, 'TCS', 'IT Services', 'Mumbai', 'tcs.hr@tcs.com'),
(2, 'Infosys', 'Consulting', 'Bangalore', 'hr@infosys.com'),
(3, 'Wipro', 'Software', 'Hyderabad', 'careers@wipro.com'),
(4, 'HDFC Bank', 'Banking', 'Delhi', 'jobs@hdfc.com'),
(5, 'Amazon', 'E-commerce', 'Pune', 'hiring@amazon.com');

CREATE TABLE Jobs (
    JobID INT PRIMARY KEY,
    CompanyID INT NOT NULL,
    Role VARCHAR(100) NOT NULL,
    SalaryPackage DECIMAL(10,2) NOT NULL CHECK (SalaryPackage > 0),
    Location VARCHAR(100) NOT NULL,
    Openings INT NOT NULL CHECK (Openings > 0),
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
);

INSERT INTO Jobs (JobID, CompanyID, Role, SalaryPackage, Location, Openings) 
VALUES
(1, 1, 'Software Engineer', 600000.00, 'Mumbai', 10),
(2, 2, 'System Analyst', 750000.00, 'Bangalore', 5),
(3, 3, 'Data Analyst', 550000.00, 'Hyderabad', 8),
(4, 4, 'Finance Associate', 500000.00, 'Delhi', 4),
(5, 5, 'Cloud Engineer', 900000.00, 'Pune', 6);


CREATE TABLE Applications (
    AppID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    JobID INT NOT NULL,
    ApplyDate DATE NOT NULL,
    Status VARCHAR(20) CHECK (Status IN ('Applied','Shortlisted','Rejected','Selected')),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID)
);

INSERT INTO Applications (AppID, StudentID, JobID, ApplyDate, Status) 
VALUES
(1, 1, 1, '2025-07-01', 'Applied'),
(2, 2, 2, '2025-07-02', 'Shortlisted'),
(3, 3, 3, '2025-07-03', 'Applied'),
(4, 4, 4, '2025-07-04', 'Rejected'),
(5, 5, 5, '2025-07-05', 'Selected'),
(6, 6, 1, '2025-07-06', 'Applied'),
(7, 7, 2, '2025-07-07', 'Applied'),
(8, 8, 3, '2025-07-08', 'Shortlisted'),
(9, 9, 4, '2025-07-09', 'Applied'),
(10, 10, 5, '2025-07-10', 'Applied');

CREATE TABLE Interviews (
   InterviewID INT PRIMARY KEY,
    AppID INT NOT NULL,
    RoundNo INT NOT NULL CHECK (RoundNo > 0),
    Result VARCHAR(20) CHECK (Result IN ('Pass','Fail','Pending')),
    InterviewDate DATE NOT NULL,
    FOREIGN KEY (AppID) REFERENCES Applications(AppID)
);
INSERT INTO Interviews (InterviewID, AppID, RoundNo, Result, InterviewDate) 
VALUES
(1, 2, 1, 'Pass', '2025-07-15'),
(2, 2, 2, 'Pending', '2025-07-20'),
(3, 5, 1, 'Pass', '2025-07-12'),
(4, 5, 2, 'Pass', '2025-07-18'),
(5, 8, 1, 'Fail', '2025-07-16'),
(6, 8, 2, 'Pending', '2025-07-22'),
(7, 1, 1, 'Fail', '2025-07-14'),
(8, 3, 1, 'Pass', '2025-07-17'),
(9, 6, 1, 'Pending', '2025-07-19'),
(10, 7, 1, 'Fail', '2025-07-21');





CREATE TABLE Offers (
    OfferID INT PRIMARY KEY,
    AppID INT NOT NULL,
    Salary DECIMAL(10,2) NOT NULL CHECK (Salary > 0),
    JoiningDate DATE NOT NULL,
    Status VARCHAR(20) CHECK (Status IN ('Accepted','Pending','Declined')),
    FOREIGN KEY (AppID) REFERENCES Applications(AppID)
);

INSERT INTO Offers (OfferID, AppID, Salary, JoiningDate, Status) VALUES
(1, 5, 950000.00, '2025-08-01', 'Accepted'),
(2, 2, 800000.00, '2025-08-05', 'Pending'),
(3, 3, 600000.00, '2025-08-10', 'Declined'),
(4, 8, 580000.00, '2025-08-12', 'Pending'),
(5, 1, 650000.00, '2025-08-15', 'Accepted');
