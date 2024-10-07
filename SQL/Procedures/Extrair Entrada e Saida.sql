DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ExtrairDadosMovimentos`(
    IN input_date DATE,
    IN input_start_date DATE,
    IN input_end_date DATE,
    IN input_fornecedor VARCHAR(255)
)
BEGIN
    DECLARE fornecedor_id INT DEFAULT NULL;

    -- Buscar o ID do fornecedor com base no nome fornecido, se especificado
    IF input_fornecedor IS NOT NULL THEN
        SELECT `id` INTO fornecedor_id
        FROM `fornecedor`
        WHERE `RazaoSocial` = input_fornecedor
        LIMIT 1;
    END IF;

    -- Consulta com base na data única ou intervalo de datas
    IF input_start_date IS NULL AND input_end_date IS NULL THEN
        -- Busca com data única
        SELECT 
            p.nome AS nome_produto,
            f.RazaoSocial AS nome_fornecedor,
            ce.data,
            ce.tipo_operacao,
            ce.NF,
            ce.quantidade
        FROM 
            controle_estoque ce
        JOIN 
            produtos p ON ce.id_produto = p.id
        JOIN 
            fornecedor f ON ce.id_fornecedor = f.id
        WHERE 
            DATE(ce.data) = input_date
            AND (input_fornecedor IS NULL OR ce.id_fornecedor = fornecedor_id)
        ORDER BY 
            p.nome, ce.data;
    ELSE
        -- Busca com intervalo de datas
        SELECT 
            p.nome AS nome_produto,
            f.RazaoSocial AS nome_fornecedor,
            ce.data,
            ce.tipo_operacao,
            ce.NF,
            ce.quantidade
        FROM 
            controle_estoque ce
        JOIN 
            produtos p ON ce.id_produto = p.id
        JOIN 
            fornecedor f ON ce.id_fornecedor = f.id
        WHERE 
            DATE(ce.data) BETWEEN input_start_date AND input_end_date
            AND (input_fornecedor IS NULL OR ce.id_fornecedor = fornecedor_id)
        ORDER BY 
            p.nome, ce.data;
    END IF;
END$$

DELIMITER ;
