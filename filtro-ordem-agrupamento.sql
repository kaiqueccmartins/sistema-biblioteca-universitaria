-- Top 5 livros mais emprestados
SELECT b.title,
       COUNT(*) AS times_loaned
FROM loans l
JOIN book_copies bc USING(copy_id)
JOIN books b        USING(book_id)
GROUP BY b.title
ORDER BY times_loaned DESC
LIMIT 5;

-- Número de reservas por membro, em ordem decrescente
SELECT m.full_name,
       COUNT(r.*) AS reservations_count
FROM members m
LEFT JOIN reservations r USING(member_id)
GROUP BY m.full_name
ORDER BY reservations_count DESC;

-- Filiais com mais cópias disponíveis
SELECT lb.name,
       COUNT(*) AS available_copies
FROM book_copies bc
JOIN library_branches lb USING(branch_id)
WHERE bc.status = 'available'
GROUP BY lb.name
ORDER BY available_copies DESC;
