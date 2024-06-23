# [IBM Data Engineering Capstone Project](https://www.coursera.org/learn/data-enginering-capstone-project?specialization=ibm-data-engineer)

## Project Overview
As part of the Capstone project, you will assume the role of an Associate Data Engineer who has recently joined an e-commerce organization. You will be presented with a business challenge that requires building a data platform for retailer data analytics.

In this Capstone project, you will:
* Design a data platform that uses MySQL as an OLTP database and MongoDB as a NoSQL database.
* Design and implement a data warehouse and generate reports from the data.
* Design a reporting dashboard that reflects the key metrics of the business.
* Extract data from OLTP and NoSQL databases, transform it and load it into the data warehouse, and then create an ETL pipeline.
* And finally, create a Spark connection to the data warehouse, and then deploy a machine learning model.

The Capstone project is divided into 6 Modules:
* In Module 1, you will design the OLTP database for an E-Commerce website, populate the OLTP Database with the data provided and automate the export of the daily incremental data into the data warehouse.
* In Module 2, you will set up a NoSQL database to store the catalogue data for an E-Commerce website, load the E-Commerce catalogue data into the NoSQL database, and query the E-Commerce catalogue data in the NoSQL database.
* In Module 3, you will design the schema for a data warehouse based on the schema of the OLTP and NoSQL databases. You’ll then create the schema and load the data into fact and dimension tables, automate the daily incremental data insertion into the data warehouse, and create Cubes and Rollups to make the reporting easier.
* In Module 4, you will create a Cognos data source that points to a data warehouse table, create a bar chart of Quarterly sales of cell phones, create a pie chart of sales of electronic goods by category, and create a line chart of total sales per month for the year 2020.
* In Module 5, you will extract data from OLTP, NoSQL, and MongoDB databases into CSV format. You will then transform the OLTP data to suit the data warehouse schema and then load the transformed data into the data warehouse. Finally, you will verify that the data is loaded properly.
* In the 6 and final Module, you will use your skills in Big Data Analytics to create a Spark connection to the data warehouse, and then deploy a machine learning model on SparkML for making sales projections.

### Data Platform Architecture
  ![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/Data-Platform.png)
  This is the data platform architecture of an ecommerce company named SoftCart. SoftCart uses a hybrid architecture, with some of its databases on premises and some on cloud.

  ## Tools and Technologies:
* OLTP database - MySQL
* NoSQL database - MongoDB
* Production Data warehouse – DB2 on Cloud
* Staging - Data warehouse – PostgreSQL
* Big data platform - Hadoop
* Big data analytics platform – Spark
* Business Intelligence Dashboard - IBM Cognos Analytics
* Data Pipelines - Apache Airflow

### Process:
SoftCart's online presence is primarily through its website, which customers access using a variety of devices like laptops, mobiles and tablets. All the catalogue data of the products is stored in the MongoDB NoSQL server. All the transactional data like inventory and sales are stored in the MySQL database server. SoftCart's webserver is driven entirely by these two databases. Data is periodically extracted from these two databases and put into the staging data warehouse running on PostgreSQL. Production data warehouse is on the cloud instance of IBM DB2 server. BI teams connect to the IBM DB2 for operational dashboard creation. IBM Cognos Analytics is used to create dashboards. SoftCart uses Hadoop cluster as its big data platform where all the data collected for analytics purposes. Spark is used to analyse the data on the Hadoop cluster. To move data between OLTP, NoSQL and the data warehouse, ETL pipelines are used and these run on Apache Airflow.


## [Module 1: Data Platform Architecture and OLTP Database](https://github.com/bky201/Data_Engineering_Capstone_Project/tree/main/M1_Data_Platform_Architecture_and%20_OLTP_Database)

### OLTP database requirements and design

#### OLTP database:
OLTP database is generally used to handle everyday business transactions of an organization like a bank or a super market chain. OLTP databases can be write heavy or may have a balanced read/write load.

#### OLTP database requirements:
An OLTP database is expected to handle a huge number of transactions per second. Each transaction usually involves accessing (read/write) a small portion of the database, in other words the payload per transaction is small. The time taken to execute a transaction usually called latency needs to be very less.

#### OLTP database design:
The schema of an OLTP database is highly normalized so as to achieve a very low latency. To further improve the latency an OLTP database stores only the recent data like the last few week's data. They are usually run on storage that is very fast like SSD.

### Scenario
You are a data engineer at an e-commerce company. Your company needs you to design a data platform that uses MySQL as an OLTP database. You will be using MySQL to store the OLTP data.

### Design the OLTP Database
Creating sales database and sales_data table in sales database.

![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M1_Data_Platform_Architecture_and%20_OLTP_Database/Assignment_result_images/createtable.png)

### Load the given data(oltpdata.csv) into sales_data table
Importing data from oltpdata.csv file into sales_data table using phpMyAdmin GUI.

![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M1_Data_Platform_Architecture_and%20_OLTP_Database/Assignment_result_images/importdata.png)

List the tables in the sales database and query the count of records in the sales_data table to make sure the data are imported correctly and successfully.<br />
![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M1_Data_Platform_Architecture_and%20_OLTP_Database/Assignment_result_images/listtables.png)

![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M1_Data_Platform_Architecture_and%20_OLTP_Database/Assignment_result_images/salesrows.png)

### Set up Admin tasks
Creating index on the timestamp field to speed up queries.
![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M1_Data_Platform_Architecture_and%20_OLTP_Database/Assignment_result_images/listindexes.png)

Writing a bash script(datadump.sh) that exports all the rows in the sales_data table to a file named sales_data.sql to automate the export of the daily incremental data into the data warehouse.
![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M1_Data_Platform_Architecture_and%20_OLTP_Database/Assignment_result_images/exportdata.png)

## [Module 2: Querying Data in NoSQL Databases](https://github.com/bky201/Data_Engineering_Capstone_Project/tree/main/M2_Querying_Data_in_NoSQL_Databases)

### Scenario
You are a data engineer at an e-commerce company. Your company needs you to design a data platform that uses MongoDB as a NoSQL database. You will be using MongoDB to store the e-commerce catalogue data.

### Importing data into MongoDB database
Installing mongoimport and mongoexport. Importing given data(catalog.json) into a database named ‘catalog’ and a collection named ‘electronics’ on mongodb server.
![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M2_Querying_Data_in_NoSQL_Databases/Assignment_result_images/mongoimport.png)

List out all databases and collections on mongodb server to check if catalog database and electronics collection are created successfully or not.
![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M2_Querying_Data_in_NoSQL_Databases/Assignment_result_images/list-dbs.png)

![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M2_Querying_Data_in_NoSQL_Databases/Assignment_result_images/list-collections.png)


##### Creating index on the field ‘type’ for faster queries.
![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M2_Querying_Data_in_NoSQL_Databases/Assignment_result_images/create-index.png)

### Trying out a few queries to check the imported data:
Finding the count of laptops.<br />
![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M2_Querying_Data_in_NoSQL_Databases/Assignment_result_images/mongo-query-laptops.png)

Finding the number of smart phones with screen size of 6 inches.
![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M2_Querying_Data_in_NoSQL_Databases/Assignment_result_images/mongo-query-mobiles1.png)

Finding the average screen size of smart phones.
![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M2_Querying_Data_in_NoSQL_Databases/Assignment_result_images/mongo-query-mobiles2.png)

### Export data from MongoDB database as csv file
Exporting the fields _id, “type”, “model”, from the ‘electronics’ collection into a file named electronics.csv.
![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M2_Querying_Data_in_NoSQL_Databases/Assignment_result_images/mongoexport.png)

## [Module 3.1: Data Warehousing](https://github.com/bky201/Data_Engineering_Capstone_Project/tree/main/M3_Build_A_Data_Warehouse_and_Reporting)

### Scenario
You are a data engineer hired by an ecommerce company named SoftCart.com. The company retails download only items like E-Books, Movies, Songs etc. The company has international presence and customers from all over the world. The company would like to create a data warehouse so that it can create reports like:
* Total sales per year per country
* Total sales per month per category
* Total sales per quarter per country
* Total sales per category per country
You will use your data warehousing skills to design and implement a data warehouse for the company.

### Designing a Data Warehouse
The ecommerce company has provided you the sample data.<br />
![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M3_Build_A_Data_Warehouse_and_Reporting/sample-data.png)<br />

You will start your project by designing a Star Schema for the warehouse by identifying the columns for the various dimension and fact tables in the schema. Name your database as softcart.

Creating tables and relationships amongst created tables, using the ERD design Tool of pgAdmin.
![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M3_Build_A_Data_Warehouse_and_Reporting/Assignment_result_images/assign_3.1/softcartRelationships.png)

### Create the schema
After creating tables and relationships using ERD design tool, generate the schema sql using the tool. Then use the created schema sql to create the schema in a database named staging.
![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M3_Build_A_Data_Warehouse_and_Reporting/Assignment_result_images/assign_3.1/createschema.png)

## [Module 3.2: Data Warehouse Reporting](https://github.com/bky201/Data_Engineering_Capstone_Project/tree/main/M3_Build_A_Data_Warehouse_and_Reporting)

### Scenario
You are a data engineer hired by an ecommerce company named SoftCart.com. The company retails download only items like E-Books, Movies, Songs etc. The company has international presence and customers from all over the world. You have designed the schema for the data warehouse in the previous assignment. Data engineering is a team game. Your senior data engineer reviewed your design. Your schema design was improvised to suit the production needs of the company. In this assignment you will generate reports out of the data in the data warehouse.

### Load data into the Data Warehouse

Loading the data provided by the company in csv format into the tables (DimDate, DimCategory, DimCountry, FactSales).
![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M3_Build_A_Data_Warehouse_and_Reporting/Assignment_result_images/assign_3.2/DimDate.png)

![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M3_Build_A_Data_Warehouse_and_Reporting/Assignment_result_images/assign_3.2/DimCategory.png)

![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M3_Build_A_Data_Warehouse_and_Reporting/Assignment_result_images/assign_3.2/DimCountry.png)

![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M3_Build_A_Data_Warehouse_and_Reporting/Assignment_result_images/assign_3.2/FactSales.png)

### Queries for data analytics
Creating and running queries to check if the created data warehouse can create reports.

Grouping sets query using the columns country, category, totalsales. (Total sales per country and Total sales per category)

![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M3_Build_A_Data_Warehouse_and_Reporting/Assignment_result_images/assign_3.2/groupingsets.png)

Rollup query using the columns year, country, and totalsales. (Total sales per year per country and Total sales per year)

![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M3_Build_A_Data_Warehouse_and_Reporting/Assignment_result_images/assign_3.2/rollup.png)

Cube query using the columns year, country, and average sales. (Average sales per year per country, Average sales per year, Average sales per country)

![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M3_Build_A_Data_Warehouse_and_Reporting/Assignment_result_images/assign_3.2/cube.png)

Creating a materialized query table (MQT) named total_sales_per_country that has the columns country and total_sales to improve the performance of complex queries that operate on very large amounts of data.<br />
Db2 uses a materialized query table to precompute the results of data that is derived from one or more tables. When you submit a query, Database can use the results that are stored in a materialized query table rather than compute the results from the underlying source tables on which the materialized query table is defined.

![alt text](https://github.com/bky201/Data_Engineering_Capstone_Project/blob/main/M3_Build_A_Data_Warehouse_and_Reporting/Assignment_result_images/assign_3.2/mqt.png)
