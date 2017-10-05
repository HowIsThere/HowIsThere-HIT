/* Lógico_1: */

CREATE TABLE Lugar (
    latitude DECIMAL(10,5) NOT NULL,
    nome_lugar VARCHAR(256) NOT NULL,
    id_lugar SERIAL PRIMARY KEY NOT NULL,
    descricao VARCHAR(256) NOT NULL,
    longitude DECIMAL(10,5) NOT NULL,
    FK_Categoria_id_categoria SERIAL,
    FK_Pessoa_id_pessoa SERIAL,
    FK_Imagem_id_imagem SERIAL
);

CREATE TABLE Avaliacao (
    id_avaliacao SERIAL PRIMARY KEY NOT NULL,
    texto TEXT,
    nota INTEGER NOT NULL CHECK (nota >= 1 and nota <=5),
    FK_Lugar_id_lugar SERIAL,
    FK_Pessoa_id_pessoa SERIAL
);

CREATE TABLE Comentarios (
    id_comentario SERIAL PRIMARY KEY NOT NULL,
    texto TEXT NOT NULL,
    FK_Pessoa_id_pessoa SERIAL,
    FK_Postagem_id_postagem SERIAL
);

CREATE TABLE Pessoa (
    colaboracao INT NOT NULL,
    id_pessoa  SERIAL PRIMARY KEY NOT NULL,
    nome_pessoa VARCHAR(255) NOT NULL,
    ativo CHAR(1) NOT NULL,
    senha VARCHAR(20) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    numero CHAR(5) NOT NULL,
    uf CHAR(2) NOT NULL,
    email VARCHAR(255) NOT NULL CONSTRAINT proper_email CHECK (email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'),
    login VARCHAR(20) NOT NULL,
    rua VARCHAR(100) NOT NULL,
    autencidade INT NOT NULL,
    cep VARCHAR(10) NOT NULL CONSTRAINT proper_cep CHECK (cep ~* '^[0-9]{2}.[0-9]{3}-[0-9]{3}$'),
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    FK_Imagem_id_imagem SERIAL
);

CREATE TABLE Categoria (
    id_categoria  SERIAL PRIMARY KEY NOT NULL,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao VARCHAR(256) NOT NULL,
    FK_Pessoa_id_pessoa SERIAL,
    FK_Imagem_id_imagem SERIAL
);

CREATE TABLE Postagem (
    id_postagem SERIAL PRIMARY KEY NOT NULL,
    data  DATE NOT NULL,
    texto TEXT,
    FK_Lugar_id_lugar SERIAL,
    FK_Imagem_id_imagem SERIAL,
    FK_Pessoa_id_pessoa SERIAL
);

CREATE TABLE Imagem (
    id_imagem SERIAL PRIMARY KEY NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    caminho_imagem VARCHAR(256) NOT NULL,
    FK_Tipo_Imagem_id_tipo_imagem SERIAL
);

CREATE TABLE Tipo_Imagem (
    id_tipo_imagem SERIAL PRIMARY KEY NOT NULL,
    nome_tipo VARCHAR(50) NOT NULL
);
 
ALTER TABLE Lugar ADD CONSTRAINT FK_Lugar_1
    FOREIGN KEY (FK_Categoria_id_categoria)
    REFERENCES Categoria (id_categoria)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Lugar ADD CONSTRAINT FK_Lugar_2
    FOREIGN KEY (FK_Pessoa_id_pessoa)
    REFERENCES Pessoa (id_pessoa)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Lugar ADD CONSTRAINT FK_Lugar_3
    FOREIGN KEY (FK_Imagem_id_imagem)
    REFERENCES Imagem (id_imagem)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Avaliacao ADD CONSTRAINT FK_Avaliacao_1
    FOREIGN KEY (FK_Lugar_id_lugar)
    REFERENCES Lugar (id_lugar)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Avaliacao ADD CONSTRAINT FK_Avaliacao_2
    FOREIGN KEY (FK_Pessoa_id_pessoa)
    REFERENCES Pessoa (id_pessoa)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Comentarios ADD CONSTRAINT FK_Comentarios_1
    FOREIGN KEY (FK_Pessoa_id_pessoa)
    REFERENCES Pessoa (id_pessoa)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Comentarios ADD CONSTRAINT FK_Comentarios_2
    FOREIGN KEY (FK_Postagem_id_postagem)
    REFERENCES Postagem (id_postagem)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Pessoa ADD CONSTRAINT FK_Pessoa_1
    FOREIGN KEY (FK_Imagem_id_imagem)
    REFERENCES Imagem (id_imagem)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Categoria ADD CONSTRAINT FK_Categoria_1
    FOREIGN KEY (FK_Pessoa_id_pessoa)
    REFERENCES Pessoa (id_pessoa)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Categoria ADD CONSTRAINT FK_Categoria_2
    FOREIGN KEY (FK_Imagem_id_imagem)
    REFERENCES Imagem (id_imagem)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Postagem ADD CONSTRAINT FK_Postagem_1
    FOREIGN KEY (FK_Lugar_id_lugar)
    REFERENCES Lugar (id_lugar)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Postagem ADD CONSTRAINT FK_Postagem_2
    FOREIGN KEY (FK_Imagem_id_imagem)
    REFERENCES Imagem (id_imagem)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Postagem ADD CONSTRAINT FK_Postagem_3
    FOREIGN KEY (FK_Pessoa_id_pessoa)
    REFERENCES Pessoa (id_pessoa)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Imagem ADD CONSTRAINT FK_Imagem_1
    FOREIGN KEY (FK_Tipo_Imagem_id_tipo_imagem)
    REFERENCES Tipo_Imagem (id_tipo_imagem)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
