--select the database
USE hospital_db;

--question 1.1
SELECT 
    COUNT(admission_id) AS total_patient_admissions
FROM admissions;

--question 1.2
SELECT 
    AVG(DATEDIFF(discharges.discharge_date, admissions.admission_date)) AS avg_length_of_stay
FROM admissions 
JOIN discharges  ON admissions.admission_id = discharges.admission_id;

--question 2.1
SELECT primary_diagnosis, 
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY primary_diagnosis;

--question 2.2
SELECT service, 
    AVG(DATEDIFF(discharges.discharge_date, admissions.admission_date)) AS avg_lenght_stay 
FROM admissions
JOIN discharges ON discharges.admission_id = admissions.admission_id
GROUP BY service;

--question 2.3
SELECT discharge_disposition, 
    COUNT(*) AS total_no_of_discharges
FROM discharges
GROUP BY discharge_disposition;

--question 3.1
SELECT service, 
    count(*) AS total_number_admissions
FROM admissions
GROUP BY service
HAVING COUNT(*) > 5;

--question 3.2
SELECT primary_diagnosis,
	AVG(DATEDIFF(discharges.discharge_date, admissions.admission_date)) AS avg_length_stay
FROM admissions
JOIN discharges ON discharges.admission_id = admissions.admission_id
GROUP BY primary_diagnosis
HAVING primary_diagnosis = "Stroke";

--question 4.1
SELECT acuity, 
	COUNT(*) AS total_no_of_visits
FROM ed_visits
GROUP BY acuity;

--question 4.2
SELECT primary_diagnosis, service,
	COUNT(*) AS total_no_of_admissions
FROM admissions
GROUP BY primary_diagnosis, service;

--question 5.1
SELECT 
	date_format(admission_date, "%Y-%m") AS  month_of_admission,
	COUNT(*) AS admissions_per_month
FROM admissions
GROUP BY date_format(admission_date, "%Y-%m");

--question 5.2
SELECT primary_diagnosis,
	MAX(DATEDIFF(discharges.discharge_date, admissions.admission_date)) AS max_length_stay
FROM admissions
JOIN discharges ON discharges.admission_id = admissions.admission_id
GROUP BY primary_diagnosis;

--Bonus challenge
SELECT service,
    COUNT(*) AS total_admissions,
	SUM(DATEDIFF(discharges.discharge_date, admissions.admission_date)) AS total_lenth_of_stay,
    AVG(DATEDIFF(discharges.discharge_date, admissions.admission_date)) AS avg_length_stay
FROM admissions
JOIN discharges ON discharges.admission_id = admissions.admission_id
GROUP BY service
ORDER BY avg_length_stay DESC;

