CREATE TABLE "Member"(
    "MemberId" INT NOT NULL,
    "Email" NVARCHAR(255) NOT NULL,
    "CompanyName" NVARCHAR(255) NOT NULL,
    "City" NVARCHAR(255) NOT NULL,
    "Country" NVARCHAR(255) NOT NULL,
    "Password" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "Member" ADD CONSTRAINT "member_memberid_primary" PRIMARY KEY("MemberId");
CREATE TABLE "Product"(
    "ProductId" INT NOT NULL,
    "CategoryId" INT NOT NULL,
    "ProductName" NVARCHAR(255) NOT NULL,
    "Weight" DECIMAL(8, 2) NOT NULL,
    "UnitPrice" DECIMAL(8, 2) NOT NULL,
    "UnitsInStock" INT NOT NULL
);
ALTER TABLE
    "Product" ADD CONSTRAINT "product_productid_primary" PRIMARY KEY("ProductId");
CREATE TABLE "OrderDetail"(
    "OrderId" INT NOT NULL,
    "ProductId" INT NOT NULL,
    "UnitPrice" DECIMAL(8, 2) NOT NULL,
    "Quantity" INT NOT NULL,
    "Discount" DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    "OrderDetail" ADD CONSTRAINT "orderdetail_orderid_primary" PRIMARY KEY("OrderId");
CREATE TABLE "Order"(
    "OrderId" INT NOT NULL,
    "MemberId" INT NOT NULL,
    "OrderDate" DATE NOT NULL,
    "RequiredDate" DATE NOT NULL,
    "ShippedDate" DATE NOT NULL,
    "Freight" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "Order" ADD CONSTRAINT "order_orderid_primary" PRIMARY KEY("OrderId");
CREATE TABLE "Category"(
    "CategoryId" INT NOT NULL,
    "CategoryName" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "Category" ADD CONSTRAINT "category_categoryid_primary" PRIMARY KEY("CategoryId");
ALTER TABLE
    "Order" ADD CONSTRAINT "order_orderid_foreign" FOREIGN KEY("OrderId") REFERENCES "OrderDetail"("OrderId");
ALTER TABLE
    "Product" ADD CONSTRAINT "product_categoryid_foreign" FOREIGN KEY("CategoryId") REFERENCES "Category"("CategoryId");
ALTER TABLE
    "Order" ADD CONSTRAINT "order_memberid_foreign" FOREIGN KEY("MemberId") REFERENCES "Member"("MemberId");
ALTER TABLE
    "OrderDetail" ADD CONSTRAINT "orderdetail_productid_foreign" FOREIGN KEY("ProductId") REFERENCES "Product"("ProductId");