USE stock_genius;
DELIMITER $$

CREATE PROCEDURE ContarProdutos ()
BEGIN
    SELECT 
        SUM(CASE WHEN quantidade > qtde_min THEN 1 ELSE 0 END) AS produtos_ok,
        SUM(CASE WHEN quantidade < qtde_min THEN 1 ELSE 0 END) AS produtos_alerta,
        SUM(CASE WHEN quantidade = 0 THEN 1 ELSE 0 END) AS produtos_zerados
    FROM produtos;
END $$

DELIMITER ;