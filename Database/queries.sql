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
	ri.actual_duration,
	sm.arm_group_type,
	sm.intervention_type,
	sm.interventional_type_model,
	sm.phase
INTO interventional_study	
FROM Registration_Info as ri
LEFT JOIN Study_Method as sm
ON ri."ID" = sm."ID"
WHERE ri.study_type = 'Interventional';

--Drop table
DROP TABLE interventional_study;

-- Display Interventional Study table
SELECT * FROM interventional_study;

-- FDA Regulated Drug/Device for Interventional Study
SELECT ivs."ID",
	ivs.title,
	ivs.actual_duration,
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

SELECT * FROM ivs_study_fda;	
--Drop table
DROP TABLE ivs_study_fda;

-- Create updated ivs table with enrollment count:
SELECT isf."ID",
	isf.title,
	isf.actual_duration,
	isf.status,
	isf.study_type,
	isf.arm_group_type,
	isf.intervention_type,
	isf.interventional_type_model,
	isf.phase,
	isf.fda_regulated_drug,
	isf.fda_regulated_device,
	ta.enrollment_count
INTO updated_ivs_studies	
FROM ivs_study_fda as isf	
LEFT JOIN Text_Analysis as ta
ON isf."ID" = ta."ID";

-- Display ivs_study_fda table
SELECT * FROM updated_ivs_studies;

-- Tables of Observational Study ONLY
SELECT ri."ID",
	ri.title,
	ri.status,
	ri.study_type,
	ri.actual_duration,
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

-- FDA Regulated Drug/Device for Observational Study
SELECT obs."ID",
	obs.title,
	obs.actual_duration,
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

-- Create updated obs_study
SELECT osf."ID",
	osf.title,
	osf.actual_duration,
	osf.status,
	osf.study_type,
	osf.observational_study_model,
	osf.target_duration,
	osf.sampling_method,
	osf.fda_regulated_drug,
	osf.fda_regulated_device,
	ta.enrollment_count
INTO updated_obs_studies	
FROM obs_study_fda as osf
LEFT JOIN text_analysis as ta
ON osf."ID" = ta."ID";

-- Display updated_obs_studies table
SELECT * FROM updated_obs_studies;

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

-- Create table IVS and OBS for Machine Learning
SELECT ri."ID",
	ri.title,
	ri.actual_duration,
	ri.status,
	ri.study_type,
	sd.fda_regulated_drug,
	sd.fda_regulated_device,
	sd.responsible_party
INTO ivs_obs	
FROM Registration_Info as ri
LEFT JOIN Study_Detail as sd
ON ri."ID" = sd."ID";

-- Update table ivs_obs with enrollment count
SELECT io."ID",
	io.title,
	io.actual_duration,
	io.status,
	io.study_type,
	io.fda_regulated_drug,
	io.fda_regulated_device,
	io.responsible_party,
	ta.enrollment_count
INTO ivs_vs_obs	
FROM ivs_obs as io
LEFT JOIN text_analysis as ta
ON io."ID" = ta."ID";

-- Display ivs_vs_obs table
SELECT * FROM ivs_vs_obs;
