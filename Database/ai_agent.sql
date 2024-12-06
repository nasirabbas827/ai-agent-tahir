-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2024 at 01:09 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ai_agent`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password`) VALUES
(1, 'admin', 'admin@admin.com', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_base`
--

CREATE TABLE `knowledge_base` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `knowledge_base`
--

INSERT INTO `knowledge_base` (`id`, `question`, `answer`) VALUES
(1, 'What is Python?', 'Python is a high-level programming language.'),
(2, 'What is Django?', 'Django is a web framework for Python.'),
(3, 'What is a CSV file?', 'CSV is a comma-separated values file format.'),
(4, 'What is an Excel file?', 'Excel files are spreadsheets created by Excel.'),
(5, 'What is a .docx file?', '.docx is a Microsoft Word document file.'),
(6, 'How do I upload a file in Django?', 'Use Django\'s FileField to handle file uploads.'),
(7, 'What is pandas in Python?', 'Pandas is a data analysis library in Python.'),
(8, 'How to validate a file in Django?', 'Use Django\'s validators like validate_file_extension.'),
(9, 'How to install Django?', 'Run pip install django in your terminal.'),
(10, 'What is an HTTP request?', 'It\'s a request made by a client to a server.'),
(11, 'What is a database?', 'A database is a structured collection of data.'),
(12, 'What is a model in Django?', 'A model is a database abstraction in Django.'),
(13, 'What is a view in Django?', 'A view processes requests and returns responses.'),
(14, 'How to run a Django project?', 'Use python manage.py runserver in your terminal.'),
(15, 'What is HTML?', 'HTML is a markup language for web pages.'),
(16, 'What is CSS?', 'CSS is used to style web pages.'),
(17, 'What is JavaScript?', 'JavaScript is a programming language for the web.'),
(18, 'How to create a form in Django?', 'Use Django\'s forms.Form or forms.ModelForm.'),
(19, 'What is ORM in Django?', 'ORM is Object-Relational Mapping for databases.'),
(20, 'How to handle errors in Python?', 'Use try-except blocks for error handling.');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `error_message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `error_message`) VALUES
(1, 'Sorry, I cannot find an answer to your query');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `knowledge_base`
--
ALTER TABLE `knowledge_base`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `knowledge_base`
--
ALTER TABLE `knowledge_base`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
