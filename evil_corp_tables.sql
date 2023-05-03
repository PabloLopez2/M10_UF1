DROP TABLE IF EXISTS treatments;
DROP TABLE IF EXISTS medicines;
DROP TABLE IF EXISTS doctors;
DROP TABLE IF EXISTS `condition`;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS diagnoses;

CREATE TABLE users (
	id_user BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(64) NOT NULL,
	email VARCHAR(128) NOT NULL,
	`password` VARCHAR(32) NOT NULL,
	gender CHAR(1) NOT NULL,
	country CHAR(3) NOT NULL,
	birth_date DATE NOT NULL,
	created_at DATETIME NOT NULL
);

CREATE TABLE medicines (
	id_medicine INT UNSIGNED NOT NULL AUTO_INCREMENT,
	medicament VARCHAR(192) NOT NULL,
	production_cost DECIMAL(9,2) NOT NULL,
	sell_cost DECIMAL(9,2) NOT NULL,
	PRIMARY KEY (id_medicine)
);

CREATE TABLE doctors (
	id_doctor INT UNSIGNED NOT NULL AUTO_INCREMENT,
	doctor VARCHAR(32) NOT NULL,
	PRIMARY KEY (id_doctor)
);

CREATE TABLE `condition` (
	id_condition INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`condition` VARCHAR(64) NOT NULL,
	symptoms TEXT NOT NULL,
	description TEXT NOT NULL,
	deadly BOOLEAN NOT NULL
);

CREATE TABLE diagnoses (
	id_diagnosis BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	diagnosis TEXT NOT NULL,
	id_doctor INT UNSIGNED NOT NULL,
	id_user BIGINT UNSIGNED NOT NULL,
	id_condition INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_doctor) REFERENCES doctors(id_doctor), 
	FOREIGN KEY (id_user) REFERENCES users(id_user),
	FOREIGN KEY (id_condition) REFERENCES `condition`(id_condition)
);

CREATE TABLE treatments (
	id_treatment BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_diagnosis BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (id_diagnosis) REFERENCES diagnoses(id_diagnosis)
);

INSERT INTO users (username, first_name, last_name, email, password, gender, country, birth_date, created_at)
VALUES ('root','mr.musgo@gmail.com', '95a6a7ebcb9a717b17c7a7f895de906c', ‘M’, 'ESP', '1985-12-12', NOW());

/*Lo siento Rafa no me da tiempo a hacerlo y todo lo que hay a partir de abajo es chat haha (NO SOY UN CHATERO xd)*/

INSERT INTO users (username, email, password, gender, country, birth_date, created_at)
VALUES
  ('JohnDoe', 'johndoe@example.com', 'password1', 'M', 'USA', '1990-01-01', NOW()),
  ('JaneDoe', 'janedoe@example.com', 'password2', 'F', 'CAN', '1995-05-05', NOW()),
  ('BobSmith', 'bobsmith@example.com', 'password3', 'M', 'UK', '1985-12-25', NOW());

INSERT INTO doctors (doctor)
VALUES
  ('Dr. Smith'),
  ('Dr. Johnson');

INSERT INTO medicines (medicament, production_cost, sell_cost)
VALUES
  ('Aspirin', 1.00, 3.00),
  ('Ibuprofen', 2.00, 5.00),
  ('Paracetamol', 0.50, 2.50),
  ('Amoxicillin', 3.00, 10.00);

INSERT INTO `condition` (`condition`, symptoms, description, deadly)
VALUES
  ('Flu', 'Fever, cough, headache', 'A common respiratory illness', 0),
  ('Diabetes', 'Increased thirst, frequent urination', 'A metabolic disorder', 0),
  ('Cancer', 'Unexplained weight loss, fatigue', 'A group of diseases characterized by abnormal cell growth', 1),
  ('Depression', 'Feeling sad or hopeless, loss of interest', 'A mood disorder', 0),
  ('Anemia', 'Fatigue, weakness, pale skin', 'A condition in which there are not enough red blood cells in the body', 0),
  ('High blood pressure', 'Headache, blurred vision', 'A condition in which the force of the blood against the artery walls is too high', 0);

INSERT INTO diagnoses (diagnosis, id_doctor, id_user, id_condition)
VALUES
  ('You have the flu', 1, 1, 1),
  ('You have diabetes', 2, 2, 2),
  ('You have cancer', 1, 1, 3),
  ('You have depression', 2, 3, 4);

INSERT INTO treatments (id_diagnosis)
VALUES
  (1),
  (2),
  (3),
  (4),
  (2),
  (4);


