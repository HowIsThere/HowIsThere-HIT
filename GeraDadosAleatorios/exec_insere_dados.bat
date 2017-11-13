echo **************************************************
echo "inicio do processo completo"
echo %time%
set TEMP_INICIO_COMPLETO=%time%

echo **************************************************

echo "inicio do processo insercao TIPO_IMAGEM"
set TEMP_INICIO_TIPO_IMAGEM=%time%
psql -h localhost -d HIT -U postgres -p 5432 -q -W -f script_insertTipoImagem.sql
echo "inicio do processo insercao TIPO_IMAGEM" %TEMP_INICIO_TIPO_IMAGEM%
set TEMP_FIM_TIPO_IMAGEM=%time%
echo "fim do processo de inserção na tabela TIPO_IMAGEM" %TEMP_FIM_TIPO_IMAGEM%

echo **************************************************

echo "inicio do processo insercao IMAGEM"
set TEMP_INICIO_IMAGEM=%time%
psql -h localhost -d HIT -U postgres -p 5432 -q -W -f script_insertImagem.sql
echo "inicio do processo insercao IMAGEM" %TEMP_INICIO_IMAGEM%
set TEMP_FIM_IMAGEM=%time%
echo "fim do processo de inserção na tabela IMAGEM" %TEMP_FIM_IMAGEM%

echo **************************************************

echo "inicio do processo insercao PESSOA"
set TEMP_INICIO_PESSOA=%time%
psql -h localhost -d HIT -U postgres -p 5432 -q -W -f script_insertPessoa.sql
echo "inicio do processo insercao PESSOA" %TEMP_INICIO_PESSOA%
set TEMP_FIM_PESSOA=%time%
echo "fim do processo de inserção na tabela PESSOA" %TEMP_FIM_PESSOA%

echo **************************************************

echo "inicio do processo insercao CATEGORIA"
set TEMP_INICIO_CATEGORIA=%time%
psql -h localhost -d HIT -U postgres -p 5432 -q -W -f script_insertCategoria.sql
echo "inicio do processo insercao CATEGORIA" %TEMP_INICIO_CATEGORIA%
set TEMP_FIM_CATEGORIA=%time%
echo "fim do processo de inserção na tabela CATEGORIA" %TEMP_FIM_CATEGORIA%

echo **************************************************

echo "inicio do processo insercao LUGAR"
set TEMP_INICIO_LUGAR=%time%
psql -h localhost -d HIT -U postgres -p 5432 -q -W -f script_insertLugar.sql
echo "inicio do processo insercao LUGAR" %TEMP_INICIO_LUGAR%
set TEMP_FIM_LUGAR=%time%
echo "fim do processo de inserção na tabela LUGAR" %TEMP_FIM_LUGAR%

echo **************************************************

echo "inicio do processo insercao POSTAGEM"
set TEMP_INICIO_POSTAGEM=%time%
psql -h localhost -d HIT -U postgres -p 5432 -q -W -f script_insertPostagem.sql
echo "inicio do processo insercao POSTAGEM" %TEMP_INICIO_POSTAGEM%
set TEMP_FIM_POSTAGEM=%time%
echo "fim do processo de inserção na tabela POSTAGEM" %TEMP_FIM_POSTAGEM%

echo **************************************************

echo "inicio do processo insercao IMAGEM_POSTAGEM"
set TEMP_INICIO_IMAGEM_POSTAGEM=%time%
psql -h localhost -d HIT -U postgres -p 5432 -q -W -f script_insertImagemPostagem.sql
echo "inicio do processo insercao IMAGEM_POSTAGEM" %TEMP_INICIO_IMAGEM_POSTAGEM%
set TEMP_FIM_IMAGEM_POSTAGEM=%time%
echo "fim do processo de inserção na tabela IMAGEM_POSTAGEM" %TEMP_FIM_IMAGEM_POSTAGEM%

echo **************************************************

RESUMO
echo "inicio geral do processo" %TEMP_INICIO_COMPLETO%

echo "inicio do processo insercao TIPO_IMAGEM" %TEMP_INICIO_TIPO_IMAGEM%
echo "fim do processo de inserção na tabela TIPO_IMAGEM" %TEMP_FIM_TIPO_IMAGEM%
echo "inicio do processo insercao IMAGEM" %TEMP_INICIO_IMAGEM%
echo "fim do processo de inserção na tabela IMAGEM" %TEMP_FIM_IMAGEM%
echo "inicio do processo insercao PESSOA" %TEMP_INICIO_PESSOA%
echo "fim do processo de inserção na tabela PESSOA" %TEMP_FIM_PESSOA%
echo "inicio do processo insercao CATEGORIA" %TEMP_INICIO_CATEGORIA%
echo "fim do processo de inserção na tabela CATEGORIA" %TEMP_FIM_CATEGORIA%
echo "inicio do processo insercao LUGAR" %TEMP_INICIO_LUGAR%
echo "fim do processo de inserção na tabela LUGAR" %TEMP_FIM_LUGAR%
echo "inicio do processo insercao POSTAGEM" %TEMP_INICIO_POSTAGEM%
echo "fim do processo de inserção na tabela POSTAGEM" %TEMP_FIM_POSTAGEM%
echo "inicio do processo insercao IMAGEM_POSTAGEM" %TEMP_INICIO_IMAGEM_POSTAGEM%
echo "fim do processo de inserção na tabela IMAGEM_POSTAGEM" %TEMP_FIM_IMAGEM_POSTAGEM%

echo "final do processo completo %time%
