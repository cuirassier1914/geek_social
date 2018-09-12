-- Задача 2. Для структуры из задачи 1 
-- выведите список всех пользователей, 
-- которые поставили лайк пользователям A и B (id задайте произвольно), 
-- но при этом не поставили лайк пользователю C.

-- A, B = [1,3] -> David, Chris, John
-- C = [2] -> John

select users.*

from users

join likes
on likes.from = users.id

where likes.to in (1,3)

and not exists (
	select *
    from likes
    where likes.from = users.id
    and likes.to = 2
)

group by users.id, users.login
