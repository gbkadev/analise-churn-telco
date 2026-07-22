SELECT * FROM customers LIMIT 10;

UPDATE customers
SET TotalCharges = NULL
WHERE TRIM(TotalCharges) = '';

SELECT
    Churn,
    COUNT(*) AS total_clientes,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM customers), 1) AS percentual
FROM customers
GROUP BY Churn;

SELECT
    Contract,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churnados,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS taxa_churn
FROM customers
GROUP BY Contract
ORDER BY taxa_churn DESC;

SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 meses'
        WHEN tenure <= 24 THEN '13-24 meses'
        WHEN tenure <= 48 THEN '25-48 meses'
        ELSE '48+ meses'
    END AS faixa_tenure,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS taxa_churn
FROM customers
GROUP BY faixa_tenure
ORDER BY taxa_churn DESC;

SELECT
    PaymentMethod,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS taxa_churn,
    RANK() OVER (ORDER BY ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) DESC) AS ranking
FROM customers
GROUP BY PaymentMethod;

SELECT
    ROUND(SUM(MonthlyCharges), 2) AS receita_mensal_perdida
FROM customers
WHERE Churn = 'Yes';

DROP VIEW IF EXISTS churn_por_contrato;
CREATE VIEW churn_por_contrato AS
SELECT
    Contract,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churnados,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS taxa_churn
FROM customers
GROUP BY Contract;

DROP VIEW IF EXISTS churn_por_tenure;
CREATE VIEW churn_por_tenure AS
SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 meses'
        WHEN tenure <= 24 THEN '13-24 meses'
        WHEN tenure <= 48 THEN '25-48 meses'
        ELSE '48+ meses'
    END AS faixa_tenure,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churnados,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS taxa_churn
FROM customers
GROUP BY faixa_tenure;

DROP VIEW IF EXISTS churn_por_metodo_pagamento;
CREATE VIEW churn_por_metodo_pagamento AS
SELECT
    PaymentMethod,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churnados,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS taxa_churn
FROM customers
GROUP BY PaymentMethod;
