DELIMITER $$
CREATE PROCEDURE GetProdutosPorFornecedor(IN input_fornecedor VARCHAR(255))
BEGIN
    SELECT 
        fornecedor,
        ID, 
        nome, 
        categoria,
        armazenamento, 
        quantidade AS Qtde, 
        qtde_min AS QtdeMin, 
        codbarras_img
    FROM produtos
    WHERE (fornecedor = input_fornecedor OR input_fornecedor IS NULL)
    ORDER BY fornecedor;
END$$
DELIMITER ;