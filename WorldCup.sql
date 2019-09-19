-- phpMyAdmin SQL Dump
-- version 4.6.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 18, 2018 at 11:46 AM
-- Server version: 5.6.28
-- PHP Version: 5.5.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `WorldCup`
--

-- --------------------------------------------------------

--
-- Table structure for table `COUNTRY`
--

CREATE TABLE `COUNTRY` (
  `Name` varchar(30) NOT NULL,
  `Population` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COUNTRY`
--

INSERT INTO `COUNTRY` (`Name`, `Population`) VALUES
('Australia', 24863844),
('China', 1397030000),
('France', 65306319),
('Germany', 82344766),
('Iceland', 348580),
('Italy', 59270710),
('Japan', 127094745),
('Russia', 144530031),
('South Korea', 20188641),
('Spain', 46507760),
('USA', 329256465);

-- --------------------------------------------------------

--
-- Table structure for table `CUSTOMER`
--

CREATE TABLE `CUSTOMER` (
  `ID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `CountryName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CUSTOMER`
--

INSERT INTO `CUSTOMER` (`ID`, `Name`, `Email`, `CountryName`) VALUES
(0, 'Tang Bae', 'tbae@gmail.com', 'New Zealand'),
(1, 'Aisha Alloe', 'allo2@hotmail.com', 'Australia'),
(2, 'Hallen Alama', 'halama3@gmail.com', 'USA'),
(3, 'Jocelyn Dutertre', 'dtret2@gmail.com', 'France'),
(4, 'Ivone Nalbone', 'ivone764@yahoo.com', 'Italy');

-- --------------------------------------------------------

--
-- Table structure for table `ELIMINATIONGAME`
--

CREATE TABLE `ELIMINATIONGAME` (
  `ID` int(11) NOT NULL,
  `Stage` varchar(20) NOT NULL,
  `HomePenalties` int(2) NOT NULL,
  `AwayPenalties` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ELIMINATIONGAME`
--

INSERT INTO `ELIMINATIONGAME` (`ID`, `Stage`, `HomePenalties`, `AwayPenalties`) VALUES
(1, 'Round of 16', 2, 1),
(6, 'Quarter Finals', 0, 1),
(7, 'Semi Finals', 0, 0),
(8, 'Finals', 0, 2),
(9, 'Semi Finals', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `GOALS`
--

CREATE TABLE `GOALS` (
  `PlayerID` int(11) NOT NULL,
  `MatchID` int(11) NOT NULL,
  `Count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `GOALS`
--

INSERT INTO `GOALS` (`PlayerID`, `MatchID`, `Count`) VALUES
(1, 2, 1),
(1, 3, 0),
(1, 6, 1),
(1, 10, 2),
(2, 4, 1),
(3, 3, 1),
(11, 4, 3),
(11, 9, 1),
(13, 1, 2),
(13, 2, 3),
(13, 5, 1),
(16, 7, 2),
(18, 3, 1),
(19, 4, 1),
(22, 6, 4);

-- --------------------------------------------------------

--
-- Stand-in structure for view `GoalTotal`
-- (See below for the actual view)
--
CREATE TABLE `GoalTotal` (
`PlayerID` int(11)
,`MatchID` int(11)
,`total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `HOMECLUB`
--

CREATE TABLE `HOMECLUB` (
  `Name` varchar(20) NOT NULL,
  `Country` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `HOMECLUB`
--

INSERT INTO `HOMECLUB` (`Name`, `Country`) VALUES
('AC Milan', 'Italy'),
('Arsenal', 'England'),
('Chelsea', 'England'),
('FC Barcelona', 'Spain'),
('FC Bayern Munich', 'Germany'),
('Manchester United', 'England'),
('Paris Saint-Germain', 'France'),
('Real Madrid', 'Spain');

-- --------------------------------------------------------

--
-- Table structure for table `MATCH`
--

CREATE TABLE `MATCH` (
  `ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Stadium` varchar(20) NOT NULL,
  `HomeYear` year(4) NOT NULL,
  `HomeTeamID` int(11) NOT NULL,
  `AwayYear` year(4) NOT NULL,
  `AwayTeamID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MATCH`
--

INSERT INTO `MATCH` (`ID`, `Date`, `Time`, `Stadium`, `HomeYear`, `HomeTeamID`, `AwayYear`, `AwayTeamID`) VALUES
(0, '1934-10-08', '01:32:00', 'Stadio Olimpico', 1934, 2, 1938, 3),
(1, '1982-10-18', '10:18:36', 'SAN SIRO', 1974, 5, 1982, 6),
(2, '1994-10-17', '07:06:43', 'JUVENTUS', 1982, 6, 1982, 6),
(3, '1938-10-24', '09:43:14', 'STADIO SAN PAOLO', 1982, 0, 1994, 1),
(4, '1934-10-09', '06:30:32', 'ARTEMIO FRANCHI', 1982, 1, 1934, 2),
(5, '1982-10-09', '11:40:32', 'STADIO OLIMPICO', 1982, 6, 1994, 1),
(6, '1999-10-15', '16:36:20', 'Olympiastadion', 1974, 5, 1974, 5),
(7, '1969-10-09', '03:20:11', 'Estadio Azteca', 1982, 0, 1982, 1),
(8, '1969-10-09', '03:20:11', 'Estadio Azteca', 1982, 1, 1982, 0),
(9, '1969-10-09', '13:14:11', 'Millennium', 1994, 1, 1974, 5),
(10, '1954-10-09', '17:15:34', 'JUVENTUS', 1954, 16, 1990, 11);

-- --------------------------------------------------------

--
-- Table structure for table `MEMBER`
--

CREATE TABLE `MEMBER` (
  `ID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MEMBER`
--

INSERT INTO `MEMBER` (`ID`, `Name`) VALUES
(0, 'John Smith'),
(1, 'Allen Swin'),
(2, 'Naeem Francis'),
(3, 'Roland Hirst'),
(4, 'Layla Adam'),
(5, 'Kayden Zuniga'),
(6, 'Luqman Wagner'),
(7, 'Amandeep Donnelly'),
(8, 'Nicola Butler'),
(9, 'Fabien Curtis'),
(10, 'Jamal Irvine'),
(11, 'Zohaib Aldred'),
(12, 'Zou Zhihao'),
(13, 'Yu Zhong'),
(14, 'Tang Jia'),
(15, 'Lian Zhelan'),
(16, 'Stéphane Chapuis'),
(17, 'Amaury Héroux'),
(18, 'Denis Bonnel'),
(19, 'Alonso Saelices'),
(20, 'Facundo Villa'),
(21, 'Priamo Alma'),
(22, 'Dominic Sauro');

-- --------------------------------------------------------

--
-- Table structure for table `PLAYER`
--

CREATE TABLE `PLAYER` (
  `ID` int(11) NOT NULL,
  `Position` varchar(20) NOT NULL,
  `HomeClubName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PLAYER`
--

INSERT INTO `PLAYER` (`ID`, `Position`, `HomeClubName`) VALUES
(0, 'Goal Keeper', 'Arsenal'),
(1, 'Defender', 'Chelsea'),
(2, 'Forward', 'Paris Saint-Germain'),
(3, 'Mid Fielder', 'FC Bayern Munich'),
(4, 'Goal Keeper', 'Real Madrid'),
(5, 'Defender', 'FC Bayern Munich'),
(11, 'Mid Fielder', 'Chelsea'),
(12, 'Goal Keeper', 'FC Barcelona'),
(13, 'Forward', 'FC Barcelona'),
(15, 'Goal Keeper', 'Manchester United'),
(16, 'Defender', 'Paris Saint-Germain'),
(17, 'Mid Fielder', 'Arsenal'),
(18, 'Forward', 'FC Bayern Munich'),
(19, 'Mid Fielder', 'Paris Saint-Germain'),
(20, 'Goal Keeper', 'FC Bayern Munich'),
(21, 'Mid Fielder', 'AC Milan'),
(22, 'Forward', 'FC Bayern Munich');

-- --------------------------------------------------------

--
-- Table structure for table `POOLGAME`
--

CREATE TABLE `POOLGAME` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `POOLGAME`
--

INSERT INTO `POOLGAME` (`ID`) VALUES
(0),
(2),
(3),
(4),
(5);

-- --------------------------------------------------------

--
-- Table structure for table `SAVES`
--

CREATE TABLE `SAVES` (
  `PlayerID` int(11) NOT NULL,
  `MatchID` int(11) NOT NULL,
  `Count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SAVES`
--

INSERT INTO `SAVES` (`PlayerID`, `MatchID`, `Count`) VALUES
(0, 4, 0),
(4, 6, 3),
(4, 7, 3),
(12, 7, 1),
(15, 0, 2),
(15, 3, 2),
(20, 8, 5);

-- --------------------------------------------------------

--
-- Table structure for table `SUPPORTSTAFF`
--

CREATE TABLE `SUPPORTSTAFF` (
  `ID` int(11) NOT NULL,
  `Role` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SUPPORTSTAFF`
--

INSERT INTO `SUPPORTSTAFF` (`ID`, `Role`) VALUES
(6, 'Manager'),
(7, 'Manager'),
(8, 'Goal Keaper Coach'),
(9, 'Team Photographer'),
(10, 'Player Ambassador'),
(11, 'Assistant Coach'),
(14, 'Physiotherapist');

-- --------------------------------------------------------

--
-- Table structure for table `TEAM`
--

CREATE TABLE `TEAM` (
  `Year` year(4) NOT NULL,
  `ID` int(11) NOT NULL,
  `Country` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TEAM`
--

INSERT INTO `TEAM` (`Year`, `ID`, `Country`) VALUES
(1934, 15, 'Australia'),
(1938, 14, 'Australia'),
(1974, 13, 'Australia'),
(1982, 12, 'Australia'),
(1990, 11, 'Australia'),
(1994, 8, 'Australia'),
(2018, 7, 'Australia'),
(1982, 0, 'China'),
(1982, 1, 'France'),
(1994, 1, 'France'),
(1982, 6, 'Germany'),
(1954, 16, 'Iceland'),
(1938, 3, 'Italy'),
(1974, 5, 'Italy'),
(2018, 10, 'Japan'),
(2018, 9, 'South Korea'),
(1934, 2, 'USA'),
(1994, 4, 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `TEAMMEMBER`
--

CREATE TABLE `TEAMMEMBER` (
  `Year` year(4) NOT NULL,
  `TeamID` int(11) NOT NULL,
  `MemberID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TEAMMEMBER`
--

INSERT INTO `TEAMMEMBER` (`Year`, `TeamID`, `MemberID`) VALUES
(1938, 3, 3),
(2018, 7, 4),
(1982, 1, 6),
(2018, 7, 6),
(2018, 9, 7),
(1954, 16, 8),
(1974, 5, 8),
(2018, 7, 8),
(2018, 9, 9),
(2018, 10, 10),
(1994, 8, 11),
(1974, 5, 12),
(2018, 7, 13),
(1934, 2, 14),
(1994, 4, 14),
(1954, 16, 16),
(1994, 1, 18);

-- --------------------------------------------------------

--
-- Table structure for table `TICKET`
--

CREATE TABLE `TICKET` (
  `MatchID` int(11) NOT NULL,
  `TicketNum` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `Price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TICKET`
--

INSERT INTO `TICKET` (`MatchID`, `TicketNum`, `CustomerID`, `Price`) VALUES
(1, 3, 0, 85),
(3, 5, 2, 165),
(7, 3, 4, 144.5),
(7, 10, 2, 354),
(8, 4, 2, 190);

-- --------------------------------------------------------

--
-- Stand-in structure for view `TicketTotal`
-- (See below for the actual view)
--
CREATE TABLE `TicketTotal` (
`MatchID` int(11)
,`total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `TOURNAMENT`
--

CREATE TABLE `TOURNAMENT` (
  `Year` year(4) NOT NULL,
  `Country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TOURNAMENT`
--

INSERT INTO `TOURNAMENT` (`Year`, `Country`) VALUES
(1938, 'France'),
(1974, 'Germany'),
(1954, 'Iceland'),
(1934, 'Italy'),
(1990, 'Italy'),
(2018, 'Russia'),
(1982, 'Spain'),
(1994, 'USA');

-- --------------------------------------------------------

--
-- Structure for view `GoalTotal`
--
DROP TABLE IF EXISTS `GoalTotal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `GoalTotal`  AS  select `g`.`PlayerID` AS `PlayerID`,`g`.`MatchID` AS `MatchID`,sum(`g`.`Count`) AS `total` from (`GOALS` `g` join `ELIMINATIONGAME` `e`) where (`g`.`MatchID` = `e`.`ID`) group by `g`.`PlayerID` ;

-- --------------------------------------------------------

--
-- Structure for view `TicketTotal`
--
DROP TABLE IF EXISTS `TicketTotal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `TicketTotal`  AS  select `t`.`MatchID` AS `MatchID`,sum(`t`.`TicketNum`) AS `total` from `TICKET` `t` group by `t`.`MatchID` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `COUNTRY`
--
ALTER TABLE `COUNTRY`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `CUSTOMER`
--
ALTER TABLE `CUSTOMER`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ELIMINATIONGAME`
--
ALTER TABLE `ELIMINATIONGAME`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `GOALS`
--
ALTER TABLE `GOALS`
  ADD PRIMARY KEY (`PlayerID`,`MatchID`),
  ADD KEY `MatchID` (`MatchID`);

--
-- Indexes for table `HOMECLUB`
--
ALTER TABLE `HOMECLUB`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `MATCH`
--
ALTER TABLE `MATCH`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `HomeYear` (`HomeYear`,`HomeTeamID`,`AwayYear`,`AwayTeamID`),
  ADD KEY `AwayYear` (`AwayYear`,`AwayTeamID`);

--
-- Indexes for table `MEMBER`
--
ALTER TABLE `MEMBER`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `PLAYER`
--
ALTER TABLE `PLAYER`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `HomeClubName` (`HomeClubName`);

--
-- Indexes for table `POOLGAME`
--
ALTER TABLE `POOLGAME`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `SAVES`
--
ALTER TABLE `SAVES`
  ADD PRIMARY KEY (`PlayerID`,`MatchID`),
  ADD KEY `MatchID` (`MatchID`);

--
-- Indexes for table `SUPPORTSTAFF`
--
ALTER TABLE `SUPPORTSTAFF`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `TEAM`
--
ALTER TABLE `TEAM`
  ADD PRIMARY KEY (`Year`,`ID`),
  ADD KEY `Country` (`Country`);

--
-- Indexes for table `TEAMMEMBER`
--
ALTER TABLE `TEAMMEMBER`
  ADD PRIMARY KEY (`Year`,`TeamID`,`MemberID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `TICKET`
--
ALTER TABLE `TICKET`
  ADD PRIMARY KEY (`MatchID`,`TicketNum`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `TOURNAMENT`
--
ALTER TABLE `TOURNAMENT`
  ADD PRIMARY KEY (`Year`),
  ADD KEY `Country` (`Country`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ELIMINATIONGAME`
--
ALTER TABLE `ELIMINATIONGAME`
  ADD CONSTRAINT `ELIMINATIONGAME_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `MATCH` (`ID`);

--
-- Constraints for table `GOALS`
--
ALTER TABLE `GOALS`
  ADD CONSTRAINT `GOALS_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `PLAYER` (`ID`),
  ADD CONSTRAINT `GOALS_ibfk_2` FOREIGN KEY (`MatchID`) REFERENCES `MATCH` (`ID`);

--
-- Constraints for table `MATCH`
--
ALTER TABLE `MATCH`
  ADD CONSTRAINT `MATCH_ibfk_1` FOREIGN KEY (`HomeYear`,`HomeTeamID`) REFERENCES `TEAM` (`Year`, `ID`),
  ADD CONSTRAINT `MATCH_ibfk_2` FOREIGN KEY (`AwayYear`,`AwayTeamID`) REFERENCES `TEAM` (`Year`, `ID`);

--
-- Constraints for table `PLAYER`
--
ALTER TABLE `PLAYER`
  ADD CONSTRAINT `PLAYER_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `MEMBER` (`ID`),
  ADD CONSTRAINT `PLAYER_ibfk_2` FOREIGN KEY (`HomeClubName`) REFERENCES `HOMECLUB` (`Name`);

--
-- Constraints for table `POOLGAME`
--
ALTER TABLE `POOLGAME`
  ADD CONSTRAINT `POOLGAME_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `MATCH` (`ID`);

--
-- Constraints for table `SAVES`
--
ALTER TABLE `SAVES`
  ADD CONSTRAINT `SAVES_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `PLAYER` (`ID`),
  ADD CONSTRAINT `SAVES_ibfk_2` FOREIGN KEY (`MatchID`) REFERENCES `MATCH` (`ID`);

--
-- Constraints for table `SUPPORTSTAFF`
--
ALTER TABLE `SUPPORTSTAFF`
  ADD CONSTRAINT `SUPPORTSTAFF_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `MEMBER` (`ID`);

--
-- Constraints for table `TEAM`
--
ALTER TABLE `TEAM`
  ADD CONSTRAINT `TEAM_ibfk_1` FOREIGN KEY (`Country`) REFERENCES `COUNTRY` (`Name`),
  ADD CONSTRAINT `TEAM_ibfk_2` FOREIGN KEY (`Year`) REFERENCES `TOURNAMENT` (`Year`);

--
-- Constraints for table `TEAMMEMBER`
--
ALTER TABLE `TEAMMEMBER`
  ADD CONSTRAINT `TEAMMEMBER_ibfk_1` FOREIGN KEY (`Year`,`TeamID`) REFERENCES `TEAM` (`Year`, `ID`),
  ADD CONSTRAINT `TEAMMEMBER_ibfk_2` FOREIGN KEY (`MemberID`) REFERENCES `MEMBER` (`ID`);

--
-- Constraints for table `TICKET`
--
ALTER TABLE `TICKET`
  ADD CONSTRAINT `TICKET_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `CUSTOMER` (`ID`),
  ADD CONSTRAINT `TICKET_ibfk_2` FOREIGN KEY (`MatchID`) REFERENCES `MATCH` (`ID`);

--
-- Constraints for table `TOURNAMENT`
--
ALTER TABLE `TOURNAMENT`
  ADD CONSTRAINT `TOURNAMENT_ibfk_1` FOREIGN KEY (`Country`) REFERENCES `COUNTRY` (`Name`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
