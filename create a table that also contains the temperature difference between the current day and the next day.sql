WITH cte AS(
   SELECT
      W1.*, 
      LEAD(W2.temperature, 1) OVER(PARTITION BY W2.city ORDER BY 
      W2.date) AS temp_next                                                   
   FROM weather W1                                                                                                                                                   
   LEFT JOIN weather W2                                                                                                                                              
   ON W1.date = W2.date and W1.city = W2.city
)                                                                                                                       SELECT 
   *, 
   COALESCE((temp_next - temperature), 0) AS temp_diff 
FROM cte;