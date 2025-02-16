USE techathon;

SELECT * FROM data_2023;

UPDATE data_2023
SET Time_Period = REPLACE(Time_Period, '2022', '2023')
WHERE Time_Period LIKE '2022-%';

SELECT * FROM data_2023;

SELECT * FROM data_2022;

