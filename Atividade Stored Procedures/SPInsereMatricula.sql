/*
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
O QUE SOBROU PARA FAZER??
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

------Restante do exercício 1:
b. Cpf – informado pelo usuário - Os dados para a inserção podem vir de
vários sistemas que usam interfaces e máscaras diferentes, ou seja,
podem vir Cpfs com caracteres diferentes de números (tracinho, ponto,
hífen). Garantir que na tabela seja somente inserido números.
l. Parcela – número sequencial de parcela correspondente ao curso que está
se matriculando (ex. curso com 3 parcelas, inserir parcela 1, parcela 2 e
parcela 3).
m. Dt_vencimento – data de vencimento da parcela correspondente
n. Valor – valor da parcela a ser paga
o. Dt_pagto – na inserção das mensalidades deixar null, pois são parcelas a
vencer
p. Status – inserir o valor 1 – que indicará que a parcela está ativa.

--------Exercício 3 (o 2 já foi resolvido)

*/

create procedure sp_InsereMatricula
	@Cpf varchar(14),
	@Nome varchar(50),
	@Email varchar(100),
	@Genero varchar(1),
	@Id_Curso INT,
	@Parcelas int,
AS
--ATENÇÃO: Alguns parêmetros foram tratados direto pelo INSERT!
	BEGIN
	--Incremento da matrícula
	DECLARE @NovoId INT
	SELECT @NovoId = ISNULL(MAX(Id_Matricula), 0) + 1 FROM Matricula

	--Tratamento do NOME
	SET @Nome = trim(upper(@Nome))

	--Tratamento do EMAIL
	SET @Email = lower(Email)
	
	--Tratamento do CPF
	SET @Cpf = replace(@Cpf, '.', ''), '-', ''), '/'; '')

	--Tratamento do GENERO
	SET @Genero = upper(@Genero)
	IF NOT @Genero IN ('M', 'F', 'O', 'N')
	BEGIN
		SET @Genero = 'N'
	END

	--Tratamento das PARCELAS
	IF @Parcelas <= 0
	BEGIN
		SET @Parcelas = 1
	END
	IF @Parcelas > (SELECT max_parcelas FROM cursos WHERE id_curso = @Id_Curso)
	BEGIN
		@Parcelas = (SELECT max_parcelas FROM cursos WHERE id_curso = @Id_Curso)
	END

	--INSERÇÃO NA TABELA"
	INSERT INTO Matricula(id_matricula, cpf, nome, genero, email, id_curso, dt_matricula, parcelas, status)
	VALUES (@NovoId, @Cpf, @Nome, @Genero, @email, @id_curso, GETDATE(), @Parcelas, 1)

END