DELIMITER //

CREATE PROCEDURE ListarProdutosPorNome(IN nomeBusca VARCHAR(255))
BEGIN
    SELECT 
        p.ID, 
        p.quantidade, 
        p.nome, 
        p.descricao, 
        p.categoria, 
        f.RazaoSocial AS fornecedor, 
        p.armazenamento 
    FROM 
        produtos p
    LEFT JOIN 
        produto_fornecedor pf ON p.ID = pf.produto_id
    LEFT JOIN 
        fornecedor f ON pf.fornecedor_id = f.ID
    WHERE 
        p.nome LIKE CONCAT('%', nomeBusca, '%');
END //

DELIMITER ;