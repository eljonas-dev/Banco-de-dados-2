create procedure sp_CancelaMatricula  --O CANCELAMENTO É SÓ PRA ALTERAR O STATUS PRA 0, NÃO VAMOS EXCLUIR NADA!!!!
@Id_Matricula  int,
@Dt_Cancelamento date

AS
	BEGIN
		UPDATE Matricula
			SET status = 0
			WHERE id_matricula = @Id_Matricula

		UPDATE mensalidades
			SET status = 0
			WHERE id_matricula = @Id_Matricula
				AND dt_vencimento > @Dt_Cancelamento
	END