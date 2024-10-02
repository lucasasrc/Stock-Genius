DELIMITER $$

CREATE PROCEDURE filtrarHistoricoDataUnica(
    IN input_date DATE,
    IN input_tipo_operacao VARCHAR(50)
)
BEGIN
    SELECT * 
    FROM `controle_estoque`
    WHERE DATE(`data`) = input_date 
      AND `tipo_operacao` = input_tipo_operacao;
END $$

DELIMITER ;

