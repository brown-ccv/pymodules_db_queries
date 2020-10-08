SELECT DISTINCT
    m.module,
    m.version,
    COUNT(*) AS n_loads
FROM 
    modulelog AS m

WHERE 
    operation = 'load' AND
    YEAR(utctime) = 2020
    
GROUP BY 
    module,
    version
ORDER BY 
    module,
    version;
