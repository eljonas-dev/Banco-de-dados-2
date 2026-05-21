create procedure sp_InsereAluno
	@nome varchar(50),
	@email varchar(100),
	@genero char(1)
as 
	begin
	--trato os dados
	set @nome = upper(@nome)
	set @email = lower(@email)
	set @genero = upper(@genero)
	if not @genero in ('M', 'F', 'O', 'N')
		set @genero = 'N'
	--dados tratados agora só fazer o insert;)
	insert into alunos (nome, email, genero, dt_matricula)
	values(@nome, @email, @genero, getdate())
	end

	sp_InsereAluno 'Jose da Silva', 'JOSE@IFSP.EDU.BR', 'k'

	SELECT * FROM alunos

CREATE PROCEDURE sp_excluialuno @matricula int
as
begin
	delete from alunos where matricula =@matricula
end

sp_excluialuno 1

create procedure sp_consultaaluno @matricula int = null
as
	begin
	if @matricula is null
		select * from alunos
	else
		select * from alunos where matricula = @matricula
	end


