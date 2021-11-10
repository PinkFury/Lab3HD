
CREATE TABLE "HUB_Student" (
    "Student_hash_key" int   NOT NULL,
    "TaskNumber" int   NOT NULL,
    CONSTRAINT "pk_HUB_Student" PRIMARY KEY (
        "Student_hash_key"
     )
);

CREATE TABLE "LINK_Tasks" (
    "Number_hash_key" int   NOT NULL,
    "Student_hash_key" int   NOT NULL,
    "Task_hash_key" int   NOT NULL,
    CONSTRAINT "pk_LINK_Tasks" PRIMARY KEY (
        "Number_hash_key"
     )
);

CREATE TABLE "HUB_Tasks" (
    "Task_hash_key" int   NOT NULL,
    "db_hash_key" int   NOT NULL,
    "os_hash_key" int   NOT NULL,
    "ChangedAt" date   NOT NULL,
    CONSTRAINT "pk_HUB_Tasks" PRIMARY KEY (
        "Task_hash_key"
     )
);

CREATE TABLE "HUB_Databases" (
    "Database_hash_key" int   NOT NULL,
    CONSTRAINT "pk_HUB_Databases" PRIMARY KEY (
        "Database_hash_key"
     )
);

CREATE TABLE "HUB_OS" (
    "OperatingSystem_hash_key" int   NOT NULL,
    CONSTRAINT "pk_HUB_OS" PRIMARY KEY (
        "OperatingSystem_hash_key"
     )
);

CREATE TABLE "LINK_Databases" (
    "DBlink_hash_key" int   NOT NULL,
    "db_hash_key" int   NOT NULL,
    "Database_hash_key" int   NOT NULL,
    CONSTRAINT "pk_LINK_Databases" PRIMARY KEY (
        "DBlink_hash_key"
     )
);

CREATE TABLE "LINK_OS" (
    "OSlink_hash_key" int   NOT NULL,
    "os_hash_key" int   NOT NULL,
    "OperatingSystem_hash_key" int   NOT NULL,
    CONSTRAINT "pk_LINK_OS" PRIMARY KEY (
        "OSlink_hash_key"
     )
);

CREATE TABLE "SAT_Student" (
    "Student_hash_key" int   NOT NULL,
    "Name" string   NOT NULL,
    "Second_Name" string   NOT NULL,
    "Grade" int   NOT NULL,
    CONSTRAINT "pk_SAT_Student" PRIMARY KEY (
        "Student_hash_key"
     )
);

CREATE TABLE "SAT_Tasks" (
    "Task_hash_key" int   NOT NULL,
    "Description" string   NOT NULL,
    "CreatedAt" date   NOT NULL,
    CONSTRAINT "pk_SAT_Tasks" PRIMARY KEY (
        "Task_hash_key"
     )
);

CREATE TABLE "SAT_OS" (
    "OperatingSystem_hash_key" int   NOT NULL,
    "Family" string   NOT NULL,
    "Distribution" string   NOT NULL,
    "Name" string   NOT NULL,
    "MajorVersion" int   NOT NULL,
    "MinorVersion" int   NOT NULL,
    CONSTRAINT "pk_SAT_OS" PRIMARY KEY (
        "OperatingSystem_hash_key"
     )
);

CREATE TABLE "SAT_DB" (
    "Database_hash_key" int   NOT NULL,
    "Name" string   NOT NULL,
    "Version" string   NOT NULL,
    "Link" string   NOT NULL,
    "CreatedAt" date   NOT NULL,
    CONSTRAINT "pk_SAT_DB" PRIMARY KEY (
        "Database_hash_key"
     )
);

CREATE TABLE "SAT_TaskExtended" (
    "Number_hash_key" int   NOT NULL,
    "Registrator" string   NOT NULL,
    "CreatedAt" date   NOT NULL,
    CONSTRAINT "pk_SAT_TaskExtended" PRIMARY KEY (
        "Number_hash_key"
     )
);

CREATE TABLE "SAT_LicenceDB" (
    "DBlink_hash_key" int   NOT NULL,
    "LicenceNumber" string   NOT NULL,
    "LicenceDate" date   NOT NULL,
    CONSTRAINT "pk_SAT_LicenceDB" PRIMARY KEY (
        "DBlink_hash_key"
     )
);

CREATE TABLE "SAT_LicenceOS" (
    "OSlink_hash_key" int   NOT NULL,
    "LicenceNumber" string   NOT NULL,
    "LicenceDate" date   NOT NULL,
    CONSTRAINT "pk_SAT_LicenceOS" PRIMARY KEY (
        "OSlink_hash_key"
     )
);


ALTER TABLE "LINK_Tasks" ADD CONSTRAINT "fk_LINK_Tasks_Student_hash_key" FOREIGN KEY("Student_hash_key")
REFERENCES "HUB_Student" ("Student_hash_key");

ALTER TABLE "LINK_Tasks" ADD CONSTRAINT "fk_LINK_Tasks_Task_hash_key" FOREIGN KEY("Task_hash_key")
REFERENCES "HUB_Tasks" ("Task_hash_key");

ALTER TABLE "HUB_Tasks" ADD CONSTRAINT "fk_HUB_Tasks_db_hash_key" FOREIGN KEY("db_hash_key")
REFERENCES "LINK_Databases" ("db_hash_key");

ALTER TABLE "LINK_Databases" ADD CONSTRAINT "fk_LINK_Databases_Database_hash_key" FOREIGN KEY("Database_hash_key")
REFERENCES "HUB_Databases" ("Database_hash_key");

ALTER TABLE "LINK_OS" ADD CONSTRAINT "fk_LINK_OS_os_hash_key" FOREIGN KEY("os_hash_key")
REFERENCES "HUB_Tasks" ("os_hash_key");

ALTER TABLE "LINK_OS" ADD CONSTRAINT "fk_LINK_OS_OperatingSystem_hash_key" FOREIGN KEY("OperatingSystem_hash_key")
REFERENCES "HUB_OS" ("OperatingSystem_hash_key");

ALTER TABLE "SAT_Student" ADD CONSTRAINT "fk_SAT_Student_Student_hash_key" FOREIGN KEY("Student_hash_key")
REFERENCES "HUB_Student" ("Student_hash_key");

ALTER TABLE "SAT_Tasks" ADD CONSTRAINT "fk_SAT_Tasks_Task_hash_key" FOREIGN KEY("Task_hash_key")
REFERENCES "HUB_Tasks" ("Task_hash_key");

ALTER TABLE "SAT_OS" ADD CONSTRAINT "fk_SAT_OS_OperatingSystem_hash_key" FOREIGN KEY("OperatingSystem_hash_key")
REFERENCES "HUB_OS" ("OperatingSystem_hash_key");

ALTER TABLE "SAT_DB" ADD CONSTRAINT "fk_SAT_DB_Database_hash_key" FOREIGN KEY("Database_hash_key")
REFERENCES "HUB_Databases" ("Database_hash_key");

ALTER TABLE "SAT_TaskExtended" ADD CONSTRAINT "fk_SAT_TaskExtended_Number_hash_key" FOREIGN KEY("Number_hash_key")
REFERENCES "LINK_Tasks" ("Number_hash_key");

ALTER TABLE "SAT_LicenceDB" ADD CONSTRAINT "fk_SAT_LicenceDB_DBlink_hash_key" FOREIGN KEY("DBlink_hash_key")
REFERENCES "LINK_Databases" ("DBlink_hash_key");

ALTER TABLE "SAT_LicenceOS" ADD CONSTRAINT "fk_SAT_LicenceOS_OSlink_hash_key" FOREIGN KEY("OSlink_hash_key")
REFERENCES "LINK_OS" ("OSlink_hash_key");