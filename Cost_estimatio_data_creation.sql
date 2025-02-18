USE techathon;

DROP TABLE IF EXISTS combined_cost_data;
CREATE TABLE IF NOT EXISTS combined_cost_data(
	Time_Period VARCHAR(25),
    Crop_type VARCHAR(100),  -- Reduced size for efficiency
    State VARCHAR(50),       
    Cost INT(25) 
    );

INSERT INTO combined_cost_data VALUES
("2021_22", "Paddy", "Maharashtra", 97597),
("2021_22", "Maize", "Maharashtra", 92343),
("2021_22", "Wheat", "Maharashtra", 69000),
("2021_22", "Jowar", "Maharashtra", 51536),
("2021_22", "Bajra", "Maharashtra", 72926),
("2021_22", "Sugarcane", "Maharashtra", 242598),
("2021_22", "Gram", "Maharashtra", 60020),
("2021_22", "Groundnut", "Maharashtra", 116118),
("2021_22", "Soyabean", "Maharashtra", 70704),
("2021_22", "Cotton", "Maharashtra", 98962),

("2020_21", "Paddy", "Maharashtra", 88514),
("2020_21", "Maize", "Maharashtra", 89175),
("2020_21", "Wheat", "Maharashtra", 61886),
("2020_21", "Jowar", "Maharashtra", 49435),
("2020_21", "Bajra", "Maharashtra", 62228),
("2020_21", "Sugarcane", "Maharashtra", 260509),
("2020_21", "Gram", "Maharashtra", 54181),
("2020_21", "Groundnut", "Maharashtra", 112410),
("2020_21", "Soyabean", "Maharashtra", 57190),
("2020_21", "Cotton", "Maharashtra", 80900),

("2019_20", "Paddy", "Maharashtra", 102420),
("2019_20", "Maize", "Maharashtra", 77057),
("2019_20", "Wheat", "Maharashtra", 60607),
("2019_20", "Jowar", "Maharashtra", null),
("2019_20", "Bajra", "Maharashtra", 72926),
("2019_20", "Sugarcane", "Maharashtra", 242598),
("2019_20", "Gram", "Maharashtra", 47160),
("2019_20", "Groundnut", "Maharashtra", 88680),
("2019_20", "Soyabean", "Maharashtra", 55474),
("2019_20", "Cotton", "Maharashtra", 84103),

("2018_19", "Paddy", "Maharashtra", 108044),
("2018_19", "Maize", "Maharashtra", 72300),
("2018_19", "Wheat", "Maharashtra", 63907),
("2018_19", "Jowar", "Maharashtra", 51150),
("2018_19", "Bajra", "Maharashtra", 61070),
("2018_19", "Sugarcane", "Maharashtra", 185156),
("2018_19", "Gram", "Maharashtra", 43598),
("2018_19", "Groundnut", "Maharashtra", 87524),
("2018_19", "Soyabean", "Maharashtra", 48574),
("2018_19", "Cotton", "Maharashtra", 89570),

("2017_18", "Paddy", "Maharashtra", 88276),
("2017_18", "Maize", "Maharashtra", 74750),
("2017_18", "Wheat", "Maharashtra", 56000),
("2017_18", "Jowar", "Maharashtra", 50242),
("2017_18", "Bajra", "Maharashtra", 48500),
("2017_18", "Sugarcane", "Maharashtra", 231707),
("2017_18", "Gram", "Maharashtra", 54076),
("2017_18", "Groundnut", "Maharashtra", 75509),
("2017_18", "Soyabean", "Maharashtra", 46155),
("2017_18", "Cotton", "Maharashtra", 82930);

SELECT * FROM combined_cost_data;

ALTER TABLE combined_cost_data 
ADD COLUMN Cost_of_Production INT(25),
ADD COLUMN Operational_Cost INT(25),
ADD COLUMN Fixed_Cost INT(25);

UPDATE combined_cost_data
SET
    Cost_of_Production = CASE
        WHEN Crop_type = 'Paddy' AND Time_Period = '2021_22' THEN 4376
        WHEN Crop_type = 'Bajra' AND Time_Period = '2021_22' THEN 2696
        WHEN Crop_type = 'Jowar' AND Time_Period = '2021_22' THEN 3714
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2021_22' THEN 235
        WHEN Crop_type = 'Gram' AND Time_Period = '2021_22' THEN 4688
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2021_22' THEN 10294
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2021_22' THEN 4755
        WHEN Crop_type = 'Wheat' AND Time_Period = '2021_22' THEN 2814
        WHEN Crop_type = 'Maize' AND Time_Period = '2021_22' THEN 1428
        WHEN Crop_type = 'Cotton' AND Time_Period = '2021_22' THEN 8450
        
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
        
        WHEN Crop_type = 'Paddy' AND Time_Period = '2017_18' THEN 3020
        WHEN Crop_type = 'Bajra' AND Time_Period = '2017_18' THEN 2114
        WHEN Crop_type = 'Jowar' AND Time_Period = '2017_18' THEN 2670
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2017_18' THEN 212
        WHEN Crop_type = 'Gram' AND Time_Period = '2017_18' THEN 4460
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2017_18' THEN 6000
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2017_18' THEN 34820
        WHEN Crop_type = 'Wheat' AND Time_Period = '2017_18' THEN 2548
        WHEN Crop_type = 'Maize' AND Time_Period = '2017_18' THEN 1058
        WHEN Crop_type = 'Cotton' AND Time_Period = '2017_18' THEN 3495
    END,
    Operational_Cost = CASE
        WHEN Crop_type = 'Paddy' AND Time_Period = '2021_22' THEN 81228
        WHEN Crop_type = 'Bajra' AND Time_Period = '2021_22' THEN 58926
        WHEN Crop_type = 'Jowar' AND Time_Period = '2021_22' THEN 40158
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2021_22' THEN 178446
        WHEN Crop_type = 'Gram' AND Time_Period = '2021_22' THEN 43814
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2021_22' THEN 96820
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2021_22' THEN 53147
        WHEN Crop_type = 'Wheat' AND Time_Period = '2021_22' THEN 53559
        WHEN Crop_type = 'Maize' AND Time_Period = '2021_22' THEN 66158
        WHEN Crop_type = 'Cotton' AND Time_Period = '2021_22' THEN 76303
        
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
        
        WHEN Crop_type = 'Paddy' AND Time_Period = '2017_18' THEN 69690
        WHEN Crop_type = 'Bajra' AND Time_Period = '2017_18' THEN 34787
        WHEN Crop_type = 'Jowar' AND Time_Period = '2017_18' THEN 35702
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2017_18' THEN 164934
        WHEN Crop_type = 'Gram' AND Time_Period = '2017_18' THEN 37514
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2017_18' THEN 60639
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2017_18' THEN 35940
        WHEN Crop_type = 'Wheat' AND Time_Period = '2017_18' THEN 38830
        WHEN Crop_type = 'Maize' AND Time_Period = '2017_18' THEN 52578
        WHEN Crop_type = 'Cotton' AND Time_Period = '2017_18' THEN 63275
    END,
   
   Fixed_Cost = CASE
        WHEN Crop_type = 'Paddy' AND Time_Period = '2021_22' THEN 26184
        WHEN Crop_type = 'Bajra' AND Time_Period = '2021_22' THEN 14000
        WHEN Crop_type = 'Jowar' AND Time_Period = '2021_22' THEN 11378
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2021_22' THEN 64151
        WHEN Crop_type = 'Gram' AND Time_Period = '2021_22' THEN 15844
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2021_22' THEN 19300
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2021_22' THEN 16758
        WHEN Crop_type = 'Wheat' AND Time_Period = '2021_22' THEN 15360
        WHEN Crop_type = 'Maize' AND Time_Period = '2021_22' THEN 26184
        WHEN Crop_type = 'Cotton' AND Time_Period = '2021_22' THEN 18406
        
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
        
        WHEN Crop_type = 'Paddy' AND Time_Period = '2017_18' THEN 18197
        WHEN Crop_type = 'Bajra' AND Time_Period = '2017_18' THEN 13698
        WHEN Crop_type = 'Jowar' AND Time_Period = '2017_18' THEN 14480
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2017_18' THEN 66772
        WHEN Crop_type = 'Gram' AND Time_Period = '2017_18' THEN 16560
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2017_18' THEN 14870
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2017_18' THEN 10214
        WHEN Crop_type = 'Wheat' AND Time_Period = '2017_18' THEN 17146
        WHEN Crop_type = 'Maize' AND Time_Period = '2017_18' THEN 22172
        WHEN Crop_type = 'Cotton' AND Time_Period = '2017_18' THEN 19657
    END;
   
   
   