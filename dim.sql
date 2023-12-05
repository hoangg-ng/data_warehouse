-- Creating Product dimension
SELECT Production.ProductPhoto.ProductPhotoID,Production.ProductProductPhoto.ProductID,Production.ProductProductPhoto.[Primary],Production.ProductPhoto.ThumbnailPhotoFileName,Production.ProductPhoto.LargePhoto,Production.ProductPhoto.LargePhotoFileName,Production.ProductPhoto.ThumbNailPhoto,Production.ProductPhoto.ModifiedDate
 INTO dbo.dim_ProductPhoto
 FROM Production.ProductPhoto 
 FULL OUTER JOIN Production.ProductProductPhoto
 ON ProductPhoto.ProductPhotoID=ProductProductPhoto.ProductPhotoID;

-- Creating dimension Product Inventory
SELECT Production.ProductInventory.ProductID, Production.ProductInventory.LocationID,Production.Location.Name, Production.ProductInventory.Shelf, Production.ProductInventory.Bin,Production.ProductInventory.Quantity,Production.Location.CostRate,Production.Location.Availability,Production.ProductInventory.rowguid,Production.ProductInventory.ModifiedDate
 INTO dbo.dim_ProductInventory
 FROM Production.Location
 FULL OUTER JOIN Production.ProductInventory
 ON ProductInventory.LocationID= Location.LocationID;

-- Creating dimension Document
SELECT Production.ProductDocument.ProductID,Production.ProductDocument.DocumentNode,Production.Document.ChangeNumber,Production.Document.Document,Production.Document.DocumentLevel,Production.Document.DocumentSummary,Production.Document.FileExtension,Production.Document.FileName,Production.Document.FolderFlag,Production.Document.ModifiedDate,Production.Document.Owner,Production.Document.Revision,Production.Document.rowguid,Production.Document.Status,Production.Document.Title
 INTO dbo.dim_ProductDocument
 FROM Production.ProductDocument
 FULL OUTER JOIN Production.Document
 ON ProductDocument.DocumentNode=Document.DocumentNode

-- Creating dimension Product
SELECT *
INTO dbo.dim_Product
FROM Production.Product

-- Creating dimension Product Model
SELECT *
INTO dbo.dim_ProductModel 
FROM Production.ProductModel

-- Creating dimension TransactionHistory
SELECT * 
INTO dbo.dim_TransactionHistory
FROM Production.TransactionHistory

-- Creating dimension Category
SELECT * 
INTO dbo.dim_Category
FROM Production.ProductSubcategory

-- Creating dimension Product Review
SELECT *
INTO dbo.dim_ProductReview
FROM Production.ProductReview