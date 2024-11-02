DELIMITER $$

CREATE PROCEDURE visualizarAvaliacao(
    IN p_idAvaliacao INT
)
BEGIN
    SELECT 
        DATE_FORMAT(c.data, '%d/%m/%Y %H:%i:%s') AS Data,                            -- Data formatada
        f.RazaoSocial AS Fornecedor,                                                 -- Fornecedor
        p.nome AS Produto,                                                           -- Produto
        p.categoria AS Categoria,                                                    -- Categoria
        c.NF AS NotaFiscal,                                                          -- Nota Fiscal
        c.quantidade AS Quantidade,                                                  -- Quantidade
        a.nota_entrega AS NotaEntrega,                                               -- Nota Entrega
        a.nota_cuidado AS NotaCuidado,                                               -- Nota Cuidado
        a.nota_suporte AS NotaSuporte,                                               -- Nota Suporte
        ROUND((a.nota_entrega + a.nota_cuidado + a.nota_suporte) / 3, 1) AS NotaFinal, -- Nota Final (média das notas)
        a.observacoes AS Observacoes                                                 -- Observações
    FROM 
        avaliacoes a
    JOIN 
        controle_estoque c ON a.entrada_id = c.id  -- Relaciona com a tabela controle_estoque
    JOIN 
        fornecedor f ON a.fornecedor_id = f.ID     -- Relaciona com a tabela fornecedor
    JOIN 
        produtos p ON c.id_produto = p.ID          -- Relaciona com a tabela produtos
    WHERE 
        a.ID = p_idAvaliacao;                      -- Filtra pela avaliação recebida como parâmetro
END$$

DELIMITER ;
