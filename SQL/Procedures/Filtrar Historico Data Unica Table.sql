DELIMITER $$

CREATE PROCEDURE FiltrarHistoricoDataTable(
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
        SELECT 
            ce.id,
            ce.NF,
            ce.quantidade,
            ce.data,
            p.nome AS nome_produto,
            f.RazaoSocial AS nome_fornecedor
        FROM 
            controle_estoque ce
        JOIN 
            produtos p ON ce.id_produto = p.id
        JOIN 
            fornecedor f ON ce.id_fornecedor = f.id
        WHERE 
            DATE(ce.data) = input_date
            AND ce.tipo_operacao = input_tipo_operacao
            AND (input_fornecedor IS NULL OR ce.id_fornecedor = fornecedor_id);
    ELSE
        -- Busca com intervalo de datas
        SELECT 
            ce.id,
            ce.NF,
            ce.quantidade,
            ce.data,
            p.nome AS nome_produto,
            f.RazaoSocial AS nome_fornecedor
        FROM 
            controle_estoque ce
        JOIN 
            produtos p ON ce.id_produto = p.id
        JOIN 
            fornecedor f ON ce.id_fornecedor = f.id
        WHERE 
            DATE(ce.data) BETWEEN input_start_date AND input_end_date
            AND ce.tipo_operacao = input_tipo_operacao
            AND (input_fornecedor IS NULL OR ce.id_fornecedor = fornecedor_id);
    END IF;
END $$

DELIMITER ;

CALL FiltrarHistoricoDataTable('2024-09-10', 'ENTRADA', NULL, NULL, 'MICROSOFT DO BRASIL');
CALL FiltrarHistoricoDataTable('2024-09-10', 'SAIDA', NULL, NULL, 'MICROSOFT DO BRASIL');