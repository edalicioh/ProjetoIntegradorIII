-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Dez-2019 às 20:18
-- Versão do servidor: 10.4.6-MariaDB
-- versão do PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `rest_jwt`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `classes`
--

CREATE TABLE `classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `period` enum('M','V') COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `classes`
--

INSERT INTO `classes` (`id`, `period`, `class_number`) VALUES
(1, 'M', 100),
(2, 'V', 101),
(3, 'M', 200),
(4, 'V', 201),
(5, 'M', 300),
(6, 'V', 301),
(7, 'M', 400),
(8, 'V', 401),
(9, 'M', 500),
(10, 'V', 501),
(14, 'M', 600),
(15, 'M', 122);

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `frequencies`
--

CREATE TABLE `frequencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` date NOT NULL,
  `presence` tinyint(1) NOT NULL,
  `periods_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `grades`
--

CREATE TABLE `grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL COMMENT 'Define a data em que o trabalho ou prova foi aplicada',
  `grade` double(8,2) NOT NULL COMMENT 'Define a nota do estudante',
  `periods_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_11_07_142316_create_students_table', 1),
(5, '2019_11_07_142346_create_classes_table', 1),
(6, '2019_11_07_143534_create_notes_table', 1),
(7, '2019_11_07_143740_create_periods_table', 1),
(8, '2019_11_07_144023_create_grades_table', 1),
(9, '2019_11_07_144042_create_frequencies_table', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `user_class_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `periods`
--

CREATE TABLE `periods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `begins_class` date NOT NULL COMMENT 'Nesta campo deve conter a data de inicio do periudo ( semestre , trimestre , bimestre ) EX.: 01-01-1900',
  `end_classes` date NOT NULL COMMENT 'Nesta campo deve conter a data de final do periudo ( semestre , trimestre , bimestre ) EX.: 31-31-1900',
  `class_cycle` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Define em qual do período ano letivo ( 1 : para o primeiro , 2 : para o segundo , 3 : para o terceiro , 4 : para o quarto ',
  `student_class_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `studenthasclass`
--

CREATE TABLE `studenthasclass` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `studenthasuser`
--

CREATE TABLE `studenthasuser` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_birth` date NOT NULL,
  `registration` int(11) NOT NULL,
  `gender` enum('M','F','O') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `userhasclass`
--

CREATE TABLE `userhasclass` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `userhasclass`
--

INSERT INTO `userhasclass` (`id`, `class_id`, `user_id`) VALUES
(1, 1, 8),
(2, 6, 5),
(3, 14, 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('M','F','O') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Define o gênero com uma letra ( M : Masculino, F : Feminino, O : Outro )',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Define se o usuário está ativo no sistema ( true , false ) o valor padrão true',
  `user_type` enum('PAI','PRO','COR') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PAI' COMMENT 'Descreve o tipo de acesso a cada usuário como o padrão de 3 letras ( PAI: Representa os pais, PRO: Representa os professores, COR: Representa a coordenação ) o valor padrão e PAI',
  `login` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `full_name`, `phone`, `cpf`, `gender`, `status`, `user_type`, `login`, `email`, `password`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'edalicio', '21212121', '212121', 'M', 0, 'COR', 'cor', 'cor@cor.com', '$2y$10$fTLva0F0K0v2.eaOUGfvKOAFRSjj5xRHJDoFktWKwKKvjuRMpvoRi', NULL, NULL, NULL, NULL),
(5, 'Prof 01', '21212121', '333333', 'M', 0, 'PRO', 'pro', 'pro@pro.com', '$2y$10$Igru/SBhrEK8Hkl/jE9R6OCAq8Zi.e227A0B5kn8GxREO6LaYyEsG', NULL, NULL, NULL, NULL),
(6, 'edalicio', '21212121', '212121', 'M', 1, 'PAI', 'pai', 'pai@pai.com', '$2y$10$iond56rg/QiypBv1jx3lqusDrfvXzOO1K.blWxXxda4yM51G0.zBi', NULL, NULL, NULL, NULL),
(8, 'Prof 02', '4797935748', '07492021909', 'M', 1, 'PRO', NULL, 'edalicio@outlook.com', '$2y$10$3reu5HbhZTwC7S7uQ45HSe9WIWsrvMuaWNOeOV9vlQ1WBpzgGSw1q', NULL, NULL, NULL, NULL),
(9, 'Prof 03', '4797935748', '333333', 'M', 1, 'PRO', NULL, 'pro1@pro.com', '$2y$10$u7qIhHjauAhMxpJtISCGnuSwzBXNZmICC80Hucv8qAZUvZEZD0br2', NULL, NULL, NULL, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `frequencies`
--
ALTER TABLE `frequencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `frequencies_periods_id_foreign` (`periods_id`);

--
-- Índices para tabela `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grades_periods_id_foreign` (`periods_id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_user_class_id_foreign` (`user_class_id`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `periods`
--
ALTER TABLE `periods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `periods_student_class_id_foreign` (`student_class_id`);

--
-- Índices para tabela `studenthasclass`
--
ALTER TABLE `studenthasclass`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studenthasclass_class_id_foreign` (`class_id`),
  ADD KEY `studenthasclass_student_id_foreign` (`student_id`);

--
-- Índices para tabela `studenthasuser`
--
ALTER TABLE `studenthasuser`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studenthasuser_user_id_foreign` (`user_id`),
  ADD KEY `studenthasuser_student_id_foreign` (`student_id`);

--
-- Índices para tabela `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `userhasclass`
--
ALTER TABLE `userhasclass`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userhasclass_user_id_foreign` (`user_id`),
  ADD KEY `userhasclass_class_id_foreign` (`class_id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_login_unique` (`login`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `frequencies`
--
ALTER TABLE `frequencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `grades`
--
ALTER TABLE `grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `periods`
--
ALTER TABLE `periods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `studenthasclass`
--
ALTER TABLE `studenthasclass`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `studenthasuser`
--
ALTER TABLE `studenthasuser`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `userhasclass`
--
ALTER TABLE `userhasclass`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `frequencies`
--
ALTER TABLE `frequencies`
  ADD CONSTRAINT `frequencies_periods_id_foreign` FOREIGN KEY (`periods_id`) REFERENCES `periods` (`id`);

--
-- Limitadores para a tabela `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_periods_id_foreign` FOREIGN KEY (`periods_id`) REFERENCES `periods` (`id`);

--
-- Limitadores para a tabela `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_user_class_id_foreign` FOREIGN KEY (`user_class_id`) REFERENCES `userhasclass` (`id`);

--
-- Limitadores para a tabela `periods`
--
ALTER TABLE `periods`
  ADD CONSTRAINT `periods_student_class_id_foreign` FOREIGN KEY (`student_class_id`) REFERENCES `studenthasclass` (`id`);

--
-- Limitadores para a tabela `studenthasclass`
--
ALTER TABLE `studenthasclass`
  ADD CONSTRAINT `studenthasclass_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `studenthasclass_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Limitadores para a tabela `studenthasuser`
--
ALTER TABLE `studenthasuser`
  ADD CONSTRAINT `studenthasuser_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `studenthasuser_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Limitadores para a tabela `userhasclass`
--
ALTER TABLE `userhasclass`
  ADD CONSTRAINT `userhasclass_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `userhasclass_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
