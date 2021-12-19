-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3307
-- Время создания: Дек 16 2021 г., 17:46
-- Версия сервера: 5.7.24
-- Версия PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shelterbd1`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Orders` ()  NO SQL
SELECT order_set.IdOrder, pet.Name, client.Lastname
FROM order_set join pet on order_set.IdPet = pet.Id
JOIN client on order_set.IdClient = client.IdClient$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Pet_Shelter` ()  NO SQL
SELECT pet.Name, pet.Gender, shelter.NameShelter FROM pet JOIN shelter on pet.IdShelter = shelter.IdShelter$$

--
-- Функции
--
CREATE DEFINER=`root`@`localhost` FUNCTION `fun1` (`p` VARCHAR(50)) RETURNS VARCHAR(50) CHARSET utf8 RETURN (SELECT COUNT(*) FROM pet INNER join shelter on pet.IdShelter=shelter.IdShelter WHERE shelter.NameShelter=p)$$

CREATE DEFINER=`root`@`localhost` FUNCTION `fun2` (`c` VARCHAR(20)) RETURNS VARCHAR(20) CHARSET utf8 RETURN (SELECT COUNT(*) from pet WHERE pet.Gender=c)$$

CREATE DEFINER=`root`@`localhost` FUNCTION `Pet_Show` (`n` VARCHAR(20)) RETURNS VARCHAR(20) CHARSET utf8 RETURN (SELECT * from pet WHERE Name=n)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `IdClient` int(11) NOT NULL,
  `Lastname` varchar(50) NOT NULL,
  `Firstname` varchar(20) NOT NULL,
  `Middlename` varchar(50) NOT NULL,
  `Phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`IdClient`, `Lastname`, `Firstname`, `Middlename`, `Phone`) VALUES
(1, 'Сергеев ', 'Николай', 'Аристархович', '88005026369'),
(2, 'Михайлов', 'Михаил', 'Александрович', '85050483695'),
(3, 'Киркорова', 'Оксана', 'Генадьевна', '88586924239'),
(4, 'Пушкина', 'Екатерина', 'Михайловна', '89515365254'),
(5, 'Есинина', 'Любовь', 'Генадьевна', '89516238457'),
(6, 'Пушкин', 'Артем', 'Алексеевич', '89536248651'),
(7, 'Лимонов', 'Михаил', 'Александрович', '89549623512'),
(8, 'Бабиков', 'Дмитрий', 'Дмитриевич', '89516234523'),
(9, 'Артемов', 'Алексей', 'Михайлович', '84516235465'),
(10, 'Иванов', 'Сергей', 'Иванович', '89516248596'),
(11, 'Вершинина', 'Наталья', 'Владимировна', '89519545689'),
(12, 'Пикначева', 'Светлана', 'Петровна', '89549519565'),
(13, 'Будько', 'Степан', 'Петрович', '89528526532'),
(14, 'Николаева', 'Ольга', 'Петровна', '89536214510'),
(15, 'Коволева', 'Евгения', 'Михайловна', '89532148050'),
(16, 'Каштанова', 'Виктория', 'Александровна', '85962321660'),
(17, 'Медведева', 'Евгения', 'Эдуардовна', '89536215050'),
(18, 'Загитова', 'Алина', 'Степановна', '89578426325'),
(19, 'Тарасова', 'Екатерина', 'Михайловна', '89516235020'),
(20, 'Сергеева', 'Ангелина', 'Степановна', '89518742350'),
(21, 'Лазарева', 'Ольга', 'Викторовна', '89635217410'),
(22, 'Козакова', 'Ангелина', 'Владимировна', '89518475630'),
(23, 'Карпович', 'Мирослава', 'Михайловна', '85695236100'),
(24, 'Лазарев', 'Сергей', 'Владимирович', '88945612307'),
(25, 'Песков', 'Алексей', 'Генадьевич', '89547621013'),
(26, 'Козлов', 'Георгий', 'Алексеевич', '85628469630'),
(27, 'Чепайкин', 'Глеб', 'Денисович', '84501236952'),
(28, 'Радужкина', 'Алефтина', 'Артемьевна', '89536284102'),
(29, 'Растова', 'Наталья', 'Михайловна', '85396245120'),
(30, 'Балконский', 'Иван', 'Сергеевич', '87456231010'),
(31, 'Мирный', 'Генадий', 'Денисович', '89526318450'),
(32, 'Онегин', 'Денис', 'Михайлович', '85623542197'),
(33, 'Катина', 'Лена', 'Сергеевна', '89548526231'),
(34, 'Родрыгез', 'Тимур', 'Маркович', '89576423120'),
(35, 'Тодоренко', 'Регина', 'Петровна', '89576432020'),
(36, 'Топалов', 'Владислав', 'Николаевич', '89574106230'),
(37, 'Лазарев', 'Сергей', 'Николаевич', '89579461320'),
(38, 'Кузнецова', 'Наталья', 'Петровна', '89574123205'),
(39, 'Широков', 'Данил', 'Александрович', '88957621306'),
(40, 'Лихачев', 'Максим', 'Сергеевич', '88957632120'),
(41, 'Федорова', 'Алина', 'Алексеевна', '89574102365'),
(42, 'Лимонова', 'Ольга ', 'Матвеевна', '89574102140'),
(43, 'Слобожанинова', 'Карина', 'Анатольевна', '89576302514'),
(44, 'Власова', 'Карина', 'Александровна', '89576543210'),
(45, 'Кораблев', 'Михаил', 'Юрьевич', '89563210412'),
(46, 'Пасютина', 'Анастасия', 'Елизаровна', '89563214014'),
(47, 'Марковщенкова', 'Ирина', 'Михайловна', '89576423101'),
(48, 'Курилов', 'Роман', 'Романович', '89576423220'),
(49, 'Романова', 'Екатерина ', 'Петровна', '89576423102'),
(50, 'Романов', 'Сергей', 'Сергеевич', '89576321025');

-- --------------------------------------------------------

--
-- Структура таблицы `order_set`
--

CREATE TABLE `order_set` (
  `IdOrder` int(11) NOT NULL,
  `IdPet` int(11) NOT NULL,
  `IdClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_set`
--

INSERT INTO `order_set` (`IdOrder`, `IdPet`, `IdClient`) VALUES
(1, 4, 48),
(2, 9, 34),
(4, 6, 38);

-- --------------------------------------------------------

--
-- Структура таблицы `pet`
--

CREATE TABLE `pet` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `History` text,
  `Foto` text NOT NULL,
  `ViewPet` varchar(10) NOT NULL,
  `IdShelter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pet`
--

INSERT INTO `pet` (`Id`, `Name`, `Gender`, `Age`, `History`, `Foto`, `ViewPet`, `IdShelter`) VALUES
(1, 'Фандор', 'Мужской', 10, NULL, 'фото', 'Собака', 1),
(2, 'Джек', 'Мужской', 6, NULL, 'фото', 'Собака', 1),
(3, 'Маркиза', 'Женский', 7, NULL, 'фото', 'Кот', 1),
(4, 'Кеша', 'Мужской', 5, NULL, 'фото', 'Кот', 1),
(5, 'Граф', 'Мужской', 9, NULL, 'фото', 'Собака', 1),
(6, 'Фиона', 'Женский', 4, NULL, 'фото', 'Собака', 1),
(8, 'Мурка', 'Женский', 4, NULL, 'фото', 'Кот', 1),
(9, 'Том', 'Мужской', 7, NULL, 'фото', 'Кот', 1),
(10, 'Найда', 'Женский', 5, NULL, 'фото', 'Собака', 1),
(11, 'Шарик', 'Мужской', 8, NULL, 'фото', 'Собака', 1),
(12, 'Ариша', 'Женский', 5, NULL, 'фото', 'Собака', 1);

--
-- Триггеры `pet`
--
DELIMITER $$
CREATE TRIGGER `TR_ADD` BEFORE INSERT ON `pet` FOR EACH ROW SET New.Age=New.Age+1
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TR_Delete` BEFORE DELETE ON `pet` FOR EACH ROW DELETE from order_set where order_set.IdPet=old.Id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TR_Update` BEFORE UPDATE ON `pet` FOR EACH ROW set New.Age=New.Age+1
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `pets`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `pets` (
`Name` varchar(50)
,`NameShelter` varchar(100)
);

-- --------------------------------------------------------

--
-- Структура таблицы `shelter`
--

CREATE TABLE `shelter` (
  `IdShelter` int(11) NOT NULL,
  `NameShelter` varchar(100) NOT NULL,
  `S_History` text NOT NULL,
  `Phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shelter`
--

INSERT INTO `shelter` (`IdShelter`, `NameShelter`, `S_History`, `Phone`) VALUES
(1, 'Дари Добро', 'Приют для бездомных животных в Сошенях.', '89005659513');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zoo`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zoo` (
`Name` varchar(50)
,`ViewPet` varchar(10)
,`NameShelter` varchar(100)
);

-- --------------------------------------------------------

--
-- Структура для представления `pets`
--
DROP TABLE IF EXISTS `pets`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pets`  AS SELECT `pet`.`Name` AS `Name`, `shelter`.`NameShelter` AS `NameShelter` FROM (`pet` join `shelter`) ;

-- --------------------------------------------------------

--
-- Структура для представления `zoo`
--
DROP TABLE IF EXISTS `zoo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zoo`  AS SELECT `pet`.`Name` AS `Name`, `pet`.`ViewPet` AS `ViewPet`, `shelter`.`NameShelter` AS `NameShelter` FROM (`pet` join `shelter`) ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`IdClient`);

--
-- Индексы таблицы `order_set`
--
ALTER TABLE `order_set`
  ADD PRIMARY KEY (`IdOrder`),
  ADD KEY `IdPet` (`IdPet`),
  ADD KEY `IdClient` (`IdClient`);

--
-- Индексы таблицы `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdShelter` (`IdShelter`);

--
-- Индексы таблицы `shelter`
--
ALTER TABLE `shelter`
  ADD PRIMARY KEY (`IdShelter`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `IdClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT для таблицы `order_set`
--
ALTER TABLE `order_set`
  MODIFY `IdOrder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `pet`
--
ALTER TABLE `pet`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `shelter`
--
ALTER TABLE `shelter`
  MODIFY `IdShelter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `order_set`
--
ALTER TABLE `order_set`
  ADD CONSTRAINT `order_set_ibfk_1` FOREIGN KEY (`IdPet`) REFERENCES `pet` (`Id`),
  ADD CONSTRAINT `order_set_ibfk_2` FOREIGN KEY (`IdClient`) REFERENCES `client` (`IdClient`);

--
-- Ограничения внешнего ключа таблицы `pet`
--
ALTER TABLE `pet`
  ADD CONSTRAINT `pet_ibfk_1` FOREIGN KEY (`IdShelter`) REFERENCES `shelter` (`IdShelter`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
