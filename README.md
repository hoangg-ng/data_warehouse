# This project has 2 part:

## Data Warehouse Management
We use SQL server to manage the database and do some ETL steps in it. There are source code in SQL folder.

We connect the new design database and host it on Google BigQuery

## Frequent Itemset Data Mining 
By using apriori, we find the min_support of the item at 0.014 and use it to find the confidence of these rules. The confidence threshold is often tested at 0.6 and 0.9 to find the best.