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
INTO interventional_study	
FROM Registration_Info as ri
LEFT JOIN Study_Method as sm
ON ri."ID" = sm."ID"
WHERE ri.study_type = 'Interventional';

-- Display Interventional Study table
SELECT * FROM interventional_study;

-- Tables of Observational Study ONLY
SELECT ri."ID",
	ri.title,
	ri.status,
	ri.study_type,
	sm.observational_study_model,
	sm.target_duration,
	sm.sampling_method
INTO observational_study	
FROM Registration_Info as ri
LEFT JOIN Study_Method as sm
ON ri."ID" = sm."ID" 
WHERE ri.study_type = 'Observational';

-- Display Observational Study table
SELECT *  FROM observational_study;

-- FDA Regulated Drug/Device for Interventional Study
SELECT ivs."ID",
	ivs.title,
	ivs.status,
	ivs.study_type,
	ivs.arm_group_type,
	ivs.intervention_type,
	ivs.interventional_type_model,
	ivs.phase,
	sd.fda_regulated_drug,
	sd.fda_regulated_device
INTO ivs_study_fda	
FROM interventional_study as ivs	
LEFT JOIN Study_Detail as sd
ON ivs."ID" = sd."ID";

-- Display ivs_study_fda table
SELECT * FROM ivs_study_fda;

-- FDA Regulated Drug/Device for Observational Study
SELECT obs."ID",
	obs.title,
	obs.status,
	obs.study_type,
	obs.observational_study_model,
	obs.target_duration,
	obs.sampling_method,
	sd.fda_regulated_drug,
	sd.fda_regulated_device
INTO obs_study_fda	
FROM observational_study as obs	
LEFT JOIN Study_Detail as sd
ON obs."ID" = sd."ID";

-- Display obs_study_fda table
SELECT * FROM obs_study_fda;

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