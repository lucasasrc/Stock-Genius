DELIMITER $$
CREATE PROCEDURE GetProdutosPorCategoria(IN input_categoria VARCHAR(50))
BEGIN
    SELECT 
        categoria,
        ID, 
        nome, 
        armazenamento, 
        quantidade AS Qtde, 
        qtde_min AS QtdeMin, 
        codbarras_img
    FROM produtos
    WHERE (categoria = input_categoria OR input_categoria IS NULL)
    ORDER BY categoria;
END$$
DELIMITER ;