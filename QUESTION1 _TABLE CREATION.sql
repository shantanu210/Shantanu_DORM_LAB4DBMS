CREATE TABLE supplier
    (
        SUPP_ID INT PRIMARY KEY,
        SUPP_NAME VARCHAR(50) NOT NULL,
        SUPP_CITY VARCHAR(50) NOT NULL,
        SUPP_PHONE VARCHAR(50) NOT NULL
    );
    
CREATE TABLE customer
    (
       
        CUS_ID	INT PRIMARY KEY, 
        CUS_NAME VARCHAR(20) NOT NULL,
        CUS_PHONE VARCHAR(10) NOT NULL,
	CUS_CITY VARCHAR(30) NOT NULL,
	CUS_GENDER CHAR

    );
    
CREATE TABLE category
    (
       
       CAT_ID INT PRIMARY KEY,
       CAT_NAME	VARCHAR(20) NOT NULL

    );    
 
CREATE TABLE product
    (  
        PRO_ID INT PRIMARY KEY,
	PRO_NAME VARCHAR(20) DEFAULT "Dummy",
	PRO_DESC VARCHAR(60) NOT NULL,
	CAT_ID INT,
	FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID)
   );   
   
   
CREATE TABLE supplier_pricing
    (
        PRICING_ID	INT PRIMARY KEY,
	SUPP_PRICE	INT DEFAULT 0,
	PRO_ID INT,
	SUPP_ID INT,
	FOREIGN KEY (PRO_ID) REFERENCES product(PRO_ID),
	FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID)
   ); 
   
CREATE TABLE if not exists order1 (
      ORD_ID	INT PRIMARY KEY,
ORD_AMOUNT	INT NOT NULL,
ORD_DATE DATE NOT NULL,
CUS_ID	INT,
PRICING_ID	INT,
FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID),
FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
   );     

CREATE TABLE if not exists rating (
      RAT_ID	INT PRIMARY KEY,
ORD_ID	INT,
RAT_RATSTARS	INT NOT NULL, 
FOREIGN KEY (ORD_ID) REFERENCES order1(ORD_ID)

   );   
   


       
        
        
