# Week 7 Assignment: Database Design and Normalization

## Project Overview

This project demonstrates database design and normalization techniques using MySQL. It focuses on applying First Normal Form (1NF) and Second Normal Form (2NF) to improve database structure, eliminate data redundancy, and maintain data integrity.

## Learning Objectives

- Understand the principles of database normalization.
- Apply First Normal Form (1NF).
- Apply Second Normal Form (2NF).
- Identify and eliminate repeating groups.
- Identify and remove partial dependencies.
- Create relational tables using primary keys and foreign keys.
- Write and execute SQL statements.

## Assignment Questions

### Question 1: Achieving First Normal Form (1NF)

The original `ProductDetail` table contained multiple products in a single column.

To achieve 1NF:
- Created a new table called `ProductDetail_1NF`.
- Ensured each row contains only one product per order.
- Inserted all normalized product records.
- Used a composite primary key consisting of `OrderID` and `Product`.

### Question 2: Achieving Second Normal Form (2NF)

The original `OrderDetails` table contained a partial dependency because `CustomerName` depended only on `OrderID`, rather than the entire composite key.

To achieve 2NF:
- Created an `Orders` table to store order information.
- Created an `OrderItems` table to store products and quantities.
- Used `OrderID` as the primary key in the `Orders` table.
- Used `(OrderID, Product)` as the composite primary key in `OrderItems`.
- Established a foreign key relationship between the two tables.

## Database Structure

### ProductDetail_1NF

| Column | Data Type | Description |
|---|---|---|
| OrderID | INT | Order identification |
| CustomerName | VARCHAR(100) | Customer name |
| Product | VARCHAR(100) | Individual product |

### Orders

| Column | Data Type | Description |
|---|---|---|
| OrderID | INT | Primary key |
| CustomerName | VARCHAR(100) | Customer name |

### OrderItems

| Column | Data Type | Description |
|---|---|---|
| OrderID | INT | Foreign key referencing Orders |
| Product | VARCHAR(100) | Product name |
| Quantity | INT | Quantity ordered |

## Technologies Used

- MySQL
- SQL
- Visual Studio Code
- Git and GitHub

## How to Run the Project

1. Clone this repository to your computer.
2. Open the project using Visual Studio Code or MySQL Workbench.
3. Open `answer.sql`.
4. Connect to your MySQL database server.
5. Execute the SQL statements.
6. Verify the results using the SELECT statements included in the script.

## Expected Results

- Question 1 produces six normalized product records.
- Question 2 produces three records in the Orders table.
- Question 2 produces six records in the OrderItems table.
- The foreign key ensures that every order item belongs to an existing order.

## Conclusion

This assignment demonstrates how database normalization improves database organization, reduces unnecessary data duplication, and strengthens data integrity.

By applying 1NF and 2NF, the database becomes more efficient, consistent, and easier to maintain.

## Author

**Edapal Danson**

**Course:** Database Design and Normalization

**Assignment:** Week 7
