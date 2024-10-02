DELIMITER $$

CREATE PROCEDURE ContarProdutosPorFornecedor()
BEGIN
    SELECT fornecedor, COUNT(DISTINCT categoria) AS quantidade_produtos 
    FROM produtos 
    GROUP BY fornecedor;
END $$

DELIMITER ;
