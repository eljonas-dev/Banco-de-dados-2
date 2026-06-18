--TRIGGERS! 17-06-2026
/* 
vIMOS Ddois objetos programáveis

1- Procedures (método void, n devolve nada) ---> existe uma variação q devolve um inteiro, mas e a única situação
2- Funções (é como um método tipado, recebe parâmetros e sempre retorna algo)

Em ambos os casos, eu preciso mandar executar de alguma forma.

A TRIGGER é diferente, porque ela dispara automaticamente
Isso pode ser percebido até poelo seu nome (gatilho)

1- Ela é um objeto associado a uma tabela. Ela sempre tá associada a uma tabela!

2- Ela dispara automaticamente ATRAVÉS DE UM EVENTO --> INSERT, DELETE ou UPDATE
	Eu posso escolher pra qual ele vai funcionar. Um trigger pra insert, outro pra delete e etc.
	Ou seja, pra mesma tabela posso ter 3 Triggers diferentes.

3- A trigger NÃO RECEBE parâmetros
	- Como eu manipulo a informação?
		Ela trabalha com TABELAS TEMPORÁRIAS (sempre)

		ex:
		Tabela Produto [
		id_prod
		nome
		valor]

		Se eu tenho uma trigger que funciona com INSERT, a  partir do momento q eu dou um INSERT, o TRIGGER vai criar a seguinte tabela:

				ex:
		Tabela INSERTED [
		id_prod
		nome
		valor] ---> tem uma cópia dos dados inseridos!

		se fosse com DELETE, ele faria uma cópia doq tá sendo deletado numa tabela DELETED! E assim por diante.
		Podemos usar isso daí pra pra fazer testes na tabela

		a exceção é o UPDATE --> Não existe tabela UPDATED zé

		Quando faço um UPDATE, ele na verdade cria 2 tabelas! Um INSERTED e um DELETED
			-- o valor antigo vai pro DELETED, enquanto o novo valor vai pro INSERTED


Dizemos q são Triggers do tipo AFTER, ocorrem depois da inserção na tabela
temos também as INSTEAD OF (tenhoq  especificar) que acontece ANTES da operação
	ou seja, posso usar isso como FORMA DE TRATAMENTO! 
	Por exemplo, eu posso bloquear um delete antes dele acontecer, associando um trigger que captura o evento antes dele ocorrer
	É quase como usar um try catch

	eu posso desabilitar (DISABLE) ou habilitar (ENABLE) um trigger. É como se eu desse uma pausa temporária pra poder usar alguma funcionalidade
*/

create database aula17;
use aula17
create TABLE auditoria_produto
{
	
}

CREATE trg_mensagem
ON produto
FOR INSERT
AS 
BEGIN
	PRINT 'Produto Inserido com sucesso!'
END