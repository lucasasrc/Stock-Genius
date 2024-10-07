DELIMITER $$

CREATE PROCEDURE listarCategorias()
BEGIN
    SELECT Nome FROM categoriaproduto;
END $$

DELIMITER ;