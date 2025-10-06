INSERT INTO authors (first_name, last_name, birth_date)
SELECT
    'AuthorFirst' || i,
    'AuthorLast' || i,
    DATE '1950-01-01' + (floor(random() * 20000)::int || ' days')::interval
FROM generate_series(1,50) AS s(i);

INSERT INTO publishers (name, address)
SELECT
    'Publisher ' || i,
    (i || ' Publisher St, City ' || i)
FROM generate_series(1,20) AS s(i);

INSERT INTO genres (name)
VALUES
    ('Fiction'),
    ('Non-Fiction'),
    ('Sci-Fi'),
    ('Fantasy'),
    ('Mystery'),
    ('Romance'),
    ('Biography'),
    ('History'),
    ('Science'),
    ('Art');

INSERT INTO books (title, author_id, publisher_id, genre_id, pub_year, isbn)
SELECT
    'Book Title ' || i,
    (floor(random() * 50) + 1)::int,
    (floor(random() * 20) + 1)::int,
    (floor(random() * 10) + 1)::int,
    (floor(random() * (2025-1950)) + 1950)::int,
    lpad((floor(random() * 1e13))::bigint::text, 13, '0')
FROM generate_series(1,300) AS s(i);

INSERT INTO library_branches (name, address)
VALUES
    ('Central Library', '123 Main St'),
    ('East Branch', '456 East Ave'),
    ('West Branch', '789 West Blvd');

INSERT INTO book_copies (book_id, branch_id, status)
SELECT
    (floor(random() * 300) + 1)::int,
    (floor(random() * 3) + 1)::int,
    (ARRAY['available','loaned','reserved','lost'])[ceil(random() * 4)]
FROM generate_series(1,1000) AS s(i);

INSERT INTO members (full_name, email, phone, membership_start, membership_end)
SELECT
    'Member ' || i,
    'member' || i || '@uni.edu',
    '555-01' || lpad(i::text, 3, '0'),
    current_date - ((floor(random() * 365))::int || ' days')::interval,
    current_date + ((365 - floor(random() * 30))::int || ' days')::interval
FROM generate_series(1,200) AS s(i);

INSERT INTO loans (copy_id, member_id, loan_date, due_date, return_date)
SELECT
    (floor(random() * 1000) + 1)::int,
    (floor(random() * 200) + 1)::int,
    now() - ((floor(random() * 365))::int || ' days')::interval AS loan_date,
    (now() - ((floor(random() * 365))::int || ' days')::interval) + INTERVAL '14 days' AS due_date,
    CASE
        WHEN random() < 0.8 THEN
            (now() - ((floor(random() * 365))::int || ' days')::interval)
            + ((-5 + floor(random() * 15))::int || ' days')::interval
        ELSE
            NULL
    END
FROM generate_series(1,1200) AS s(i);

INSERT INTO reservations (copy_id, member_id, reservation_date, status)
SELECT
    (floor(random() * 1000) + 1)::int,
    (floor(random() * 200) + 1)::int,
    now() - ((floor(random() * 365))::int || ' days')::interval,
    (ARRAY['active','fulfilled','cancelled'])[ceil(random() * 3)]
FROM generate_series(1,400) AS s(i);

INSERT INTO librarians (full_name, email, branch_id)
SELECT
    'Librarian ' || i,
    'librarian' || i || '@uni.edu',
    (floor(random() * 3) + 1)::int
FROM generate_series(1,10) AS s(i);
