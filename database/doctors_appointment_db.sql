-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Apr 2023 pada 08.59
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doctors_appointment_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `appointment_list`
--

CREATE TABLE `appointment_list` (
  `id` int(30) NOT NULL,
  `doctor_id` int(30) NOT NULL,
  `patient_id` int(30) NOT NULL,
  `schedule` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0= for verification, 1=confirmed,2= reschedule,3=done',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `appointment_list`
--

INSERT INTO `appointment_list` (`id`, `doctor_id`, `patient_id`, `schedule`, `status`, `date_created`) VALUES
(5, 2, 7, '2020-09-30 11:00:00', 1, '2020-09-24 15:20:52'),
(7, 2, 7, '2020-09-28 10:00:00', 2, '2020-09-24 16:39:00'),
(9, 2, 7, '2020-10-12 13:00:00', 0, '2020-09-24 16:43:21'),
(10, 3, 11, '2023-04-17 10:00:00', 1, '2023-04-17 11:41:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `doctors_list`
--

CREATE TABLE `doctors_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `name_pref` varchar(100) NOT NULL,
  `clinic_address` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `specialty_ids` text NOT NULL,
  `img_path` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `doctors_list`
--

INSERT INTO `doctors_list` (`id`, `name`, `name_pref`, `clinic_address`, `contact`, `email`, `specialty_ids`, `img_path`, `date_created`) VALUES
(2, 'James Smith', 'M.D.', 'Sample Clinic Address', '0821 554 55623', 'jsmith@sample.com', '[6,5]', '1600920480_d1.jpg', '2020-09-24 09:52:00'),
(3, 'Claire Blake', 'M.D.', 'Sample Only', '+5465 555 623', 'cblake@sample.com', '[4,1]', '1600937100_1600924020_images.jpg', '2020-09-24 13:07:21'),
(4, 'Johan', '(M.D)', 'RS.UD', '082732729', 'johan@gmail.com', '[4]', '1681706640_young-female-doctor-posing-corridor-hospital-min-scaled.jpg', '2023-04-17 11:44:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `doctors_schedule`
--

CREATE TABLE `doctors_schedule` (
  `id` int(30) NOT NULL,
  `doctor_id` int(30) NOT NULL,
  `day` varchar(20) NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `doctors_schedule`
--

INSERT INTO `doctors_schedule` (`id`, `doctor_id`, `day`, `time_from`, `time_to`) VALUES
(3, 2, 'Monday', '10:00:00', '17:00:00'),
(4, 2, 'Wednesday', '10:00:00', '17:00:00'),
(5, 3, 'Monday', '10:00:00', '15:00:00'),
(6, 3, 'Tuesday', '10:00:00', '15:00:00'),
(7, 3, 'Wednesday', '10:00:00', '15:00:00'),
(8, 3, 'Thursday', '10:00:00', '15:00:00'),
(9, 3, 'Friday', '10:00:00', '15:00:00'),
(10, 4, 'Monday', '10:00:00', '00:00:00'),
(11, 4, 'Tuesday', '00:00:00', '13:00:00'),
(12, 4, 'Wednesday', '00:00:00', '02:00:00'),
(13, 4, 'Thursday', '00:00:00', '01:00:00'),
(14, 4, 'Friday', '00:00:00', '02:00:00'),
(15, 4, 'Saturday', '00:00:00', '03:00:00'),
(16, 4, 'Sunday', '00:00:00', '02:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `medical_specialty`
--

CREATE TABLE `medical_specialty` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `img_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `medical_specialty`
--

INSERT INTO `medical_specialty` (`id`, `name`, `img_path`) VALUES
(1, 'Pediatrics', '1681707060_mother_and_child-01.webp'),
(3, 'Cardiology', '1600910100_human-heart-illustration-png-clip-art.png'),
(4, 'Orthopaedics', '1681707120_orthopedic-logo-design-template-inspiration-white-background-212077154.jpg'),
(5, 'Obstetrician/gynecologists', '1681707300_m2-obstetrician-columbus.jpg'),
(6, 'Neurologists', '1681707480_neurology-logo-260nw-493593040.webp');

-- --------------------------------------------------------

--
-- Struktur dari tabel `patient_list`
--

CREATE TABLE `patient_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `contact_no` varchar(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Rumah sakit', 'RSMalang@gmail.com', '085 654 765 112', '1681706220_young-female-doctor-posing-corridor-hospital-min-scaled.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;b style=&quot;margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;Rumah Sakit&lt;/b&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&amp;nbsp;yang berdiri di Malang sejak tahun 2016, beralamat di Jalan Akasia nomer 5C. Rumah Sakit ini adalah sebuah grup Rumah Sakit yang dimiliki oleh PT Mufidah Grup yang membawahi RS Permata Surabaya, RS permata Jakarta Timur dan RS Permata Madiun. Berawal dari tekad ingin mewujudkan Rumah Sakit pilihan keluarga Indonesia yang memberikan pelayanan prima, beretika, bersahabat, memberikan rasa aman, nyaman dan terlindungi, serta second home keluarga Indonesia.&lt;/span&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;/p&gt;&lt;h2 style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;MOTTO&lt;/h2&gt;&lt;p style=&quot;text-align: center; margin-bottom: 15px; padding: 0px; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400;&quot;&gt;"friendly and caring hospital", merupakan komitmen mewujudkan rumah sakit yang benar-benar nyaman, sejuk, penuh keramahan dalam pelayanan, dan menghadirkan nuansa yang menunjang kesembuhan pasien.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `doctor_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = doctor,3=patient'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `doctor_id`, `name`, `address`, `contact`, `username`, `password`, `type`) VALUES
(1, 0, 'Administrator', '', '', 'admin', 'admin123', 1),
(7, 0, 'George Wilson', 'Sample Only', '+18456-5455-55', 'gwilson@sample.com', 'd40242fb23c45206fadee4e2418f274f', 3),
(9, 2, 'DR.James Smith, M.D.', 'Sample Clinic Address', '0821 554 55623', 'jsmith@sample.com', 'jsmith123', 2),
(10, 3, 'DR.Claire Blake, M.D.', 'Sample Only', '+5465 555 623', 'cblake@sample.com', 'blake123', 2),
(11, 0, 'joko', 'kelapa gading', '0812983921', 'joko@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 3),
(12, 4, 'DR.Johan, (M.D)', 'RS.UD', '082732729', 'johan@gmail.com', '12345', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `appointment_list`
--
ALTER TABLE `appointment_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `doctors_list`
--
ALTER TABLE `doctors_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `doctors_schedule`
--
ALTER TABLE `doctors_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `medical_specialty`
--
ALTER TABLE `medical_specialty`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `patient_list`
--
ALTER TABLE `patient_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `appointment_list`
--
ALTER TABLE `appointment_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `doctors_list`
--
ALTER TABLE `doctors_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `doctors_schedule`
--
ALTER TABLE `doctors_schedule`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `medical_specialty`
--
ALTER TABLE `medical_specialty`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `patient_list`
--
ALTER TABLE `patient_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
