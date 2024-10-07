DELIMITER //

CREATE PROCEDURE ListarProdutosEstoqueZerado()
BEGIN
    SELECT ID, nome, categoria, fornecedor, quantidade, qtde_min
    FROM produtos
    WHERE quantidade = 0;
END //

DELIMITER ;