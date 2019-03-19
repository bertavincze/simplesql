--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET default_tablespace = '';
SET default_with_oids = false;

---
--- drop tables
---

DROP TABLE IF EXISTS customer CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS order_detail;
DROP TABLE IF EXISTS product;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE customer (
    CustomerID bpchar NOT NULL,
    CompanyName character varying(40) NOT NULL,
    ContactName character varying(30),
    ContactTitle character varying(30),
    Address character varying(60),
    City character varying(15),
    Region character varying(15),
    PostalCode character varying(10),
    Country character varying(15),
    Phone character varying(24),
    Fax character varying(24)
);

--
-- Name: orders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orders (
    OrderID smallint NOT NULL,
    CustomerID bpchar,
    EmployeeID smallint,
    OrderDate date,
    RequiredDate date,
    ShippedDate date,
    ShipVia smallint,
    Freight real,
    ShipName character varying(40),
    ShipAddress character varying(60),
    ShipCity character varying(15),
    ShipRegion character varying(15),
    ShipPostalCode character varying(10),
    ShipCountry character varying(15)
);

--
-- Name: order_detail; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE order_detail (
    OrderID smallint NOT NULL,
    ProductID smallint NOT NULL,
    UnitPrice real NOT NULL,
    Quantity smallint NOT NULL,
    Discount real NOT NULL
);

--
-- Name: product; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE product (
    ProductID smallint NOT NULL,
    ProductName character varying(40) NOT NULL,
    SupplierID smallint,
    CategoryID smallint,
    QuantityPerUnit character varying(20),
    UnitPrice real,
    UnitsInStock smallint,
    UnitsOnOrder smallint,
    ReorderLevel smallint,
    Discontinued integer NOT NULL
);

--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO customer VALUES ('ALFKI', 'Alfreds Futterkiste', 'Maria Anders', 'Sales Representative', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', '030-0074321', '030-0076545');
INSERT INTO customer VALUES ('ANATR', 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Owner', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico', '(5) 555-4729', '(5) 555-3745');
INSERT INTO customer VALUES ('ANTON', 'Antonio Moreno Taquería', 'Antonio Moreno', 'Owner', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico', '(5) 555-3932', NULL);

--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO orders VALUES (10759, 'ANATR', 3, '1997-11-28', '1997-12-26', '1997-12-12', 3, 11.9899998, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico');
INSERT INTO orders VALUES (10952, 'ALFKI', 1, '1998-03-16', '1998-04-27', '1998-03-24', 1, 40.4199982, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO orders VALUES (10856, 'ANTON', 3, '1998-01-28', '1998-02-25', '1998-02-10', 2, 58.4300003, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico');

--
-- Data for Name: order_detail; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO order_detail VALUES (10759, 32, 32, 10, 0);
INSERT INTO order_detail VALUES (10952, 6, 25, 16, 0.0500000007);
INSERT INTO order_detail VALUES (10952, 28, 45.5999985, 2, 0);
INSERT INTO order_detail VALUES (11011, 58, 13.25, 40, 0.0500000007);
INSERT INTO order_detail VALUES (11011, 71, 21.5, 20, 0);
INSERT INTO order_detail VALUES (10856, 2, 19, 20, 0);
INSERT INTO order_detail VALUES (10856, 42, 14, 20, 0);

--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO product VALUES (1, 'Chai', 8, 1, '10 boxes x 30 bags', 18, 39, 0, 10, 1);
INSERT INTO product VALUES (2, 'Chang', 1, 1, '24 - 12 oz bottles', 19, 17, 40, 25, 1);
INSERT INTO product VALUES (3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10, 13, 70, 25, 0);
INSERT INTO product VALUES (4, 'Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22, 53, 0, 0, 0);
INSERT INTO product VALUES (5, 'Chef Anton''s Gumbo Mix', 2, 2, '36 boxes', 21.3500004, 0, 0, 0, 1);
INSERT INTO product VALUES (6, 'Grandma''s Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25, 120, 0, 25, 0);

--
-- Name: pk_customer; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT pk_customer PRIMARY KEY (CustomerID);

--
-- Name: pk_order; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT pk_order PRIMARY KEY (OrderID);

--
-- Name: pk_order_detail; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY order_detail
    ADD CONSTRAINT pk_order_detail PRIMARY KEY (OrderID,ProductID);
   
--
-- Name: pk_product; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY product
    ADD CONSTRAINT pk_product PRIMARY KEY (ProductID);
   
--
-- Name: fk_order_customer; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_order_customer FOREIGN KEY (CustomerID) REFERENCES customer;
