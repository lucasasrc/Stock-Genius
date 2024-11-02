DELIMITER $$

CREATE PROCEDURE listarAvaliacoes()
BEGIN
    SELECT 
        a.ID AS idAvaliacao,  -- ID da avaliação
        f.RazaoSocial AS Fornecedor,
        ROUND((a.nota_entrega + a.nota_cuidado + a.nota_suporte) / 3, 1) AS Nota,
        DATE_FORMAT(c.data, '%d/%m/%Y %H:%i:%s') AS Data
    FROM 
        avaliacoes a
    JOIN 
        fornecedor f ON a.fornecedor_id = f.ID
    JOIN 
        controle_estoque c ON a.entrada_id = c.id
    ORDER BY 
        c.data DESC;
END$$

DELIMITER ;