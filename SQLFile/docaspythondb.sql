-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: db
-- Thời gian đã tạo: Th2 10, 2026 lúc 07:38 PM
-- Phiên bản máy phục vụ: 8.0.45
-- Phiên bản PHP: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `docaspythondb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_customuser'),
(22, 'Can change user', 6, 'change_customuser'),
(23, 'Can delete user', 6, 'delete_customuser'),
(24, 'Can view user', 6, 'view_customuser'),
(25, 'Can add specialization', 7, 'add_specialization'),
(26, 'Can change specialization', 7, 'change_specialization'),
(27, 'Can delete specialization', 7, 'delete_specialization'),
(28, 'Can view specialization', 7, 'view_specialization'),
(29, 'Can add doctor reg', 8, 'add_doctorreg'),
(30, 'Can change doctor reg', 8, 'change_doctorreg'),
(31, 'Can delete doctor reg', 8, 'delete_doctorreg'),
(32, 'Can view doctor reg', 8, 'view_doctorreg'),
(33, 'Can add appointment', 9, 'add_appointment'),
(34, 'Can change appointment', 9, 'change_appointment'),
(35, 'Can delete appointment', 9, 'delete_appointment'),
(36, 'Can view appointment', 9, 'view_appointment'),
(37, 'Can add page', 10, 'add_page'),
(38, 'Can change page', 10, 'change_page'),
(39, 'Can delete page', 10, 'delete_page'),
(40, 'Can view page', 10, 'view_page');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dasapp_appointment`
--

CREATE TABLE `dasapp_appointment` (
  `id` bigint NOT NULL,
  `appointmentnumber` int NOT NULL,
  `fullname` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `mobilenumber` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `date_of_appointment` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `time_of_appointment` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `additional_msg` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `doctor_id_id` bigint NOT NULL,
  `prescription` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `remark` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `recommendedtest` longtext COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dasapp_appointment`
--

INSERT INTO `dasapp_appointment` (`id`, `appointmentnumber`, `fullname`, `mobilenumber`, `email`, `date_of_appointment`, `time_of_appointment`, `additional_msg`, `created_at`, `updated_at`, `doctor_id_id`, `prescription`, `remark`, `status`, `recommendedtest`) VALUES
(7, 635776554, 'Phạm Khánh Trang', '0367102804', 'trangpk.22it@vku.udn.vn', '2026-02-11', '10:40', 'Nhớ bác sĩ quá', '2026-02-10 14:36:20.012264', '2026-02-10 14:37:03.432978', 8, '0', 'Bác sĩ cx nhớ em', 'Approved', '0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dasapp_customuser`
--

CREATE TABLE `dasapp_customuser` (
  `id` bigint NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `user_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `profile_pic` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dasapp_customuser`
--

INSERT INTO `dasapp_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `user_type`, `profile_pic`) VALUES
(2, 'pbkdf2_sha256$720000$e5L32qv8i6Naoxk0V5YL5B$IP2Nc5L7SsohbBDKCY4kEZamQldZSqTOiE53IiKHH2o=', NULL, 0, 'gar123', 'Garima', 'Singh', 'garima@gmail.com', 0, 1, '2024-02-26 06:29:38.251191', '2', 'media/profile_pic/team2.jpg'),
(3, 'pbkdf2_sha256$390000$zgW4dMmwELvEYcnIgiZOr9$77uF6Z8Sp8DE1h+1agdYPRIDFZKRPjHF8Lv9L6kn7Ss=', '2024-03-07 06:28:42.745297', 0, 'abir123', 'Abir', 'Kumar', 'abir@gmail.com', 0, 1, '2024-02-26 06:30:07.256819', '2', 'media/profile_pic/team1_WNNrlZF.jpg'),
(4, 'pbkdf2_sha256$720000$1drCywe3Jewlm5P3h8JeXw$gTc45Ys2jeAMZvKB3KCSVyz+KeapaT7R4g5FLhDtBE8=', NULL, 0, 'som123', 'Soumya', 'Yadav', 'som@gmail.com', 0, 1, '2024-02-26 06:30:54.396349', '2', 'media/profile_pic/team4_pD84mFP.jpg'),
(5, 'pbkdf2_sha256$720000$fQXxZOAXjEfhO19bUvGl0O$NSQmgkeyR93Kiaz3PiVBAMAW1azwHzMeqTFzR2+jRvg=', NULL, 0, 'har123', 'Harishankar', 'Singh', 'har@gmail.com', 0, 1, '2024-02-26 06:31:39.536109', '2', 'media/profile_pic/s1.jpg'),
(6, 'pbkdf2_sha256$720000$JMn0H0NZSJiNWzEQmf9vAW$z6QsiiOr2tAxnVZYIedP7I7ALpEBeiSM/i12rRHomfo=', NULL, 0, 'renu123', 'Renu', 'Gupta', 'renu@gmail.com', 0, 1, '2024-02-26 06:32:23.336261', '2', 'media/profile_pic/s5.jpg'),
(7, 'pbkdf2_sha256$390000$lk73AkyXIo8bN1r6jMMMPk$xnGk80FZsLzTQ0oIzubBJdklEYqfW9X9vVf3jc2LVus=', '2024-03-06 16:56:50.443286', 0, 'drak30', 'Anuj', 'Kumar', 'ak@gmail.com', 0, 1, '2024-03-06 16:56:05.551943', '2', 'media/profile_pic/travel-agent.png'),
(8, 'pbkdf2_sha256$390000$Xk8MrbR9cPUwgjKRtfNsGI$4vkFOxqiIGbDE5HI/a62CSsEtfIf6DOGz6skblACaoI=', '2024-03-07 17:30:43.935138', 0, 'johndeo12', 'John', 'Doe', 'johndoe12@gmail.com', 0, 1, '2024-03-06 17:22:41.071763', '2', 'media/profile_pic/doctor.png'),
(9, 'pbkdf2_sha256$600000$7euUL0I5zRJowN7R90OskX$2czpLx6BxRGOr3CoS4N1um3MA5o/uqIt4YMMxUUIOzs=', '2026-02-11 02:36:57.733538', 0, 'ntnguyen2034', 'NGUYEN TRUNG', ' NGUYEN', 'nguyenkun555@gmail.com', 0, 1, '2026-02-10 14:16:20.490778', '2', 'media/profile_pic/d9dcc2db-c5bd-44a5-aa3d-9c1a4fa6d479.jpg'),
(10, 'pbkdf2_sha256$600000$eSo8O4tOBqQTtAX3zOljyS$fUr4eLNp7i3SBVUUixESVdJXzlXNm1LpLyaVTAP4myk=', '2026-02-10 14:43:01.871099', 1, 'admin', 'NGUYEN TRUNG', 'NGUYEN', 'admin123@gmail.com', 1, 1, '2026-02-10 14:21:39.323721', '1', 'media/profile_pic/d9dcc2db-c5bd-44a5-aa3d-9c1a4fa6d479_dtruz27.jpg'),
(11, 'pbkdf2_sha256$600000$5qT4gxxeMvGxmyFcqSkWYQ$TtcsBRscQRajfMC82HL/kaqfFHt4Ank6a8hqQ7RH3po=', '2026-02-11 02:37:30.382719', 0, 'dinh123', 'NGUYEN TRUNG', ' DINH', 'dinh123@gmail.com', 0, 1, '2026-02-10 14:48:27.415817', '2', 'media/profile_pic/unnamed.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dasapp_customuser_groups`
--

CREATE TABLE `dasapp_customuser_groups` (
  `id` bigint NOT NULL,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dasapp_customuser_user_permissions`
--

CREATE TABLE `dasapp_customuser_user_permissions` (
  `id` bigint NOT NULL,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dasapp_doctorreg`
--

CREATE TABLE `dasapp_doctorreg` (
  `id` bigint NOT NULL,
  `mobilenumber` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `regdate_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `admin_id` bigint DEFAULT NULL,
  `specialization_id_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dasapp_doctorreg`
--

INSERT INTO `dasapp_doctorreg` (`id`, `mobilenumber`, `regdate_at`, `updated_at`, `admin_id`, `specialization_id_id`) VALUES
(1, '7894561236', '2024-02-26 06:29:39.005447', '2024-02-26 06:29:39.005447', 2, 3),
(2, '7897979878', '2024-02-26 06:30:07.971414', '2024-02-26 06:30:07.971414', 3, 2),
(3, '6464646445', '2024-02-26 06:30:55.169334', '2024-02-26 06:30:55.169334', 4, 10),
(4, '4464564654', '2024-02-26 06:31:40.324768', '2024-02-26 06:31:40.324768', 5, 11),
(5, '6545646546', '2024-02-26 06:32:24.094640', '2024-02-26 06:32:24.095638', 6, 9),
(6, '1414141425', '2024-03-06 16:56:05.764937', '2024-03-06 16:56:05.764937', 7, 13),
(7, '1231231231', '2024-03-06 17:22:41.637519', '2024-03-06 17:22:41.637519', 8, 1),
(8, '0397556616', '2026-02-10 14:16:20.928359', '2026-02-10 14:16:20.928359', 9, 2),
(9, '0373829873', '2026-02-10 14:48:27.820170', '2026-02-10 14:48:27.820170', 11, 13);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dasapp_page`
--

CREATE TABLE `dasapp_page` (
  `id` bigint NOT NULL,
  `pagetitle` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `aboutus` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `mobilenumber` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dasapp_page`
--

INSERT INTO `dasapp_page` (`id`, `pagetitle`, `address`, `aboutus`, `email`, `mobilenumber`, `created_at`, `updated_at`) VALUES
(1, 'Webpage Details', 'H-890, Ajanta Apartment', 'There are around 60 medical specialties and 30 subspecialties that make it harder for doctors to choose their specialization. Based on interest, doctors can choose their medical specialties. However, there are aspects like demand, scope, salary, and availability of the PG medical seat.\r\n\r\nIn such a situation, decision-making would be a tougher job. However, your decision is crucial to can set up a rewarding or dismaying career. Thus, be careful while choosing your medical specialties. The medical courses listed below are in high demand and have a greater scope in India.', 'support@gmail.com', 1234567890, '0000-00-00 00:00:00.000000', '2024-02-26 06:39:16.446263');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dasapp_specialization`
--

CREATE TABLE `dasapp_specialization` (
  `id` bigint NOT NULL,
  `sname` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dasapp_specialization`
--

INSERT INTO `dasapp_specialization` (`id`, `sname`, `created_at`, `updated_at`) VALUES
(1, 'Orthopedics', '2024-02-26 06:24:12.101985', '2024-02-26 06:24:12.101985'),
(2, 'Internal Medicine', '2024-02-26 06:24:25.653848', '2024-02-26 06:24:25.653848'),
(3, 'Obstetrics and Gynecology', '2024-02-26 06:24:35.592772', '2024-02-26 06:24:35.592772'),
(4, 'Dermatology', '2024-02-26 06:24:45.212670', '2024-02-26 06:24:45.212670'),
(5, 'Pediatrics', '2024-02-26 06:24:52.493340', '2024-02-26 06:24:52.493340'),
(6, 'Radiology', '2024-02-26 06:25:00.364941', '2024-02-26 06:25:00.364941'),
(7, 'General Surgery', '2024-02-26 06:25:09.110658', '2024-02-26 06:25:09.110658'),
(8, 'Ophthalmology', '2024-02-26 06:25:16.661938', '2024-02-26 06:25:16.662934'),
(9, 'Family Medicine', '2024-02-26 06:25:27.502854', '2024-02-26 06:25:27.502854'),
(10, 'Chest Medicine', '2024-02-26 06:25:42.886345', '2024-02-26 06:25:42.886345'),
(11, 'Anesthesia', '2024-02-26 06:25:50.029827', '2024-02-26 06:25:50.029827'),
(12, 'Pathology', '2024-02-26 06:25:58.369617', '2024-02-26 06:25:58.369617'),
(13, 'ENT', '2024-02-26 06:26:05.020793', '2024-02-26 06:26:05.020793');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL
) ;

--
-- Đang đổ dữ liệu cho bảng `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2026-02-10 14:22:11.133950', '1', 'admin', 3, '', 6, 10),
(2, '2026-02-10 14:44:41.684220', '6', 'Appointment #749133529 - Garima Singh', 3, '', 9, 10),
(3, '2026-02-10 14:44:46.985814', '5', 'Appointment #718119677 - Amit', 3, '', 9, 10),
(4, '2026-02-10 14:44:50.700516', '4', 'Appointment #288217941 - Tanu Sharma', 3, '', 9, 10),
(5, '2026-02-10 14:44:54.960420', '3', 'Appointment #566162414 - Rakesh Sharma', 3, '', 9, 10),
(6, '2026-02-10 14:44:58.296153', '2', 'Appointment #425778070 - Ram Chandra', 3, '', 9, 10),
(7, '2026-02-10 14:45:01.644348', '1', 'Appointment #925833328 - Harish Kumar', 3, '', 9, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(9, 'dasapp', 'appointment'),
(6, 'dasapp', 'customuser'),
(8, 'dasapp', 'doctorreg'),
(10, 'dasapp', 'page'),
(7, 'dasapp', 'specialization'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-02-26 06:18:09.420094'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-02-26 06:18:09.481700'),
(3, 'auth', '0001_initial', '2024-02-26 06:18:09.719886'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-02-26 06:18:09.767781'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-02-26 06:18:09.777756'),
(6, 'auth', '0004_alter_user_username_opts', '2024-02-26 06:18:09.785828'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-02-26 06:18:09.792851'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-02-26 06:18:09.795805'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-02-26 06:18:09.802735'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-02-26 06:18:09.809677'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-02-26 06:18:09.816658'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-02-26 06:18:09.828747'),
(13, 'auth', '0011_update_proxy_permissions', '2024-02-26 06:18:09.836726'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-02-26 06:18:09.844320'),
(15, 'dasapp', '0001_initial', '2024-02-26 06:18:10.162316'),
(16, 'admin', '0001_initial', '2024-02-26 06:18:10.322744'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-02-26 06:18:10.335918'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-02-26 06:18:10.349882'),
(19, 'dasapp', '0002_alter_customuser_user_type', '2024-02-26 06:18:10.359246'),
(20, 'dasapp', '0003_specialization_alter_customuser_user_type', '2024-02-26 06:18:10.384022'),
(21, 'dasapp', '0004_alter_customuser_user_type_doctorreg', '2024-02-26 06:18:10.517449'),
(22, 'dasapp', '0005_alter_customuser_user_type_appointment', '2024-02-26 06:18:10.638866'),
(23, 'dasapp', '0006_alter_customuser_user_type', '2024-02-26 06:18:10.652829'),
(24, 'dasapp', '0007_alter_appointment_date_of_appointment_and_more', '2024-02-26 06:18:10.764269'),
(25, 'dasapp', '0008_alter_appointment_email', '2024-02-26 06:18:15.083492'),
(26, 'dasapp', '0009_appointment_prescription_appointment_remark_and_more', '2024-02-26 06:18:15.136642'),
(27, 'dasapp', '0010_alter_appointment_prescription_and_more', '2024-02-26 06:18:15.156898'),
(28, 'dasapp', '0011_appointment_recommendedtest_and_more', '2024-02-26 06:18:15.278690'),
(29, 'dasapp', '0012_alter_customuser_user_type', '2024-02-26 06:18:15.290900'),
(30, 'dasapp', '0013_page_alter_customuser_user_type', '2024-02-26 06:18:15.312347'),
(31, 'dasapp', '0014_remove_doctorreg_profile_pic', '2024-02-26 06:18:15.334639'),
(32, 'dasapp', '0015_doctorreg_profile_pic', '2024-02-26 06:18:15.372634'),
(33, 'dasapp', '0016_remove_doctorreg_profile_pic', '2024-02-26 06:18:15.390847'),
(34, 'sessions', '0001_initial', '2024-02-26 06:18:15.425865'),
(35, 'dasapp', '0017_alter_customuser_user_type', '2026-02-10 14:12:43.129831');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('13fzdfbm8tr9v9rtu8ughntqp71sguqo', '.eJxVjDEOwjAMRe-SGUVOUXHMyM4ZIjuOaQG1UtNOFXdHkTrA-t97f3eJt3VIWy1LGtVdXXCn3004v8rUgD55esw-z9O6jOKb4g9a_X3W8r4d7t_BwHVo9fnCaBKZUAHVOislE5NE5J6kB9MgBtGIpMu5y4ASFcgAAxZQ9_kCF385BQ:1rer8c:Di632v5ncN1k7kirlnXNl97SHHuPv004lb5PHg79Fxc', '2024-03-12 06:40:26.826027'),
('lv4jm2dr50ebae6qbww9kwkkd3rkeoel', '.eJxVjM0OwiAQhN-FsyGFIrt69N5nIMvPStVAUtqT8d2lSQ96mmS-b-YtHG1rdltLi5ujuAolTr-dp_BMZQfxQeVeZahlXWYvd0UetMmpxvS6He7fQaaW-_rMMCqMYC35YEyEYaTLoFkjKEI2qEMCC8FwV5g9G5-QQg_N6McoPl_daDh7:1riHdO:fdn9SQZfZ_8Ht0HW8746TQy-Qg2okH-WbUlVJ7-IQIE', '2024-03-21 17:34:22.101361'),
('orq7hxqffhou3bkacjouz53w7s3h4mlx', '.eJxVjMsOwiAQRf-FtSHIhJdL934DGZhBqgaS0q4a_12bdKHbe865m4i4LjWug-c4kbgIEKffLWF-ctsBPbDdu8y9LfOU5K7Igw5568Sv6-H-HVQc9VtrNIScvQ8pZW8dgy9GExjFZwLF3gZwgFaTM0U5sg6DcgU9kDLaFvH-AO33N7k:1rerDn:iuZPwpMypM39VwePXfVCoyHoa2-KQyY6bMBsDJ-Dty4', '2024-03-12 06:45:47.364618');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `dasapp_appointment`
--
ALTER TABLE `dasapp_appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dasapp_appointment_doctor_id_id_045c6f58_fk_dasapp_doctorreg_id` (`doctor_id_id`);

--
-- Chỉ mục cho bảng `dasapp_customuser`
--
ALTER TABLE `dasapp_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `dasapp_customuser_groups`
--
ALTER TABLE `dasapp_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dasapp_customuser_groups_customuser_id_group_id_e4fe99d3_uniq` (`customuser_id`,`group_id`),
  ADD KEY `dasapp_customuser_groups_group_id_cecd6c59_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `dasapp_customuser_user_permissions`
--
ALTER TABLE `dasapp_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dasapp_customuser_user_p_customuser_id_permission_f6b0a96d_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `dasapp_customuser_us_permission_id_28ebaabc_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `dasapp_doctorreg`
--
ALTER TABLE `dasapp_doctorreg`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_id` (`admin_id`),
  ADD KEY `dasapp_doctorreg_specialization_id_id_053c14bd_fk_dasapp_sp` (`specialization_id_id`);

--
-- Chỉ mục cho bảng `dasapp_page`
--
ALTER TABLE `dasapp_page`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `dasapp_specialization`
--
ALTER TABLE `dasapp_specialization`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_dasapp_customuser_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `dasapp_appointment`
--
ALTER TABLE `dasapp_appointment`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `dasapp_customuser`
--
ALTER TABLE `dasapp_customuser`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `dasapp_customuser_groups`
--
ALTER TABLE `dasapp_customuser_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `dasapp_customuser_user_permissions`
--
ALTER TABLE `dasapp_customuser_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `dasapp_doctorreg`
--
ALTER TABLE `dasapp_doctorreg`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `dasapp_page`
--
ALTER TABLE `dasapp_page`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `dasapp_specialization`
--
ALTER TABLE `dasapp_specialization`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Ràng buộc đối với các bảng kết xuất
--

--
-- Ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ràng buộc cho bảng `dasapp_appointment`
--
ALTER TABLE `dasapp_appointment`
  ADD CONSTRAINT `dasapp_appointment_doctor_id_id_045c6f58_fk_dasapp_doctorreg_id` FOREIGN KEY (`doctor_id_id`) REFERENCES `dasapp_doctorreg` (`id`);

--
-- Ràng buộc cho bảng `dasapp_customuser_groups`
--
ALTER TABLE `dasapp_customuser_groups`
  ADD CONSTRAINT `dasapp_customuser_gr_customuser_id_e4c9b5ff_fk_dasapp_cu` FOREIGN KEY (`customuser_id`) REFERENCES `dasapp_customuser` (`id`),
  ADD CONSTRAINT `dasapp_customuser_groups_group_id_cecd6c59_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ràng buộc cho bảng `dasapp_customuser_user_permissions`
--
ALTER TABLE `dasapp_customuser_user_permissions`
  ADD CONSTRAINT `dasapp_customuser_us_customuser_id_5a276bdd_fk_dasapp_cu` FOREIGN KEY (`customuser_id`) REFERENCES `dasapp_customuser` (`id`),
  ADD CONSTRAINT `dasapp_customuser_us_permission_id_28ebaabc_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Ràng buộc cho bảng `dasapp_doctorreg`
--
ALTER TABLE `dasapp_doctorreg`
  ADD CONSTRAINT `dasapp_doctorreg_admin_id_a8e63d8d_fk_dasapp_customuser_id` FOREIGN KEY (`admin_id`) REFERENCES `dasapp_customuser` (`id`),
  ADD CONSTRAINT `dasapp_doctorreg_specialization_id_id_053c14bd_fk_dasapp_sp` FOREIGN KEY (`specialization_id_id`) REFERENCES `dasapp_specialization` (`id`);

--
-- Ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_dasapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `dasapp_customuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
