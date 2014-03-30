CREATE TABLE Customer (
	Customer_ID VARCHAR(20),
Username VARCHAR(15),
	Password VARCHAR(10),
	FirstName VARCHAR(20),
	LastName VARCHAR(20),
	EmailId VARCHAR(15),
	Address VARCHAR(50),
	ZipCode INTEGER(10),
PRIMARY KEY (Customer_ID)
);


CREATE TABLE Admin(
	Admin_ID VARCHAR (20),
	Username VARCHAR(15),
	Password VARCHAR(10),
	FirstName VARCHAR(20),
	LastName VARCHAR(20),
	Address VARCHAR(50),
	ZipCode INTEGER(10),
            PRIMARY KEY (Admin_ID)
);

CREATE TABLE Brand(
	Brand_ID VARCHAR (20),
	BrandName VARCHAR(20),
	PRIMARY KEY (Brand_ID)
);

CREATE TABLE Category(
	Category_ID VARCHAR(20),
	CategoryName VARCHAR(20),
	PRIMARY KEY (Category_ID)
);

CREATE TABLE Product(
	Product_ID VARCHAR(20),
	ProductName VARCHAR(20),
	Price FLOAT,
	Quantity_in_stock INTEGER,
	PRIMARY KEY (Product_ID)
);

CREATE TABLE Order(
	Order_ID VARCHAR(20),
	OrderStatus VARCHAR(10),
	PRIMARY KEY (Order_ID)
);

CREATE TABLE Payment(
	Payment_ID VARCHAR(20),	
	PaymentType VARCHAR(10),
	Amount FLOAT,
	PRIMARY KEY (Payment_ID)
);


CREATE TABLE Cart(
	Cart_ID VARCHAR(20),
	ProductQuantity VARCHAR(15),
	TotalCost FLOAT,
	PRIMARY KEY (Cart_ID)
);	

CREATE TABLE Review(
	Review_ID VARCHAR(20),
	Comment VARCHAR(100),
	PRIMARY KEY (Review_ID)
);

CREATE TABLE Wishlist(

);

CREATE SEQUENCE

CREATE SEQUENCE CUSTOMER_SEQ
	START WITH 1000
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;



/*Relations:

‘Gives_Review’ is a one to one relation between the entities Review and Customer
‘Add_to_wishlist’ is a one to one relation between the entities Customer and Wishlist
‘Places_Order’ is one to many relation from Customer to Order
‘Generates_Payment’ is the one to one relation between the entities Order and Payment.
‘Has_cart’ is the one to one relation from Customer to Cart.
‘Has_brand’ is the many to many relation between Product and Brand
‘Has_category’ is the many to many relation between the entities Category and Product
‘Add_to_Cart’ is the many to many relation between Product and Cart
‘Manages_Product’ is the one to many relation from the entities Admin to Product.

Relations Script:
*/
CREATE TABLE GIVES_REVIEWS (
Customer_ID VARCHAR(20),
Review_ID VARCHAR(20),
PRIMARY KEY (Customer_ID, Review_ID),
FOREIGN KEY (Customer_ID)
	REFERENCES CUSTOMER (Customer_ID),
FOREIGN KEY (Review_ID)
	REFERENCES REVIEW (Review_ID)
);
CREATE TABLE PLACES_ORDER (
Customer_ID VARCHAR(20),
Order_ID VARCHAR(20),
PRIMARY KEY (Order_ID),
FOREIGN KEY (Customer_ID)
	REFERENCES CUSTOMER (Customer_ID),
FOREIGN KEY (Order_ID)
	REFERENCES ORDER (Order_ID)
);

CREATE TABLE GENERATES_PAYMENT (
Order_ID VARCHAR(20),
Payment_ID VARCHAR(20),
PRIMARY KEY (Order_ID ,Payment_ID),
FOREIGN KEY (Order_ID)
	REFERENCES ORDER (Order_ID),
FOREIGN KEY (Payment_ID)
	REFERENCES PAYMENT (Payment_ID)
);

CREATE TABLE HAS_CART (
Customer_ID VARCHAR(20),
Cart_ID VARCHAR(20),
PRIMARY KEY (Customer_ID,  Cart_ID),
FOREIGN KEY (Customer_ID)
	REFERENCES CUSTOMER (Customer_ID)
FOREIGN KEY (Cart_ID)
	REFERENCES CART (Cart_ID)
);


CREATE TABLE HAS_BRAND (
Product_ID VARCHAR(20),
Brand_ID VARCHAR(20),
PRIMARY KEY (Product_ID, Brand_ID),
FOREIGN KEY (Product_ID)
	REFERENCES PRODUCT (Product_ID),
FOREIGN KEY (Brand_ID)
	REFERENCES BRAND (Brand_ID)
);

CREATE TABLE HAS_CATEGORY (
Category_ID VARCHAR(20),	
Product_ID VARCHAR(20),
PRIMARY KEY (Category_ID, Product _ID),
FOREIGN KEY (Category_ID)
	REFERENCES CATEGORY (Category_ID),
FOREIGN KEY (Product_ID)
	REFERENCES PRODUCT (Product_ID)
);

CREATE TABLE MANAGES_PRODUCT (
Admin_ID VARCHAR(20),
Product_ID VARCHAR(20),
PRIMARY KEY (Product_ID),
FOREIGN KEY (Product_ID)
	REFERENCES PRODUCT (Product_ID),
FOREIGN KEY (Admin_ID)
	REFERENCES ADMIN (Admin_ID)
);

CREATE TABLE ADD_TO_CART (
Product_ID VARCHAR(20),
CartID VARCHAR(20),
PRIMARY KEY (Product_ID, CartID),
FOREIGN KEY (Product_ID)
	REFERENCES PRODUCT(Product_ID),
FOREIGN KEY (CartID)
	REFERENCES CART (CartID)
);
