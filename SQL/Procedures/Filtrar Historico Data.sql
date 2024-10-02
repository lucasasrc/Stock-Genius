DELIMITER $$

CREATE PROCEDURE filtrarHistoricoData(
    IN input_date DATE,
    IN input_tipo_operacao VARCHAR(50),
    IN input_start_date DATE,
    IN input_end_date DATE,
    IN input_fornecedor VARCHAR(255)
)
BEGIN
    DECLARE fornecedor_id INT;

    -- Buscar o ID do fornecedor com base no nome fornecido
    SELECT `id` INTO fornecedor_id
    FROM `fornecedor`
    WHERE `RazaoSocial` = input_fornecedor
    LIMIT 1;

    -- Se nenhum ID for encontrado, definir fornecedor_id como NULL
    IF fornecedor_id IS NULL THEN
        SET fornecedor_id = 0;
    END IF;

    -- Consulta com base na data única ou intervalo de datas
    IF input_start_date IS NULL AND input_end_date IS NULL THEN
        -- Busca com data única
        SELECT * 
        FROM `controle_estoque`
        WHERE DATE(`data`) = input_date 
          AND `tipo_operacao` = input_tipo_operacao
          AND (input_fornecedor IS NULL OR `id_fornecedor` = fornecedor_id);
    ELSE
        -- Busca com intervalo de datas
        SELECT * 
        FROM `controle_estoque`
        WHERE DATE(`data`) BETWEEN input_start_date AND input_end_date
          AND `tipo_operacao` = input_tipo_operacao
          AND (input_fornecedor IS NULL OR `id_fornecedor` = fornecedor_id);
    END IF;
END $$

DELIMITER ;

CALL filtrarHistoricoData('2024-09-10', 'ENTRADA', NULL, NULL, 'MICROSOFT DO BRASIL')