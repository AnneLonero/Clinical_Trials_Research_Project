## Clinical Breast Cancer Research Trial 

## Topic Overview

&#9989; Topic and Reasoning<br>
The aim of the project is to help cancer patients comprehend the clinical research landscape in order to understand the full breadth of their treatment options. This project builds off of existing [research on clinical trials](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6092479/) to discern the factors that make clinical trials successful or not. The project also leverages machine learning to find patterns across the data and predict the status/outcome of a trial.<br>

&#9989; Questions aimed to answer <br>
Here are some questions that the project would aim to answer:
* What factors influence the likelihood of success? Are there measurable degrees of achievement?
* Would one type of trials be more successful than others?
* Is trial length associated with success?
* Would the number of paricipants affect the likelihood of success?
* Are certain trial phases associated with make-or-break points?
* What are the most commnon reasons that made the trial stop?

&#9989; Description of data source<br>
The data for this project was obtained through API from the database of privately and publicly funded [clinical studies](https://clinicaltrials.gov/) provided by the U.S. National Library of Medicine. For the purpose of our research, the data was limited to "Breast Cancer" and date range of 2018 and after (due to some report regulations changed).

While the purview of this project is restricted to clinical trials of breast cancer, this project can potentially serve as a springboard for a consulting services for patients and clinical research coordinators in the future. By providing primary stakeholders with data-driven insights into the clinical trial process, this project can enable researchers to maximize the likelihood of success, and empower patients to make the most educated decisions about their health.

## Research Outline

&#9989; Description of data exploration phase<br>
#### 1. Extract, Transfer, Load and Clean the data <br> 
(Please feel free to edit this Gahyun and Annekah)

*Progress Status*: All data was extracted from [clinicaltrials.gov API](https://clinicaltrials.gov/api/gui/home), cleaned and loaded into 5 [tables](https://github.com/AnneLonero/Clinical_Trials_Research_Project/tree/main/Tables).
Data extracted as json files from [clinicaltrials.gov API](https://clinicaltrials.gov/api/gui/home) were converted into multiple DataFrames for data cleaning. Data in each of the dataframes were first converted as string, then each values were run through ```for``` loops to remove any unnecessary characters through regular expression. All columns were then renamed. Because some trials had multiple rows, duplicate rows based on the trial ID have beeen removed using ```drop_duplicates(subset=[ID], keep='first')```.

#### 2. Build Database<br>
*Progress Status*: Database finished with 5 tables. All the data was intergrated and ready for queries. SQL Queries ran to achieve multiple statistic analysis and created additional customed tables for future analysis.<br> 

The database was built in Postgre pgAdmin using 5 separated tables, and used `ID` as a primary key for each table (find below). The data was then integrated to database using csv files.

![field_tables](https://github.com/AnneLonero/Clinical_Trials_Research_Project/blob/main/Database/QuickDBD-schema.png)<br>

&#9989; Description of data analysis phase<br>
#### 3. Supervised Machine Learning Model
&#9989; Technologies used<br>
*Progress Status*: 3 Supervised Learning Models were built and Optimized for Observational and Interventional Studies, Observational studies ONLY, and Interventional studies ONLY
After running SQL queries in database, we found that there are two main study types Observational and Intervention. We build a Supervised Learning Model for both Observation and Interventional studies to explore and evaluate the potential features for our model. We then break down each study type to learn separately, since each has a different set of contributing characteristics that need to be examined more closely. 
We determined that `Status` column will be our target, then dropped the `Unknown Status` since it doesn't serve any purpose for our analysis. We then placed the studies status in 2 buckets. `High_chance` includes `Completed, Recruiting, Enrolling by invitation`, and `low_chance` includes `Withdrawn, Terminated, Suspendended, Not yet recruiting, and Active, not Recruiting`.
All models were built using `RandomForestClassifer`,`BalancedRandomForest`, an `LogisticRegression` and later resampled using `NaiveRandomSampling`, `SMOTE`, `UnderSampling`, and `Combination(OverandUnder)Sampling - SMOTEENN`.

#### 4. Display Analysis Results and Findings using Tableau
(Annekah, please add a brief discription here!)
*In Progress* 

## Results

&#9989; Results of analysis

### Tableau Analysis
(Text and images here!) - Annekah

### Observational and Interventional Studies - Supervised Learning Model

* Random Forest Classifier<br>
![Observataional - Balanced Random Forest](Images/Machine%20Learning%20Results/ivs_obs_random_forest.png)
![Observataional - Balanced Random Forest](Images/Machine%20Learning%20Results/ivs_obs_features_importance.png)<br><br>

* Banlanced Random Forest Classifier<br>
![Observataional - Balanced Random Forest](Images/Machine%20Learning%20Results/ivs_obs_balanced_random_forest.png)<br><br>

* Logistic Regression Model <br>
![Observataional - Balanced Random Forest](Images/Machine%20Learning%20Results/ivs_obs_lr.png)
<br><br>

* Re-Sampling<br>
    - Oversampling: Random Over Sampling <br>
    ![Observataional - Balanced Random Forest](Images/Machine%20Learning%20Results/ivs_obs_random_oversample.png)

    - Undersampling: Cluster Centroid <br>
    ![Observataional - Balanced Random Forest](Images/Machine%20Learning%20Results/ivs_obs_undersampling.png)

    - Combination: SMOTEENN <br>
    ![Observataional - Balanced Random Forest](Images/Machine%20Learning%20Results/ivs_obs_SMOTEENN.png)


### Observational Studies ONLY - Supervised Learning Model

* Random Forest Classifier<br>
![Observataional - Balanced Random Forest](Images/Machine%20Learning%20Results/obs_random_forest.jpg)
![Observataional - Balanced Random Forest](Images/Machine%20Learning%20Results/obs_random_forest_importance.jpg)<br><br>

* Banlanced Random Forest Classifier<br>
![Observataional - Balanced Random Forest](Images/Machine%20Learning%20Results/obs_bal_random_forest.jpg)
![Observataional - Balanced Random Forest](Images/Machine%20Learning%20Results/obs_bal_random_forest_importance.jpg)
<br><br>

* Logistic Regression Model <br>
![Observataional - Balanced Random Forest](Images/Machine%20Learning%20Results/obs_lr.jpg)
<br><br>

* Re-Sampling<br>
    - Oversampling: Random Over Sampling <br>
    ![Observataional - Balanced Random Forest](Images/Machine%20Learning%20Results/obs_ros.jpg)

    - Undersampling: Cluster Centroid <br>
    ![Observataional - Balanced Random Forest](Images/Machine%20Learning%20Results/obs_cluster.jpg)

    - Combination: SMOTEENN <br>
    ![Observataional - Balanced Random Forest](Images/Machine%20Learning%20Results/obs_smoteenn.jpg)


### Interventional Studies ONLY - Supervised Learning Model
(Text and imaged here!)

### Free Text Analysis - Natural Language Processing
(Text and images here!) - Alejandra

## Reflection

&#9989; Recommendations for future analysis

&#9989; Anything the team would have done differently












