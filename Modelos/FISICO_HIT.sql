-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Imagem (
id_imagem SERIAL PRIMARY KEY NOT NULL,
path VARCHAR(256) NOT NULL,
descricao VARCHAR(256) NOT NULL
);

CREATE TABLE ImagemPessoa (
id_imagem_pessoa SERIAL PRIMARY KEY NOT NULL,
id_imagem INTEGER NOT NULL,
CONSTRAINT FK_id_imagem FOREIGN KEY(id_imagem) REFERENCES Imagem (id_imagem)
);

CREATE TABLE Pessoa (
id_pessoa SERIAL PRIMARY KEY NOT NULL,
cep VARCHAR(10) NOT NULL CONSTRAINT proper_cep CHECK (cep ~* '^[0-9]{2}.[0-9]{3}-[0-9]{3}$'),
bairro VARCHAR(100) NOT NULL,
cidade VARCHAR(100) NOT NULL,
estado VARCHAR(100) NOT NULL,
rua VARCHAR(100) NOT NULL,
numero VARCHAR(5) NOT NULL,
email VARCHAR(255) NOT NULL CONSTRAINT proper_email CHECK (email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'),
colaboracao INTEGER NOT NULL,
autenticidade INTEGER NOT NULL,
senha VARCHAR(20) NOT NULL,
login VARCHAR(20) NOT NULL,
ativo CHAR(1) NOT NULL,
nome_pessoa VARCHAR(255) NOT NULL,
id_imagem_pessoa VARCHAR(10) NOT NULL,
CONSTRAINT FK_id_imagem_pessoa FOREIGN KEY(id_imagem_pessoa) REFERENCES ImagemPessoa (id_imagem_pessoa)
);

CREATE TABLE Categoria (
id_categoria SERIAL PRIMARY KEY NOT NULL,
descricao VARCHAR(256) NOT NULL,
nome_categoria VARCHAR(256) NOT NULL,
id_pessoa INTEGER NOT NULL,
CONSTRAINT FK_id_pessoa FOREIGN KEY(id_pessoa) REFERENCES Pessoa (id_pessoa)
);

CREATE TABLE ImagemCategoria (
id_imagem_categoria SERIAL PRIMARY KEY NOT NULL,
id_imagem INTEGER NOT NULL,
id_categoria INTEGER NOT NULL,
CONSTRAINT FK_id_imagem FOREIGN KEY(id_imagem) REFERENCES Imagem (id_imagem),
CONSTRAINT FK_id_categoria FOREIGN KEY(id_categoria) REFERENCES Categoria (id_categoria)
);

CREATE TABLE Lugar (
id_lugar SERIAL PRIMARY KEY NOT NULL,
long DECIMAL(10,5) NOT NULL,
lat DECIMAL(10,5) NOT NULL,
descricao VARCHAR(256) NOT NULL,
nome_lugar VARCHAR(256) NOT NULL,
id_pessoa INTEGER NOT NULL,
id_categoria INTEGER NOT NULL,
CONSTRAINT FK_id_pessoa FOREIGN KEY(id_pessoa) REFERENCES Pessoa (id_pessoa),
CONSTRAINT FK_id_categoria FOREIGN KEY(id_categoria) REFERENCES Categoria (id_categoria)
);

CREATE TABLE ImagemLugar (
id_imagem_lugar SERIAL PRIMARY KEY NOT NULL,
id_imagem INTEGER NOT NULL,
id_lugar INTEGER NOT NULL,
CONSTRAINT FK_id_imagem FOREIGN KEY(id_imagem) REFERENCES Imagem (id_imagem),
CONSTRAINT FK_id_lugar FOREIGN KEY(id_lugar) REFERENCES Lugar (id_lugar)
);

CREATE TABLE Postagem (
data DATE NOT NULL,
id_postagem SERIAL PRIMARY KEY NOT NULL,
postagem TEXT,
id_lugar INTEGER NOT NULL,
id_pessoa INTEGER NOT NULL,
CONSTRAINT FK_id_lugar FOREIGN KEY(id_lugar) REFERENCES Lugar (id_lugar),
CONSTRAINT FK_id_pessoa FOREIGN KEY(id_pessoa) REFERENCES Pessoa (id_pessoa)
);

CREATE TABLE ImagemPostagem (
id_imagem_postagem SERIAL PRIMARY KEY NOT NULL,
id_imagem INTEGER NOT NULL,
id_postagem INTEGER NOT NULL,
CONSTRAINT FK_id_imagem FOREIGN KEY(id_imagem) REFERENCES Imagem (id_imagem),
CONSTRAINT FK_id_postagem FOREIGN KEY(id_postagem) REFERENCES Postagem (id_postagem)
);

CREATE TABLE Cometarios (
id_comentario SERIAL PRIMARY KEY NOT NULL,
texto TEXT NOT NULL,
id_postagem INTEGER NOT NULL,
id_pessoa INTEGER NOT NULL,
CONSTRAINT FK_id_postagem FOREIGN KEY(id_postagem) REFERENCES Postagem (id_postagem),
CONSTRAINT FK_id_pessoa FOREIGN KEY(id_pessoa) REFERENCES Pessoa (id_pessoa)
);

CREATE TABLE Avaliacao (
id_avaliacao SERIAL PRIMARY KEY NOT NULL,
nota INTEGER NOT NULL CHECK (nota >= 1 and nota <=5),
comentario TEXT,
id_pessoa INTEGER NOT NULL,
id_lugar INTEGER NOT NULL,
CONSTRAINT FK_id_pessoa FOREIGN KEY(id_pessoa) REFERENCES Pessoa (id_pessoa),
CONSTRAINT FK_id_lugar FOREIGN KEY(id_lugar) REFERENCES Lugar (id_lugar)
);