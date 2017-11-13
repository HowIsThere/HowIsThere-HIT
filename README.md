# TRABALHO 01 : HowIsThere-HIT
Trabalho desenvolvido durante a disciplina de BD

    O referido projeto poderá ser:
        a) Um novo sistema/projeto 
        b) Uma expansão de sistema/projeto previamente desenvolvido em disciplinas anteriores 
        (ex: Expansão dos módulos do sistema desenvolvidos em BD1 - incremento mínimo de 50% nos 
        requisitos/complexidade)
    
    OBS Importantes: 
        a) Os projetos/sistemas propostos serão validados pelo professor e pela turma
        b) Se possível é interessante que os novos sistemas estejam correlacionados com alguma área 
        previamente estudada pelo aluno
        c) Caso dependa de alguma instituição/parceiro externo, a base de dados e informações pertinentes 
        a esta devem ser obtidas no prazo de até 15 dias apos aprovação da proposta do trabalho 
        (caso contrário, nova proposta deverá ser apresentada a turma implicando logicamente em um prazo 
        mais curto para realização das atividades e conclusão do trabalho)
    
DICA: 
    O kickstart normalmente lança inovaçôes em termos de Sofwares e Apps, portanto pode ser interessante 
    olhar os lançamentos recentes para incrementar as possibilidades e aguçar a criatividade, o que pode 
    auxiliar o grupo com novas ideias na solução proposta. Acesse os links abaixo do para explorar sobre apps e softwares no Kickstarter.
    <br>
    https://www.kickstarter.com/discover/categories/technology/software
    <br>
    https://www.kickstarter.com/discover/categories/technology/apps
# Sumário

### 1	COMPONENTES<br>
Cassiano Künsch das Neves</br>
Giseli Siqueira

### 2	INTRODUÇÃO E MOTIVAÇAO<br>
Alguma vez na sua vida você já deve ter ido para algum lugar e chegando lá você viu que não era nada daquilo que você tinha imaginado, seja porque você estava esperando que o lugar estivesse cheio ou então vazio, ou até mesmo esperando que o ambiente estivesse melhor, e por conta disso você teve que procurar em cima da hora outro lugar pra ir, ou até mesmo voltar para casa. Pensando nessas situações que teve-se a ideia de cria o "Como ta?", que é um aplicativo que vai te ajudar a descobrir como o lugar vai estar no momento em que você tem interesse em frequentá-lo. 
 		  
O aplicativo reune lugares com base em categorias que podem ser: Praias, shoppings, supermercados, Lojas, Restaurantes, etc., e mostra para o usuário as opções disponíveis mais proximas de onde ele está no momento com base na sua localização, contendo um ranking de avaliação de tal lugar com base em avaliações feitas pelos seus usuários.
  		  
Os lugares são exibidos por ordem de "mais bem avaliado" segundo o ranking de estrelas e na distância atual em relaçao ao usuário. Ao selecionar um lugar é acessado uma timeline com informações referentes ao lugar naquele momento, onde os usuários podem postar fotos do lugar, comentar sobre algo que esteja acontecendo no momento e postar sua opiniao sobre o lugar.

Os lugares são exibidos por ordem de "mais bem avaliado" segundo o ranking de estrelas e ao selecionar um lugar é acessado um bate-papo com informações referentes ao lugar naquele momento, onde os usuários podem postar fotos do lugar, comentar sobre algo que esteja acontecendo no momento e postar sua opiniao sobre o lugar, avaliando se o ambiente está bom ou não. <br>
      
### 3	MINI-MUNDO<br>

Os usuários pode logar usando um perfil ativo em alguma rede social ou criar uma conta no aplicativo.Para o aplicativo é importante identificar cada usuário para controle. De um usuário deseja-se ter o nome completo, endereço, email e uma senha de acesso. Para efetuar login o usuário poderá entrar com seu endereço de email e senha informados no cadastro ou selecionando perfil em uma das redes sociais integradas que são Facebook, Instagram e twitter. 
 
O usuário efetua login e tem acesso as categorias de lugares. Em cada menu de categoria é possível ter acesso a lugares previamente cadastrados ou a opção de cadastro de lugar. Os lugares são exibidos por ordem de avaliação onde os que são mais bem avaliados são listados primeiro. Cada lugar possui um nome, o seu respectivo endereço, uma imagem e a avaliação geral. Ao selecionar um lugar é exibido uma timeline onde é possível ter acesso ao conteúdo que as pessoas que também frequentaram aquele lugar postaram. O conteúdo pode ser mensagem de texto com possíveis comentários de avaliação de como está o lugar ou foto do lugar ou das pessoas que estarão lá no momento. Cada postagem é registrada com o nome do perfil do usuário que a realizou bem como data e hora do momento exato da publicação. Ainda sobre as publicações, cada uma conterá opções para alteração da publicação e exclusão.

### 4	RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>
Rascunhos de interface em formato .PDF navegável disponível em:<br>
![Alt text](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/HowIsThere.pdf)


### 5	MODELO CONCEITUAL<br>
#### 5.1 NOTACAO ENTIDADE RELACIONAMENTO
![Alt text](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Imagens/CONCEITUAL_HIT.png?raw=true "Modelo Conceitual")
    
     5.2 NOTACAO UML (Caso esteja fazendo a disciplina de Projeto)

#### 5.3 DECISÕES DE PROJETO
    [atributo]: [descrição da decisão]
    
    EXEMPLO:
    a) Campo endereço: em nosso projeto optamos por um campo multivalorado e composto, pois a empresa 
    pode possuir para cada departamento mais de uma localização... 
    b) justifique!

#### 5.4 DESCRIÇÃO DOS DADOS 

    [Tabela - Cometario_Postagem]: Armazena todos os comentários feitos pelos usuários
        id_comentario: Atributo identificador da tabela
        texto: Armazena o texto escrito pelo usuário
        id_postagem: Chave secundária
        id_pessoa: Chave secundária

    [Tabela - Postagem] - Armazena todas as postagens feitas pelos usuários
        data: Campo que armazena a data da postagem
        id_postagem: Atributo identificador da tabela
        postagem: Armazena o texto escrito pelo usuário
        id_lugar: Chave secundária
        id_pessoa: Chave secundária

    [Tabela - Imagem] - Armazena todas as imagens do sistema
        id_imagem: Atributo identificador da tabela 
        path: Campo que armazena o caminho da imagem
        descricao: Campo que armazena a descrição da imagem

    [Tabela - Categoria] - Armazena todas as categorias dos lugares
        id_categoria: Atributo identificador da tabela
        descricao: Campo que armazena a descrição da categoria
        nome_categoria: Campo que armazena o nome da categoria
        id_pessoa: Chave secundária

    [Tabela - Lugar] - Armazena todos os lugares do sistema
        long: Campo que armazena a longitude do lugar
        id_lugar: Atributo identificador da tabela
        lat: Campo que armazena a latitudo do lugar
        descricao: Campo que armazena a descricao do lugar
        nome_lugar: Campo que armazena o nome do lugar
        id_pessoa: Chave secundária
        id_categoria: Chave secundária

    [Tabela - Avaliacao] - Armazena todas as avaliações dos usuários
        id_avaliacao: Atributo identificador da tabela
        nota: Campo que armazena a nota dada pelo usuário
        comentario: Campo que armazena o comentário feito pelo usuário
        id_lugar: Chave secundária
        id_pessoa: Chave secundaria

    [Tabela - Pessoa] - Armazena os dados das pessoas que usam o sistema
        cep: Campo que armazena o CEP do usuário
        bairro: Campo que armazena o bairro do usuário
        cidade: Campo que armazena o cidade do usuário
        estado: Campo que armazena o estado do usuário
        rua: Campo que armazena o rua do usuário
        numero: Campo que armazena o numero do usuário
        id_pessoa: Atributo identificador da tabela
        email: Campo que armazena o CEP do usuário
        colaboracao: Campo quantos lugares o usuário ajudou a identificar como verdadeiro
        autenticidade: Campo quantos lugares o usuário identificou como verdade e realmente é verdade
        senha: Campo que armazena a senha do usuário
        login: Campo que armazena o login do usuário
        ativo: Campo que diz se o usuário está ativo ou não
        nome_pessoa: Campo que armazena o nome do usuário
        id_imagem_pessoa: Chave secundária
        
    [Tabela - Tipo_Imagem] - Armazena o tipo da imagem
        id_tipo_imagem: Chave primaria da tabela
        nome_tipo: Campo que armazena o tipo da imagem
    
    [Tabela - Comentario_Avaliacao] - Armazena os comentarios de cada avaliacao
        id_comentario_avaliacao: Chave primaria da tabela
        texto: Campo que armazena o comentario do usuário
        FK_Avaliacao_id_avaliacao: Chave secundária
       

    [Tabela - Imagem_postagem] - Responsável 
        FK_Imagem_id_imagem SERIAL: Chave primaria
        FK_Postagem_id_postagem: Chave secundária
        
### 6	MODELO LÓGICO<br>
![Alt text](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Imagens/LOGICO_HIT.png?raw=true "Modelo Lógico")
### 7	MODELO FÍSICO<br>
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
        login VARCHAR(100) NOT NULL CONSTRAINT proper_email CHECK (email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'),
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
    
### 8	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS<br>
#### 8.1 DETALHAMENTO DAS INFORMAÇÕES
        Detalhamento sobre as informações e processo de obtenção ou geração dos dados.
        Referenciar todas as fontes referentes a:
        
        a) obtenção dos dados 
        Dados para preenchimento de informações de lugares obtidos em <https://www.google.com.br/maps>
        
        b) obtenção de códigos reutilizados
        
        c) fontes de estudo para desenvolvimento do projeto
        Foram utilizados materiais de aula disponibilizados pelo professor.
        
#### 8.2 INCLUSÃO DO SCRIPT PARA CRIAÇÃO DE TABELAS E INSERÇÃO DOS DADOS (ARQUIVO ÚNICO COM):
        a) inclusão das instruções para criação das tabelas e estruturas de amazenamento do BD
        b) inclusão das instruções de inserção dos dados nas referidas tabelas
        c) inclusão das instruções para execução de outros procedimentos necessários
        
   O arquivo com o script para criação de tabelas e inserção dos dados está disponível em:<br>
   ![Alt text](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Postgres-HIT/HIT_BD_v2.sql)

### 9	TABELAS E PRINCIPAIS CONSULTAS<br>
#### 9.1	GERACAO DE DADOS (MÍNIMO DE 10 REGISTROS PARA CADA TABELA NO BANCO DE DADOS)<br>

Disponível em: ![Clique aqui](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Postgres-HIT/HIT_BD_v2.sql)


OBS: Incluir para os tópicos 9.2 e 9.3 as instruções SQL + imagens (print da tela) mostrando os resultados.<br>

#### 9.2	SELECT DAS TABELAS COM PRIMEIROS 10 REGISTROS INSERIDOS <br> 
    Data de Entrega: (Data a ser definida)

    SELECT * FROM imagem LIMIT 10 
![alt tag](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Imagens/Imagens-Select/V2/select%20Imagem.png)<br>

    SELECT * FROM imagem_postagem LIMIT 10
![alt tag](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Imagens/Imagens-Select/V2/select%20Imagem_postagem.png)<br>

    SELECT * FROM avaliacao LIMIT 10 
![alt tag](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Imagens/Imagens-Select/V2/select%20avaliacao.png)<br>

    SELECT * FROM categoria LIMIT 10 
![alt tag](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Imagens/Imagens-Select/V2/select%20categoria.png)<br>

    SELECT * FROM comentario_avaliacao LIMIT 10 
![alt tag](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Imagens/Imagens-Select/V2/select%20comentario_avaliacao.png)<br>

    SELECT * FROM comentario_postagem LIMIT 10 
![alt tag](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Imagens/Imagens-Select/V2/select%20comentario_postagem.png)<br>

    SELECT * FROM lugar LIMIT 10 
![alt tag](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Imagens/Imagens-Select/V2/select%20lugar.png)<br>

    SELECT * FROM pessoa LIMIT 10 
![alt tag](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Imagens/Imagens-Select/V2/select%20pessoa.png)<br>

    SELECT * FROM postagem LIMIT 10 
![alt tag](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Imagens/Imagens-Select/V2/select%20postagem.png)<br>

    SELECT * FROM tipo_imagem LIMIT 10 
![alt tag](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Imagens/Imagens-Select/V2/select%20tipo_imagem.png)<br>
  
<br>

#### 9.3	SELECT DAS VISÕES COM PRIMEIROS 10 REGISTROS DA VIEW <br>
        a) Descrição da view sobre que grupos de usuários (operacional/estratégico) <br>
        e necessidade ela contempla.
        b) Descrição das permissões de acesso e usuários correlacionados (após definição <br>
        destas características)
        
   * view_categorias : A view contempla o acesso a atributos das tabelas categoria, imagemCategoria e imagem que são exibidos ao acessar as categorias do aplicativo, onde são exibidos o nome, a descrição e o path da imagem referente as categorias.<br>
        Criação:  
        
                    CREATE VIEW view_categorias AS
                    SELECT nome_categoria, categoria.descricao, path
                    FROM categoria
                    INNER JOIN imagemcategoria
                    ON (categoria.id_categoria = imagemcategoria.id_categoria)
                    INNER JOIN imagem
                    ON (imagem.id_imagem = imagemcategoria.id_imagem);
        
        Select: 
        
                    SELECT * FROM view_categorias LIMIT 10;
                    
![alt tag](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Imagens/Imagens-Views/view_categorias.png)<br>

   * view_lugares : A view contempla o acesso a atributos das tabelas lugar, imagemLugar, imagem e avaliacao que são exibidos ao acessar os lugares de determinada categoria do aplicativo, onde são apresentados o nome do lugar, avaliação geral quando possuir (obtida da média das avaliações individuais), imagem do lugar e a localização (latitude e longitude do lugar).<br>
        Criação:    
        
                    CREATE VIEW view_lugares AS
                    SELECT nome_lugar, path, lat, long, AVG(nota) AS Nota
                    FROM lugar
                    INNER JOIN imagemlugar
                    ON (lugar.id_lugar = imagemlugar.id_lugar)
                    INNER JOIN imagem
                    ON (imagem.id_imagem = imagemlugar.id_imagem)
                    LEFT OUTER JOIN avaliacao
                    on (avaliacao.id_lugar = lugar.id_lugar)
                    WHERE lugar.id_categoria IN (
                                                    SELECT id_categoria AS ID_Categoria
                                                    FROM categoria
                                                    WHERE id_categoria = 6
                                                    )
                    GROUP BY nome_lugar, path, lat, long;
                    
        Select: 
        
                    SELECT * FROM view_lugares LIMIT 10;
                    
![alt tag](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Imagens/Imagens-Views/view_lugares.png)<br>

   * view_avaliacao_lugar : A view contempla o acesso a atributos das tabelas pessoa, imagemPessoa, imagem e avaliacao que são exibidos ao acessar um lugar e ser mostrada sua página de avaliações, onde são exibidos os comentários individuais, sendo compostos de nome da pessoa, imagem da pessoa, nota atribuída ao lugar pela pessoa e o comentário.<br>
        Criação:    
        
                    CREATE VIEW view_avaliacao_lugar AS
                    SELECT nome_pessoa, path, nota, comentario
                    FROM pessoa
                    INNER JOIN imagempessoa
                    ON (pessoa.id_imagem_pessoa = imagempessoa.id_imagem_pessoa)
                    INNER JOIN imagem
                    ON (imagem.id_imagem = imagempessoa.id_imagem)
                    INNER JOIN avaliacao
                    ON (avaliacao.id_pessoa = pessoa.id_pessoa)
                    WHERE avaliacao.id_lugar IN(
                                                    select id_lugar as ID_Lugar
                                                    from lugar
                                                    where id_lugar = 1
                                                    );
                                                    
        Select: 
        
                    SELECT * FROM view_avaliacao_lugar LIMIT 10;
                    
 ![alt tag](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Imagens/Imagens-Views/view_avaliacoes_lugar.png)<br>
 
    * view_timeline_lugar : A view contempla o acesso a atributos das tabelas pessoa, imagemPessoa, imagem, postagem e imagemPostagem que são exibidos ao acessar a timeline de um lugar, onde são exibidos informações de nome da pessoa, imagem da pessoa, postagem (texto e imagem quando houver) e data da postagem.<br>
        Criação:    
        
                    CREATE VIEW view_timeline_lugar AS
                    SELECT nome_pessoa, path, postagem, id_imagem_postagem, data
                    FROM postagem
                    INNER JOIN pessoa
                    ON (postagem.id_pessoa = pessoa.id_pessoa)
                    INNER JOIN imagempessoa
                    ON (pessoa.id_imagem_pessoa = imagempessoa.id_imagem_pessoa)
                    INNER JOIN imagem
                    ON (imagem.id_imagem = imagempessoa.id_imagem)
                    LEFT OUTER JOIN imagempostagem
                    ON (imagempostagem.id_postagem = postagem.id_postagem)
                    WHERE postagem.id_lugar IN(
                                                    SELECT id_lugar AS ID_Lugar
                                                    FROM lugar
                                                    WHERE id_lugar = 8
                                                    );
                                                    
        Select: 
        
                    SELECT * FROM view_timeline_lugar LIMIT 10;
                    
![alt tag](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Imagens/Imagens-Views/view_timeline_lugar.png)

        b) Descrição das permissões de acesso e usuários correlacionados (após definição <br>
           destas características)
           Data de Entrega: (Data a ser definida)

<br>

#### 9.4	LISTA DE CODIGOS DAS FUNÇÕES, ASSERÇOES E TRIGGERS<br>
        Detalhamento sobre funcionalidade de cada código.
        a) Objetivo
        b) Código do objeto (função/trigger/asserção)
        c) exemplo de dados para aplicação
        d) resultados em forma de tabela/imagem
        
   * TRIGGER NA TABELA PESSOA : A trigger tem como função evitar que seja criada várias contas com o mesmo e-mail.<br>
        Criação:    
        
                CREATE OR REPLACE FUNCTION insert_existing_pessoa() RETURNS trigger AS $$
                    BEGIN
                        PERFORM 1 FROM pessoa WHERE email = NEW.email;
                        IF NOT FOUND THEN
                            RETURN NEW;
                        ELSE
                            RAISE EXCEPTION 'Já existe uma pessoa com esse e-mail registrada!';
                        END IF;
                    END $$ LANGUAGE plpgsql;

                CREATE TRIGGER a_insert_existing_pessoa BEFORE INSERT ON pessoa
                FOR EACH ROW EXECUTE PROCEDURE insert_existing_pessoa();
                    
![alt tag](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Imagens/Imagens%20-%20Triggers/triggerPessoa.png)

   * TRIGGER NA TABELA LUGAR : A trigger tem como função evitar que seja criado vários lugares com o mesmo nome.<br>
        Criação:  
        
            CREATE OR REPLACE FUNCTION insert_existing_lugar() RETURNS trigger AS $$
                BEGIN
                    PERFORM 1 FROM lugar WHERE nome_lugar = NEW.nome_lugar;
                    IF NOT FOUND THEN
                        RETURN NEW;
                    ELSE
                        RAISE EXCEPTION 'Já existe um lugar com esse nome registrado!';
                    END IF;
                END $$ LANGUAGE plpgsql;


            CREATE TRIGGER a_insert_existing_lugar BEFORE INSERT ON lugar
            FOR EACH ROW EXECUTE PROCEDURE insert_existing_lugar();

 ![alt tag](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Imagens/Imagens%20-%20Triggers/triggerLugar.png)       

   * TRIGGER NA TABELA CATEGORIA : A trigger tem como função evitar que seja criado várias categorias com o mesmo nome.<br>
        Criação:
        
            CREATE OR REPLACE FUNCTION insert_existing_categoria() RETURNS trigger AS $$
                BEGIN
                    PERFORM 1 FROM categoria WHERE nome_categoria = NEW.nome_categoria;
                    IF NOT FOUND THEN
                        RETURN NEW;
                    ELSE
                        RAISE EXCEPTION 'Já existe uma categoria com esse nome registrado!';
                    END IF;
                END $$ LANGUAGE plpgsql;


            CREATE TRIGGER a_insert_existing_categoria BEFORE INSERT ON categoria
            FOR EACH ROW EXECUTE PROCEDURE insert_existing_categoria();
![alt tag](https://github.com/HowIsThere/HowIsThere-HIT/blob/master/Imagens/Imagens%20-%20Triggers/triggerCategoria.png)

<br>

#### 9.5	Administração do banco de dados<br>
        Descrição detalhada sobre como serão executadas no banco de dados as <br>
        seguintes atividades.
        a) Segurança e autorização de acesso:
        b) Estimativas de aquisição de recursos para armazenamento e processamento da informação
        c) Planejamento de rotinas de manutenção e monitoramento do banco
        d) Plano com frequencia de análises visando otimização de performance
<br>

#### 9.6	GERACAO DE DADOS (MÍNIMO DE 1,5 MILHÃO DE REGISTROS PARA PRINCIPAL RELAÇAO)
        a) principal tabela do sistema deve ter no mínimo 1,5 milhão de registros
        b) tabelas diretamente relacionadas a tabela principal 100 mil registros
        c) tabelas auxiliares de relacao multivalorada mínimo de 10 registros
        d) registrar o tempo de inserção em cada uma das tabelas do banco de dados
        e) especificar a quantidade de registros inseridos em cada tabela
        Para melhor compreensão verifiquem o exemplo na base de testes:<br>
        https://github.com/discipbd2/base-de-testes-locadora

Para ver ![Clique aqui](https://github.com/HowIsThere/HowIsThere-HIT/tree/master/GeraDadosAleatorios)

<br>

#### 9.7    Backup do Banco de Dados<br>
        Detalhamento do backup.
        a) Tempo
        b) Tamanho
        c) Teste de restauração (backup)
        d) Tempo para restauração
        e) Teste de restauração (script sql)
        f) Tempo para restauração (script sql)
<br>

Data de Entrega: (Data a ser definida)
<br>

#### 9.8	APLICAÇAO DE ÍNDICES E TESTES DE PERFORMANCE<br>
    a) Lista de índices, tipos de índices com explicação de porque foram implementados
    b) Performance esperada VS Resultados obtidos
    c) Tabela de resultados comparando velocidades antes e depois da aplicação dos índices.
<br>
    Data de Entrega: (Data a ser definida)
<br>   

#### 9.9	ANÁLISE DOS DADOS COM ORANGE<br>    
        a) captura das informaçõs
        b) integração com banco de dados em desenvolvimento
        c) aplicação de algoritmos e interpretação dos resultados
        c) atualização da documentação do trabalho incluindo a mineração de dados
<br>
    Data de Entrega: (Data a ser definida)
<br>

### 10	ATUALIZAÇÃO DA DOCUMENTAÇÃO/ SLIDES E ENTREGA FINAL<br>
<br>
    Data de Entrega: (Data a ser definida)
<br>

### 11	DIFICULDADES ENCONTRADAS PELO GRUPO<br>  

       
### 12  FORMATACAO NO GIT: https://help.github.com/articles/basic-writing-and-formatting-syntax/
<comentario no git>
    
##### About Formatting
    https://help.github.com/articles/about-writing-and-formatting-on-github/
    
##### Basic Formatting in Git
    
    https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests
    
    
##### Working with advanced formatting
    https://help.github.com/articles/working-with-advanced-formatting/
#### Mastering Markdown
    https://guides.github.com/features/mastering-markdown/

### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
1. Caso existam arquivos com conteúdos sigilosos, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário deste GIT, para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.


Link para BrModelo:<br>
http://sis4.com/brModelo/brModelo/download.html
<br>


Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")



