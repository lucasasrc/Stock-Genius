DELIMITER $$

CREATE PROCEDURE verificarDataMinima()
BEGIN
    SELECT DATE_FORMAT(MIN(data), '%d/%m/%Y') AS data_mais_antiga
    FROM controle_estoque;
END $$

DELIMITER ;

CALL verificarDataMinima()