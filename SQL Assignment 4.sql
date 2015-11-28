DROP TABLE IF EXISTS Org;
CREATE TABLE Org (Emp_id INT PRIMARY KEY, Employee_Name VARCHAR(50) NOT NULL, Position VARCHAR(50) NOT NULL, Supervisor VARCHAR(50) NULL, Parent_id INT NULL);
INSERT INTO Org (Emp_id, Employee_Name, Position, Supervisor, Parent_id) 
VALUES
(1, 'Steve Jobs', 'CEO', NULL, NULL),
(2, 'Timothy Cook', 'Chief Operating Officer', 'Steve Jobs', 1),
(3, 'Katie Cottons', 'VP Communications', 'Steve Jobs', 1),
(4, 'Bob Mansfield', 'SVP, MAC Hardware Engineering', 'Steve Jobs', 1),
(5, 'Jeffrey Williams', 'SVP Operations', 'Steve Jobs', 1),
(6, 'Dan Riccio', 'VP IPad', 'Bob Mansfield', 4),
(7, 'David Tupman', 'VP Hardware', 'Bob Mansfield', 4),
(8, 'Steve Zadesky', 'VP IPad/IPhone Design', 'Bob Mansfield', 4),
(9, 'Michael Culbert', 'VP Architecture', 'Bob Mansfield', 4),
(10, 'John Couch', 'VP Educationb', 'Timothy Cook', 2), 
(11, 'John Brandon', 'VP Channel Sales', 'Timothy Cook', 2),
(12, 'Michael Fenger', 'VP IPhone Sales', 'Timothy Cook', 2),
(13, 'Douglas Beck', 'VP Apple Japan', 'Timothy Cook', 2),
(14, 'Jennifer Bailey', 'VP Online Stores', 'Timothy Cook', 2),
(16, 'William Frederick', 'VP Fulfillment', 'Jeffrey Williams', 5),
(17, 'Rita Lane', 'VP Operations', 'Jeffrey Williams', 5),
(18, 'Sabih Khan', 'VP Operations', 'Jeffrey Williams', 5),
(19, 'Deidre OBrien', 'VP Operations', 'Jeffrey Williams', 5),
(20, 'Joel Podolny', 'VP HR', 'Steve Jobs', 1);
SELECT * FROM Org;
SELECT Parent.Employee_Name AS Supervisor_Name, Parent.Position AS Supervisor_Role, Subsidiary.Employee_Name AS Employee_Name, Subsidiary.Position AS Employee_Role
	FROM Org Parent
		JOIN Org Subsidiary
        ON Subsidiary.Parent_id = Parent.Emp_id
	ORDER BY Supervisor_Name, Employee_Name;
    
