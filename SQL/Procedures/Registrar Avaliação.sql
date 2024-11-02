DELIMITER $$

CREATE PROCEDURE registrarAvaliacao(
    IN p_razaoSocial VARCHAR(255),
    IN p_notaEntrega FLOAT,
    IN p_notaCuidado FLOAT,
    IN p_notaSuporte FLOAT,
    IN p_observacoes VARCHAR(255)
)
BEGIN
    DECLARE v_fornecedor_id INT;
    DECLARE v_entrada_id INT;
    
    -- Buscar o fornecedor_id baseado na RazaoSocial
    SELECT ID INTO v_fornecedor_id
    FROM fornecedor
    WHERE RazaoSocial = p_razaoSocial
    LIMIT 1;

    -- Buscar a entrada_id mais recente na tabela controle_estoque com tipo_operacao ENTRADA
    SELECT id INTO v_entrada_id
    FROM controle_estoque
    WHERE tipo_operacao = 'ENTRADA'
    ORDER BY data DESC
    LIMIT 1;

    -- Inserir a nova avaliação na tabela avaliacoes
    INSERT INTO avaliacoes (fornecedor_id, entrada_id, nota_entrega, nota_cuidado, nota_suporte, observacoes)
    VALUES (v_fornecedor_id, v_entrada_id, p_notaEntrega, p_notaCuidado, p_notaSuporte, p_observacoes);
    
END$$

DELIMITER ;