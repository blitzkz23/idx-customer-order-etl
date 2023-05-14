-- Create stored procedure
CREATE PROCEDURE dbo.summary_order_status
(
	@StatusID int
)
AS 
BEGIN
	SELECT 
		OrderID,
		CustomerName,
		ProductName,
		Quantity,
		StatusOrder
	FROM dbo.FactSalesOrder AS fso
	JOIN dbo.DimCustomer AS dc ON fso.CustomerID = dc.CustomerID
	JOIN dbo.DimProduct AS dp ON fso.ProductID = dp.ProductID
	JOIN dbo.DimStatusOrder AS dso ON fso.StatusID = dso.StatusID
	WHERE
		dso.StatusID = @StatusID
END;

-- Test run SP where status is 'Shipped'
EXEC summary_order_status @StatusID = 3