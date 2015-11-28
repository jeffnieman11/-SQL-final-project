DROP DATABASE IF EXISTS BuildingEnergy;
CREATE DATABASE BuildingEnergy;
DROP TABLE IF EXISTS EnergyCategories;

CREATE TABLE EnergyCategories (Cat_id INT PRIMARY KEY NOT NULL, Category VARCHAR(50) NOT NULL);
INSERT INTO EnergyCategories (Cat_id, Category) 
VALUES
(1, 'Fossil'),
(2, 'Renewable');


DROP TABLE IF EXISTS EnergyTypes;

CREATE TABLE EnergyTypes (Type_id INT NOT NULL, Type VARCHAR (50), Category VARCHAR(50));
INSERT INTO EnergyTypes (Type_id, Type, Category)
VALUES
(1, 'Electricity', 'Fossil'),
(2, 'Gas', 'Fossil'),
(3, 'Steam', 'Fossil'),
(4, 'Fuel Oil', 'Fossil'),
(5, 'Solar', 'Renewable'),
(6, 'Wind', 'Renewable');

SELECT EnergyCategories.Category, EnergyTypes.Type
FROM EnergyCategories 
LEFT JOIN EnergyTypes
ON EnergyCategories.Category = EnergyTypes.Category;

DROP TABLE IF EXISTS Building;
CREATE TABLE Building (Bldg_id INT PRIMARY KEY NOT NULL, BuildingName VARCHAR(50) NOT NULL);
INSERT INTO Building (Bldg_id, BuildingName)
VALUES
(1, 'Borough of Manhattan Community College'),
(2, 'Chrysler Building'),
(3, 'Empire State Building'); 

SELECT * FROM Building;

DROP TABLE IF EXISTS Building_EnergyTypes;

CREATE TABLE Building_EnergyTypes
(
  Bldg_id INT NOT NULL REFERENCES Building(Bldg_id),
  Type_id INT NOT NULL REFERENCES EnergyTypes(Type_id),
  CONSTRAINT pk_Building_EnergyTypes PRIMARY KEY(Bldg_id, Type_id)
 );

INSERT INTO Building_EnergyTypes (Bldg_id, Type_id)
VALUES
(1,1),
(1,3),
(1,5),
(2,1),
(2,3),
(3,1),
(3,2),
(3,3);

SELECT * FROM Building_EnergyTypes;

SELECT Building.BuildingName, EnergyTypes.Type
FROM Building 
	LEFT JOIN Building_EnergyTypes ON Building.Bldg_id=Building_EnergyTypes.Bldg_id
	LEFT JOIN EnergyTypes ON Building_EnergyTypes.Type_id=EnergyTypes.Type_id
    ORDER BY BuildingName, Type;

INSERT INTO Building(Bldg_id, BuildingName)
VALUES
    (4, 'Bronx Lion House'),
    (5, 'Brooklyn Chidrens Museum');
    
SELECT * FROM Building;

INSERT INTO EnergyTypes (Type_id, Type, Category) 
VALUES
	(7, 'Geothermal', 'Renewable');

Select * FROM EnergyTypes;

INSERT INTO Building_EnergyTypes (Bldg_id, Type_id)
VALUES
(4,7),
(5,1),
(5,7);

SELECT * FROM Building_EnergyTypes;

SELECT Building.BuildingName, EnergyTypes.Type, EnergyTypes.Category
FROM Building 
	LEFT JOIN Building_EnergyTypes ON Building.Bldg_id=Building_EnergyTypes.Bldg_id
	LEFT JOIN EnergyTypes ON Building_EnergyTypes.Type_id=EnergyTypes.Type_id
    WHERE Category = 'Renewable';
    
SELECT EnergyTypes.Type, COUNT(EnergyTypes.Type)
FROM Building 
	LEFT JOIN Building_EnergyTypes ON Building.Bldg_id=Building_EnergyTypes.Bldg_id
	LEFT JOIN EnergyTypes ON Building_EnergyTypes.Type_id=EnergyTypes.Type_id
    GROUP BY EnergyTypes.Type 
    ORDER BY COUNT(EnergyTypes.Type) DESC;
    