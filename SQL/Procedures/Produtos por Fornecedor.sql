DELIMITER $$

CREATE PROCEDURE ContarProdutosPorFornecedor()
BEGIN
SELECT f.RazaoSocial AS fornecedor, COUNT(DISTINCT p.categoria) AS quantidade_produtos 
    FROM produto_fornecedor pf
    INNER JOIN produtos p ON pf.produto_id = p.ID
    INNER JOIN fornecedor f ON pf.fornecedor_id = f.ID
    GROUP BY f.RazaoSocial;
END $$

DELIMITER ;
