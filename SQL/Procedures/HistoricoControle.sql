USE stock_genius;
SELECT * FROM controle_estoque;

DELIMITER //

CREATE PROCEDURE FiltrarHistoricoOperacao(
    IN tipoOperacao VARCHAR(50)
)
BEGIN
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
        ce.tipo_operacao = tipoOperacao;
END //

DELIMITER ;

CALL FiltrarHistoricoOperacao('SAIDA');