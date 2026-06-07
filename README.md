This project presents a comprehensive comparative analysis between two of 
India's biggest food delivery platforms — Zomato and Swiggy. The goal is 
to analyze and compare their performance across key metrics like ratings, 
delivery time, pricing, cuisine variety, and customer preferences using 
real-world data.

The dataset was prepared by combining data from both platforms using SQL 
Server, resulting in 16,000+ records after cleaning and transformation.

Key Steps:
- Combined Zomato and Swiggy datasets using SQL UNION ALL (~8,000 rows each)
- Data cleaning and transformation using SQL Server (SSMS)
- Handled null values, standardized columns, removed duplicates
- Built an interactive Power BI dashboard with dark navy theme
- Compared both platforms across multiple business dimensions

Key Findings:
- Zomato has a higher average rating compared to Swiggy overall
- Swiggy offers faster average delivery time in most cities
- Zomato dominates in restaurant variety and cuisine options
- Swiggy is more competitive in pricing for budget customers
- Both platforms perform differently across different cities and regions

Dashboard Features:
- Platform-wise KPI cards (ratings, orders, delivery time, pricing)
- City-wise performance comparison
- Cuisine category breakdown for both platforms
- Customer preference trends
- Interactive slicers for filtering by city and cuisine

Tools & Technologies:
Python | SQL Server | Power BI | DAX | pandas | Data Modeling

Dataset: Kaggle — Zomato and Swiggy Restaurant Dataset
