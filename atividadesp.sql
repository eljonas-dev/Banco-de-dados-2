create procedure sp_InsereMatricula
	@Id_Matricula INT IDENTITY(1,1),
	@Cpf varchar(14),
	@Nome varchar(50),
	@E-mail varchar(100),
	@Genero varchar(1),
	@Id_Curso INT IDENTITY (1,1),
	@Parcelas int,
	@Status int
AS
BEGIN
SET @Nome = upper(@Nome)
SET @E-mail = lower(E-mail)
SET @Genero = upper(@Genero)
SET @Cpf = replace(@Cpf, '.', '') '-', '')'/'; '')
IF NOT @Genero IN ('M', 'F', 'O', 'N')
SET @Genero = 'N'
END