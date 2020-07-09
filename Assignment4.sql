USE classicmodels;

-- Tính tổng giá trị của các order đã xuất kho (shipped) trong tháng 8 năm 2004
SELECT SUM(od.QuantityOrdered * od.PriceEach) 
FROM Orders o 
INNER JOIN OrderDetails od 
	ON o.OrderNumber = od.OrderNumber
WHERE o.ShippedDate BETWEEN '2004-08-01' AND '2004-08-31';

-- Tính lợi nhuận (profit) thu được từ mỗi khách hàng dựa trên các orders mà họ thực hiện. Liệt kê theo tên KH
SELECT c.CustomerName,SUM(od.QuantityOrdered * (od.PriceEach - p.BuyPrice)) AS Profit
FROM ((Customers c LEFT JOIN Orders o ON c.CustomerNumber = o.CustomerNumber)
	 LEFT JOIN OrderDetails od ON o.OrderNumber = od.OrderNumber)
	 LEFT JOIN Products p ON od.ProductCode = p.ProductCode
GROUP BY c.CustomerName;

-- Tính doan thu (revenue) mà mỗi sản phẩm mang lại. Liệt kê theo tên sản phẩm
SELECT p.ProductName, SUM(od.QuantityOrdered * od.PriceEach) AS Revenue
FROM (Products p LEFT JOIN OrderDetails od ON p.ProductCode = od.ProductCode)
	 LEFT JOIN Orders o ON o.OrderNumber = od.OrderNumber
GROUP BY p.ProductName;
    