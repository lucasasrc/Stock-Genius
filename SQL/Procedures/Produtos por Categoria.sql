DELIMITER $$

CREATE PROCEDURE ContarProdutosPorCategoria()
BEGIN
    SELECT categoria, COUNT(*) AS quantidade_produtos
    FROM produtos
    GROUP BY categoria;
END $$ContarProdutosContarProdutos

DELIMITER ;
