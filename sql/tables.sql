BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS products (id INTEGER PRIMARY KEY NOT NULL, name TEXT, amount INTEGER NOT NULL DEFAULT 0);
CREATE TABLE IF NOT EXISTS sales (user INTEGER NOT NULL REFERENCES users, product INTEGER NOT NULL REFERENCES products, timestamp INTEGER NOT NULL DEFAULT 0);
CREATE TABLE IF NOT EXISTS restock (user INTEGER NOT NULL REFERENCES users, product INTEGER NOT NULL REFERENCES products, amount INTEGER NOT NULL DEFAULT 0, timestamp INTEGER NOT NULL DEFAULT 0, price INTEGER NOT NULL DEFAULT 0, supplier INTEGER, best_before_date INTEGER);
CREATE TABLE IF NOT EXISTS prices (product INTEGER NOT NULL REFERENCES products, valid_from INTEGER NOT NULL DEFAULT 0, memberprice INTEGER NOT NULL DEFAULT 0, guestprice INTEGER NOT NULL DEFAULT 0);
CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY NOT NULL, email TEXT, firstname TEXT NOT NULL, lastname TEXT NOT NULL, gender TEXT, street TEXT, plz INTEGER, city TEXT, pgp TEXT);
CREATE TABLE IF NOT EXISTS authentication(user INTEGER PRIMARY KEY NOT NULL REFERENCES users, password TEXT, session CHARACTER(20), superuser BOOLEAN NOT NULL DEFAULT 0, disabled BOOLEAN NOT NULL DEFAULT 0);
CREATE TABLE IF NOT EXISTS supplier(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, city TEXT, postal_code TEXT, street TEXT, phone TEXT, website TEXT);
CREATE INDEX IF NOT EXISTS invoiceindex ON sales (user ASC, timestamp DESC);
COMMIT;
