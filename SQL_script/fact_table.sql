SELECT TOP(100000)
	dbo.dim_TransactionHistory.TransactionID,
	dbo.dim_Product.ProductID as ProductID,
	dbo.dim_TransactionHistory.ReferenceOrderID,
	dbo.dim_TransactionHistory.ReferenceOrderLineID,
	dbo.dim_Time.TimeID,
	dbo.dim_ProductModel.ProductModelID,
	dbo.dim_Category.ProductSubcategoryID,

	dbo.dim_Product.StandardCost,
	dbo.dim_TransactionHistory.ActualCost as ActualSellPrice,
	dbo.dim_Product.ListPrice,
	dbo.dim_TransactionHistory.Quantity,
	dbo.dim_TransactionHistory.TransactionType
INTO dbo.fact_table
FROM dbo.dim_Product
LEFT JOIN dim_ProductModel on dbo.dim_Product.ProductModelID=dbo.dim_ProductModel.ProductModelID
LEFT JOIN dim_TransactionHistory on dbo.dim_Product.ProductID=dbo.dim_TransactionHistory.ProductID 
LEFT JOIN dim_Category on dbo.dim_Product.ProductSubcategoryID=dbo.dim_Category.ProductSubcategoryID
LEFT JOIN dim_Time on dbo.dim_TransactionHistory.TransactionDate=dbo.dim_Time.TransactionDate


-- Edit constraints
ALTER TABLE [dbo].[fact_table]
ALTER COLUMN TransactionID int NOT NULL;

ALTER TABLE [dbo].[fact_table]
ALTER COLUMN ReferenceOrderID int NOT NULL;

ALTER TABLE [dbo].[fact_table]
ALTER COLUMN ReferenceOrderLineID int NOT NULL;

ALTER TABLE [dbo].[fact_table]
ALTER COLUMN TimeID int NOT NULL;

ALTER TABLE [dbo].[fact_table]
ALTER COLUMN ProductModelID int NOT NULL;

ALTER TABLE [dbo].[fact_table]
ALTER COLUMN ProductSubcategoryID int NOT NULL;


-- Create new primary key for fact table
ALTER TABLE [dbo].[fact_table]
ADD CONSTRAINT PK_facttable PRIMARY KEY(TransactionID);
