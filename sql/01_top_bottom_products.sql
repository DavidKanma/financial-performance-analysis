q1 = """
SELECT Product, ROUND(SUM(Revenue_USD),0) AS Total_Revenue
FROM sales
GROUP BY Product
ORDER BY Total_Revenue DESC
LIMIT 5;
"""
pd.read_sql(q1, conn)

q2 = """
SELECT Product, ROUND(SUM(Revenue_USD),0) AS Total_Revenue
FROM sales
GROUP BY Product
ORDER BY Total_Revenue ASC
LIMIT 5;
"""
pd.read_sql(q2, conn)
