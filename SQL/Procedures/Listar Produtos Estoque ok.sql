DELIMITER //

CREATE PROCEDURE ListarProdutosEstoqueOK()
BEGIN
    SELECT 
        p.ID, 
        p.nome, 
        p.categoria, 
        f.RazaoSocial AS fornecedor, 
        p.quantidade, 
        p.qtde_min
    FROM 
        produtos p
    LEFT JOIN 
        produto_fornecedor pf ON p.ID = pf.produto_id
    LEFT JOIN 
        fornecedor f ON pf.fornecedor_id = f.ID
    WHERE 
        p.quantidade > p.qtde_min;
END //

DELIMITER ;
