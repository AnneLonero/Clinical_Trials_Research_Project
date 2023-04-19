-- Creating tables for Clincal_TrialsDB
CREATE TABLE Registration_Info (
	"ID" VARCHAR NOT NULL,
	Title VARCHAR,
	Start_Date VARCHAR,
	Completion_Date VARCHAR,
	Status VARCHAR,
	Study_Type VARCHAR,
	PRIMARY KEY ("ID")
);

CREATE TABLE Participant_Eligibility (
	"ID" VARCHAR NOT NULL,
	Gender VARCHAR,
	Minimum_Age VARCHAR,
	Healthy_Volunteers VARCHAR,
	PRIMARY KEY ("ID"),
	FOREIGN KEY ("ID") REFERENCES Registration_Info ("ID")
);

CREATE TABLE Study_Detail (
	"ID" VARCHAR NOT NULL,
	FDA_Regulated_Drug VARCHAR,
	FDA_Regulated_Device VARCHAR,
	Responsible_Party VARCHAR,
	PRIMARY KEY ("ID"),
	FOREIGN KEY ("ID") REFERENCES Participant_Eligibility ("ID")
);

CREATE TABLE Study_Method (
	"ID" VARCHAR NOT NULL,
	Study_Type VARCHAR,
	Arm_Group_Type VARCHAR,
	Intervention_Type VARCHAR,
	Interventional_Type_Model VARCHAR,
	Observational_Study_Model VARCHAR,
	Target_Duration VARCHAR,
	Sampling_Method VARCHAR,
	Phase VARCHAR,
	PRIMARY KEY ("ID"),
	FOREIGN KEY ("ID") REFERENCES Registration_Info ("ID"),
	FOREIGN KEY ("ID") REFERENCES Registration_Info ("ID")
);

CREATE TABLE Text_Analysis (
	"ID" VARCHAR,
	Enrollment_Count VARCHAR,
	Primary_OutCome_Measure VARCHAR,
	PRIMARY KEY ("ID"),
	FOREIGN KEY ("ID") REFERENCES Study_Detail ("ID")
);