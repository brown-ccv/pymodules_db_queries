SELECT 
    t.*
FROM (  
    SELECT
        u.module,
        u.`user`,
        u.n_loads AS max_loads,
        ROW_NUMBER() OVER(PARTITION BY u.module ORDER BY n_loads DESC) AS row_num
    FROM (
        SELECT 
            `user`,
            module,
            COUNT(*) AS n_loads
        FROM 
            modulelog
        WHERE 
            operation = 'load' AND 
            YEAR(utctime) = 2020
        GROUP BY 
            module,
            `user`
    ) AS u 
) AS t

WHERE t.row_num = 1

ORDER BY 
    max_loads DESC

;
