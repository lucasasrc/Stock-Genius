DELIMITER $$

CREATE PROCEDURE listarFornecedores()
BEGIN
    SELECT RazaoSocial FROM fornecedor;
END $$

DELIMITER ;
