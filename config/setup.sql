-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 28 2017 г., 21:51
-- Версия сервера: 5.5.53
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `parking`
--

-- --------------------------------------------------------

--
-- Структура таблицы `balance`
--

CREATE TABLE `balance` (
  `ID` int(10) UNSIGNED NOT NULL,
  `mtpl_id` int(10) UNSIGNED NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `member`
--

CREATE TABLE `member` (
  `ID` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `member_to_parking_lot`
--

CREATE TABLE `member_to_parking_lot` (
  `ID` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `parking_lot_id` int(10) UNSIGNED NOT NULL,
  `tariff_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `parking_lot`
--

CREATE TABLE `parking_lot` (
  `ID` int(10) UNSIGNED NOT NULL,
  `number` int(10) UNSIGNED NOT NULL,
  `parking_lot_type_id` int(10) UNSIGNED NOT NULL,
  `width` int(10) UNSIGNED NOT NULL,
  `height` int(10) UNSIGNED NOT NULL,
  `length` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `parking_lot_type`
--

CREATE TABLE `parking_lot_type` (
  `ID` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'металлический бокс'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `payment`
--

CREATE TABLE `payment` (
  `ID` int(10) UNSIGNED NOT NULL,
  `mtpl_id` int(10) UNSIGNED NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `schedule_payment`
--

CREATE TABLE `schedule_payment` (
  `ID` int(10) UNSIGNED NOT NULL,
  `mtpl_id` int(10) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tariff`
--

CREATE TABLE `tariff` (
  `ID` int(10) UNSIGNED NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `balance`
--
ALTER TABLE `balance`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `mtpl_id` (`mtpl_id`);

--
-- Индексы таблицы `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `member_to_parking_lot`
--
ALTER TABLE `member_to_parking_lot`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `parking_lot_id` (`parking_lot_id`),
  ADD KEY `tariff_id` (`tariff_id`);

--
-- Индексы таблицы `parking_lot`
--
ALTER TABLE `parking_lot`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `parking_lot_type_id` (`parking_lot_type_id`);

--
-- Индексы таблицы `parking_lot_type`
--
ALTER TABLE `parking_lot_type`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `mtpl_id` (`mtpl_id`);

--
-- Индексы таблицы `schedule_payment`
--
ALTER TABLE `schedule_payment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `mtpl_id` (`mtpl_id`),
  ADD KEY `mtpl_id_2` (`mtpl_id`);

--
-- Индексы таблицы `tariff`
--
ALTER TABLE `tariff`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `balance`
--
ALTER TABLE `balance`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `member`
--
ALTER TABLE `member`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `member_to_parking_lot`
--
ALTER TABLE `member_to_parking_lot`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `parking_lot`
--
ALTER TABLE `parking_lot`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `parking_lot_type`
--
ALTER TABLE `parking_lot_type`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `payment`
--
ALTER TABLE `payment`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `schedule_payment`
--
ALTER TABLE `schedule_payment`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tariff`
--
ALTER TABLE `tariff`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `balance`
--
ALTER TABLE `balance`
  ADD CONSTRAINT `balance_ibfk_1` FOREIGN KEY (`mtpl_id`) REFERENCES `member_to_parking_lot` (`ID`);

--
-- Ограничения внешнего ключа таблицы `member_to_parking_lot`
--
ALTER TABLE `member_to_parking_lot`
  ADD CONSTRAINT `member_to_parking_lot_ibfk_3` FOREIGN KEY (`tariff_id`) REFERENCES `tariff` (`ID`),
  ADD CONSTRAINT `member_to_parking_lot_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`ID`),
  ADD CONSTRAINT `member_to_parking_lot_ibfk_2` FOREIGN KEY (`parking_lot_id`) REFERENCES `parking_lot` (`ID`);

--
-- Ограничения внешнего ключа таблицы `parking_lot`
--
ALTER TABLE `parking_lot`
  ADD CONSTRAINT `parking_lot_ibfk_1` FOREIGN KEY (`parking_lot_type_id`) REFERENCES `parking_lot_type` (`ID`);

--
-- Ограничения внешнего ключа таблицы `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`mtpl_id`) REFERENCES `member_to_parking_lot` (`ID`);

--
-- Ограничения внешнего ключа таблицы `schedule_payment`
--
ALTER TABLE `schedule_payment`
  ADD CONSTRAINT `schedule_payment_ibfk_1` FOREIGN KEY (`mtpl_id`) REFERENCES `member_to_parking_lot` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
