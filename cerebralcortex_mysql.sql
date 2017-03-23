# noinspection SqlNoDataSourceInspectionForFile

-- Generation Time: Jan 27, 2017 at 02:06 PM

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cerebralcortex_mysql`
--
DROP DATABASE IF EXISTS `cerebralcortex_mysql`;
CREATE DATABASE IF NOT EXISTS `cerebralcortex_mysql` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cerebralcortex_mysql`;

-- --------------------------------------------------------

--
-- Table structure for table `datastream`
--

CREATE TABLE `stream` (
  `identifier` UUID(11) NOT NULL,
  `owner` UUID(11) NOT NULL,
  `name` TEXT DEFAULT NULL,
  `description` TEXT DEFAULT NULL,
  `data_descriptor` json NOT NULL,
  `execution_context` json NOT NULL,
  `annotations` json DEFAULT NULL,
  `type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `identifier` UUID(11) NOT NULL,
  `metadata` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Indexes for dumped tables
--

--
-- Indexes for table `datastream`
--
ALTER TABLE `datastream`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_id` (`user_id`),
  ADD KEY `fk_processing_module` (`processing_module_id`);

--
-- Indexes for table `processing_module`
--
ALTER TABLE `processing_module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `study`
--
ALTER TABLE `study`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_study_user_id` (`users_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `datastream`
--
ALTER TABLE `datastream`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `processing_module`
--
ALTER TABLE `processing_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `study`
--
ALTER TABLE `study`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `datastream`
--
ALTER TABLE `datastream`
  ADD CONSTRAINT `fk_processing_module` FOREIGN KEY (`processing_module_id`) REFERENCES `processing_module` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `study`
--
ALTER TABLE `study`
  ADD CONSTRAINT `fk_study_users1` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
