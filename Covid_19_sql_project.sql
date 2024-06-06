use covid_data
select * from covid_data

#1-Find the number of corona patients who faced shortness of breath.
SELECT COUNT(*) AS Number_of_Corona_Patients_With_Shortness_Of_Breath
FROM covid_data
WHERE Corona = 'Positive'
and Shortness_of_breath ='True'

"There are 14,729 corona-positive patients, and 1,577 patients have a shortness of breath problem.
 The number of patients who are COVID positive and also have a shortness of breath problem is 1,164."

#2-Find the number of negative corona patients who have fever and sore_throat. 

select count(*) as negative_patient_having_fever_and_sore_thorat 
from covid_data
where Corona = 'Negative'
and Fever = 'True'
and Sore_throat='True'

"There are 260,227 corona-negative patients,
 and there are 21,752 patients who have a fever, and 1,926 patients who have a sore throat.
 The number of negative corona patients who have both fever and sore throat is 121."
 
 #3-Group the data by month and rank the number of positive cases.
 
#change the format
-- UPDATE covid_data
-- SET test_date = STR_TO_DATE(test_date, '%d-%m-%Y');

SELECT 
DATE_FORMAT(Test_date, '%m') AS Month,
COUNT(*) AS PositiveCases,
RANK() OVER (ORDER BY COUNT(*) desc) AS Ranking
FROM covid_data
WHERE Corona = 'Positive'
GROUP BY Month;

"The number of corona-positive cases in April is 8,881, while in March, it is 5,848."

#4-Find the female negative corona patients who faced cough and headache.

select count(*) as Female_Negative_Corona_Patients_With_Cough_And_Headache
from covid_data
where corona = "Negative"
and  Sex = 'Female'
and Cough_symptoms = "True"
and Headache = "True"


"Out of the total of 278,847 COVID patients, there are 260,227 COVID-negative patients, among which 122,500 are females.
among the female COVID-negative patients, 32 have faced both cough and headache symptoms."


#5-How many elderly corona patients have faced breathing problems?

SELECT COUNT(*) AS Elderly_Patients_With_Breathing_Problems
FROM covid_data
WHERE Corona = 'Positive'
AND Age_60_above = 'Yes'
AND Shortness_of_breath = 'true';

"Out of the total of 14,729 COVID-positive patients, 2,204 patients are above 60 years of age,
 and 263 of these elderly COVID-positive patients have faced breathing problems."
 
 #6-Which three symptoms were more common among COVID positive patients?

SELECT  'Fever' AS Symptom,
SUM(CASE WHEN Fever = 'true' THEN 1 ELSE 0 END) AS Symptom_Count
FROM covid_data
WHERE `Corona` = 'Positive'
UNION ALL
SELECT 'Cough' AS Symptom,
SUM(CASE WHEN Cough_symptoms = 'true' THEN 1 ELSE 0 END) AS Symptom_Count
FROM covid_data
WHERE `Corona` = 'Positive'
UNION ALL
SELECT 'Sore throat' AS Symptom,
SUM(CASE WHEN Sore_throat = 'true' THEN 1 ELSE 0 END) AS Symptom_Count
FROM covid_data
WHERE `Corona` = 'Positive'
UNION ALL
SELECT 'Shortness of breath' AS Symptom,
SUM(CASE WHEN Shortness_of_breath = 'true' THEN 1 ELSE 0 END) AS Symptom_Count
FROM covid_data
WHERE `Corona` = 'Positive'
UNION ALL
SELECT 'Headache' AS Symptom,
SUM(CASE WHEN Headache = 'true' THEN 1 ELSE 0 END) AS Symptom_Count
FROM covid_data
WHERE `Corona` = 'Positive'
ORDER BY Symptom_Count DESC
LIMIT 3;

"Among COVID-positive patients, the three most common symptoms were cough, reported by 6,584 patients,
 fever, reported by 5,559 patients,
 and headache, reported by 2,235 patients."
 
#7- Which symptom was less common among COVID negative people?

SELECT  'Fever' AS Symptom,
SUM(CASE WHEN Fever = 'true' THEN 1 ELSE 0 END) AS Symptom_Count
FROM covid_data
WHERE `Corona` = 'Negative'
UNION ALL
SELECT 'Cough' AS Symptom,
SUM(CASE WHEN Cough_symptoms = 'true' THEN 1 ELSE 0 END) AS Symptom_Count
FROM covid_data
WHERE `Corona` = 'Negative'
UNION ALL
SELECT 'Sore throat' AS Symptom,
SUM(CASE WHEN Sore_throat = 'true' THEN 1 ELSE 0 END) AS Symptom_Count
FROM covid_data
WHERE `Corona` = 'Negative'
UNION ALL
SELECT 'Shortness of breath' AS Symptom,
SUM(CASE WHEN Shortness_of_breath = 'true' THEN 1 ELSE 0 END) AS Symptom_Count
FROM covid_data
WHERE `Corona` = 'Negative'
UNION ALL
SELECT 'Headache' AS Symptom,
SUM(CASE WHEN Headache = 'true' THEN 1 ELSE 0 END) AS Symptom_Count
FROM covid_data
WHERE `Corona` = 'Negative'
ORDER BY Symptom_Count 
LIMIT 1

"Among COVID-negative individuals, headache was the least common symptom, reported by only 148 people.
Sore throat followed with 366 reports, shortness of breath with 385 reports,
fever with 15,816 reports, and cough with the highest prevalence, reported by 34,987 people."


#8-What are the most common symptoms among COVID positive males whose known contact was abroad?

SELECT 'Fever' AS Symptom,
SUM(CASE WHEN Fever = 'true' THEN 1 ELSE 0 END) AS Symptom_Count
FROM covid_data
WHERE `Corona` = 'Positive'
AND `Sex` = 'male'
AND `Known_contact` = 'Abroad'
UNION ALL
SELECT 'Cough' AS Symptom,
SUM(CASE WHEN Cough_symptoms = 'true' THEN 1 ELSE 0 END) AS Symptom_Count
FROM covid_data
WHERE `Corona` = 'Positive'
AND `Sex` = 'male'
AND `Known_contact` = 'Abroad'
UNION ALL
SELECT
'Sore throat' AS Symptom,
SUM(CASE WHEN Sore_throat = 'true' THEN 1 ELSE 0 END) AS Symptom_Count
FROM covid_data
WHERE `Corona` = 'Positive'
AND `Sex` = 'male'
AND `Known_contact` = 'Abroad'
UNION ALL
SELECT
'Shortness of breath' AS Symptom,
SUM(CASE WHEN Shortness_of_breath = 'true' THEN 1 ELSE 0 END) AS Symptom_Count
FROM covid_data
WHERE `Corona` = 'Positive'
AND `Sex` = 'male'
AND `Known_contact` = 'Abroad'
UNION ALL
SELECT
'Headache' AS Symptom,
SUM(CASE WHEN Headache = 'true' THEN 1 ELSE 0 END) AS Symptom_Count
FROM covid_data
WHERE `Corona` = 'Positive'
AND `Sex` = 'male'
AND `Known_contact` = 'Abroad'
ORDER BY Symptom_Count DESC
LIMIT 1;

"Among COVID-positive males with a known contact abroad, the most common symptoms were cough,
 reported by 532 individuals, followed by fever with 407 reports,
 headache with 129 reports, sore throat with 87 reports, and shortness of breath with 84 reports."