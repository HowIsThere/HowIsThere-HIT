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
        ('/server/pasta/imagem4', 'Imagem postagem 2'),
        ('/server/pasta/imagem5', 'Imagem postagem 3'),
        ('/server/pasta/imagem6', 'Imagem postagem 4'),
        ('/server/pasta/imagem7', 'Imagem postagem 5'),
        ('/server/pasta/imagem8', 'Imagem postagem 6'),
        ('/server/pasta/imagem9', 'Imagem postagem 9'),
        ('/server/pasta/imagem10', 'Imagem postagem 10');
        
/* Insere dados na tabela ImagemPessoa  */
INSERT INTO ImagemPessoa (id_imagem) 
VALUES (1),
		(1),
		(1),
        (1),
        (1),
        (1),
        (1),
        (1),
        (1),
        (1);

/* Insere dados na tabela Pessoa  */
INSERT INTO Pessoa (nome_pessoa, email, login, senha, rua, numero, bairro,
                    cidade, estado, cep, colaboracao, autenticidade, ativo, id_imagem_pessoa)
VALUES ('Maria Silva', 'maria.silva@mail.com', 'maria.silva', '123456', 'Rua A', '54', 'Jacaraípe',
        'Serra', 'ES', '29.000-000', 3, 3, 'S', 1),
		('Carlos Manuel', 'carlos.manuel@mail.com', 'carlos.manuel', '123456', 'Rua B', '102', 'Jacaraípe',
         'Serra', 'ES', '29.000-000', 2, 2, 'S', 2),
        ('Cristina Soares', 'cristina.soares@mail.com', 'cristina.soares', '123456', 'Rua A', '562', 'Jardim Camburi',
         'Vitória', 'ES', '29.092-000', 2, 2, 'S', 3),
        ('Eduardo Vasconcelos', 'eduardo.vasconcelos@mail.com', 'eduardo.vasconcelos', '123456', 'Rua B', '973', 'Jardim Camburi',
         'Vitória', 'ES', '29.092-000', 1, 1, 'S', 4),
        ('Jean Costa', 'jean.costa@mail.com', 'jean.costa', '123456', 'Rua A', '628', 'Jardim da Penha',
         'Vitória', 'ES', '29.060-000', 5, 5, 'S', 5),
        ('Josué Oliveira', 'josue.oliveira@mail.com', 'josue.oliveira', '123456', 'Rua B', '6347', 'Jardim da Penha',
         'Vitória', 'ES', '29.060-000', 5, 5, 'S', 6),
        ('João Fernandes', 'joao.fernandes@mail.com', 'joao.fernandes', '123456', 'Rua A', '927', 'Jardim da Penha',
         'Vitória', 'ES', '29.060-000', 2, 2, 'S', 7),
        ('Camila Diniz', 'camila.diniz@mail.com', 'camila.diniz', '123456', 'Rua B', '7381', 'Jardim da Penha',
         'Vitória', 'ES', '29.060-000', 0, 0, 'S', 8),
        ('Ana Ferreira', 'ana.ferreira@mail.com', 'ana.ferreira', '123456', 'Rua A', '342', 'Jardim Camburi',
         'Vitória', 'ES', '29.092-000', 0, 0, 'S', 9),
        ('Vitoria Santos', 'vitoria.santos@mail.com', 'vitoria.santos', '123456', 'Rua B', '93', 'Jardim Camburi',
         'Vitória', 'ES', '29.092-000', 0, 0, 'S', 10);

/* Insere dados na tabela Categoria  */
INSERT INTO Categoria (nome_categoria, descricao, id_pessoa)
VALUES ('Shopping', 'Centro comercial com lojas, prestação de serviços e lazer.', 5),
		('Praia', 'Area recreativa para banho de mar, surfe, natação, etc.', 5),
        ('Praça', 'Espaço urbano para convivência e recreação.', 5),
        ('Supermercado', 'Comércio com grande quantidade de produtos.', 5),
        ('Lanchonete', 'Estabelecimento comercial para pequenas refeições.', 5),
        ('Bar', 'Estabelecimento comercial que oferece bebidas.', 6),
        ('Restaurante', 'Estabelecimento comercial que oferece alimentação', 6),
        ('Parque', 'Espaço para recreação.', 6),
        ('Zoológico', 'Área de exposição de animais.', 6),
        ('Museu', 'Espaço de exposição de antiguidades.', 6);

/* Insere dados na tabela ImagemCategoria  */
INSERT INTO ImagemCategoria (id_imagem, id_categoria)
VALUES (2, 1),
		(2, 2),
        (2, 3),
        (2, 4),
        (2, 5),
        (2, 6),
        (2, 7),
        (2, 8),
        (2, 9),
        (2, 10);

/* Insere dados na tabela Lugar  */
INSERT INTO Lugar (nome_lugar, descricao, lat, long, id_pessoa, id_categoria)
VALUES ('Shopping Vitória', 'Shopping Center', -20.3127, -40.2878, 1, 1),
		('Shopping Mestre Alvaro', 'Shopping Center', -20.2402, -40.2771, 1, 1),
        ('Praia da Baleia', 'Praia na Serra', -20.1742, -40.1995, 2, 2),
        ('Praça da luz', 'Praça em Laranjeiras', -20.196, -40.2572, 3, 2),
        ('Supermercado Carone', 'Supermercado em Jardim Camburi', -20.2522, -40.2685, 4, 6),
        ('Paddock bar e botequim', 'Bar e botequim na Praia do Canto', -20.2955528, -40.2947166, 1, 6),
        ('Bar abertura', 'Bar na Praia do Canto', -20.294821, -40.2930577, 2, 6),
        ('La Cozina restaurante Self service', 'Restaurante em Jardim Camburi', -20.2600233, -40.2720663, 3, 7),
        ('Restaurante Timoneiro Vitória', 'Restaurante em Jardim da Penha', -20.294821, -40.2930577, 7, 7),
        ('Don Camaleone', 'Restaurante na Praia do Canto', -20.2948208, -40.2996238, 7, 7);

/* Insere dados na tabela ImagemLugar  */
INSERT INTO ImagemLugar (id_imagem, id_lugar)
VALUES (3, 1),
		(3, 2),
        (3, 3),
        (3, 4),
        (3, 5),
        (3, 6),
        (3, 7),
        (3, 8),
        (3, 9),
        (3, 10);

/* Insere dados na tabela Postagem  */
INSERT INTO Postagem (postagem, data, id_lugar, id_pessoa)
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

/* Insere dados na tabela ImagemPostagem  */
INSERT INTO ImagemPostagem (id_imagem, id_postagem)
VALUES (4, 2),
		(5, 3),
        (6, 4),
        (7, 5),
        (8, 6),
        (9, 9),
        (10, 10);

/* Insere dados na tabela Comentarios  */
INSERT INTO Comentarios (texto, id_postagem, id_pessoa)
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

/* Insere dados na tabela Avaliacao  */
INSERT INTO Avaliacao (comentario, nota, id_pessoa, id_lugar)
VALUES ('Gostei de conhecer, lugar bem organizado, atendimento de primeira!!', 5, 4, 5),
		(null, 5, 1, 1),
		('praia muito legal, limpa e com poucas pessoas! adorei!', 5, 3, 3),
        (null, 5, 1, 2),
        (null, 5, 2, 3),
        ('ótimo Shopping, maneiro!!', 5, 5, 1),
        ('Shopping bem organizado!!', 4, 2, 1),
        (null, 5, 3, 4),
        ('Muito bom, com certeza virei mais vezes.', 5, 1, 6),
        (null, 5, 8, 6);