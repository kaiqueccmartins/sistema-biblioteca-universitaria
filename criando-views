-- View: livros disponíveis por filial
CREATE VIEW available_copies_per_branch AS
SELECT
  lb.name        AS branch,
  b.title,
  COUNT(*)       AS available_count
FROM book_copies bc
JOIN books b USING(book_id)
JOIN library_branches lb USING(branch_id)
WHERE bc.status = 'available'
GROUP BY lb.name, b.title;

-- Uso da view:
SELECT * FROM available_copies_per_branch
WHERE available_count >= 2
ORDER BY branch, available_count DESC;

-- Tabela temporária: estatíticas de empréstimo do dia
CREATE TEMP TABLE today_loan_stats AS
SELECT
  COUNT(*)                      AS total_loans,
  COUNT(DISTINCT member_id)     AS distinct_members,
  MIN(loan_date)                AS first_loan,
  MAX(loan_date)                AS last_loan
FROM loans
WHERE loan_date::date = CURRENT_DATE;

-- Uso da temp table
SELECT * FROM today_loan_stats;
