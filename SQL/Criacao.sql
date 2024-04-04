USE stock_genius;

CREATE TABLE Usuarios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    usuario VARCHAR(20) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    tipo INT NOT NULL
);

INSERT INTO Usuarios (nome, usuario, senha, email, tipo) VALUES ('Lucas Santos', 'lucas.santos', '56F977581F2A917FAD542827C370093B392B4C33D56F62B5BF90C6841301F8FD', 'lucasasrc@gmail.com', 1);
$cadProdCategoriaBox_SelectedIndexChanged = {
	$cadProdFornBox.Enabled = $true
}

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(255),
    categoria VARCHAR(20),
    fornecedor VARCHAR(50),
    armazenamento VARCHAR(50)
);