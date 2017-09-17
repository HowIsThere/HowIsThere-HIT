/* Cria a tabela Imagem, com a chave primária id_imagem  */
CREATE TABLE Imagem (
id_imagem SERIAL PRIMARY KEY NOT NULL,
path VARCHAR(256) NOT NULL,
descricao VARCHAR(256) NOT NULL
);

/* Cria a tabela ImagemPessoa, com a chave primária id_imagem_pessoa  */
CREATE TABLE ImagemPessoa (
id_imagem_pessoa SERIAL PRIMARY KEY NOT NULL,
id_imagem INTEGER NOT NULL,
CONSTRAINT FK_id_imagem FOREIGN KEY(id_imagem) REFERENCES Imagem (id_imagem)
);

/* Cria a tabela Pessoa, com a chave primária id_pessoa  */
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
id_imagem_pessoa INTEGER NOT NULL,
CONSTRAINT FK_id_imagem_pessoa FOREIGN KEY(id_imagem_pessoa) REFERENCES ImagemPessoa (id_imagem_pessoa)
);

/* Cria a tabela Categoria, com a chave primária id_categoria  */
CREATE TABLE Categoria (
id_categoria SERIAL PRIMARY KEY NOT NULL,
descricao VARCHAR(256) NOT NULL,
nome_categoria VARCHAR(256) NOT NULL,
id_pessoa INTEGER NOT NULL,
CONSTRAINT FK_id_pessoa FOREIGN KEY(id_pessoa) REFERENCES Pessoa (id_pessoa)
);

/* Cria a tabela ImagemCategoria, com a chave primária id_imagem_categoria  */
CREATE TABLE ImagemCategoria (
id_imagem_categoria SERIAL PRIMARY KEY NOT NULL,
id_imagem INTEGER NOT NULL,
id_categoria INTEGER NOT NULL,
CONSTRAINT FK_id_imagem FOREIGN KEY(id_imagem) REFERENCES Imagem (id_imagem),
CONSTRAINT FK_id_categoria FOREIGN KEY(id_categoria) REFERENCES Categoria (id_categoria)
);

/* Cria a tabela Lugar, com a chave primária id_lugar  */
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

/* Cria a tabela ImagemLugar, com a chave primária id_imagem_lugar  */
CREATE TABLE ImagemLugar (
id_imagem_lugar SERIAL PRIMARY KEY NOT NULL,
id_imagem INTEGER NOT NULL,
id_lugar INTEGER NOT NULL,
CONSTRAINT FK_id_imagem FOREIGN KEY(id_imagem) REFERENCES Imagem (id_imagem),
CONSTRAINT FK_id_lugar FOREIGN KEY(id_lugar) REFERENCES Lugar (id_lugar)
);

/* Cria a tabela Postagem, com a chave primária id_postagem  */
CREATE TABLE Postagem (
data DATE NOT NULL,
id_postagem SERIAL PRIMARY KEY NOT NULL,
postagem TEXT,
id_lugar INTEGER NOT NULL,
id_pessoa INTEGER NOT NULL,
CONSTRAINT FK_id_lugar FOREIGN KEY(id_lugar) REFERENCES Lugar (id_lugar),
CONSTRAINT FK_id_pessoa FOREIGN KEY(id_pessoa) REFERENCES Pessoa (id_pessoa)
);

/* Cria a tabela ImagemPostagem, com a chave primária id_imagem_postagem  */
CREATE TABLE ImagemPostagem (
id_imagem_postagem SERIAL PRIMARY KEY NOT NULL,
id_imagem INTEGER NOT NULL,
id_postagem INTEGER NOT NULL,
CONSTRAINT FK_id_imagem FOREIGN KEY(id_imagem) REFERENCES Imagem (id_imagem),
CONSTRAINT FK_id_postagem FOREIGN KEY(id_postagem) REFERENCES Postagem (id_postagem)
);

/* Cria a tabela Cometarios, com a chave primária id_comentario  */
CREATE TABLE Comentarios (
id_comentario SERIAL PRIMARY KEY NOT NULL,
texto TEXT NOT NULL,
id_postagem INTEGER NOT NULL,
id_pessoa INTEGER NOT NULL,
CONSTRAINT FK_id_postagem FOREIGN KEY(id_postagem) REFERENCES Postagem (id_postagem),
CONSTRAINT FK_id_pessoa FOREIGN KEY(id_pessoa) REFERENCES Pessoa (id_pessoa)
);

/* Cria a tabela Avaliacao, com a chave primária id_avaliacao  */
CREATE TABLE Avaliacao (
id_avaliacao SERIAL PRIMARY KEY NOT NULL,
nota INTEGER NOT NULL CHECK (nota >= 1 and nota <=5),
comentario TEXT,
id_pessoa INTEGER NOT NULL,
id_lugar INTEGER NOT NULL,
CONSTRAINT FK_id_pessoa FOREIGN KEY(id_pessoa) REFERENCES Pessoa (id_pessoa),
CONSTRAINT FK_id_lugar FOREIGN KEY(id_lugar) REFERENCES Lugar (id_lugar)
);


/* Insere dados na tabela Imagem  */
INSERT INTO Imagem (path, descricao) 
VALUES ('/server/pasta/imagem1', 'Imagem padrão de Pessoa'),
		('/server/pasta/imagem2', 'Imagem padrão de Categoria'),
        ('/server/pasta/imagem3', 'Imagem padrão de Lugar'),
        ('/server/pasta/imagem4', 'Imagem postagem 2');
        
/* Insere dados na tabela ImagemPessoa  */
INSERT INTO ImagemPessoa (id_imagem) 
VALUES (1),
		(1),
		(1),
        (1),
        (1);

/* Insere dados na tabela Pessoa  */
INSERT INTO Pessoa (nome_pessoa, email, login, senha, rua, numero, bairro,
                    cidade, estado, cep, colaboracao, autenticidade, ativo, id_imagem_pessoa)
VALUES ('Maria Silva', 'maria.silva@mail.com', 'maria.silva', '123456', 'Rua A', '54', 'Jacaraípe',
        'Serra', 'ES', '29.000-000', 2, 2, 'S', 1),
		('Carlos Manuel', 'carlos.manuel@mail.com', 'carlos.manuel', '123456', 'Rua B', '102', 'Jacaraípe',
         'Serra', 'ES', '29.000-000', 1, 2, 'S', 2),
        ('Cristina Soares', 'cristina.soares@mail.com', 'cristina.soares', '123456', 'Rua A', '562', 'Jardim Camburi',
         'Vitória', 'ES', '29.092-000', 1, 2, 'S', 3),
        ('Eduardo Vasconcelos', 'eduardo.vasconcelos@mail.com', 'eduardo.vasconcelos', '123456', 'Rua B', '973', 'Jardim Camburi',
         'Vitória', 'ES', '29.092-000', 1, 1, 'S', 4),
        ('Jean Costa', 'jean.costa@mail.com', 'jean.costa', '123456', 'Rua A', '628', 'Jardim da Penha',
         'Vitória', 'ES', '29.060-000', 0, 0, 'S', 5);

/* Insere dados na tabela Categoria  */
INSERT INTO Categoria (nome_categoria, descricao, id_pessoa)
VALUES ('Shopping', 'Centro comercial com lojas, prestação de serviços e lazer.', 1),
		('Praia', 'Area recreativa para banho de mar, surfe, natação, etc.', 1),
        ('Praça', 'Espaço urbano para convivência e recreação.', 1),
        ('Supermercado', 'Comércio com grande quantidade de produtos.', 1),
        ('Lanchonete', 'Estabelecimento comercial para pequenas refeições.', 1),
        ('Bar', 'Estabelecimento comercial que oferece bebidas.', 1);

/* Insere dados na tabela ImagemCategoria  */
INSERT INTO ImagemCategoria (id_imagem, id_categoria)
VALUES (2, 1),
		(2, 2),
        (2, 3),
        (2, 4),
        (2, 5),
        (2, 6);

/* Insere dados na tabela Lugar  */
INSERT INTO Lugar (nome_lugar, descricao, lat, long, id_pessoa, id_categoria)
VALUES ('Shopping Vitória', 'Shopping Center', -20.3127, -40.2878, 1, 1),
		('Shopping Mestre Alvaro', 'Shopping Center', -20.2402, -40.2771, 1, 1),
        ('Praia da Baleia', 'Praia na Serra', -20.1742, -40.1995, 2, 2),
        ('Praça da luz', 'Praça em Laranjeiras', -20.196, -40.2572, 3, 2),
        ('Supermercado Carone', 'Supermercado em Jardim Camburi', -20.2522, -40.2685, 4, 6);

/* Insere dados na tabela ImagemLugar  */
INSERT INTO ImagemLugar (id_imagem, id_lugar)
VALUES (3, 1),
		(3, 2),
        (3, 3),
        (3, 4),
        (3, 5);

/* Insere dados na tabela Postagem  */
INSERT INTO Postagem (postagem, data, id_lugar, id_pessoa)
VALUES ('Lugar maneiro, muito bom!!', '09/09/2017', 1, 4),
		('Praia com pouca gente agr, bem tranquilo!', '09/09/2017', 3, 1),
        ('Ambiente super agradável', '09/09/2017', 4, 5),
        ('Shopping com pouco movimento hoje!!', '09/09/2017', 2, 2);

/* Insere dados na tabela ImagemPostagem  */
INSERT INTO ImagemPostagem (id_imagem, id_postagem)
VALUES (4, 2);

/* Insere dados na tabela Comentarios  */
INSERT INTO Comentarios (texto, id_postagem, id_pessoa)
VALUES ('dahora mesmoooo!!', 3, 5),
		('muito bom!', 1, 2);

/* Insere dados na tabela Avaliacao  */
INSERT INTO Avaliacao (comentario, nota, id_pessoa, id_lugar)
VALUES ('Gostei de conhecer, lugar bem organizado, atendimento de primeira!!', 5, 4, 5),
		('praia muito legal, limpa e com poucas pessoas! adorei!', 5, 3, 3),
        ('ótimo Shopping, maneiro!!', 5, 5, 1),
        ('Shopping bem organizado!!', 4, 2, 1);