-- Procedure para criar empréstimo completo (insere loan + atualiza cópia)
CREATE PROCEDURE sp_create_loan(
    p_copy_id   INT,
    p_member_id INT,
    p_days      INT
)
LANGUAGE plpgsql
AS $$
BEGIN
  -- inicia transação implícita
    INSERT INTO loans(copy_id, member_id, loan_date, due_date)
    VALUES (p_copy_id, p_member_id, NOW(), NOW() + (p_days || ' days')::interval);

    UPDATE book_copies
    SET status = 'loaned'
    WHERE copy_id = p_copy_id;
END;
$$;

-- Chamada
CALL sp_create_loan(90, 46, 14);

DO $$
  -- Exemplo de transação manual com SAVEPOINT e ROLLBACK parcial
  BEGIN
  -- Insere um empréstimo
    INSERT INTO loans(copy_id, member_id, loan_date, due_date)
    VALUES (198, 11, NOW(), NOW() + INTERVAL '14 days');
    SAVEPOINT sp_after_loan;
-- Tenta atualizar a cópia
    UPDATE book_copies
    SET status = 'loaned'
    WHERE copy_id = 198;
-- Simula erro
-- RAISE EXCEPTION 'Erro simulado'

  COMMIT;
-- Se algo falhar entre BEGIN e COMMIT todo o bloco é desfeito (atomicidade)
END;
$$;
