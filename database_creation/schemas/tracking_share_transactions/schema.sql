USE spider;
CREATE TABLE  tracking_share_transactions.Investors (
investor_id INTEGER PRIMARY KEY,
Investor_details VARCHAR(255)
);

CREATE TABLE  tracking_share_transactions.Lots (
lot_id INTEGER PRIMARY KEY,
investor_id INTEGER NOT NULL,
lot_details VARCHAR(255),
FOREIGN KEY (investor_id ) REFERENCES  tracking_share_transactions.Investors(investor_id )
);

CREATE TABLE  tracking_share_transactions.Ref_Transaction_Types (
transaction_type_code VARCHAR(10) PRIMARY KEY,
transaction_type_description VARCHAR(80) NOT NULL
);



CREATE TABLE  tracking_share_transactions.Transactions (
transaction_id INTEGER PRIMARY KEY,
investor_id INTEGER NOT NULL,
transaction_type_code VARCHAR(10) NOT NULL,
date_of_transaction DATETIME,
amount_of_transaction DECIMAL(19,4),
share_count INTEGER,
other_details VARCHAR(255),
FOREIGN KEY (investor_id ) REFERENCES  tracking_share_transactions.Investors(investor_id ),FOREIGN KEY (transaction_type_code ) REFERENCES  tracking_share_transactions.Ref_Transaction_Types(transaction_type_code )
);


CREATE TABLE  tracking_share_transactions.Sales (
sales_transaction_id INTEGER PRIMARY KEY,
sales_details VARCHAR(255),
FOREIGN KEY (sales_transaction_id ) REFERENCES  tracking_share_transactions.Transactions(transaction_id )
);


CREATE TABLE  tracking_share_transactions.Purchases (
purchase_transaction_id INTEGER NOT NULL,
purchase_details VARCHAR(255) NOT NULL,
FOREIGN KEY (purchase_transaction_id ) REFERENCES  tracking_share_transactions.Transactions(transaction_id )
);



CREATE TABLE  tracking_share_transactions.Transactions_Lots (
transaction_id INTEGER NOT NULL,
lot_id INTEGER NOT NULL,
FOREIGN KEY (lot_id ) REFERENCES  tracking_share_transactions.Lots(lot_id ),
FOREIGN KEY (transaction_id ) REFERENCES  tracking_share_transactions.Transactions(transaction_id )
);


