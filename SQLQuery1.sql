--STORED PROCEDURES (Procedimentos armazenados
/*
Ele é um conjunto de código armazenado com um nome do banco de dados e é compilado pelo próprio banco de dados.
Posso juntar comandos do banco de dadoscom métodos de programação.

Na primeira vez que a procedure é executada, ele compila e verifica a maneira mais rápida de executar aquele comando.
Ou seja, nas próximas vezes em que ele compilar aquele comando, ele não precisa mais decididr que caminho ele vai tomar, ou seja, ele vai ficar mais rápido depois.

Uma STORED normalmente oferece um ganho de performance em relação a comandos comuns. 
Por exemplo, um INSERT feito por uma STORED vai ser mais rápido do que se eu executasse um INSERT manualmente.

A procedure é como se fosse um método void, enquanto a função no sql é como se fosse um método tipado (não void), basicamente:

procedure -> não devolve nada
função -> sempre devolve algo

benefícios:
* O SQL compila uma vez e depois só executa (cria um plano de execução na primeira vez, depois ele começa a ganhar tempo)
*Reduz o tráfego cliente-servidor (exemplo, simplifica o tráfego de informações pela rede, ou seja, se eu quiser fazer algo em outra linguagem fica bem mais fácil de passar os comandos)
*Reuso eficiente do código: qualquer linguagem tem acesso a ele. Posso reaproveitar essa procedure em java, por exemplo.
*Aumenta a segurança (posso tirar acesso dos usuários e permitir apenas o usuário executar procedure. Basicamente, ele só vai poder fazer consultas
através das procedures disponíveis);

Declaração de variáveis (T-SQL)
declare @nomedavar tipo
(apalavra declare é reservada)

ex:
declare @cd_client int

se quiser passar parametros nao precisa deo declare:
@Nome varchar(50)

atribuição de dados com SET

set @id_func = 15
set @nome = 'José da Silva'
select @soma=sum(vl_venda) from
	vendas where id_func = @id_func


if no SQL:

IF expresão booleana
	declaração sql
	[ ELSE
		declaração sql] ---> se tiver mais de uma expressão temos que usar begin e end


IF expressão booleana
	Begin
		comando 1
		comando 2
		comando 3
	End
ELSE
	Begin
		Comando1
		Comando2
		Comandon
	End
(É como se fosse a chavinha)

WHILE no sql:

WHILE expressão booleana
	comando SQL / bloco de comandos SQL
[ BREAK ]
	comando SQL / bloco de comandos SQL
[ CONTINUE ]

Criação de STORED PROCEDURES

CREATE PROCEDURE stp.ExcluiAluno @prontuario char(8) --> parâmetro (posso ter vários listados)
AS 
	BEGIN
		Mucho texto
	END

Pra executar uma procedure usamos EXEC e o nome da procedure (com seus parâmetrooos)

Pra ver INFORMAÇÕES (código fonte) de uma procedure usamos 

sp_helptext

sp_help


Alterar ou excluir uma procedure

Deixa guardado procedimentos de código.
*/

create database aula2005
go 
use aula2005
go
create table alunos
(matricula int identity primary key,
nome varchar(50) not null,
email varchar(100) not null,
genero char(1) not null,
dt_matricula date
)
go