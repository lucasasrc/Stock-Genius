CREATE VIEW view_usuario_mfa AS
SELECT usuario, tipo_mfa, secret_key
FROM usuarios;

SELECT tipo_mfa, secret_key FROM view_usuario_mfa WHERE usuario = 'teste.operador';