SELECT TOP(100000)
	dbo.dim_TransactionHistory.TransactionID,
	dbo.dim_Product.ProductID as ProductID,
	dbo.dim_product.[Name] as ProductName,
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
--LEFT JOIN dim_Time on dbo.dim_Time.TransactionDate=dbo.Fact_Table.TransactionDate
--LEFT JOIN dim_ProductInventory on dbo.dim_Product.ProductID=dbo.dim_ProductInventory.ProductID