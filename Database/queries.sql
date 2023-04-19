-- Drop table if necessary
DROP TABLE Registration_Info CASCADE;
DROP TABLE Participant_Eligibility CASCADE;
DROP TABLE Study_Detail CASCADE;
DROP TABLE Study_Method CASCADE;
DROP TABLE Text_Analysis CASCADE;

-- Display Tables after import CSV files
SELECT * FROM Registration_Info;
SELECT * FROM Participant_Eligibility;
SELECT * FROM Study_Detail;
SELECT * FROM Study_Method;
SELECT * FROM Text_Analysis;

-- Queries

-- Count by status
SELECT COUNT ("ID"), status
FROM Registration_Info
GROUP BY status
ORDER BY count DESC;

-- Count by study type
SELECT COUNT ("ID"), study_type
FROM Registration_Info
GROUP BY study_type
ORDER BY count DESC;

-- Tables of Interventional Study ONLY
SELECT ri."ID",
	ri.title,
	ri.status,
	ri.study_type,
	sm.arm_group_type,
	sm.intervention_type,
	sm.interventional_type_model,
	sm.phase
FROM Registration_Info as ri
LEFT JOIN Study_Method as sm
ON ri."ID" = sm."ID"
WHERE ri.study_type = 'Interventional';

-- Tables of Observational Study ONLY
SELECT ri."ID",
	ri.title,
	ri.status,
	ri.study_type,
	sm.observational_study_model,
	sm.target_duration,
	sm.sampling_method
FROM Registration_Info as ri
LEFT JOIN Study_Method as sm
ON ri."ID" = sm."ID"
WHERE ri.study_type = 'Observational';

-- Count by FDA Regulated Drug
SELECT COUNT ("ID"), fda_regulated_drug
FROM Study_Detail
GROUP BY fda_regulated_drug
ORDER BY count DESC;

-- Count by FDA Regulated Device
SELECT COUNT ("ID"), fda_regulated_device
FROM Study_Detail
GROUP BY fda_regulated_device
ORDER BY count DESC;

-- Count by Responsible Party
SELECT COUNT ("ID"), responsible_party
FROM Study_Detail
GROUP BY responsible_party
ORDER BY count DESC;