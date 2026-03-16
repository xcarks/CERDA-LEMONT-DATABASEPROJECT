CREATE DATABASE MagicTheGatheringDB;
USE MagicTheGatheringDB;

CREATE TABLE c_set(
	set_code VARCHAR(3) PRIMARY KEY,
    set_name VARCHAR(50) NOT NULL,
    set_date DATE NOT NULL
);

CREATE TABLE rarity(
	rarity_id INT PRIMARY KEY,
    rarity_name VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE c_format(
	format_id INT PRIMARY KEY,
    format_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE artist(
	artist_id INT PRIMARY KEY,
    artist_fname VARCHAR(50) NOT NULL,
    artist_lname VARCHAR(50) NOT NULL
);

CREATE TABLE color(
	color_name VARCHAR(50) PRIMARY KEY
);

CREATE TABLE c_type(
	type_name VARCHAR(50) PRIMARY KEY
);

CREATE TABLE subtype(
	subtype_name VARCHAR(50) PRIMARY KEY
);

CREATE TABLE cards(
	card_id INT PRIMARY KEY,
    card_name VARCHAR(50) NOT NULL UNIQUE,
    card_price FLOAT  NOT NULL,
    card_converted_mana_cost INT NOT NULL, 
    legendary BOOLEAN NOT NULL,
    token BOOLEAN NOT NULL,
    set_code VARCHAR(3),
    rarity_id INT,
    artist_id INT,
    FOREIGN KEY(set_code) REFERENCES c_set(set_code)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY(rarity_id) REFERENCES rarity(rarity_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY(artist_id) REFERENCES artist(artist_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE is_of_type(
	card_id INT,
    type_name VARCHAR(50),
    PRIMARY KEY (card_id, type_name),
    FOREIGN KEY (card_id) REFERENCES cards(card_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (type_name) REFERENCES c_type(type_name)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE is_of_subtype(
	card_id INT,
    subtype_name VARCHAR(50),
    PRIMARY KEY (card_id, subtype_name),
    FOREIGN KEY (card_id) REFERENCES cards(card_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (subtype_name) REFERENCES subtype(subtype_name)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE is_of_color(
	card_id INT,
    color_name VARCHAR(50),
    PRIMARY KEY (card_id, color_name),
    FOREIGN KEY (card_id) REFERENCES cards(card_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (color_name) REFERENCES color(color_name)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE format_legality(
	card_id INT,
    format_id INT,
    legality_status VARCHAR(50) NOT NULL,
    PRIMARY KEY (card_id, format_id),
    FOREIGN KEY (card_id) REFERENCES cards(card_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (format_id) REFERENCES c_format(format_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);
