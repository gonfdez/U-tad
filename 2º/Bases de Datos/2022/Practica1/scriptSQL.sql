-- Autor Gonzalo Fernandez Suarez

-- Actividad 1
-- Algebra relacional: σ territory ≠ 'EMEA' and city ≠ 'London' office
SELECT * FROM office WHERE territory != 'EMEA' and city != 'London';

-- Actividad 2

-- Estudiante ∪ Profesor
SELECT * FROM Estudiante UNION Select * FROM Profesor;

-- Estudiante ∩ Profesor
SELECT * FROM Estudiante INTERSECT Select * FROM Profesor;

-- Profesor - Estudiante
SELECT * FROM Profesor EXCEPT SELECT * FROM Estudiante;

-- Actividad 3
SELECT COUNT(dept_name) AS numeroProfes, dept_name FROM  'instructor' 
GROUP BY dept_name ORDER BY COUNT(dept_name) DESC LIMIT 1;

-- Actividad 4
SELECT COUNT(room_number) AS asignaturas, room_number FROM 'section' 
WHERE year = 2018 GROUP BY room_number ORDER BY asignaturas DESC LIMIT 1;

-- Actividad 5
SELECT course_id, title, dept_name FROM course WHERE course_id
NOT IN (SELECT course_id FROM section);

SELECT COUNT(room_number) AS n, room_number FROM section 
WHERE year = 2018 GROUP BY room_number ORDER BY n ASC LIMIT 1;

-- Actividad 6
SELECT instructor.name, COUNT(course.course_id) AS numAsignaturas
FROM instructor,course WHERE course.dept_name = instructor.dept_name
GROUP BY instructor.name ORDER BY numAsignaturas DESC;

-- Actividad 7
SELECT CONCAT(e.firstName,' ',e.lastName) AS nombreEmpleado, CONCAT(e1.firstName,' ',e1.lastName) AS nombreJefe
FROM employees AS e JOIN employees AS e1 ON e.reportsTo = e1.employeeNumber;

-- Actividad 8

-- /asignaturas.csv
-- ID;asignatura;semestre;creditos
-- 1;Int BBDD;2;6
-- 2;Sist. Oper.;1;6
-- 3;Lab. Programacion;2;4.5

CREATE TABLE asignatura ( 
id INT NOT NULL AUTO_INCREMENT, 
asignatura VARCHAR(255) NOT NULL,
semestre INT NOT NULL,
creditos DECIMAL(10,9) NOT NULL,
PRIMARY KEY(id));

LOAD DATA INFILE 'C:/Users/gonef/Desktop/U-tad/2º/2º cuatri/Bases de Datos/2022 BASES DE DATOS/PRACTICA 1/asignaturas.csv' 
INTO TABLE asignatura 
FIELDS TERMINATED BY ';' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM 'asignatura';

-- Actividad 9
SELECT COUNT(payments.customerNumber) AS nPagos, c.customerNumber, 
CONCAT(c.contactFirstName, ' ', c.contactLastName) 
FROM 'customers' AS c JOIN payments ON c.customerNumber = payments.customerNumber
GROUP BY payments.customerNumber ORDER BY nPagos DESC LIMIT 5;

-- Actividad 10
SELECT productName, productLine, 
CASE 
	WHEN productLine = 'Classic Cars' THEN '5%' 
	WHEN productLine = 'Planes' THEN '2%' 
	WHEN productLine = 'Motorcycles' THEN '4%' 
	WHEN productLine = 'Ships' THEN '3%' 
ELSE '6%' 
END AS descuento FROM products;






