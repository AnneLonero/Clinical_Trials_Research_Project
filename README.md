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

*Progress Status*: All data was extracted from [clinicaltrials.gov API](https://clinicaltrials.gov/api/gui/home), cleaned and loaded into 5 [tables](https://github.com/AnneLonero/Clinical_Trials_Research_Project/tree/main/Tables).<br>

Data extracted as json files from [clinicaltrials.gov API](https://clinicaltrials.gov/api/gui/home) were converted into multiple DataFrames for data cleaning. 
![Pre-cleaned dataframe](Images/pre_cleaned_data.jpg)<br>
As shown above, all values in DataFrames were enclosed by ```[]``` brackets, which needed to be removed for data processing. All dataframes' values were first converted to string, then each values were run through ```for``` loops to remove the brackets through regular expression. All columns were then renamed. 

There also were some trials had multiple rows of data (duplicated ID's), which needed to be cleaned for our analysis purposed. Only the first rows of the duplicated ID numbers were kept using ```drop_duplicates(subset=[ID], keep='first')```.

We had to change the Start Date, Completion Date, and Actual Duration to datetime type. We had to also modify some of the variables, such as Intervention Type, Observation Study Model, and Arm Group Type to keep only the first provided response in order to create more streamlined visualizations. 


#### 2. Build Database<br>
*Progress Status*: Database finished with 5 tables. All the data was intergrated and ready for queries. SQL Queries ran to achieve multiple statistic analysis and created additional customed tables for future analysis.<br> 

The database was built in Postgre pgAdmin using 5 separate tables and used `ID` as primary key for each table (find below). The data was then integrated to database using csv files.

![field_tables](Database/QuickDBD-schema.png)<br>

&#9989; Description of data analysis phase<br>

### Unsupervised Learning 
For the analysis of the free text response we used Natural Language Processing(NLP) which is a type of unsupervised learning for textual data. We used an algorithm called Latent Dirichlet Association - or LDA for short. This is a type of topic modeling that characterizes the rates at which words appear when discussing a particular topic. Essentially it finds patterns within the data itself, This analysis was conducted on the free text responses of the WhyStopped column.

    LDA processing steps:
    1. Lowercase responses
    2. Remove punctuation
    3. Remove stopwords
    4. Filter out top three most frequent words ('study', 'due', 'decision')
    5. Tokenize filtered responses (sentences-to-words)
    6. Create term dictionary of corpus
    7. Convert corpus into document-term-matrix
    8. Run and train LDA model on document-term-matrix using Gensim library
    9. Create Interoptic Distance Map and Top-30 Most Relevant Terms for Topics
    


#### Supervised Learning 
For the analysis of the categorical data we used a variety of supervised learning models to test which model had the highest accuracy. Due to the different characteristics of observational and interventional studies, the data was segmented by study type. 
Interventional studies are a type of clinical study in which participants are assigned to groups that receive one or more intervention/treatment, this is to evaluate biomedical or health-related outcomes.

In observational studies participants’ health outcomes are assessed but the investigator does not assign participants to a specific intervention or treatment.

&#9989; Technologies used<br>
*Progress Status*: 3 Supervised Learning Models were built and Optimized for Observational and Interventional Studies, Observational studies ONLY, and Interventional studies ONLY
* There are two main study types - Observational and Interventional. 
* Supervised Learning Models were built for both Observation and Interventional studies to explore and evaluate the potential features for our model. 
* Machine learning models were performed for each study types since each had different set of contributing characteristics that needed to be examined more closely. 
* `Status` column would be the target. The `Unknown Status` was dropped since it did't serve any purpose for our analysis. All other studies status were separated into 2 buckets. `High_chance` includes `Completed, Recruiting, Enrolling by invitation`, and `low_chance` includes `Withdrawn, Terminated, Suspendended, Not yet recruiting, and Active, not Recruiting`.
* All models were built using `RandomForestClassifer`,`BalancedRandomForest`, an `LogisticRegression` models and later resampled using 4 methods: `NaiveRandomSampling`, `SMOTE`, `UnderSampling`, and `Combination(OverandUnder)Sampling - SMOTEENN`.

#### 4. Display Analysis Results and Findings using Tableau
A large number of visualizations were able to be made from our different CSV files that we created. 
We were able to look at:
* the minimum age for each study
* the enrollment counts
* the proportion of enrollment for each study type
* actual duration of the clinical trials
* the status of the trials based on study type and phase respectively
* the number of trials that used each different study model for both the Interventional and Observational methods
* the number of trials that used each combination of arm group type and intevention type
* the gender eligibility for the trials
* whether or not they accepted people who did not have a disease or condition to participate in the observation study. 

## Results

&#9989; Results of analysis

### Tableau Analysis
[Tableau Dashboard](https://public.tableau.com/app/profile/annekah.jones/viz/Story1Demo/ClinicalTrialsDahsboard?publish=yes)

![Actual_Duration](Images/Tableau%20Visualizations/Actual%20Duration.png)
* Most of the clinical trials lasted 0-15 years.

![Arm_Group_Intervention_Type](Images/Tableau%20Visualizations/Arm%20Group%20and%20Intervention%20Type.png)
* The combination of the Experimental Arm Group Type and Drug Intervention Type was the most popular among the intervention clinical trials. 

![Enrollment_Count](Images/Tableau%20Visualizations/Enrollment%20Count.png)
* Most of the clinical trials had under 10,000 people enrolled. 

![Int_Obs_Methods](Images/Tableau%20Visualizations/Interventional%20and%20Observational%20Study%20Methods.png)
* For the Interventional Studies, Parallel Assignment and Single Group Assignment were the two most popular study models used amongst the clinical trials.
* For the Observation Studies, ignoring the null responses, Cohort and Case-Only were the two most popular study models amongst the clinical trials. 

![Minimum_Age](Images/Tableau%20Visualizations/Minimum%20Age.png)
* 18 was the most common minimum age for the clinical trials, but they ranged from 0 to 70.

![Pie_Charts](Images/Tableau%20Visualizations/Pie%20Charts.png)
* For gender eligibility, most of the trials were female only.
* Observational Studies had the most enrollment at 22,867,279 participants.
* Most of the observational studies did not accept participants that did not have a disease or condition.

![Status](Images/Tableau%20Visualizations/Status%20by%20Phase%20and%20Study%20Type.png)
* For Interventional Studies, most of the trials were recruiting.
* For Observational Studies, most of the trials were recruiting.
* For all phases, the majority of the trials were recruiting. 

![Enrollment_Actual_Duration](Images/Tableau%20Visualizations/Enrollment%20vs%20Actual%20Duration.png)
* We are able to see the relationship between enrollment type and actual duration.

![Enrollment_Status](Images/Tableau%20Visualizations/Enrollment%20v%20Status.png)
* We can see that most of the trials are in the recruiting phase, even though these trials don't have the highest levels of enrollment.

### Observational and Interventional Studies - Supervised Learning Model

Out of 3 models tested, `BalancedRandomForest` shows the best performance with the balanced accuracy of 59%. Using this model to resample with 4 resampling methods; however, none of the methods produce a better result.

* Random Forest Classifier<br>
![Ivs/Obs - Random Forest](Images/Machine%20Learning%20Results/ivs_obs_random_forest.png)
![Ivs/Obs - Random Forest](Images/Machine%20Learning%20Results/ivs_obs_features_importance.png)<br><br>

* Banlanced Random Forest Classifier<br>
![Ivs/Obs - Balanced Random Forest](Images/Machine%20Learning%20Results/ivs_obs_balanced_random_forest.png)<br><br>

* Logistic Regression Model <br>
![Ivs/Obs - Logistic Regression](Images/Machine%20Learning%20Results/ivs_obs_lr.png)
<br><br>

* Re-Sampling<br>
    - Oversampling: Random Over Sampling <br>
    ![Ivs/Obs - ROS](Images/Machine%20Learning%20Results/ivs_obs_random_oversampling.png)

    - Oversampling: SMOTE <br>
    ![Ivs/Obs - SMOTE](Images/Machine%20Learning%20Results/ivs_obs_SMOTE.png)

    - Undersampling: Cluster Centroid <br>
    ![Ivs/Obs - Cluster Centroid](Images/Machine%20Learning%20Results/ivs_obs_undersampling.png)

    - Combination: SMOTEENN <br>
    ![Ivs/Obsl - SMOTEENN](Images/Machine%20Learning%20Results/ivs_obs_SMOTEENN.png)


### Observational Studies ONLY - Supervised Learning Model

Multiple learning machine models (Random Forest, Balanced Random Forest, and Logistic Regression) were performed to test which model has higher accuracy in determining the status of the clinical trials. Of the three models tested, logistic regression shows best performance, so was done only on losgistic regression model to test if resampling will result in even better performance. Of 4 resamplings performed, oversampling has performed the best, boosting balance accuracy by about 6%.<br>


* Random Forest Classifier<br>
![Observational - Random Forest](Images/Machine%20Learning%20Results/obs_random_forest.jpg)
![Observational - Random Forest](Images/Machine%20Learning%20Results/obs_random_forest_importance_plot.png)<br><br>

* Banlanced Random Forest Classifier<br>
![Observational - Balanced Random Forest](Images/Machine%20Learning%20Results/obs_bal_random_forest.jpg)
![Observational - Balanced Random Forest](Images/Machine%20Learning%20Results/obs_bal_random_forest_importance_plot.png)
<br><br>

* Logistic Regression Model <br>
![Observational - Logistic Regression](Images/Machine%20Learning%20Results/obs_lr.jpg)
<br><br>

* Re-Sampling<br>
    - Oversampling: Random Over Sampling <br>
    ![Observational - ROS](Images/Machine%20Learning%20Results/obs_ros.jpg)

    - Oversampling: SMOTE <br>
    ![Observational - SMOTE](Images/Machine%20Learning%20Results/obs_smote.jpg)

    - Undersampling: Cluster Centroid <br>
    ![Observational - Cluster Centroid](Images/Machine%20Learning%20Results/obs_cluster.jpg)

    - Combination: SMOTEENN <br>
    ![Observational - SMOTEENN](Images/Machine%20Learning%20Results/obs_smoteenn.jpg)


### Interventional Studies ONLY - Supervised Learning Model
Machine learning on interventional studies resulted in much lower accuracy than that of obervational's. This seems to be because there are far more variables in interventional clinical trials than there are variables for observational clinical traisl. Like obervational machine learnings, multiple machine learning models were performed, and again, logistic regression model performed the best. Resampling the data, however, did not produce better results - only random over sapling produced slightly better accruacy than normal logistic regression model.

* Random Forest Classifier <br>
![Interventional - Random Forest](Images/Machine%20Learning%20Results/ivs_random_forest.jpg)
![Interventional - Random Forest](Images/Machine%20Learning%20Results/ivs_random_forest_importance_plot.png)<br><br>

* Banlanced Random Forest Classifier<br>
![Interventional - Balanced Random Forest](Images/Machine%20Learning%20Results/ivs_bal_random_forest.jpg)
![Interventional - Balanced Random Forest](Images/Machine%20Learning%20Results/ivs_bal_random_forest_importance_plot.png)
<br><br>

* Logistic Regression Model <br>
![Interventional - Logistic Regression](Images/Machine%20Learning%20Results/ivs_lr.jpg)
<br><br>

* Re-Sampling<br>
    - Oversampling: Random Over Sampling <br>
    ![Interventional - ROS](Images/Machine%20Learning%20Results/ivs_ros.jpg)

    - Oversampling: SMOTE <br>
    ![Interventional - SMOTE](Images/Machine%20Learning%20Results/ivs_smote.jpg)

    - Undersampling: Cluster Centroid <br>
    ![Interventional - Cluster Centroie](Images/Machine%20Learning%20Results/ivs_cluster.jpg)

    - Combination: SMOTEENN <br>
    ![Interventional - SMOTEENN](Images/Machine%20Learning%20Results/ivs_smoteenn.jpg)




## Reflection

&#9989; Recommendations for future analysis

&#9989; Anything the team would have done differently












