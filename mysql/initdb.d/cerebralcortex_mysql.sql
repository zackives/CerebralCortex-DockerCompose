
-- Generation Time: May 03, 2017 at 10:59 AM
-- Server version: 5.7.18-0ubuntu0.16.04.1


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cerebralcortex`
--

-- --------------------------------------------------------

--
-- Table structure for table `stream`
--

CREATE TABLE `stream` (
  `identifier` varchar(36) NOT NULL,
  `owner` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `data_descriptor` json NOT NULL,
  `execution_context` json NOT NULL,
  `annotations` json NOT NULL,
  `type` varchar(45) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `tmp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `identifier` varchar(36) NOT NULL,
  `metadata` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `stream`
--
ALTER TABLE `stream`
  ADD PRIMARY KEY (`tmp`),
  ADD KEY `UUID` (`identifier`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD KEY `UUID` (`identifier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `stream`
--
ALTER TABLE `stream`
  MODIFY `tmp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;