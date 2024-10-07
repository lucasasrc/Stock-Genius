DELIMITER //

CREATE PROCEDURE ListarProdutosEstoqueOK()
BEGIN
    SELECT ID, nome, categoria, fornecedor, quantidade, qtde_min
    FROM produtos
    WHERE quantidade > qtde_min;
END //

DELIMITER ;