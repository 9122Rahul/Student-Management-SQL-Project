create database coremodule;

use coremodule;

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL UNIQUE,
    DurationMonths INT NOT NULL CHECK (DurationMonths > 0),
    FeeAmount DECIMAL(10,2) NOT NULL CHECK (FeeAmount > 0)
);

INSERT INTO Courses (CourseID, CourseName, DurationMonths, FeeAmount) 
VALUES
(1, 'Java Full Stack Development', 6, 30000.00),
(2, 'Python for Data Science', 6, 35000.00),
(3, 'Web Development (HTML, CSS, JS, React)', 4, 25000.00),
(4, 'Cloud Computing with AWS & Azure', 5, 40000.00),
(5, 'Digital Marketing & SEO', 3, 20000.00);

CREATE TABLE Trainers (
    TrainerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Expertise VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO Trainers 
VALUES
(1,'Amit Sharma','Java','9876543210','amit@gmail.com'),
(2,'Neha Gupta','Python','9876543211','neha@gmail.com'),
(3,'Ravi Mehta','Web','9876543212','ravi@gmail.com'),
(4,'Pooja Singh','Cloud','9876543213','pooja@gmail.com'),
(5,'Arjun Rao','Marketing','9876543214','arjun@gmail.com');


CREATE TABLE Batches (
    BatchID INT PRIMARY KEY,
    CourseID INT NOT NULL,
    TrainerID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TimeSlot VARCHAR(50) NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (TrainerID) REFERENCES Trainers(TrainerID),
    CHECK (EndDate > StartDate)
    );
    
INSERT INTO Batches (BatchID, CourseID, TrainerID, StartDate, EndDate, TimeSlot) VALUES
(1, 1, 1, '2025-01-01', '2025-06-30', 'Morning'),   -- JAVA FULL STACK BY AMIT
(2, 2, 2, '2025-01-15', '2025-07-15', 'Evening'),   -- Python DS by Neha
(3, 3, 3, '2025-02-01', '2025-05-31', 'Afternoon'), -- Web Dev by Ravi
(4, 4, 4, '2025-03-01', '2025-08-01', 'Morning'),   -- Cloud by Pooja
(5, 5, 5, '2025-03-15', '2025-06-15', 'Evening');   -- Digital Marketing by Arjun

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    Address VARCHAR(255),
    DOJ DATE NOT NULL,
    CourseID INT NOT NULL,
    BatchID INT NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (BatchID) REFERENCES Batches(BatchID)
);


INSERT INTO Students (StudentID, Name, Email, Phone, Address, DOJ, CourseID, BatchID)

VALUES

(1, 'Rahul Verma', 'rahul1@gmail.com', '9000000001', 'Delhi', '2025-01-05', 1, 1),
(2, 'Sneha Kapoor', 'sneha2@gmail.com', '9000000002', 'Mumbai', '2025-01-06', 1, 1),
(3, 'Arjun Mehta', 'arjun3@gmail.com', '9000000003', 'Bangalore', '2025-01-07', 1, 1),
(4, 'Priya Singh', 'priya4@gmail.com', '9000000004', 'Hyderabad', '2025-01-08', 1, 1),
(5, 'Rohit Sharma', 'rohit5@gmail.com', '9000000005', 'Chennai', '2025-01-09', 1, 1),

(6, 'Kiran Yadav', 'kiran6@gmail.com', '9000000006', 'Pune', '2025-01-15', 2, 2),
(7, 'Divya Nair', 'divya7@gmail.com', '9000000007', 'Delhi', '2025-01-16', 2, 2),
(8, 'Vikram Rao', 'vikram8@gmail.com', '9000000008', 'Mumbai', '2025-01-17', 2, 2),
(9, 'Meena Iyer', 'meena9@gmail.com', '9000000009', 'Kolkata', '2025-01-18', 2, 2),
(10, 'Sahil Khan', 'sahil10@gmail.com', '9000000010', 'Bangalore', '2025-01-19', 2, 2),

(11, 'Pooja Sharma', 'pooja11@gmail.com', '9000000011', 'Chandigarh', '2025-02-02', 3, 3),
(12, 'Anil Kumar', 'anil12@gmail.com', '9000000012', 'Lucknow', '2025-02-03', 3, 3),
(13, 'Neeraj Gupta', 'neeraj13@gmail.com', '9000000013', 'Patna', '2025-02-04', 3, 3),
(14, 'Swati Chauhan', 'swati14@gmail.com', '9000000014', 'Jaipur', '2025-02-05', 3, 3),
(15, 'Kunal Thakur', 'kunal15@gmail.com', '9000000015', 'Nagpur', '2025-02-06', 3, 3),

(16, 'Ritu Sharma', 'ritu16@gmail.com', '9000000016', 'Delhi', '2025-03-02', 4, 4),
(17, 'Aditya Jain', 'aditya17@gmail.com', '9000000017', 'Mumbai', '2025-03-03', 4, 4),
(18, 'Nisha Agarwal', 'nisha18@gmail.com', '9000000018', 'Kolkata', '2025-03-04', 4, 4),
(19, 'Harshit Sinha', 'harshit19@gmail.com', '9000000019', 'Pune', '2025-03-05', 4, 4),
(20, 'Tanvi Desai', 'tanvi20@gmail.com', '9000000020', 'Hyderabad', '2025-03-06', 4, 4),

(21, 'Alok Sharma', 'alok21@gmail.com', '9000000021', 'Delhi', '2025-03-16', 5, 5),
(22, 'Simran Kaur', 'simran22@gmail.com', '9000000022', 'Chennai', '2025-03-17', 5, 5),
(23, 'Deepak Yadav', 'deepak23@gmail.com', '9000000023', 'Lucknow', '2025-03-18', 5, 5),
(24, 'Shreya Joshi', 'shreya24@gmail.com', '9000000024', 'Jaipur', '2025-03-19', 5, 5),
(25, 'Mohit Bansal', 'mohit25@gmail.com', '9000000025', 'Bangalore', '2025-03-20', 5, 5),

(26, 'Nikhil Verma', 'nikhil26@gmail.com', '9000000026', 'Delhi', '2025-04-01', 1, 1),
(27, 'Ananya Sen', 'ananya27@gmail.com', '9000000027', 'Kolkata', '2025-04-02', 1, 1),
(28, 'Varun Khanna', 'varun28@gmail.com', '9000000028', 'Mumbai', '2025-04-03', 1, 1),
(29, 'Preeti Rao', 'preeti29@gmail.com', '9000000029', 'Pune', '2025-04-04', 1, 1),
(30, 'Aakash Patel', 'aakash30@gmail.com', '9000000030', 'Ahmedabad', '2025-04-05', 1, 1),

(31, 'Manisha Yadav', 'manisha31@gmail.com', '9000000031', 'Lucknow', '2025-04-10', 2, 2),
(32, 'Rakesh Sharma', 'rakesh32@gmail.com', '9000000032', 'Delhi', '2025-04-11', 2, 2),
(33, 'Shalini Gupta', 'shalini33@gmail.com', '9000000033', 'Bhopal', '2025-04-12', 2, 2),
(34, 'Yash Dubey', 'yash34@gmail.com', '9000000034', 'Jaipur', '2025-04-13', 2, 2),
(35, 'Komal Nair', 'komal35@gmail.com', '9000000035', 'Hyderabad', '2025-04-14', 2, 2),

(36, 'Saurabh Singh', 'saurabh36@gmail.com', '9000000036', 'Kanpur', '2025-04-20', 3, 3),
(37, 'Megha Chauhan', 'megha37@gmail.com', '9000000037', 'Delhi', '2025-04-21', 3, 3),
(38, 'Rajeev Rathi', 'rajeev38@gmail.com', '9000000038', 'Mumbai', '2025-04-22', 3, 3),
(39, 'Ishita Das', 'ishita39@gmail.com', '9000000039', 'Kolkata', '2025-04-23', 3, 3),
(40, 'Amitabh Ghosh', 'amitabh40@gmail.com', '9000000040', 'Pune', '2025-04-24', 3, 3),

(41, 'Ravindra Patil', 'ravindra41@gmail.com', '9000000041', 'Nagpur', '2025-05-01', 4, 4),
(42, 'Sanya Malhotra', 'sanya42@gmail.com', '9000000042', 'Delhi', '2025-05-02', 4, 4),
(43, 'Dhruv Kapoor', 'dhruv43@gmail.com', '9000000043', 'Chennai', '2025-05-03', 4, 4),
(44, 'Kritika Sharma', 'kritika44@gmail.com', '9000000044', 'Mumbai', '2025-05-04', 4, 4),
(45, 'Gaurav Saxena', 'gaurav45@gmail.com', '9000000045', 'Hyderabad', '2025-05-05', 4, 4),

(46, 'Siddharth Jain', 'siddharth46@gmail.com', '9000000046', 'Delhi', '2025-05-10', 5, 5),
(47, 'Anushka Reddy', 'anushka47@gmail.com', '9000000047', 'Hyderabad', '2025-05-11', 5, 5),
(48, 'Manoj Tiwari', 'manoj48@gmail.com', '9000000048', 'Lucknow', '2025-05-12', 5, 5),
(49, 'Rashi Gupta', 'rashi49@gmail.com', '9000000049', 'Kolkata', '2025-05-13', 5, 5),
(50, 'Abhay Sharma', 'abhay50@gmail.com', '9000000050', 'Bhopal', '2025-05-14', 5, 5);

CREATE TABLE Enrollments (
    EnrollID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    BatchID INT NOT NULL,
    EnrollDate DATE NOT NULL,
    Status VARCHAR(20) CHECK (Status IN ('Active','Completed','Cancelled')),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (BatchID) REFERENCES Batches(BatchID)
);


INSERT INTO Enrollments (EnrollID, StudentID, BatchID, EnrollDate, Status) 

VALUES

(1, 1, 1, '2025-01-05', 'Active'),
(2, 2, 1, '2025-01-06', 'Active'),
(3, 3, 1, '2025-01-07', 'Active'),
(4, 4, 1, '2025-01-08', 'Completed'),
(5, 5, 1, '2025-01-09', 'Cancelled'),

(6, 6, 2, '2025-01-15', 'Active'),
(7, 7, 2, '2025-01-16', 'Active'),
(8, 8, 2, '2025-01-17', 'Completed'),
(9, 9, 2, '2025-01-18', 'Cancelled'),
(10, 10, 2, '2025-01-19', 'Active'),

(11, 11, 3, '2025-02-02', 'Active'),
(12, 12, 3, '2025-02-03', 'Active'),
(13, 13, 3, '2025-02-04', 'Cancelled'),
(14, 14, 3, '2025-02-05', 'Completed'),
(15, 15, 3, '2025-02-06', 'Active'),

(16, 16, 4, '2025-03-02', 'Active'),
(17, 17, 4, '2025-03-03', 'Completed'),
(18, 18, 4, '2025-03-04', 'Active'),
(19, 19, 4, '2025-03-05', 'Cancelled'),
(20, 20, 4, '2025-03-06', 'Active'),

(21, 21, 5, '2025-03-16', 'Active'),
(22, 22, 5, '2025-03-17', 'Completed'),
(23, 23, 5, '2025-03-18', 'Active'),
(24, 24, 5, '2025-03-19', 'Cancelled'),
(25, 25, 5, '2025-03-20', 'Active'),

(26, 26, 1, '2025-04-01', 'Active'),
(27, 27, 1, '2025-04-02', 'Completed'),
(28, 28, 1, '2025-04-03', 'Active'),
(29, 29, 1, '2025-04-04', 'Cancelled'),
(30, 30, 1, '2025-04-05', 'Active'),

(31, 31, 2, '2025-04-10', 'Active'),
(32, 32, 2, '2025-04-11', 'Completed'),
(33, 33, 2, '2025-04-12', 'Active'),
(34, 34, 2, '2025-04-13', 'Active'),
(35, 35, 2, '2025-04-14', 'Cancelled'),

(36, 36, 3, '2025-04-20', 'Active'),
(37, 37, 3, '2025-04-21', 'Completed'),
(38, 38, 3, '2025-04-22', 'Active'),
(39, 39, 3, '2025-04-23', 'Active'),
(40, 40, 3, '2025-04-24', 'Cancelled'),

(41, 41, 4, '2025-05-01', 'Active'),
(42, 42, 4, '2025-05-02', 'Active'),
(43, 43, 4, '2025-05-03', 'Completed'),
(44, 44, 4, '2025-05-04', 'Active'),
(45, 45, 4, '2025-05-05', 'Cancelled'),

(46, 46, 5, '2025-05-10', 'Active'),
(47, 47, 5, '2025-05-11', 'Completed'),
(48, 48, 5, '2025-05-12', 'Active'),
(49, 49, 5, '2025-05-13', 'Active'),
(50, 50, 5, '2025-05-14', 'Cancelled');

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    AmountPaid DECIMAL(10,2) NOT NULL CHECK (AmountPaid > 0),
    PaymentDate DATE NOT NULL,
    Mode VARCHAR(20) CHECK (Mode IN ('Cash','UPI','Card','NetBanking')),
    Remark VARCHAR(255),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Payments (PaymentID, StudentID, AmountPaid, PaymentDate, Mode, Remark) 
VALUES
(1, 1, 30000, '2025-01-10', 'UPI', 'First Installment'),
(2, 2, 45000, '2025-01-11', 'Card', 'Full Payment'),
(3, 3, 20000, '2025-01-12', 'Cash', 'First Installment'),
(4, 4, 25000, '2025-01-13', 'NetBanking', 'First Installment'),
(5, 5, 50000, '2025-01-14', 'UPI', 'Full Payment'),

(6, 6, 30000, '2025-01-20', 'UPI', 'First Installment'),
(7, 7, 15000, '2025-01-21', 'Cash', 'First Installment'),
(8, 8, 40000, '2025-01-22', 'Card', 'Full Payment'),
(9, 9, 25000, '2025-01-23', 'NetBanking', 'Pending Balance'),
(10, 10, 50000, '2025-01-24', 'UPI', 'Full Payment'),

(11, 11, 20000, '2025-02-01', 'Cash', 'First Installment'),
(12, 12, 30000, '2025-02-02', 'UPI', 'First Installment'),
(13, 13, 40000, '2025-02-03', 'Card', 'Full Payment'),
(14, 14, 45000, '2025-02-04', 'NetBanking', 'Full Payment'),
(15, 15, 35000, '2025-02-05', 'UPI', 'Partial Payment'),

(16, 16, 25000, '2025-02-10', 'Cash', 'First Installment'),
(17, 17, 50000, '2025-02-11', 'UPI', 'Full Payment'),
(18, 18, 30000, '2025-02-12', 'Card', 'First Installment'),
(19, 19, 40000, '2025-02-13', 'NetBanking', 'Full Payment'),
(20, 20, 15000, '2025-02-14', 'Cash', 'Pending Balance'),

(21, 21, 30000, '2025-02-20', 'UPI', 'First Installment'),
(22, 22, 20000, '2025-02-21', 'Cash', 'First Installment'),
(23, 23, 50000, '2025-02-22', 'Card', 'Full Payment'),
(24, 24, 35000, '2025-02-23', 'NetBanking', 'Partial Payment'),
(25, 25, 40000, '2025-02-24', 'UPI', 'Full Payment'),

(26, 26, 30000, '2025-03-01', 'UPI', 'First Installment'),
(27, 27, 20000, '2025-03-02', 'Cash', 'First Installment'),
(28, 28, 45000, '2025-03-03', 'Card', 'Full Payment'),
(29, 29, 25000, '2025-03-04', 'NetBanking', 'First Installment'),
(30, 30, 35000, '2025-03-05', 'UPI', 'Partial Payment'),

(31, 31, 50000, '2025-03-10', 'UPI', 'Full Payment'),
(32, 32, 30000, '2025-03-11', 'Cash', 'First Installment'),
(33, 33, 20000, '2025-03-12', 'Card', 'First Installment'),
(34, 34, 40000, '2025-03-13', 'NetBanking', 'Full Payment'),
(35, 35, 25000, '2025-03-14', 'UPI', 'Pending Balance'),

(36, 36, 30000, '2025-03-20', 'UPI', 'First Installment'),
(37, 37, 20000, '2025-03-21', 'Cash', 'First Installment'),
(38, 38, 50000, '2025-03-22', 'Card', 'Full Payment'),
(39, 39, 35000, '2025-03-23', 'NetBanking', 'Partial Payment'),
(40, 40, 45000, '2025-03-24', 'UPI', 'Full Payment'),

(41, 41, 30000, '2025-04-01', 'UPI', 'First Installment'),
(42, 42, 20000, '2025-04-02', 'Cash', 'First Installment'),
(43, 43, 40000, '2025-04-03', 'Card', 'Full Payment'),
(44, 44, 25000, '2025-04-04', 'NetBanking', 'First Installment'),
(45, 45, 35000, '2025-04-05', 'UPI', 'Partial Payment'),

(46, 46, 30000, '2025-04-10', 'UPI', 'First Installment'),
(47, 47, 20000, '2025-04-11', 'Cash', 'First Installment'),
(48, 48, 50000, '2025-04-12', 'Card', 'Full Payment'),
(49, 49, 40000, '2025-04-13', 'NetBanking', 'Full Payment'),
(50, 50, 45000, '2025-04-14', 'UPI', 'Full Payment');

CREATE TABLE Attendance (
    AttendID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    Date DATE NOT NULL,
    Status VARCHAR(10) CHECK (Status IN ('Present','Absent')),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
INSERT INTO Attendance (AttendID, StudentID, Date, Status) 
VALUES
(1, 1, '2025-01-10', 'Present'),
(2, 2, '2025-01-10', 'Absent'),
(3, 3, '2025-01-10', 'Present'),
(4, 4, '2025-01-10', 'Present'),
(5, 5, '2025-01-10', 'Absent'),
(6, 6, '2025-01-10', 'Present'),
(7, 7, '2025-01-10', 'Present'),
(8, 8, '2025-01-10', 'Absent'),
(9, 9, '2025-01-10', 'Present'),
(10, 10, '2025-01-10', 'Present'),

(11, 1, '2025-01-11', 'Absent'),
(12, 2, '2025-01-11', 'Present'),
(13, 3, '2025-01-11', 'Present'),
(14, 4, '2025-01-11', 'Present'),
(15, 5, '2025-01-11', 'Present'),
(16, 6, '2025-01-11', 'Absent'),
(17, 7, '2025-01-11', 'Present'),
(18, 8, '2025-01-11', 'Present'),
(19, 9, '2025-01-11', 'Present'),
(20, 10, '2025-01-11', 'Absent'),

(21, 1, '2025-01-12', 'Present'),
(22, 2, '2025-01-12', 'Present'),
(23, 3, '2025-01-12', 'Absent'),
(24, 4, '2025-01-12', 'Present'),
(25, 5, '2025-01-12', 'Present'),
(26, 6, '2025-01-12', 'Present'),
(27, 7, '2025-01-12', 'Absent'),
(28, 8, '2025-01-12', 'Present'),
(29, 9, '2025-01-12', 'Present'),
(30, 10, '2025-01-12', 'Present'),

(31, 1, '2025-01-13', 'Present'),
(32, 2, '2025-01-13', 'Present'),
(33, 3, '2025-01-13', 'Present'),
(34, 4, '2025-01-13', 'Absent'),
(35, 5, '2025-01-13', 'Present'),
(36, 6, '2025-01-13', 'Present'),
(37, 7, '2025-01-13', 'Present'),
(38, 8, '2025-01-13', 'Present'),
(39, 9, '2025-01-13', 'Absent'),
(40, 10, '2025-01-13', 'Present'),

(41, 1, '2025-01-14', 'Present'),
(42, 2, '2025-01-14', 'Present'),
(43, 3, '2025-01-14', 'Present'),
(44, 4, '2025-01-14', 'Present'),
(45, 5, '2025-01-14', 'Present'),
(46, 6, '2025-01-14', 'Present'),
(47, 7, '2025-01-14', 'Absent'),
(48, 8, '2025-01-14', 'Present'),
(49, 9, '2025-01-14', 'Present'),
(50, 10, '2025-01-14', 'Present');