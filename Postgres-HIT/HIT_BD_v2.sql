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
VALUES ('Imagem de Categoria', '/server/pasta/imagem_1', 1),
        ('Imagem de Lugar', '/server/pasta/imagem_2', 2),
        ('Imagem de Pessoa', '/server/pasta/imagem_3', 3),
        ('Imagem de postagem', '/server/pasta/imagem_4', 4),
        ('Imagem de postagem', '/server/pasta/imagem_5', 4),
        ('Imagem de postagem', '/server/pasta/imagem_6', 4),
        ('Imagem de postagem', '/server/pasta/imagem_7', 4),
        ('Imagem de postagem', '/server/pasta/imagem_8', 4),
        ('Imagem de postagem', '/server/pasta/imagem_9', 4),
        ('Imagem de postagem', '/server/pasta/imagem_10', 4);

INSERT INTO Pessoa (nome_pessoa, email, login, senha, rua, numero, bairro,
                    cidade, uf, cep, colaboracao, autenticidade, ativo, fk_imagem_id_imagem)
VALUES ('Chiun Sales', 'chiun.sales@yah00.us', 'chiun.sales@yah00.us', 'gqorighfaw', 'Travessa Santa Catarina', '1688', 'Vila Merlo', 'Barretos', 'PA', '70.914-600', 69, 49, 'S', 3),
        ('Missaki Monteiro', 'missaki.monteiro@somema1l.biz', 'missaki.monteiro@somema1l.biz', 'durifeubrhhqaj', 'Rua 7', '4786', 'Cidade Nova da Serra', 'Cajobi', 'MT', '36.119-011', 54, 46, 'S', 3),
        ('Alexis Novaes', 'alexis.novaes@ma1lbox.biz', 'alexis.novaes@ma1lbox.biz', 'zcpozsgfc', 'Rua Principal', '5474', 'São Francisco', 'Angatuba', 'PR', '42.339-563', 5, 1, 'S', 3),
        ('Cyrus da Conceição', 'probably64@gma1l.co.uk', 'probably64@gma1l.co.uk', 'xzlwwqlbkvrks', 'Rua Três', '4210', 'Santa Rosa', 'Mesquita', 'PA', '52.275-107', 72, 66, 'S', 3),
        ('Kechi Nascimento', 'kechi.nascimento@gma1l.net', 'kechi.nascimento@gma1l.net', 'aqtqujnefv', 'Alameda Santa Rita', '414', 'Centro', 'Nova Friburgo', 'AL', '94.136-151', 65, 63, 'S', 3),
        ('Linoel Nogueira', 'linoel.nogueira45@yah00.co.uk', 'linoel.nogueira45@yah00.co.uk', 'dpilfhhrt', 'Alameda 11', '2387', 'Inhaúma', 'Nova Odessa', 'PB', '71.126-090', 31, 8, 'S', 3),
        ('Gutemberg Cardoso', 'gutemberg.cardoso@hotma1l.org', 'gutemberg.cardoso@hotma1l.org', 'zsafif', 'Rua Belo Horizonte', '7752', 'Jardim Campo Grande', 'Guararapes', 'PE', '76.548-374', 32, 15, 'S', 3),
        ('Gustavo Teixeira', 'gustavo.teixeira@everyma1l.co.uk', 'gustavo.teixeira@everyma1l.co.uk', 'ebnwngmjvj', 'Alameda Sao Pedro', '7991', 'do Quadro', 'Araruama', 'MT', '73.614-418', 91, 62, 'S', 3),
        ('Alexandre Lima', 'alexandre1615@ma1lbox.co.uk', 'alexandre1615@ma1lbox.co.uk', 'upgpldn', 'Avenida Dom Pedro II', '4989', 'Jardim Guanabara', 'São Joaquim da Barra', 'RO', '31.249-249', 13, 5, 'S', 3),
        ('Edsel Gomes', 'edsel.gomes@yah00.org', 'edsel.gomes@yah00.org', 'efumgbafxdopsp', 'Alameda Belo Horizonte', '5669', 'Bela Vista', 'Barão de Antonina', 'SC', '62.570-224', 56, 24, 'S', 3);

INSERT INTO Categoria (nome_categoria, descricao, fk_pessoa_id_pessoa, fk_imagem_id_imagem)
VALUES ('Shopping', 'Centro comercial com lojas, prestação de serviços e lazer.', 5, 1),
        ('Praia', 'Area recreativa para banho de mar, surfe, natação, etc.', 5, 1),
        ('Praça', 'Espaço urbano para convivência e recreação.', 5, 1),
        ('Supermercado', 'Comércio com grande quantidade de produtos.', 5, 1),
        ('Lanchonete', 'Estabelecimento comercial para pequenas refeições.', 5, 1),
        ('Bar', 'Estabelecimento comercial que oferece bebidas.', 6, 1),
        ('Restaurante', 'Estabelecimento comercial que oferece alimentação', 6, 1),
        ('Parque', 'Espaço para recreação.', 6, 1),
        ('Zoológico', 'Área de exposição de animais.', 6, 1),
        ('Museu', 'Espaço de exposição de antiguidades.', 6, 1);

INSERT INTO Lugar (nome_lugar, descricao, latitude, longitude, fk_pessoa_id_pessoa, fk_categoria_id_categoria, fk_imagem_id_imagem)
VALUES ('Shopping Vitória', 'Shopping Center', -20.3127, -40.2878, 1, 1, 2),
        ('Shopping Mestre Alvaro', 'Shopping Center', -20.2402, -40.2771, 1, 1, 2),
        ('Praia da Baleia', 'Praia na Serra', -20.1742, -40.1995, 2, 2, 2),
        ('Praça da luz', 'Praça em Laranjeiras', -20.196, -40.2572, 3, 2, 2),
        ('Supermercado Carone', 'Supermercado em Jardim Camburi', -20.2522, -40.2685, 4, 6, 2),
        ('Paddock bar e botequim', 'Bar e botequim na Praia do Canto', -20.2955528, -40.2947166, 1, 6, 2),
        ('Bar abertura', 'Bar na Praia do Canto', -20.294821, -40.2930577, 2, 6, 2),
        ('La Cozina restaurante Self service', 'Restaurante em Jardim Camburi', -20.2600233, -40.2720663, 3, 7, 2),
        ('Restaurante Timoneiro Vitória', 'Restaurante em Jardim da Penha', -20.294821, -40.2930577, 7, 7, 2),
        ('Don Camaleone', 'Restaurante na Praia do Canto', -20.2948208, -40.2996238, 7, 7, 2);
        
INSERT INTO Postagem (data, texto, fk_lugar_id_lugar, fk_pessoa_id_pessoa)
VALUES ('2000/6/28', 'out secretly or cold came open a library badly a light do teugqfyzzugxuh hid I are words speed my to', 8, 1),
        ('2013/10/17', 'came zhvduggbsnhedo sacrifice sidekick library visions magnetic computer I hid rescue ujuvqgdekolqca', 6, 2),
        ('2012/8/2', 'dad hykgklpqqxavlrre yfewtgxgzmw monster I pull are dad out interest is are knnhharcwss constantly I', 9, 3),
        ('2002/3/1', 'I pique sill pull suspense out much television indivjdyhpg bvsbfqyxapj bhilkwnqkry a is ending will ', 4, 3),
        ('2008/11/28', 'automatically a out demanded always uhtyhjdffoq to hid man to sacrifice a computer light visions a I', 7, 4),
        ('2009/7/23', 'visions the constantly to sill in dad write I assert we much constantly assert assert a putmfspqzgya', 1, 5),
        ('2000/12/28', 'dloryexmrfl is enter visions pique good dreams in television holkumzyafr a the to do visions build I', 6, 7),
        ('2010/11/22', 'so the automatically the sill pique captain pique library asked moved sacrifice write is secretly is', 6, 8),
        ('2004/8/22', 'came hat to out is polakmiroyvcxn library boon dad a as to are ill I speed until a came caves to a I', 8, 9),
        ('2008/8/18', 'hatch do came wrong text constantly something to should sacrifice ill a I I in juxuwntccmqsew the do', 2, 10);
        
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

INSERT INTO Avaliacao (nota, fk_lugar_id_lugar, fk_pessoa_id_pessoa)
VALUES (5, 5, 4),
	(5, 1, 1),
	(5, 3, 3),
        (5, 2, 1),
        (5, 3, 2),
        (5, 1, 5),
        (4, 1, 2),
        (5, 4, 3),
        (5, 6, 1),
        (5, 6, 8);
        
INSERT INTO Comentario_avaliacao (texto, fk_avaliacao_id_avaliacao)
VALUES ('Gostei de conhecer, lugar bem organizado, atendimento de primeira!!', 1),
        ('praia muito legal, limpa e com poucas pessoas! adorei!', 3),
        ('ótimo Shopping, maneiro!!', 6),
        ('Shopping bem organizado!!', 7),
        ('Muito bom, com certeza virei mais vezes.', 9);
