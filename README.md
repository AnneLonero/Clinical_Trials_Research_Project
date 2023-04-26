# Clinical Trials Research Project

## Topic Overview
This project analyzes clinical breast cancer research from the database of privately and publicly funded [clinical studies](https://clinicaltrials.gov/) provided by the U.S. National Library of Medicine. The aim of this project is to help cancer patients comprehend the clinical research landscape in order to understand the full breadth of their treatment options. This project builds off of existing [research on clinical trials](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6092479/) to discern the factors that make clinical trials successful or not. This project leverages machine learning to find patterns across the data and predict the status/outcome of a trial.<br>
<br>

While the purview of this project is restricted to clinical trials of breast cancer, our hope is that this project can serve as a springboard for a consulting services for patients and clinical research coordinators in the future. By providing primary stakeholders with data-driven insights into the clinical trial process, this project can enable researchers to maximize the likelihood of success, and empower patients to make the most educated decisions about their health. 

## Research Outline
#### 1. Extract, Transfer, Load and Clean the data <br> (Please feel free to edit this Gahyun and Annekah)
Data extracted as json files from [clinicaltrials.gov API](https://clinicaltrials.gov/api/gui/home) were converted into multiple DataFrames for data cleaning. Data in each of the dataframes were first converted as string, then each values were run through ```for``` loops to remove any unnecessary characters through regular expression. All columns were then renamed. Because some trials had multiple rows, duplicate rows based on the trial ID have beeen removed using ```drop_duplicates(subset=[ID], keep='first')```.

#### 2. Build Database<br>

A database was built in Postgre pgAdmin using 5 separated tables, and used `ID` as a primary key for each table (find below). The data was then integrated to database using csv files.

![field_tables](https://github.com/AnneLonero/Clinical_Trials_Research_Project/blob/main/Database/QuickDBD-schema.png)<br>


#### 3. Supervised Machine Learning Model

After running queries in database, we found that there are two main study types Observational and Intervention. We build a Supervised Learning Model for both Observation and Interventional studies to explore and evaluate the potential features for our model. We then break down each study type to learn separately, since each has a different set of contributing characteristics that need to be examined more closely. All models were built using `BalancedRandomForest` and later Optimized using `NaiveRandomSampling`, `SMOTE`, `UnderSampling`, and `Combination(OverandUnder)Sampling`.

#### 4. Display Analysis Results and Findings using Tableau
(Annekah, please add a brief discription here!)

## Research Progress: 
* All data was extracted from [clinicaltrials.gov API](https://clinicaltrials.gov/api/gui/home), cleaned and loaded into 5 [tables](https://github.com/AnneLonero/Clinical_Trials_Research_Project/tree/main/Tables) .
* Database finished with 5 tables and intergated all the data, ready for queries.
* Queries ran to achieve multiple statistic analysis and created additional customed tables for future analysis.
* 3 Supervised Learning Models were built for Observational and Interventional Studies, Observational studies ONLY, and Interventional studies ONLY using `BalancedRandomForest`.
* In progress of Optimizing the Supervised Learning models using `NaiveRandomSampling`, `SMOTE`, `UnderSampling`, and `Combination(OverandUnder)Sampling`.
* In progress of displaying findings and results in Tableau.

## Results

### Tableau Analysis
Annekah

### Observational and Interventional Studies - Supervised Learning Model
Anne

### Observational Studies ONLY - Supervised Learning Model
Gahyun

### Interventional Studies ONLY - Supervised Learning Model
Alejandra

### Free Text Analysis - Natural Language Processing
Alejandra











