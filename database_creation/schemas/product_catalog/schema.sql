USE spider;
CREATE TABLE  product_catalog.Attribute_Definitions (
attribute_id INTEGER PRIMARY KEY,
attribute_name VARCHAR(30),
attribute_data_type VARCHAR(10)
);

CREATE TABLE  product_catalog.Catalogs (
catalog_id INTEGER PRIMARY KEY,
catalog_name VARCHAR(50),
catalog_publisher VARCHAR(80),
date_of_publication DATETIME,
date_of_latest_revision DATETIME
);


CREATE TABLE  product_catalog.Catalog_Structure (
catalog_level_number INTEGER PRIMARY KEY,
catalog_id INTEGER NOT NULL,
catalog_level_name VARCHAR(50),
FOREIGN KEY (catalog_id ) REFERENCES  product_catalog.Catalogs(catalog_id )
);


CREATE TABLE  product_catalog.Catalog_Contents (
catalog_entry_id INTEGER PRIMARY KEY,
catalog_level_number INTEGER NOT NULL,
parent_entry_id INTEGER,
previous_entry_id INTEGER,
next_entry_id INTEGER,
catalog_entry_name VARCHAR(80),
product_stock_number VARCHAR(50),
price_in_dollars REAL NULL,
price_in_euros REAL NULL,
price_in_pounds REAL NULL,
capacity VARCHAR(20),
length VARCHAR(20),
height VARCHAR(20),
width VARCHAR(20),
FOREIGN KEY (catalog_level_number ) REFERENCES  product_catalog.Catalog_Structure(catalog_level_number )
);

CREATE TABLE  product_catalog.Catalog_Contents_Additional_Attributes (
catalog_entry_id INTEGER NOT NULL,
catalog_level_number INTEGER NOT NULL,
attribute_id INTEGER NOT NULL,
attribute_value VARCHAR(255) NOT NULL,
FOREIGN KEY (catalog_entry_id ) REFERENCES  product_catalog.Catalog_Contents(catalog_entry_id ),
FOREIGN KEY (catalog_level_number ) REFERENCES  product_catalog.Catalog_Structure(catalog_level_number )
);
