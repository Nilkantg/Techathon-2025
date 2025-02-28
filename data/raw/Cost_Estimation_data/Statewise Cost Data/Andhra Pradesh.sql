USE techathon;

-- Drop the table if it exists
DROP TABLE IF EXISTS Andhra_Pradesh_cost_data;

-- Create the table with appropriate data types
CREATE TABLE IF NOT EXISTS Andhra_Pradesh_cost_data (
    Time_Period VARCHAR(25),
    Crop_type VARCHAR(100),
    State VARCHAR(50),
    Cost INT,  -- INT doesn't need a size like (25) in most SQL implementations
    Cost_of_Production INT,
    Operational_Cost INT,
    Fixed_Cost INT
);

-- Insert initial data
INSERT INTO Andhra_Pradesh_cost_data (Time_Period, Crop_type, State, Cost) VALUES
("2021_22", "Paddy", "Andhra Pradesh", 104626),
("2021_22", "Maize", "Andhra Pradesh", 102848),
("2021_22", "Wheat", "Andhra Pradesh", NULL),
("2021_22", "Jowar", "Andhra Pradesh", 99154),
("2021_22", "Bajra", "Andhra Pradesh", 68435),
("2021_22", "Sugarcane", "Andhra Pradesh", 158747),
("2021_22", "Gram", "Andhra Pradesh", 66940),
("2021_22", "Groundnut", "Andhra Pradesh", 84052),
("2021_22", "Soyabean", "Andhra Pradesh", 4731),
("2021_22", "Cotton", "Andhra Pradesh", 104090),
("2020_21", "Paddy", "Andhra Pradesh", 96530),
("2020_21", "Maize", "Andhra Pradesh", 96880),
("2020_21", "Wheat", "Andhra Pradesh", 58285),
("2020_21", "Jowar", "Andhra Pradesh", 83752),
("2020_21", "Bajra", "Andhra Pradesh", 62743),
("2020_21", "Sugarcane", "Andhra Pradesh", 148562),
("2020_21", "Gram", "Andhra Pradesh", 64627),
("2020_21", "Groundnut", "Andhra Pradesh", 76955),
("2020_21", "Soyabean", "Andhra Pradesh", NULL),
("2020_21", "Cotton", "Andhra Pradesh", 90605),
("2019_20", "Paddy", "Andhra Pradesh", 100794),
("2019_20", "Maize", "Andhra Pradesh", 85360),
("2019_20", "Wheat", "Andhra Pradesh", NULL),
("2019_20", "Jowar", "Andhra Pradesh", 42221),
("2019_20", "Bajra", "Andhra Pradesh", 61111),
("2019_20", "Sugarcane", "Andhra Pradesh", 202691),
("2019_20", "Gram", "Andhra Pradesh", 54358),
("2019_20", "Groundnut", "Andhra Pradesh", 76004),
("2019_20", "Soyabean", "Andhra Pradesh", NULL),
("2019_20", "Cotton", "Andhra Pradesh", 108442),
("2018_19", "Paddy", "Andhra Pradesh", 91669),
("2018_19", "Maize", "Andhra Pradesh", 77035),
("2018_19", "Wheat", "Andhra Pradesh", NULL),
("2018_19", "Jowar", "Andhra Pradesh", 34688),
("2018_19", "Bajra", "Andhra Pradesh", NULL),
("2018_19", "Sugarcane", "Andhra Pradesh", 197792),
("2018_19", "Gram", "Andhra Pradesh", 36198),
("2018_19", "Groundnut", "Andhra Pradesh", 46216),
("2018_19", "Soyabean", "Andhra Pradesh", NULL),
("2018_19", "Cotton", "Andhra Pradesh", 75750),
("2017_18", "Paddy", "Andhra Pradesh", 91590),
("2017_18", "Maize", "Andhra Pradesh", 77683),
("2017_18", "Wheat", "Andhra Pradesh", NULL),
("2017_18", "Jowar", "Andhra Pradesh", 58064),
("2017_18", "Bajra", "Andhra Pradesh", NULL),
("2017_18", "Sugarcane", "Andhra Pradesh", 204477),
("2017_18", "Gram", "Andhra Pradesh", 53580),
("2017_18", "Groundnut", "Andhra Pradesh", 70935),
("2017_18", "Soyabean", "Andhra Pradesh", 50421),
("2017_18", "Cotton", "Andhra Pradesh", 91532);

-- Update the table with Cost_of_Production, Operational_Cost, and Fixed_Cost
UPDATE Andhra_Pradesh_cost_data
SET
    Cost_of_Production = CASE
        WHEN Crop_type = 'Paddy' AND Time_Period = '2021_22' THEN 1893
        WHEN Crop_type = 'Bajra' AND Time_Period = '2021_22' THEN 1896
        WHEN Crop_type = 'Jowar' AND Time_Period = '2021_22' THEN 2279
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2021_22' THEN 477
        WHEN Crop_type = 'Gram' AND Time_Period = '2021_22' THEN 4520
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2021_22' THEN 9004
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2021_22' THEN 7611
        WHEN Crop_type = 'Wheat' AND Time_Period = '2021_22' THEN NULL
        WHEN Crop_type = 'Maize' AND Time_Period = '2021_22' THEN 1571
        WHEN Crop_type = 'Cotton' AND Time_Period = '2021_22' THEN 6893
        WHEN Crop_type = 'Paddy' AND Time_Period = '2020_21' THEN 4098
        WHEN Crop_type = 'Bajra' AND Time_Period = '2020_21' THEN 2475
        WHEN Crop_type = 'Jowar' AND Time_Period = '2020_21' THEN 4388
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2020_21' THEN 255
        WHEN Crop_type = 'Gram' AND Time_Period = '2020_21' THEN 4425
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2020_21' THEN 8358
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2020_21' THEN 4377
        WHEN Crop_type = 'Wheat' AND Time_Period = '2020_21' THEN 2525
        WHEN Crop_type = 'Maize' AND Time_Period = '2020_21' THEN 1487
        WHEN Crop_type = 'Cotton' AND Time_Period = '2020_21' THEN 6445
        WHEN Crop_type = 'Paddy' AND Time_Period = '2019_20' THEN 4026
        WHEN Crop_type = 'Bajra' AND Time_Period = '2019_20' THEN 2145
        WHEN Crop_type = 'Jowar' AND Time_Period = '2019_20' THEN 3256
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2019_20' THEN 246
        WHEN Crop_type = 'Gram' AND Time_Period = '2019_20' THEN 4286
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2019_20' THEN 7996
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2019_20' THEN 4094
        WHEN Crop_type = 'Wheat' AND Time_Period = '2019_20' THEN 2856
        WHEN Crop_type = 'Maize' AND Time_Period = '2019_20' THEN 1481
        WHEN Crop_type = 'Cotton' AND Time_Period = '2019_20' THEN 6126
        WHEN Crop_type = 'Paddy' AND Time_Period = '2018_19' THEN 3650
        WHEN Crop_type = 'Bajra' AND Time_Period = '2018_19' THEN 1680
        WHEN Crop_type = 'Jowar' AND Time_Period = '2018_19' THEN 3020
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2018_19' THEN 215
        WHEN Crop_type = 'Gram' AND Time_Period = '2018_19' THEN 4364
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2018_19' THEN 7694
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2018_19' THEN 4058
        WHEN Crop_type = 'Wheat' AND Time_Period = '2018_19' THEN 2477
        WHEN Crop_type = 'Maize' AND Time_Period = '2018_19' THEN 1313
        WHEN Crop_type = 'Cotton' AND Time_Period = '2018_19' THEN 6155
        WHEN Crop_type = 'Paddy' AND Time_Period = '2017_18' THEN 1664
        WHEN Crop_type = 'Bajra' AND Time_Period = '2017_18' THEN NULL
        WHEN Crop_type = 'Jowar' AND Time_Period = '2017_18' THEN 3714
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2017_18' THEN 264
        WHEN Crop_type = 'Gram' AND Time_Period = '2017_18' THEN 7675
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2017_18' THEN 2187
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2017_18' THEN 3343
        WHEN Crop_type = 'Wheat' AND Time_Period = '2017_18' THEN NULL
        WHEN Crop_type = 'Maize' AND Time_Period = '2017_18' THEN 1298
        WHEN Crop_type = 'Cotton' AND Time_Period = '2017_18' THEN 6105
    END,
    Operational_Cost = CASE
        WHEN Crop_type = 'Paddy' AND Time_Period = '2021_22' THEN 70346
        WHEN Crop_type = 'Bajra' AND Time_Period = '2021_22' THEN 51552
        WHEN Crop_type = 'Jowar' AND Time_Period = '2021_22' THEN 55490
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2021_22' THEN 125060
        WHEN Crop_type = 'Gram' AND Time_Period = '2021_22' THEN 37684
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2021_22' THEN 64105
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2021_22' THEN 40624
        WHEN Crop_type = 'Wheat' AND Time_Period = '2021_22' THEN NULL
        WHEN Crop_type = 'Maize' AND Time_Period = '2021_22' THEN 63362
        WHEN Crop_type = 'Cotton' AND Time_Period = '2021_22' THEN 66141
        WHEN Crop_type = 'Paddy' AND Time_Period = '2020_21' THEN 72985
        WHEN Crop_type = 'Bajra' AND Time_Period = '2020_21' THEN 49475
        WHEN Crop_type = 'Jowar' AND Time_Period = '2020_21' THEN 38895
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2020_21' THEN 191798
        WHEN Crop_type = 'Gram' AND Time_Period = '2020_21' THEN 37617
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2020_21' THEN 92430
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2020_21' THEN 43575
        WHEN Crop_type = 'Wheat' AND Time_Period = '2020_21' THEN 49945
        WHEN Crop_type = 'Maize' AND Time_Period = '2020_21' THEN 65867
        WHEN Crop_type = 'Cotton' AND Time_Period = '2020_21' THEN 63840
        WHEN Crop_type = 'Paddy' AND Time_Period = '2019_20' THEN 79200
        WHEN Crop_type = 'Bajra' AND Time_Period = '2019_20' THEN 42362
        WHEN Crop_type = 'Jowar' AND Time_Period = '2019_20' THEN 41016
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2019_20' THEN 120852
        WHEN Crop_type = 'Gram' AND Time_Period = '2019_20' THEN 34404
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2019_20' THEN 72752
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2019_20' THEN 39600
        WHEN Crop_type = 'Wheat' AND Time_Period = '2019_20' THEN 46021
        WHEN Crop_type = 'Maize' AND Time_Period = '2019_20' THEN 55476
        WHEN Crop_type = 'Cotton' AND Time_Period = '2019_20' THEN 62831
        WHEN Crop_type = 'Paddy' AND Time_Period = '2018_19' THEN 83195
        WHEN Crop_type = 'Bajra' AND Time_Period = '2018_19' THEN 44632
        WHEN Crop_type = 'Jowar' AND Time_Period = '2018_19' THEN 36622
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2018_19' THEN 132040
        WHEN Crop_type = 'Gram' AND Time_Period = '2018_19' THEN 30388
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2018_19' THEN 71664
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2018_19' THEN 34960
        WHEN Crop_type = 'Wheat' AND Time_Period = '2018_19' THEN 47384
        WHEN Crop_type = 'Maize' AND Time_Period = '2018_19' THEN 51083
        WHEN Crop_type = 'Cotton' AND Time_Period = '2018_19' THEN 62408
        WHEN Crop_type = 'Paddy' AND Time_Period = '2017_18' THEN 65330
        WHEN Crop_type = 'Bajra' AND Time_Period = '2017_18' THEN NULL
        WHEN Crop_type = 'Jowar' AND Time_Period = '2017_18' THEN 64485
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2017_18' THEN 129882
        WHEN Crop_type = 'Gram' AND Time_Period = '2017_18' THEN 33783
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2017_18' THEN 40634
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2017_18' THEN 34710
        WHEN Crop_type = 'Wheat' AND Time_Period = '2017_18' THEN NULL
        WHEN Crop_type = 'Maize' AND Time_Period = '2017_18' THEN 66158
        WHEN Crop_type = 'Cotton' AND Time_Period = '2017_18' THEN 76303
    END,
    Fixed_Cost = CASE
        WHEN Crop_type = 'Paddy' AND Time_Period = '2021_22' THEN 33241
        WHEN Crop_type = 'Bajra' AND Time_Period = '2021_22' THEN 16744
        WHEN Crop_type = 'Jowar' AND Time_Period = '2021_22' THEN 42908
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2021_22' THEN 33686
        WHEN Crop_type = 'Gram' AND Time_Period = '2021_22' THEN 29202
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2021_22' THEN 19338
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2021_22' THEN 6704
        WHEN Crop_type = 'Wheat' AND Time_Period = '2021_22' THEN NULL
        WHEN Crop_type = 'Maize' AND Time_Period = '2021_22' THEN 39485
        WHEN Crop_type = 'Cotton' AND Time_Period = '2021_22' THEN 37570
        WHEN Crop_type = 'Paddy' AND Time_Period = '2020_21' THEN 14504
        WHEN Crop_type = 'Bajra' AND Time_Period = '2020_21' THEN 12752
        WHEN Crop_type = 'Jowar' AND Time_Period = '2020_21' THEN 11122
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2020_21' THEN 68425
        WHEN Crop_type = 'Gram' AND Time_Period = '2020_21' THEN 15281
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2020_21' THEN 19980
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2020_21' THEN 11805
        WHEN Crop_type = 'Wheat' AND Time_Period = '2020_21' THEN 1817
        WHEN Crop_type = 'Maize' AND Time_Period = '2020_21' THEN 23308
        WHEN Crop_type = 'Cotton' AND Time_Period = '2020_21' THEN 79372
        WHEN Crop_type = 'Paddy' AND Time_Period = '2019_20' THEN 14565
        WHEN Crop_type = 'Bajra' AND Time_Period = '2019_20' THEN 15130
        WHEN Crop_type = 'Jowar' AND Time_Period = '2019_20' THEN 16050
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2019_20' THEN 56106
        WHEN Crop_type = 'Gram' AND Time_Period = '2019_20' THEN 12480
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2019_20' THEN 15394
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2019_20' THEN 14455
        WHEN Crop_type = 'Wheat' AND Time_Period = '2019_20' THEN 13380
        WHEN Crop_type = 'Maize' AND Time_Period = '2019_20' THEN 21580
        WHEN Crop_type = 'Cotton' AND Time_Period = '2019_20' THEN 18368
        WHEN Crop_type = 'Paddy' AND Time_Period = '2018_19' THEN 18128
        WHEN Crop_type = 'Bajra' AND Time_Period = '2018_19' THEN 16380
        WHEN Crop_type = 'Jowar' AND Time_Period = '2018_19' THEN 13650
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2018_19' THEN 53116
        WHEN Crop_type = 'Gram' AND Time_Period = '2018_19' THEN 12050
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2018_19' THEN 15860
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2018_19' THEN 11590
        WHEN Crop_type = 'Wheat' AND Time_Period = '2018_19' THEN 16220
        WHEN Crop_type = 'Maize' AND Time_Period = '2018_19' THEN 21217
        WHEN Crop_type = 'Cotton' AND Time_Period = '2018_19' THEN 22333
        WHEN Crop_type = 'Paddy' AND Time_Period = '2017_18' THEN 34914
        WHEN Crop_type = 'Bajra' AND Time_Period = '2017_18' THEN NULL
        WHEN Crop_type = 'Jowar' AND Time_Period = '2017_18' THEN 27047
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2017_18' THEN 73967
        WHEN Crop_type = 'Gram' AND Time_Period = '2017_18' THEN 19763
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2017_18' THEN 17429
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2017_18' THEN 15711
        WHEN Crop_type = 'Wheat' AND Time_Period = '2017_18' THEN NULL
        WHEN Crop_type = 'Maize' AND Time_Period = '2017_18' THEN 26184
        WHEN Crop_type = 'Cotton' AND Time_Period = '2017_18' THEN 18406
    END;

-- Select all data to view the result
SELECT * FROM Andhra_Pradesh_cost_data;