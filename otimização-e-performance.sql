-- Índice para acelerar buscas por data de empréstimo
CREATE INDEX idx_loans_loan_date
ON loans(loan_date);

-- Índice composto para filtrar por status e filial rapidamente
CREATE INDEX idx_copies_status_branch
ON book_copies(status, branch_id);

-- Índice para buscas por gênero e ordenação por título
CREATE INDEX idx_books_genre_title
ON books(genre_id, title);

-- Índice para consultas em members(email) - busca dce login ou notificação
CREATE INDEX idx_members_email
ON members(email);

-- Plano para query de top 5 livros mais emprestados
EXPLAIN ANALYZE
SELECT b.title,
       COUNT(*) AS times_loaned
FROM loans l
JOIN book_copies bc ON l.copy_id = bc.copy_id
JOIN books b ON bc.book_id = b.book_id
GROUP BY b.title
ORDER BY times_loaned DESC
LIMIT 5;


WITH loan_counts AS (
  SELECT bc.book_id, COUNT(*) AS cnt
  FROM loans l
  JOIN book_copies bc ON l.copy_id = bc.copy_id
  GROUP BY bc.book_id
)
SELECT b.title, lc.cnt
FROM loan_counts lc
JOIN books b ON b.book_id = lc.book_id
WHERE lc.cnt > 50
ORDER BY lc.cnt DESC;
