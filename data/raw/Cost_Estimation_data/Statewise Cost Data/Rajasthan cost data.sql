USE techathon;

DROP TABLE IF EXISTS Uttar_pradesh_cost_data;
CREATE TABLE IF NOT EXISTS Uttar_pradesh_cost_data(
	Time_Period VARCHAR(25),
    Crop_type VARCHAR(100),  -- Reduced size for efficiency
    State VARCHAR(50),       
    Cost INT(25) 
    );
    
INSERT INTO Uttar_pradesh_cost_data VALUES
("2021_22", "Paddy", "Uttar Pradesh", 74657),
("2021_22", "Maize", "Uttar Pradesh", 54392),
("2021_22", "Wheat", "Uttar Pradesh", 75951),
("2021_22", "Jowar", "Uttar Pradesh", null),
("2021_22", "Bajra", "Uttar Pradesh", 43686),
("2021_22", "Sugarcane", "Uttar Pradesh", 164137),
("2021_22", "Gram", "Uttar Pradesh", 52718),
("2021_22", "Groundnut", "Uttar Pradesh", 142380),
("2021_22", "Soyabean", "Uttar Pradesh", null),
("2021_22", "Cotton", "Uttar Pradesh", null),

("2020_21", "Paddy", "Uttar Pradesh", 71564),
("2020_21", "Maize", "Uttar Pradesh", 54052),
("2020_21", "Wheat", "Uttar Pradesh", 72998),
("2020_21", "Jowar", "Uttar Pradesh", null),
("2020_21", "Bajra", "Uttar Pradesh", 41440),
("2020_21", "Sugarcane", "Uttar Pradesh", 150055),
("2020_21", "Gram", "Uttar Pradesh", 57830),
("2020_21", "Groundnut", "Uttar Pradesh", 40774),
("2020_21", "Soyabean", "Uttar Pradesh", null),
("2020_21", "Cotton", "Uttar Pradesh", null),

("2019_20", "Paddy", "Uttar Pradesh", 61728),
("2019_20", "Maize", "Uttar Pradesh", 55020),
("2019_20", "Wheat", "Uttar Pradesh", 60607),
("2019_20", "Jowar", "Uttar Pradesh", null),
("2019_20", "Bajra", "Uttar Pradesh", 44098),
("2019_20", "Sugarcane", "Uttar Pradesh", 138295),
("2019_20", "Gram", "Uttar Pradesh", 48684),
("2019_20", "Groundnut", "Uttar Pradesh", 51915),
("2019_20", "Soyabean", "Uttar Pradesh", null),
("2019_20", "Cotton", "Uttar Pradesh", null),

("2018_19", "Paddy", "Uttar Pradesh", 59772),
("2018_19", "Maize", "Uttar Pradesh", 50135),
("2018_19", "Wheat", "Uttar Pradesh", 66360),
("2018_19", "Jowar", "Uttar Pradesh", null),
("2018_19", "Bajra", "Uttar Pradesh", 61070),
("2018_19", "Sugarcane", "Uttar Pradesh", 13410),
("2018_19", "Gram", "Uttar Pradesh", 51431),
("2018_19", "Groundnut", "Uttar Pradesh", 50536),
("2018_19", "Soyabean", "Uttar Pradesh", null),
("2018_19", "Cotton", "Uttar Pradesh", null),

("2017_18", "Paddy", "Uttar Pradesh", 61514),
("2017_18", "Maize", "Uttar Pradesh", 47425),
("2017_18", "Wheat", "Uttar Pradesh", 63368),
("2017_18", "Jowar", "Uttar Pradesh", null),
("2017_18", "Bajra", "Uttar Pradesh", 34464),
("2017_18", "Sugarcane", "Uttar Pradesh", 125636),
("2017_18", "Gram", "Uttar Pradesh", 45512),
("2017_18", "Groundnut", "Uttar Pradesh", 44865),
("2017_18", "Soyabean", "Uttar Pradesh", null),
("2017_18", "Cotton", "Uttar Pradesh", null);    

ALTER TABLE Uttar_pradesh_cost_data 
ADD COLUMN Cost_of_Production INT(25),
ADD COLUMN Operational_Cost INT(25),
ADD COLUMN Fixed_Cost INT(25);

UPDATE Uttar_pradesh_cost_data
SET
    Cost_of_Production = CASE
        WHEN Crop_type = 'Paddy' AND Time_Period = '2021_22' THEN 2136
        WHEN Crop_type = 'Bajra' AND Time_Period = '2021_22' THEN 1956
        WHEN Crop_type = 'Jowar' AND Time_Period = '2021_22' THEN null
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2021_22' THEN 254
        WHEN Crop_type = 'Gram' AND Time_Period = '2021_22' THEN 6052
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2021_22' THEN 4754
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2021_22' THEN null
        WHEN Crop_type = 'Wheat' AND Time_Period = '2021_22' THEN 1792
        WHEN Crop_type = 'Maize' AND Time_Period = '2021_22' THEN 1903
        WHEN Crop_type = 'Cotton' AND Time_Period = '2021_22' THEN null
        
        WHEN Crop_type = 'Paddy' AND Time_Period = '2020_21' THEN 1874
        WHEN Crop_type = 'Bajra' AND Time_Period = '2020_21' THEN 1824
        WHEN Crop_type = 'Jowar' AND Time_Period = '2020_21' THEN null
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2020_21' THEN 264
        WHEN Crop_type = 'Gram' AND Time_Period = '2020_21' THEN 5917
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2020_21' THEN 3996
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2020_21' THEN null
        WHEN Crop_type = 'Wheat' AND Time_Period = '2020_21' THEN 1705
        WHEN Crop_type = 'Maize' AND Time_Period = '2020_21' THEN 1374
        WHEN Crop_type = 'Cotton' AND Time_Period = '2020_21' THEN null
        
        WHEN Crop_type = 'Paddy' AND Time_Period = '2019_20' THEN 1798
        WHEN Crop_type = 'Bajra' AND Time_Period = '2019_20' THEN 1542
        WHEN Crop_type = 'Jowar' AND Time_Period = '2019_20' THEN null
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2019_20' THEN 230
        WHEN Crop_type = 'Gram' AND Time_Period = '2019_20' THEN 4872
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2019_20' THEN 3586
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2019_20' THEN null
        WHEN Crop_type = 'Wheat' AND Time_Period = '2019_20' THEN 1476
        WHEN Crop_type = 'Maize' AND Time_Period = '2019_20' THEN 1839
        WHEN Crop_type = 'Cotton' AND Time_Period = '2019_20' THEN null
        
        WHEN Crop_type = 'Paddy' AND Time_Period = '2018_19' THEN 1741
        WHEN Crop_type = 'Bajra' AND Time_Period = '2018_19' THEN 1437
        WHEN Crop_type = 'Jowar' AND Time_Period = '2018_19' THEN null
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2018_19' THEN 250
        WHEN Crop_type = 'Gram' AND Time_Period = '2018_19' THEN 3812
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2018_19' THEN 4500
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2018_19' THEN null
        WHEN Crop_type = 'Wheat' AND Time_Period = '2018_19' THEN 1514
        WHEN Crop_type = 'Maize' AND Time_Period = '2018_19' THEN 1735
        WHEN Crop_type = 'Cotton' AND Time_Period = '2018_19' THEN null
        
        WHEN Crop_type = 'Paddy' AND Time_Period = '2017_18' THEN 61363
        WHEN Crop_type = 'Bajra' AND Time_Period = '2017_18' THEN 1354
        WHEN Crop_type = 'Jowar' AND Time_Period = '2017_18' THEN null
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2017_18' THEN 218
        WHEN Crop_type = 'Gram' AND Time_Period = '2017_18' THEN 5595
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2017_18' THEN 2187
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2017_18' THEN 3343
        WHEN Crop_type = 'Wheat' AND Time_Period = '2017_18' THEN 1633
        WHEN Crop_type = 'Maize' AND Time_Period = '2017_18' THEN 1677
        WHEN Crop_type = 'Cotton' AND Time_Period = '2017_18' THEN null
    END,
    Operational_Cost = CASE
        WHEN Crop_type = 'Paddy' AND Time_Period = '2021_22' THEN 54670
        WHEN Crop_type = 'Bajra' AND Time_Period = '2021_22' THEN 29007
        WHEN Crop_type = 'Jowar' AND Time_Period = '2021_22' THEN null
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2021_22' THEN 188011
        WHEN Crop_type = 'Gram' AND Time_Period = '2021_22' THEN 35572
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2021_22' THEN 102495
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2021_22' THEN null
        WHEN Crop_type = 'Wheat' AND Time_Period = '2021_22' THEN 47775
        WHEN Crop_type = 'Maize' AND Time_Period = '2021_22' THEN 35866
        WHEN Crop_type = 'Cotton' AND Time_Period = '2021_22' THEN null
        
        WHEN Crop_type = 'Paddy' AND Time_Period = '2020_21' THEN 51667
        WHEN Crop_type = 'Bajra' AND Time_Period = '2020_21' THEN 28354
        WHEN Crop_type = 'Jowar' AND Time_Period = '2020_21' THEN null
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2020_21' THEN 86400
        WHEN Crop_type = 'Gram' AND Time_Period = '2020_21' THEN 35948
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2020_21' THEN 30376
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2020_21' THEN null
        WHEN Crop_type = 'Wheat' AND Time_Period = '2020_21' THEN 45339
        WHEN Crop_type = 'Maize' AND Time_Period = '2020_21' THEN 36227
        WHEN Crop_type = 'Cotton' AND Time_Period = '2020_21' THEN null
        
        WHEN Crop_type = 'Paddy' AND Time_Period = '2019_20' THEN 43525
        WHEN Crop_type = 'Bajra' AND Time_Period = '2019_20' THEN 26867
        WHEN Crop_type = 'Jowar' AND Time_Period = '2019_20' THEN null
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2019_20' THEN 82070
        WHEN Crop_type = 'Gram' AND Time_Period = '2019_20' THEN 28181
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2019_20' THEN 38388
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2019_20' THEN null
        WHEN Crop_type = 'Wheat' AND Time_Period = '2019_20' THEN 37585
        WHEN Crop_type = 'Maize' AND Time_Period = '2019_20' THEN 38222
        WHEN Crop_type = 'Cotton' AND Time_Period = '2019_20' THEN null
        
        WHEN Crop_type = 'Paddy' AND Time_Period = '2018_19' THEN 41972
        WHEN Crop_type = 'Bajra' AND Time_Period = '2018_19' THEN 27150
        WHEN Crop_type = 'Jowar' AND Time_Period = '2018_19' THEN null
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2018_19' THEN 76245
        WHEN Crop_type = 'Gram' AND Time_Period = '2018_19' THEN 27950
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2018_19' THEN 37432
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2018_19' THEN null
        WHEN Crop_type = 'Wheat' AND Time_Period = '2018_19' THEN 40455
        WHEN Crop_type = 'Maize' AND Time_Period = '2018_19' THEN 34758
        WHEN Crop_type = 'Cotton' AND Time_Period = '2018_19' THEN null
        
        WHEN Crop_type = 'Paddy' AND Time_Period = '2017_18' THEN 43330
        WHEN Crop_type = 'Bajra' AND Time_Period = '2017_18' THEN null
        WHEN Crop_type = 'Jowar' AND Time_Period = '2017_18' THEN 64485
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2017_18' THEN 73272
        WHEN Crop_type = 'Gram' AND Time_Period = '2017_18' THEN 28255
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2017_18' THEN 33220
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2017_18' THEN null
        WHEN Crop_type = 'Wheat' AND Time_Period = '2017_18' THEN 35866
        WHEN Crop_type = 'Maize' AND Time_Period = '2017_18' THEN 60675
        WHEN Crop_type = 'Cotton' AND Time_Period = '2017_18' THEN null
    END,
   
   Fixed_Cost = CASE
        WHEN Crop_type = 'Paddy' AND Time_Period = '2021_22' THEN 19986
        WHEN Crop_type = 'Bajra' AND Time_Period = '2021_22' THEN 14678
        WHEN Crop_type = 'Jowar' AND Time_Period = '2021_22' THEN null
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2021_22' THEN 67480
        WHEN Crop_type = 'Gram' AND Time_Period = '2021_22' THEN 17190
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2021_22' THEN 13967
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2021_22' THEN null
        WHEN Crop_type = 'Wheat' AND Time_Period = '2021_22' THEN 28176
        WHEN Crop_type = 'Maize' AND Time_Period = '2021_22' THEN 15197
        WHEN Crop_type = 'Cotton' AND Time_Period = '2021_22' THEN null
        
        WHEN Crop_type = 'Paddy' AND Time_Period = '2020_21' THEN 19897
        WHEN Crop_type = 'Bajra' AND Time_Period = '2020_21' THEN 12871
        WHEN Crop_type = 'Jowar' AND Time_Period = '2020_21' THEN null
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2020_21' THEN 62884
        WHEN Crop_type = 'Gram' AND Time_Period = '2020_21' THEN 17680
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2020_21' THEN 10399
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2020_21' THEN null
        WHEN Crop_type = 'Wheat' AND Time_Period = '2020_21' THEN 27209
        WHEN Crop_type = 'Maize' AND Time_Period = '2020_21' THEN 17825
        WHEN Crop_type = 'Cotton' AND Time_Period = '2020_21' THEN null
        
        WHEN Crop_type = 'Paddy' AND Time_Period = '2019_20' THEN 17992
        WHEN Crop_type = 'Bajra' AND Time_Period = '2019_20' THEN 17230
        WHEN Crop_type = 'Jowar' AND Time_Period = '2019_20' THEN null
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2019_20' THEN 56224
        WHEN Crop_type = 'Gram' AND Time_Period = '2019_20' THEN 19595
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2019_20' THEN 13527
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2019_20' THEN null
        WHEN Crop_type = 'Wheat' AND Time_Period = '2019_20' THEN 61420
        WHEN Crop_type = 'Maize' AND Time_Period = '2019_20' THEN 16665
        WHEN Crop_type = 'Cotton' AND Time_Period = '2019_20' THEN null
        
        WHEN Crop_type = 'Paddy' AND Time_Period = '2018_19' THEN 17880
        WHEN Crop_type = 'Bajra' AND Time_Period = '2018_19' THEN 24745
        WHEN Crop_type = 'Jowar' AND Time_Period = '2018_19' THEN null
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2018_19' THEN 16970
        WHEN Crop_type = 'Gram' AND Time_Period = '2018_19' THEN 22950
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2018_19' THEN 13105
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2018_19' THEN null
        WHEN Crop_type = 'Wheat' AND Time_Period = '2018_19' THEN 24745
        WHEN Crop_type = 'Maize' AND Time_Period = '2018_19' THEN 15378
        WHEN Crop_type = 'Cotton' AND Time_Period = '2018_19' THEN null
        
        WHEN Crop_type = 'Paddy' AND Time_Period = '2017_18' THEN 18052
        WHEN Crop_type = 'Bajra' AND Time_Period = '2017_18' THEN 12418
        WHEN Crop_type = 'Jowar' AND Time_Period = '2017_18' THEN null
        WHEN Crop_type = 'Sugarcane' AND Time_Period = '2017_18' THEN 52365
        WHEN Crop_type = 'Gram' AND Time_Period = '2017_18' THEN 16425
        WHEN Crop_type = 'Groundnut' AND Time_Period = '2017_18' THEN 11645
        WHEN Crop_type = 'Soyabean' AND Time_Period = '2017_18' THEN null
        WHEN Crop_type = 'Wheat' AND Time_Period = '2017_18' THEN 21792
        WHEN Crop_type = 'Maize' AND Time_Period = '2017_18' THEN 35375
        WHEN Crop_type = 'Cotton' AND Time_Period = '2017_18' THEN null
    END;