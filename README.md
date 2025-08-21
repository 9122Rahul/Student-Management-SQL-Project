📘 Student Management & Placement System (SQL Project)
📌 Project Overview

This project is a Student Management & Placement Database built using SQL.
It covers academic and placement modules of an institute, designed with proper Primary Keys, Foreign Keys, Constraints, and Relationships.

The database allows management of:

🎓 Students, Courses, Trainers, and Batches

📝 Enrollments, Attendance, Scores, and Payments

🏢 Companies, Jobs, Applications, Interviews, and Offers

🗂️ Database Schema
1️⃣ Core Module

Students (StudentID, Name, Email, Phone, Address, DOJ, CourseID, BatchID)

Courses (CourseID, CourseName, DurationMonths, FeeAmount)

Trainers (TrainerID, Name, Expertise, Phone, Email)

Batches (BatchID, CourseID, TrainerID, StartDate, EndDate, TimeSlot)

Enrollments (EnrollID, StudentID, BatchID, EnrollDate, Status)

2️⃣ Finance Module

Payments (PaymentID, StudentID, AmountPaid, PaymentDate, Mode, Remark)

3️⃣ Academics Module

Attendance (AttendID, StudentID, Date, Status)

Scores (ScoreID, StudentID, ExamName, MarksObtained, MaxMarks, ExamDate)

4️⃣ Placement Module

Companies (CompanyID, Name, Industry, Location, Contact)

Jobs (JobID, CompanyID, Role, SalaryPackage, Location, Openings)

Applications (AppID, StudentID, JobID, ApplyDate, Status)

Interviews (InterviewID, AppID, RoundNo, Result, InterviewDate)

Offers (OfferID, AppID, Salary, JoiningDate, Status)

🔑 Features

✔️ Normalized relational schema with PK–FK mapping
✔️ CHECK, NOT NULL, UNIQUE constraints implemented
✔️ Sample INSERT statements with 50 students, courses, trainers, etc.
✔️ Complete Placement Module integration
✔️ ER Diagram for better visualization
