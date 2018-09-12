-- Задача 1. У вас есть социальная сеть, где пользователи (id, имя) могут ставить друг другу лайки.
-- Создайте необходимые таблицы для хранения данной информации. Создайте запрос, который
-- выведет информацию:
-- 	id пользователя;
-- 	имя;
-- 	лайков получено;
-- 	лайков поставлено;
-- 	взаимные лайки.

-- [1, John] : получил=2, оставил=2, взаимных=2
-- [2, Chris]: получил=1, оставил=3, взаимных=1
-- [3, David]: получил=2, оставил=1, взаимных=1
-- [4, Artur]: получил=1, оставил=0, взаимных=0

select

u1.id,
u1.login as `Пользователь`, 
count(distinct likes1.id) as `Получено лайков`,
count(distinct likes2.id) as `Оставлено лайков`,
sum(likes1.from = likes2.to) as `Взаимных лайков`

from users as u1

left join likes as likes1
on u1.id = likes1.to

left join users as u2
on u2.id = likes1.from

left join likes as likes2
on u1.id = likes2.from

group by u1.id, u1.login