DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project;

CREATE TABLE project(
	project_id INT AUTO_INCREMENT NOT NULL, 
	project_name VARCHAR(128) NOT NULL,
	estimated_hours DECIMAL(7,2),
	actual_hours DECIMAL(7,2),
	difficulty INT,
	notes TEXT,
	PRIMARY KEY (project_id) 
);

CREATE TABLE material(
	material_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	material_name VARCHAR(128) NOT NULL,
	num_required INT,
	cost DECIMAL(7,2),
	PRIMARY KEY (material_id),
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE step(
	step_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	step_text TEXT NOT NULL,
	step_order	INT NOT NULL,
	PRIMARY KEY (step_id),
	FOREIGN KEY (project_id)REFERENCES project (project_id) ON DELETE CASCADE	
);

CREATE TABLE category(
	category_id INT AUTO_INCREMENT NOT NULL,
	category_name VARCHAR(128) NOT NULL,
	PRIMARY KEY (category_id)
);

CREATE TABLE project_category(
	project_id INT NOT NULL,
	category_id INT NOT NULL,
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
	FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
	UNIQUE KEY (project_id, category_id)
);

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes)
VALUES 
('Birthday Card', 4, 4.5, 3, 'Consider the recipient(s) favorite color(s) and the theme (cheerful or serious) before selecting cardstock, paper, and embellishments. Also, determine the size of the card. NOTE: These instructions are only for the front exterior of the card.'),
('Wall hanging', 1, 1, 2, 'Measure carefully for leveling the picture');


INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Cardstock', 5, 7.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Decorative paper', 3, 5.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Embelishments(gems, flowers, boats, etc.)', 5, 3.50);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Double-sided tape roll', 1, 3.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Paper crafting glue', 1, 3.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Scissors', 1, 3.00);

INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'wall hanging kit(assorted nails, hangers, hanging wire, pencil)', 1, 10.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'hammer', 1, 6.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'Wire cutter', 1, 8.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'Mirror', 1, 25.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'Tape measure', 1, 5.00);

INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Sketch your idea before you cut out your shapes.', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Cut your shapes out of the paper or cardstock you have chosen.', 2);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Fold your cardstock in half for the card base. Trim it to the desired size.', 3);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Position the shapes on the piece of cardstock you have chosen for the card base.', 4);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'After you have determined the best postion for all of the shapes, either place a minimal dot of glue behind each piece to hold it onto the cardstock. If the shape is large enough, double-sided tape that can be used to affix the item to the cardstock. Make sure all glue and tape are hidden.', 5);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Affix any embellishments in the desired position on the card.', 6);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Allow the glue to dry for 3 hours before handling the card or placing it in an envelope.', 7);

INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'Select the area where the mirror will be hung.', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'Using the measuring tape, measure the wall space width and height of the area where the mirror will be hung.', 2);
INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'Hold the mirror up to the wall in the desired position and use the pencil to mark the position where the mirror hanger will be set. The mirror hanger is usually in the center on the back side of the mirror but can also be on both top corners.', 3);
INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'If needed, cut the desired amount of wire to affix to both sides of the hangers on the back of the mirror. Make sure you are using a sufficient ammount to securely twist the wire on both sides of the mirror and that the wire is not too long. It can be hidden behind the mirror once it is hung.', 4);
INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'Select the desired nail(s) and hanger(s).', 5);
INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'Use the hammer to set the hanger(s) and nail(s) into the wall where needed.', 6);
INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'Hang the mirror on the wall using the hangers that you set into the wall.', 7);
INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'Adjust the mirror accordingly to make sure it is staightened on the wall.', 8);

INSERT INTO category (category_id, category_name) VALUES (1, 'Card crafting');
INSERT INTO category (category_id, category_name) VALUES (2, 'Wall hangings');

INSERT INTO project_category (project_id, category_id) VALUES (1, 1);
INSERT INTO project_category (project_id, category_id) VALUES (2, 2);

