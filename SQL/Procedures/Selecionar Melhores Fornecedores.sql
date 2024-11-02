DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selecionarMelhoresFornecedores`(IN produtoID INT)
BEGIN
    SELECT 
        f.RazaoSocial AS Fornecedor,
        f.Email AS Email,
        ROUND(AVG((a.nota_entrega + a.nota_cuidado + a.nota_suporte) / 3), 1) AS NotaMedia
    FROM 
        produto_fornecedor pf
    JOIN 
        fornecedor f ON pf.fornecedor_id = f.ID
    JOIN 
        avaliacoes a ON pf.fornecedor_id = a.fornecedor_id
    WHERE 
        pf.produto_id = produtoID
    GROUP BY 
        pf.fornecedor_id
    ORDER BY 
        NotaMedia DESC
    LIMIT 3;
END$$

DELIMITER ;
