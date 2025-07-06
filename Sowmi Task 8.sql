USE task_8;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderAmount DECIMAL(10,2)
);

INSERT INTO Orders VALUES
(1, 'Karthik', 5000),
(2, 'Divya', 12000),
(3, 'Karthik', 3000),
(4, 'Ravi', 15000);

DELIMITER $$
CREATE FUNCTION CalculateGST(amount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN amount * 0.18;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE ShowCustomerOrders(IN cust_name VARCHAR(100))
BEGIN
    SELECT OrderID, OrderAmount, CalculateGST(OrderAmount) AS GST
    FROM Orders
    WHERE CustomerName = cust_name;
END $$
DELIMITER ;

CALL ShowCustomerOrders('Karthik');

