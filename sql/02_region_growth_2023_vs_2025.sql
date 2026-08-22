q3 = """
WITH yearly AS (
  SELECT Region, Year, SUM(Revenue_USD) AS Revenue
  FROM sales
  WHERE Year IN (2023, 2025)
  GROUP BY Region, Year
)
SELECT
  y23.Region,
  ROUND(y23.Revenue,0) AS Revenue_2023,
  ROUND(y25.Revenue,0) AS Revenue_2025,
  ROUND(((y25.Revenue - y23.Revenue) / y23.Revenue) * 100, 1) AS Growth_Pct
FROM yearly y23
JOIN yearly y25 ON y23.Region = y25.Region AND y23.Year = 2023 AND y25.Year = 2025
ORDER BY Growth_Pct DESC;
"""
pd.read_sql(q3, conn)
