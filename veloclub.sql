-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2019-08-12 22:22:50
-- 服务器版本： 10.3.16-MariaDB
-- PHP 版本： 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `veloclub`
--

-- --------------------------------------------------------

--
-- 表的结构 `choixStage`
--

CREATE TABLE `choixStage` (
  `idChoix` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idStage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `choixStage`
--

INSERT INTO `choixStage` (`idChoix`, `idUser`, `idStage`) VALUES
(1, 5, 2),
(2, 1, 1),
(3, 7, 2),
(15, 2, 5);

-- --------------------------------------------------------

--
-- 表的结构 `reparation_employ`
--

CREATE TABLE `reparation_employ` (
  `idRepair` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `date` date NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT 'reparation_employ',
  `description` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT 'payant',
  `startTime` time NOT NULL,
  `endTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `reparation_employ`
--

INSERT INTO `reparation_employ` (`idRepair`, `idUser`, `date`, `type`, `description`, `startTime`, `endTime`) VALUES
(2, 1, '2019-08-08', 'reparation_employ', '', '09:00:00', '12:00:00'),
(4, 5, '2019-08-08', 'reparation_employ', '', '15:00:00', '17:00:00'),
(10, 7, '2019-08-08', 'reparation_employ', 'payant', '08:00:00', '10:00:00'),
(18, 7, '2019-08-05', 'reparation_employ', 'payant', '12:00:00', '17:00:00'),
(19, 7, '2019-08-06', 'reparation_employ', 'payant', '16:00:00', '18:00:00'),
(35, 7, '2019-08-08', 'reparation_employ', 'avec lqw', '17:00:00', '19:00:00'),
(36, 7, '2019-08-23', 'reparation_employ', 'payant', '08:00:00', '14:00:00'),
(37, 7, '2019-08-12', 'reparation_employ', 'payant', '21:00:00', '22:00:00'),
(39, 7, '2019-08-24', 'reparation_employ', 'payant', '14:00:00', '15:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `reparation_membre`
--

CREATE TABLE `reparation_membre` (
  `idRepair` int(11) NOT NULL,
  `date` date NOT NULL,
  `idUser` int(11) NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT 'reparation_membre',
  `description` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT 'membre',
  `startTime` time NOT NULL,
  `endTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `reparation_membre`
--

INSERT INTO `reparation_membre` (`idRepair`, `date`, `idUser`, `type`, `description`, `startTime`, `endTime`) VALUES
(4, '2019-08-10', 5, 'reparation_membre', '', '14:00:00', '17:00:00'),
(5, '2019-08-08', 2, 'reparation_membre', '', '10:00:00', '18:00:00'),
(23, '2019-08-05', 7, 'reparation_membre', 'membre', '15:00:00', '16:00:00'),
(36, '2019-08-05', 7, 'reparation_membre', '', '10:00:00', '11:00:00'),
(40, '2019-08-13', 7, 'reparation_membre', 'mon reservation', '09:30:00', '12:00:00'),
(41, '2019-08-15', 7, 'reparation_membre', 'mon reservation', '09:00:00', '11:30:00'),
(43, '2019-08-15', 7, 'reparation_membre', 'mon reservation', '12:00:00', '14:00:00'),
(45, '2019-08-11', 7, 'reparation_membre', 'mon reservation', '10:00:00', '11:00:00'),
(46, '2019-08-11', 7, 'reparation_membre', 'mon reservation', '11:30:00', '13:30:00');

-- --------------------------------------------------------

--
-- 表的结构 `stage`
--

CREATE TABLE `stage` (
  `idStage` int(11) NOT NULL,
  `date` date NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `participation` int(11) DEFAULT NULL COMMENT 'Participation financière',
  `nombreMax` int(3) NOT NULL COMMENT 'nombre  maximum de  partipant',
  `formateur` int(1) NOT NULL COMMENT '0:membre 1:salarie',
  `type` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT 'formation'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `stage`
--

INSERT INTO `stage` (`idStage`, `date`, `startTime`, `endTime`, `description`, `participation`, `nombreMax`, `formateur`, `type`) VALUES
(1, '2019-08-06', '11:00:00', '15:00:00', 'class 1', 2, 3, 0, 'formation\r\n'),
(2, '2019-08-08', '08:00:00', '10:00:00', 'class 2', 3, 10, 1, 'formation\r\n'),
(4, '2019-08-07', '08:00:00', '11:00:00', 'class 3', 23, 12, 0, 'formation'),
(5, '2019-08-08', '15:00:00', '19:00:00', 'hhhhhhhhh', 56, 65, 1, 'formation');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `pseudo` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `passwd` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `nom` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `prenom` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `codePostal` int(5) NOT NULL,
  `ville` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `adresse` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`idUser`, `pseudo`, `passwd`, `nom`, `prenom`, `codePostal`, `ville`, `adresse`) VALUES
(1, 'lqw', 'lqw', 'lqw', 'lqw', 59650, 'lille', 'D315, REZ leonard de vinci, boulevard paul de langevin,'),
(2, 'test', 'test', 'hhh', 'hhh', 20240, 'Shanghai', 'shanghai,dongchuan,800,sjtu'),
(5, 'my', 'myhhh', 'my', 'my', 23456, 'beijing', 'myhhhhhh'),
(7, 'my', 'my', 'qingwen', 'li', 59650, 'lille', 'D315, REZ leonard de vinci, boulevard paul de langevin,'),
(9, 'lqw', 'lqw', 'qingwen', 'wang', 59650, 'lille', 'D315, REZ leonard de vinci, boulevard paul de langevin,');

--
-- 转储表的索引
--

--
-- 表的索引 `choixStage`
--
ALTER TABLE `choixStage`
  ADD PRIMARY KEY (`idChoix`),
  ADD UNIQUE KEY `idUser` (`idUser`),
  ADD KEY `Stage` (`idStage`) USING BTREE,
  ADD KEY `user` (`idUser`) USING BTREE;

--
-- 表的索引 `reparation_employ`
--
ALTER TABLE `reparation_employ`
  ADD PRIMARY KEY (`idRepair`),
  ADD KEY `repair_payant` (`idRepair`),
  ADD KEY `repair_pay` (`idUser`);

--
-- 表的索引 `reparation_membre`
--
ALTER TABLE `reparation_membre`
  ADD PRIMARY KEY (`idRepair`),
  ADD KEY `repair_gratuit` (`idUser`) USING BTREE;

--
-- 表的索引 `stage`
--
ALTER TABLE `stage`
  ADD PRIMARY KEY (`idStage`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `choixStage`
--
ALTER TABLE `choixStage`
  MODIFY `idChoix` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `reparation_employ`
--
ALTER TABLE `reparation_employ`
  MODIFY `idRepair` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- 使用表AUTO_INCREMENT `reparation_membre`
--
ALTER TABLE `reparation_membre`
  MODIFY `idRepair` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- 使用表AUTO_INCREMENT `stage`
--
ALTER TABLE `stage`
  MODIFY `idStage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 限制导出的表
--

--
-- 限制表 `choixStage`
--
ALTER TABLE `choixStage`
  ADD CONSTRAINT `choose` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`),
  ADD CONSTRAINT `class` FOREIGN KEY (`idStage`) REFERENCES `stage` (`idStage`);

--
-- 限制表 `reparation_employ`
--
ALTER TABLE `reparation_employ`
  ADD CONSTRAINT `repair_pay` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`);

--
-- 限制表 `reparation_membre`
--
ALTER TABLE `reparation_membre`
  ADD CONSTRAINT `repair_free` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
