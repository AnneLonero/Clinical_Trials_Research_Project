-- Creating tables for Clincal_TrialsDB
CREATE TABLE Registration_Info (
	OrgStudyId VARCHAR NOT NULL,
	BriefTitle VARCHAR,
	StartDate DATE,
	CompletionDate DATE,
	OverallStatus VARCHAR,
	StudyType VARCHAR,
	PRIMARY KEY (OrgStudyId),
	UNIQUE (OrgStudyId)
);

CREATE TABLE Participant_Eligibility (
	OrgStudyId VARCHAR NOT NULL,
	Gender VARCHAR,
	MinimumAge INT,
	MaximumAge INT,
	HealthyVolunteers VARCHAR,
	PRIMARY KEY (OrgStudyId),
	FOREIGN KEY (OrgStudyId) REFERENCES Registration_Info (OrgStudyId)
);

CREATE TABLE Study_Detail (
	OrgStudyId VARCHAR NOT NULL,
	IsFDARegulatedDrug VARCHAR,
	IsFDARegulatedDevice VARCHAR,
	IsUnapprovedDevice VARCHAR,
	ResponsiblePartyType VARCHAR,
	PRIMARY KEY (OrgStudyId),
	FOREIGN KEY (OrgStudyId) REFERENCES Participant_Eligibility (OrgStudyId)
);

CREATE TABLE Study_Method (
	OrgStudyId VARCHAR NOT NULL,
	StudyType VARCHAR,
	ArmGroupType VARCHAR,
	InterventionType VARCHAR,
	DesignInterventionalModel VARCHAR,
	DesignObservationalModel VARCHAR,
	TargetDuration VARCHAR,
	SamplingMethod VARCHAR,
	Phase VARCHAR,
	PRIMARY KEY (OrgStudyId),
	FOREIGN KEY (OrgStudyId) REFERENCES Registration_Info (OrgStudyId),
	FOREIGN KEY (StudyType) REFERENCES Registration_Info (OrgStudyId)
);

CREATE TABLE Text_Analysis (
	OrgStudyId VARCHAR,
	WhyStopped VARCHAR,
	EnrollmentCount VARCHAR,
	PrimaryOutComeMeasure VARCHAR,
	FlowDropWithdrawType VARCHAR,
	PRIMARY KEY (OrgStudyId),
	FOREIGN KEY (OrgStudyId) REFERENCES Study_Detail (OrgStudyId)
);