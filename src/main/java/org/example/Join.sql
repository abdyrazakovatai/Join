select c.name, p.title
from companies c
         left join projects p on c.id = p.company_id;

select p.title
from projects p
         right join companies co on p.company_id = co.id;

select d.first_name, c.name
from developers d
         join city c on d.address_id = c.id;

select c.name, d.first_name
from city c
         join developers d on c.id = d.address_id;

select d.first_name, p.title, c.name, co.name
from projects p
         left join companies c on p.company_id = c.id
         join developers d on d.id = p.dev_id
         join city ci on c.address_id = ci.id
         join countries co on ci.country_id = co.id;


-- 7.Компаниялардын аттарын жана алардын жайгашкан шаарларын чыгаруучу суроо жаз.
-- Напишите запрос, который выведет названия компаний и названия городов, в которых они расположены.

select c.name, ci.name
from companies c
         join city ci on c.address_id = ci.id;

-- 8.Разработчиктердин аттарын, алардын долбоорлорун жана ошол долбоорлорду жүргүзгөн компанияларды чыгаруучу суроо жаз.
--  Напишите запрос, который покажет имена разработчиков, их проекты и компании, которые ведут эти проекты.

select d.first_name, p.title, co.name
from developers d
         join projects p on d.id = p.dev_id
         join companies co on p.company_id = co.id;

-- 9.Бардык разработчиктерди жана алардын компанияларын чыгаруучу суроо жаз.
-- Эгерде разработчик долбоорго дайындалбаган болсо дагы, аны көрсөтүү керек.
-- Напишите запрос, который покажет всех разработчиков и их компании.
-- Если разработчик не назначен на проект в компании, все равно вывести его.

select *
from developers d
         right join projects p on d.id = p.dev_id
         join companies c on p.company_id = c.id;

-- 10.Бардык долбоорлорду жана ошол долбоорлордун үстүндө иштеген разработчиктердин аттарын чыгаруучу суроо жаз.
-- Эгерде долбоордо разработчиктер жок болсо дагы, долбоорду көрсөтүү керек.
--  Напишите запрос, который покажет все проекты и разработчиков, которые работают над ними.
-- Если проект не имеет разработчика, все равно вывести его.

select p.title, d.first_name
from projects p
         join developers d on p.dev_id = d.id;

-- 11. Долбоорлорду жана алардын жайгашкан өлкөлөрүн чыгаруучу суроо жаз. Бул суроо шаарлар аркылуу байланыш жүргүзөт.
-- Напишите запрос, который покажет проекты и страны, в которых они находятся, через города.'

select p.title, co.name
from projects p
         join companies c on p.company_id = c.id
         join city ci on c.address_id = ci.id
         join
     countries co on ci.country_id = co.id;


-- 12.
-- Ар бир компания үчүн долбоорлордун санын эсептеген суроону түзүңүз.
-- Суроо компаниянын атын жана жалпы долбоорлордун санын көрсөтүшү керек.
-- Эгерде долбоорлору жок компанияларды дагы камтууну унутпаңыз.
-- ____
-- Создайте запрос, который подсчитывает количество проектов для каждой компании.
-- Запрос должен отображать название компании и общее количество проектов.
-- Убедитесь, что вы включили компании, у которых нет проектов.

select c.name, count(p.id) as project_count
from companies c
         left join projects p on c.id = p.company_id
group by c.name;

-- 13.
-- Иштеп чыгуучулардын аты-жөндөрүн, жашаган шаарларынын аттарын жана тиешелүү өлкөлөрдүн аттарын тандоочу суроону жазыңыз.
-- Шаар тууралуу маалымат жок болсо да, бардык иштеп чыгуучуларды камтыңыз.
-- ----
-- Напишите запрос, чтобы выбрать имя и фамилию разработчиков вместе с названиями городов, в которых они живут,
-- и названиями соответствующих стран. Убедитесь, что вы включили всех разработчиков, даже если информация о городе недоступна.

select d.first_name, d.last_name, c.name
from developers d
         right join city c on d.address_id = c.id
         join countries co on c.country_id = co.id;

-- 14.
-- Долбоорлорду, ошол долбоорлорго дайындалган иштеп чыгуучулардын аттарын жана компанияларын көрсөтүүчү суроону түзүңүз.
-- Эгерде долбоордо иштеп чыгуучулар жок болсо, дагы эле көрсөтүлүшү керек.
-- ------
-- Составьте запрос, который покажет все проекты вместе с именами разработчиков, назначенных на каждый проект,
-- и компаниями, которые управляют этими проектами.
-- Если проект не имеет назначенных разработчиков, он все равно должен быть отображен.

select p.title, d.first_name, c.name
from projects p
         left join developers d on p.dev_id = d.id
         join companies c on p.company_id = c.id;

-- 15.
-- Бардык өлкөлөрдү жана алардын тиешелүү шаарларын,
-- ошол шаарларда жашаган иштеп чыгуучулардын аттарын көрсөтүүчү суроону түзүңүз.
-- Эгер шаарда иштеп чыгуучулар жок болсо да, шаарларды камтыңыз.
------
-- Создайте запрос, чтобы отобразить все страны и их соответствующие города вместе с именами разработчиков,
-- проживающих в этих городах. Включите города, даже если в них нет проживающих разработчиков.

select co.*,c.name,d.first_name from developers d right join city c on d.address_id = c.id join countries co on c.country_id=co.id;