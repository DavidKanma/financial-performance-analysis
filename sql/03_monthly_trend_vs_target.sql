q4 = """
SELECT
  s.Date,
  s.Region,
  ROUND(SUM(s.Revenue_USD),0) AS Actual_Revenue,
  ROUND(t.Revenue_Target_USD,0) AS Target_Revenue,
  ROUND(((SUM(s.Revenue_USD) - t.Revenue_Target_USD) / t.Revenue_Target_USD) * 100, 1) AS Pct_Vs_Target
FROM sales s
JOIN targets t ON s.Date = t.Date AND s.Region = t.Region
GROUP BY s.Date, s.Region
ORDER BY s.Date;
"""
pd.read_sql(q4, conn)
