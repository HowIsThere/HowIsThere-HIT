CREATE TABLE Lugar (
    id_lugar SERIAL PRIMARY KEY NOT NULL,
    nome_lugar VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    latitude DECIMAL(10,5) NOT NULL,
    longitude DECIMAL(10,5) NOT NULL,
    FK_Pessoa_id_pessoa SERIAL,
    FK_Categoria_id_categoria SERIAL,
    FK_Imagem_id_imagem SERIAL
);

CREATE TABLE Avaliacao (
    id_avaliacao SERIAL PRIMARY KEY NOT NULL,
    nota INTEGER NOT NULL CHECK (nota >= 1 and nota <=5),
    FK_Lugar_id_lugar SERIAL,
    FK_Pessoa_id_pessoa SERIAL
);

CREATE TABLE Comentario_Postagem (
    id_comentario_postagem SERIAL PRIMARY KEY NOT NULL,
    texto TEXT NOT NULL,
    FK_Pessoa_id_pessoa SERIAL,
    FK_Postagem_id_postagem SERIAL
);

CREATE TABLE Pessoa (
    id_pessoa  SERIAL PRIMARY KEY NOT NULL,
    nome_pessoa VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL CONSTRAINT proper_email CHECK (email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'),
    login VARCHAR(100) NOT NULL,
    senha VARCHAR(20) NOT NULL,
    rua VARCHAR(100) NOT NULL,
    numero CHAR(5) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    uf CHAR(2) NOT NULL,
    cep VARCHAR(10) NOT NULL CONSTRAINT proper_cep CHECK (cep ~* '^[0-9]{2}.[0-9]{3}-[0-9]{3}$'),
    colaboracao INT NOT NULL,
    autenticidade INT NOT NULL,
    ativo CHAR(1) NOT NULL,
    FK_Imagem_id_imagem SERIAL
);

CREATE TABLE Categoria (
    id_categoria  SERIAL PRIMARY KEY NOT NULL,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    FK_Pessoa_id_pessoa SERIAL,
    FK_Imagem_id_imagem SERIAL
);

CREATE TABLE Postagem (
    id_postagem SERIAL PRIMARY KEY NOT NULL,
    data  DATE NOT NULL,
    texto TEXT,
    FK_Lugar_id_lugar SERIAL,
    FK_Pessoa_id_pessoa SERIAL
);

CREATE TABLE Imagem (
    id_imagem SERIAL PRIMARY KEY NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    caminho_imagem VARCHAR(255) NOT NULL,
    FK_Tipo_Imagem_id_tipo_imagem SERIAL
);

CREATE TABLE Tipo_Imagem (
    id_tipo_imagem SERIAL PRIMARY KEY NOT NULL,
    nome_tipo VARCHAR(50) NOT NULL
);

CREATE TABLE Comentario_Avaliacao (
    id_comentario_avaliacao SERIAL PRIMARY KEY NOT NULL,
    texto TEXT NOT NULL,
    FK_Avaliacao_id_avaliacao SERIAL
);

CREATE TABLE IMAGEM_POSTAGEM (
    FK_Imagem_id_imagem SERIAL,
    FK_Postagem_id_postagem SERIAL
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
 
ALTER TABLE Comentario_Postagem ADD CONSTRAINT FK_Comentario_Postagem_1
    FOREIGN KEY (FK_Pessoa_id_pessoa)
    REFERENCES Pessoa (id_pessoa)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Comentario_Postagem ADD CONSTRAINT FK_Comentario_Postagem_2
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

ALTER TABLE Postagem ADD CONSTRAINT FK_Postagem_3
    FOREIGN KEY (FK_Pessoa_id_pessoa)
    REFERENCES Pessoa (id_pessoa)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Imagem ADD CONSTRAINT FK_Imagem_1
    FOREIGN KEY (FK_Tipo_Imagem_id_tipo_imagem)
    REFERENCES Tipo_Imagem (id_tipo_imagem)
    ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE Comentario_Avaliacao ADD CONSTRAINT FK_Comentario_Avaliacao_1
    FOREIGN KEY (FK_Avaliacao_id_avaliacao)
    REFERENCES Avaliacao (id_avaliacao)
    ON DELETE CASCADE ON UPDATE CASCADE;
    
ALTER TABLE IMAGEM_POSTAGEM ADD CONSTRAINT FK_IMAGEM_POSTAGEM_0
    FOREIGN KEY (FK_Imagem_id_imagem)
    REFERENCES Imagem (id_imagem)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE IMAGEM_POSTAGEM ADD CONSTRAINT FK_IMAGEM_POSTAGEM_1
    FOREIGN KEY (FK_Postagem_id_postagem)
    REFERENCES Postagem (id_postagem)
    ON DELETE SET NULL ON UPDATE CASCADE;

INSERT INTO tipo_imagem (nome_tipo)
VALUES ('Categoria'),
		('Lugar'),
        ('Pessoa'),
        ('Postagem'),
        ('Comentario');

INSERT INTO Imagem (descricao, caminho_imagem, fk_tipo_imagem_id_tipo_imagem) 
VALUES ('Imagem padrão de Pessoa', '/server/pasta/imagem1', 3),
		('Imagem padrão de Categoria', '/server/pasta/imagem2', 1),
        ('Imagem padrão de Lugar', '/server/pasta/imagem3', 2),
        ('Imagem postagem 2', '/server/pasta/imagem4', 4),
        ('Imagem postagem 3', '/server/pasta/imagem5', 4),
        ('Imagem postagem 4', '/server/pasta/imagem6', 4),
        ('Imagem postagem 5', '/server/pasta/imagem7', 4),
        ('Imagem postagem 6', '/server/pasta/imagem8', 4),
        ('Imagem postagem 9', '/server/pasta/imagem9', 4),
        ('Imagem postagem 10', '/server/pasta/imagem10', 4);

INSERT INTO Pessoa (nome_pessoa, email, login, senha, rua, numero, bairro,
                    cidade, uf, cep, colaboracao, autenticidade, ativo, fk_imagem_id_imagem)
VALUES ('Maria Silva', 'maria.silva@mail.com', 'maria.silva', '123456', 'Rua A', '54', 'Jacaraípe',
        'Serra', 'ES', '29.000-000', 3, 3, 'S', 1),
		('Carlos Manuel', 'carlos.manuel@mail.com', 'carlos.manuel', '123456', 'Rua B', '102', 'Jacaraípe',
         'Serra', 'ES', '29.000-000', 2, 2, 'S', 1),
        ('Cristina Soares', 'cristina.soares@mail.com', 'cristina.soares', '123456', 'Rua A', '562', 'Jardim Camburi',
         'Vitória', 'ES', '29.092-000', 2, 2, 'S', 1),
        ('Eduardo Vasconcelos', 'eduardo.vasconcelos@mail.com', 'eduardo.vasconcelos', '123456', 'Rua B', '973', 'Jardim Camburi',
         'Vitória', 'ES', '29.092-000', 1, 1, 'S', 1),
        ('Jean Costa', 'jean.costa@mail.com', 'jean.costa', '123456', 'Rua A', '628', 'Jardim da Penha',
         'Vitória', 'ES', '29.060-000', 5, 5, 'S', 1),
        ('Josué Oliveira', 'josue.oliveira@mail.com', 'josue.oliveira', '123456', 'Rua B', '6347', 'Jardim da Penha',
         'Vitória', 'ES', '29.060-000', 5, 5, 'S', 1),
        ('João Fernandes', 'joao.fernandes@mail.com', 'joao.fernandes', '123456', 'Rua A', '927', 'Jardim da Penha',
         'Vitória', 'ES', '29.060-000', 2, 2, 'S', 1),
        ('Camila Diniz', 'camila.diniz@mail.com', 'camila.diniz', '123456', 'Rua B', '7381', 'Jardim da Penha',
         'Vitória', 'ES', '29.060-000', 0, 0, 'S', 1),
        ('Ana Ferreira', 'ana.ferreira@mail.com', 'ana.ferreira', '123456', 'Rua A', '342', 'Jardim Camburi',
         'Vitória', 'ES', '29.092-000', 0, 0, 'S', 1),
        ('Vitoria Santos', 'vitoria.santos@mail.com', 'vitoria.santos', '123456', 'Rua B', '93', 'Jardim Camburi',
         'Vitória', 'ES', '29.092-000', 0, 0, 'S', 1);
         
INSERT INTO Categoria (nome_categoria, descricao, fk_pessoa_id_pessoa, fk_imagem_id_imagem)
VALUES ('Shopping', 'Centro comercial com lojas, prestação de serviços e lazer.', 5, 2),
		('Praia', 'Area recreativa para banho de mar, surfe, natação, etc.', 5, 2),
        ('Praça', 'Espaço urbano para convivência e recreação.', 5, 2),
        ('Supermercado', 'Comércio com grande quantidade de produtos.', 5, 2),
        ('Lanchonete', 'Estabelecimento comercial para pequenas refeições.', 5, 2),
        ('Bar', 'Estabelecimento comercial que oferece bebidas.', 6, 2),
        ('Restaurante', 'Estabelecimento comercial que oferece alimentação', 6, 2),
        ('Parque', 'Espaço para recreação.', 6, 2),
        ('Zoológico', 'Área de exposição de animais.', 6, 2),
        ('Museu', 'Espaço de exposição de antiguidades.', 6, 2);

INSERT INTO Lugar (nome_lugar, descricao, latitude, longitude, fk_pessoa_id_pessoa, fk_categoria_id_categoria, fk_imagem_id_imagem)
VALUES ('Shopping Vitória', 'Shopping Center', -20.3127, -40.2878, 1, 1, 3),
		('Shopping Mestre Alvaro', 'Shopping Center', -20.2402, -40.2771, 1, 1, 3),
        ('Praia da Baleia', 'Praia na Serra', -20.1742, -40.1995, 2, 2, 3),
        ('Praça da luz', 'Praça em Laranjeiras', -20.196, -40.2572, 3, 2, 3),
        ('Supermercado Carone', 'Supermercado em Jardim Camburi', -20.2522, -40.2685, 4, 6, 3),
        ('Paddock bar e botequim', 'Bar e botequim na Praia do Canto', -20.2955528, -40.2947166, 1, 6, 3),
        ('Bar abertura', 'Bar na Praia do Canto', -20.294821, -40.2930577, 2, 6, 3),
        ('La Cozina restaurante Self service', 'Restaurante em Jardim Camburi', -20.2600233, -40.2720663, 3, 7, 3),
        ('Restaurante Timoneiro Vitória', 'Restaurante em Jardim da Penha', -20.294821, -40.2930577, 7, 7, 3),
        ('Don Camaleone', 'Restaurante na Praia do Canto', -20.2948208, -40.2996238, 7, 7, 3);
        
INSERT INTO Postagem (texto, data, fk_lugar_id_lugar, fk_pessoa_id_pessoa)
VALUES ('Lugar maneiro, muito bom!!', '09/09/2017', 1, 4),
		('Praia com pouca gente agr, bem tranquilo!', '09/09/2017', 3, 1),
        ('Ambiente super agradável', '09/09/2017', 4, 5),
        ('Shopping com pouco movimento hoje!!', '09/09/2017', 2, 2),
        ('Restaurante com comida maravilhosa!', '09/09/2017', 8, 5),
        ('Restaurante com atendimento maravilhoso!!', '09/09/2017', 8, 7),
        ('Barzinho hoje tá demaiiiis!', '09/09/2017', 6, 6),
        ('Comida italiana maravilhosaaaa!', '09/09/2017', 10, 7),
        ('Evento maneiro de musica ao vivo aqui na praça.', '09/09/2017', 4, 2),
        ('Melhor praiaaa!', '09/09/2017', 3, 4);
        
/*Tabela que representa o relacionamento entre postagem e imagem*/
INSERT INTO IMAGEM_POSTAGEM (fk_imagem_id_imagem, fk_postagem_id_postagem)
VALUES (4, 2),
		(5, 3),
        (6, 4),
        (7, 5),
        (8, 6),
        (9, 9),
        (10, 10);

INSERT INTO Comentario_postagem (texto, fk_postagem_id_postagem, fk_pessoa_id_pessoa)
VALUES ('dahora mesmoooo!!', 3, 5),
		('muito bom!', 1, 2),
        ('top!', 3, 1),
        ('massa!', 3, 10),
        ('amei!', 5, 7),
        ('comida muito boa!', 5, 4),
        ('melhor atendimento!', 7, 6),
        ('Cara, e esse som que ta rolando hoje?!', 7, 8),
        ('Nem fala, maneiro dms', 7, 9),
        ('Shoooow!', 7, 3);

INSERT INTO Avaliacao (nota, fk_pessoa_id_pessoa, fk_lugar_id_lugar)
VALUES (5, 4, 5),
		(5, 1, 1),
		(5, 3, 3),
        (5, 1, 2),
        (5, 2, 3),
        (5, 5, 1),
        (4, 2, 1),
        (5, 3, 4),
        (5, 1, 6),
        (5, 8, 6);
        
INSERT INTO Comentario_avaliacao (texto, fk_avaliacao_id_avaliacao)
VALUES ('Gostei de conhecer, lugar bem organizado, atendimento de primeira!!', 1),
        ('praia muito legal, limpa e com poucas pessoas! adorei!', 3),
        ('ótimo Shopping, maneiro!!', 6),
        ('Shopping bem organizado!!', 7),
        ('Muito bom, com certeza virei mais vezes.', 9);