-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Student" (
    "StudentID" int   NOT NULL,
    "Name" string   NOT NULL,
    "Second_Name" string   NOT NULL,
    "TaskNumber" int   NOT NULL,
    "Grade" int   NOT NULL,
    CONSTRAINT "pk_Student" PRIMARY KEY (
        "StudentID"
     )
);

CREATE TABLE "TasksInNumbers" (
    "NumberID" int   NOT NULL,
    "NumberForStudentID" int   NOT NULL,
    "TaskID" int   NOT NULL,
    CONSTRAINT "pk_TasksInNumbers" PRIMARY KEY (
        "NumberID"
     )
);

CREATE TABLE "Tasks" (
    "TaskID" int   NOT NULL,
    "Description" string   NOT NULL,
    "dbID" int   NOT NULL,
    "osID" int   NOT NULL,
    CONSTRAINT "pk_Tasks" PRIMARY KEY (
        "TaskID"
     )
);

CREATE TABLE "Databases" (
    "DatabaseID" int   NOT NULL,
    "Name" string   NOT NULL,
    "Version" string   NOT NULL,
    "Link" string   NOT NULL,
    CONSTRAINT "pk_Databases" PRIMARY KEY (
        "DatabaseID"
     )
);

CREATE TABLE "OS" (
    "OperatingSystemID" int   NOT NULL,
    "Family" string   NOT NULL,
    "Distribution" string   NOT NULL,
    "Name" string   NOT NULL,
    "MajorVersion" int   NOT NULL,
    "MinorVersion" int   NOT NULL,
    CONSTRAINT "pk_OS" PRIMARY KEY (
        "OperatingSystemID"
     )
);

ALTER TABLE "Student" ADD CONSTRAINT "fk_Student_TaskNumber" FOREIGN KEY("TaskNumber")
REFERENCES "TasksInNumbers" ("NumberID");

ALTER TABLE "TasksInNumbers" ADD CONSTRAINT "fk_TasksInNumbers_TaskID" FOREIGN KEY("TaskID")
REFERENCES "Tasks" ("TaskID");

ALTER TABLE "Tasks" ADD CONSTRAINT "fk_Tasks_dbID" FOREIGN KEY("dbID")
REFERENCES "Databases" ("DatabaseID");

ALTER TABLE "Tasks" ADD CONSTRAINT "fk_Tasks_osID" FOREIGN KEY("osID")
REFERENCES "OS" ("OperatingSystemID");

