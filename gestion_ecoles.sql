-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 21 sep. 2026 à 09:28
-- Version du serveur : 8.0.30
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_ecoles`
--

-- --------------------------------------------------------

--
-- Structure de la table `absences`
--

CREATE TABLE `absences` (
  `id` bigint NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `edited_by` int DEFAULT NULL,
  `date_absence` date NOT NULL,
  `motif` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `justifie` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `author_id` bigint DEFAULT NULL,
  `inscriptions_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `absences`
--

INSERT INTO `absences` (`id`, `slug`, `created_at`, `updated_at`, `edited_by`, `date_absence`, `motif`, `justifie`, `author_id`, `inscriptions_id`) VALUES
(1, 'mvyim2g_xxn_yjkll9pmm18fhhnwc4u4lauohhnvlg8', '2026-09-21 09:00:27.863491', '2026-09-21 09:00:27.863516', NULL, '2026-09-22', 'Un cas de malade', 'justifie', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `anneescolaires`
--

CREATE TABLE `anneescolaires` (
  `id` bigint NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `edited_by` int DEFAULT NULL,
  `libele` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `author_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `anneescolaires`
--

INSERT INTO `anneescolaires` (`id`, `slug`, `created_at`, `updated_at`, `edited_by`, `libele`, `date_debut`, `date_fin`, `author_id`) VALUES
(1, 'vaq_1pshtqk0ojziqzbrcoomqjldnjgupwecbxwfiw8', '2026-09-20 16:37:54.269268', '2026-09-20 16:37:54.269296', NULL, '2026-2027', '2026-10-05', '2027-06-15', 1);

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_permission`
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
(21, 'Can add utilisateur', 6, 'add_utilisateur'),
(22, 'Can change utilisateur', 6, 'change_utilisateur'),
(23, 'Can delete utilisateur', 6, 'delete_utilisateur'),
(24, 'Can view utilisateur', 6, 'view_utilisateur'),
(25, 'Can add groupe', 7, 'add_groupe'),
(26, 'Can change groupe', 7, 'change_groupe'),
(27, 'Can delete groupe', 7, 'delete_groupe'),
(28, 'Can view groupe', 7, 'view_groupe'),
(29, 'Can add client', 8, 'add_client'),
(30, 'Can change client', 8, 'change_client'),
(31, 'Can delete client', 8, 'delete_client'),
(32, 'Can view client', 8, 'view_client'),
(33, 'Can add entreprise', 9, 'add_entreprise'),
(34, 'Can change entreprise', 9, 'change_entreprise'),
(35, 'Can delete entreprise', 9, 'delete_entreprise'),
(36, 'Can view entreprise', 9, 'view_entreprise'),
(37, 'Can add annee scolaire', 10, 'add_anneescolaire'),
(38, 'Can change annee scolaire', 10, 'change_anneescolaire'),
(39, 'Can delete annee scolaire', 10, 'delete_anneescolaire'),
(40, 'Can view annee scolaire', 10, 'view_anneescolaire'),
(41, 'Can add enseignant', 11, 'add_enseignant'),
(42, 'Can change enseignant', 11, 'change_enseignant'),
(43, 'Can delete enseignant', 11, 'delete_enseignant'),
(44, 'Can view enseignant', 11, 'view_enseignant'),
(45, 'Can add matiere', 12, 'add_matiere'),
(46, 'Can change matiere', 12, 'change_matiere'),
(47, 'Can delete matiere', 12, 'delete_matiere'),
(48, 'Can view matiere', 12, 'view_matiere'),
(49, 'Can add periode', 13, 'add_periode'),
(50, 'Can change periode', 13, 'change_periode'),
(51, 'Can delete periode', 13, 'delete_periode'),
(52, 'Can view periode', 13, 'view_periode'),
(53, 'Can add classe', 14, 'add_classe'),
(54, 'Can change classe', 14, 'change_classe'),
(55, 'Can delete classe', 14, 'delete_classe'),
(56, 'Can view classe', 14, 'view_classe'),
(57, 'Can add eleve', 15, 'add_eleve'),
(58, 'Can change eleve', 15, 'change_eleve'),
(59, 'Can delete eleve', 15, 'delete_eleve'),
(60, 'Can view eleve', 15, 'view_eleve'),
(61, 'Can add parent', 16, 'add_parent'),
(62, 'Can change parent', 16, 'change_parent'),
(63, 'Can delete parent', 16, 'delete_parent'),
(64, 'Can view parent', 16, 'view_parent'),
(65, 'Can add enseignement', 17, 'add_enseignement'),
(66, 'Can change enseignement', 17, 'change_enseignement'),
(67, 'Can delete enseignement', 17, 'delete_enseignement'),
(68, 'Can view enseignement', 17, 'view_enseignement'),
(69, 'Can add inscription', 18, 'add_inscription'),
(70, 'Can change inscription', 18, 'change_inscription'),
(71, 'Can delete inscription', 18, 'delete_inscription'),
(72, 'Can view inscription', 18, 'view_inscription'),
(73, 'Can add parent eleve', 19, 'add_parenteleve'),
(74, 'Can change parent eleve', 19, 'change_parenteleve'),
(75, 'Can delete parent eleve', 19, 'delete_parenteleve'),
(76, 'Can view parent eleve', 19, 'view_parenteleve'),
(77, 'Can add note', 20, 'add_note'),
(78, 'Can change note', 20, 'change_note'),
(79, 'Can delete note', 20, 'delete_note'),
(80, 'Can view note', 20, 'view_note'),
(81, 'Can add absence', 21, 'add_absence'),
(82, 'Can change absence', 21, 'change_absence'),
(83, 'Can delete absence', 21, 'delete_absence'),
(84, 'Can view absence', 21, 'view_absence'),
(85, 'Can add paiement', 22, 'add_paiement'),
(86, 'Can change paiement', 22, 'change_paiement'),
(87, 'Can delete paiement', 22, 'delete_paiement'),
(88, 'Can view paiement', 22, 'view_paiement');

-- --------------------------------------------------------

--
-- Structure de la table `classes`
--

CREATE TABLE `classes` (
  `id` bigint NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `edited_by` int DEFAULT NULL,
  `nom` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `niveau` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `effectif_max` bigint UNSIGNED NOT NULL,
  `annees_id` bigint NOT NULL,
  `author_id` bigint DEFAULT NULL,
  `enseignants_id` bigint NOT NULL
) ;

--
-- Déchargement des données de la table `classes`
--

INSERT INTO `classes` (`id`, `slug`, `created_at`, `updated_at`, `edited_by`, `nom`, `niveau`, `effectif_max`, `annees_id`, `author_id`, `enseignants_id`) VALUES
(1, 'agf9veiebgbebpojv6ayctmcntdrz7ghjpcl1y7v3ds', '2026-09-20 20:23:24.781671', '2026-09-20 20:31:34.340838', 1, '3eme Année', 'CP1', 500, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` bigint NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `edited_by` int DEFAULT NULL,
  `nom` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `adresse` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `author_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
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

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(21, 'absences', 'absence'),
(6, 'accounts', 'utilisateur'),
(1, 'admin', 'logentry'),
(10, 'annee_scolaires', 'anneescolaire'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(14, 'classes', 'classe'),
(8, 'clients', 'client'),
(4, 'contenttypes', 'contenttype'),
(15, 'eleves', 'eleve'),
(11, 'enseignants', 'enseignant'),
(17, 'enseignements', 'enseignement'),
(9, 'entreprises', 'entreprise'),
(7, 'groupes', 'groupe'),
(18, 'inscriptions', 'inscription'),
(12, 'matieres', 'matiere'),
(20, 'notes', 'note'),
(22, 'paiements', 'paiement'),
(16, 'parents', 'parent'),
(19, 'parent_eleves', 'parenteleve'),
(13, 'periodes', 'periode'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2026-09-20 16:18:51.765441'),
(2, 'contenttypes', '0002_remove_content_type_name', '2026-09-20 16:18:51.820860'),
(3, 'auth', '0001_initial', '2026-09-20 16:18:52.053641'),
(4, 'auth', '0002_alter_permission_name_max_length', '2026-09-20 16:18:52.101906'),
(5, 'auth', '0003_alter_user_email_max_length', '2026-09-20 16:18:52.109893'),
(6, 'auth', '0004_alter_user_username_opts', '2026-09-20 16:18:52.118212'),
(7, 'auth', '0005_alter_user_last_login_null', '2026-09-20 16:18:52.125015'),
(8, 'auth', '0006_require_contenttypes_0002', '2026-09-20 16:18:52.129329'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2026-09-20 16:18:52.139977'),
(10, 'auth', '0008_alter_user_username_max_length', '2026-09-20 16:18:52.149056'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2026-09-20 16:18:52.158596'),
(12, 'auth', '0010_alter_group_name_max_length', '2026-09-20 16:18:52.180205'),
(13, 'auth', '0011_update_proxy_permissions', '2026-09-20 16:18:52.195026'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2026-09-20 16:18:52.203226'),
(15, 'accounts', '0001_initial', '2026-09-20 16:18:52.493245'),
(16, 'admin', '0001_initial', '2026-09-20 16:18:52.629171'),
(17, 'admin', '0002_logentry_remove_auto_add', '2026-09-20 16:18:52.651899'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2026-09-20 16:18:52.673148'),
(19, 'annee_scolaires', '0001_initial', '2026-09-20 16:18:52.790624'),
(20, 'clients', '0001_initial', '2026-09-20 16:18:52.899763'),
(21, 'entreprises', '0001_initial', '2026-09-20 16:18:53.021008'),
(22, 'groupes', '0001_initial', '2026-09-20 16:18:53.133148'),
(23, 'sessions', '0001_initial', '2026-09-20 16:18:53.173136'),
(24, 'enseignants', '0001_initial', '2026-09-20 17:30:52.053787'),
(25, 'matieres', '0001_initial', '2026-09-20 17:40:02.750078'),
(26, 'periodes', '0001_initial', '2026-09-20 18:43:05.203221'),
(27, 'periodes', '0002_alter_periode_libelle', '2026-09-20 19:14:53.630315'),
(28, 'periodes', '0003_alter_periode_date_debut', '2026-09-20 19:44:47.227825'),
(29, 'classes', '0001_initial', '2026-09-20 20:19:17.480439'),
(30, 'classes', '0002_alter_classe_niveau_alter_classe_nom', '2026-09-21 05:57:58.957752'),
(31, 'eleves', '0001_initial', '2026-09-21 05:57:59.069847'),
(32, 'classes', '0003_alter_classe_effectif_max', '2026-09-21 06:20:34.820727'),
(33, 'parents', '0001_initial', '2026-09-21 06:28:23.303180'),
(34, 'enseignements', '0001_initial', '2026-09-21 06:41:31.887044'),
(35, 'eleves', '0002_alter_eleve_date_naissance', '2026-09-21 06:47:58.406397'),
(36, 'enseignements', '0002_alter_enseignement_classes_and_more', '2026-09-21 06:56:58.562213'),
(37, 'inscriptions', '0001_initial', '2026-09-21 07:17:59.234826'),
(38, 'inscriptions', '0002_alter_inscription_status', '2026-09-21 07:40:52.466550'),
(39, 'parent_eleves', '0001_initial', '2026-09-21 07:40:52.570789'),
(40, 'parent_eleves', '0002_alter_parenteleve_eleves_alter_parenteleve_parents', '2026-09-21 07:46:14.780208'),
(41, 'notes', '0001_initial', '2026-09-21 08:14:28.784838'),
(42, 'notes', '0002_alter_note_type_evaluation_alter_note_valeur', '2026-09-21 08:31:00.777141'),
(43, 'absences', '0001_initial', '2026-09-21 08:48:14.333782'),
(44, 'absences', '0002_alter_absence_justifie', '2026-09-21 08:59:01.432675'),
(45, 'paiements', '0001_initial', '2026-09-21 09:22:39.315655');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2f3he1drjqpu5osj1ficgsj3jpbntppp', '.eJxVjMsOwiAQRf-FtSFSOjxcuu83kGEGpGogKe3K-O_apAvd3nPOfYmA21rC1tMSZhYXocTpd4tIj1R3wHestyap1XWZo9wVedAup8bpeT3cv4OCvXxr0Dk69mMiyDiCB8vaAQBqy8yZ2VmK5EENgIhaDVaTMZHJnjlbg-L9AfrhOKI:1x8KHC:OqCwSA1DvkVNso1Vq8-WQFovi-3_WVh7LaZPOrR_hc8', '2026-10-04 16:20:26.043712'),
('o59vl8bir4k53up1qpsz2g9kl56effx3', '.eJxVjMsOwiAQRf-FtSFSOjxcuu83kGEGpGogKe3K-O_apAvd3nPOfYmA21rC1tMSZhYXocTpd4tIj1R3wHestyap1XWZo9wVedAup8bpeT3cv4OCvXxr0Dk69mMiyDiCB8vaAQBqy8yZ2VmK5EENgIhaDVaTMZHJnjlbg-L9AfrhOKI:1x8WdM:_EM9FI544qzIxUVA2KwIL-k0xWT2zdvwJPloceNErGc', '2026-10-05 05:32:08.451074');

-- --------------------------------------------------------

--
-- Structure de la table `eleves`
--

CREATE TABLE `eleves` (
  `id` bigint NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `edited_by` int DEFAULT NULL,
  `nom` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `prenoms` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `date_naissance` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `sexe` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `adresse` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `author_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `eleves`
--

INSERT INTO `eleves` (`id`, `slug`, `created_at`, `updated_at`, `edited_by`, `nom`, `prenoms`, `date_naissance`, `sexe`, `adresse`, `author_id`) VALUES
(1, 'vzzyahdah9x2j1nql9h-r8yw4nqfuckdoslyj6enahq', '2026-09-21 06:03:51.131960', '2026-09-21 06:05:28.946645', 1, 'Diallo', 'Mamadou Yaya', '2026-09-21', 'Masculin', 'Conakry', 1),
(3, 'pkui4kc3s2e0psknz_xcp5s69ftap8ho8gdsf131i7e', '2026-09-21 06:48:12.113408', '2026-09-21 06:48:28.749018', 1, 'Barry', 'Mamadou Yaya', '2026-09-21', 'Masculin', 'Cosa', 1),
(4, '0uf8cuh3_aa2rxpe7fzt0tyaxmbnatadqvoxmciaavc', '2026-09-21 06:48:51.344183', '2026-09-21 06:48:51.344202', NULL, 'Diallo', 'Ibrahima', '2026-09-21', 'Masculin', 'Conakry', 1);

-- --------------------------------------------------------

--
-- Structure de la table `enseignants`
--

CREATE TABLE `enseignants` (
  `id` bigint NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `edited_by` int DEFAULT NULL,
  `nom` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `prenoms` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `date_embauche` date NOT NULL,
  `author_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `enseignants`
--

INSERT INTO `enseignants` (`id`, `slug`, `created_at`, `updated_at`, `edited_by`, `nom`, `prenoms`, `telephone`, `date_embauche`, `author_id`) VALUES
(1, '5hai9r98qggrhawjdt0q-nuwgudmi0rrevlyzphtnks', '2026-09-20 17:52:32.353943', '2026-09-20 17:52:42.824888', 1, 'Diallo', 'Ibrahima', '623 765 345', '2026-09-25', 1);

-- --------------------------------------------------------

--
-- Structure de la table `enseignements`
--

CREATE TABLE `enseignements` (
  `id` bigint NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `edited_by` int DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  `classes_id` bigint NOT NULL,
  `enseignants_id` bigint DEFAULT NULL,
  `matieres_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `enseignements`
--

INSERT INTO `enseignements` (`id`, `slug`, `created_at`, `updated_at`, `edited_by`, `author_id`, `classes_id`, `enseignants_id`, `matieres_id`) VALUES
(1, 'hinketppaumvpdjrd0no62vv6jxhabvp_pbttjvcopa', '2026-09-21 06:58:12.436650', '2026-09-21 06:59:13.817696', 1, 1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `entreprises`
--

CREATE TABLE `entreprises` (
  `id` bigint NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `edited_by` int DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `site_web` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `logo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cachet` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `signature` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `siege_social` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `author_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `groupes`
--

CREATE TABLE `groupes` (
  `group_ptr_id` int NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `edited_by` int DEFAULT NULL,
  `author_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inscriptions`
--

CREATE TABLE `inscriptions` (
  `id` bigint NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `edited_by` int DEFAULT NULL,
  `date_inscription` date NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `author_id` bigint DEFAULT NULL,
  `eleves_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `inscriptions`
--

INSERT INTO `inscriptions` (`id`, `slug`, `created_at`, `updated_at`, `edited_by`, `date_inscription`, `status`, `author_id`, `eleves_id`) VALUES
(1, 'bjqatd_btdmv730nnm0b3p04608vzcjsp7qjxf48eq0', '2026-09-21 07:23:05.634069', '2026-09-21 07:23:05.634094', NULL, '2026-09-03', 'en_attente', 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `matieres`
--

CREATE TABLE `matieres` (
  `id` bigint NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `edited_by` int DEFAULT NULL,
  `nom` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `coefficient` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `author_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `matieres`
--

INSERT INTO `matieres` (`id`, `slug`, `created_at`, `updated_at`, `edited_by`, `nom`, `coefficient`, `author_id`) VALUES
(2, 'fpttqc0ktv7sidflpnxevn8ogy0pmvuk06mmeez46tk', '2026-09-20 17:52:00.891144', '2026-09-20 17:52:00.891190', NULL, 'Histoire', '15', 1);

-- --------------------------------------------------------

--
-- Structure de la table `notes`
--

CREATE TABLE `notes` (
  `id` bigint NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `edited_by` int DEFAULT NULL,
  `valeur` decimal(5,2) NOT NULL,
  `type_evaluation` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `author_id` bigint DEFAULT NULL,
  `inscriptions_id` bigint DEFAULT NULL,
  `matieres_id` bigint DEFAULT NULL,
  `periodes_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `notes`
--

INSERT INTO `notes` (`id`, `slug`, `created_at`, `updated_at`, `edited_by`, `valeur`, `type_evaluation`, `author_id`, `inscriptions_id`, `matieres_id`, `periodes_id`) VALUES
(1, 'uycfraruafjmhz8ost1pz9lerzjuyd1mxldkojidyms', '2026-09-21 08:32:25.530080', '2026-09-21 08:33:12.574249', 1, 15.00, 'examen', 1, 1, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `paiements`
--

CREATE TABLE `paiements` (
  `id` bigint NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `edited_by` int DEFAULT NULL,
  `montant` decimal(20,2) NOT NULL,
  `date_paiement` date NOT NULL,
  `type_frais` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `mode_paiement` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `author_id` bigint DEFAULT NULL,
  `inscriptions_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `paiements`
--

INSERT INTO `paiements` (`id`, `slug`, `created_at`, `updated_at`, `edited_by`, `montant`, `date_paiement`, `type_frais`, `mode_paiement`, `author_id`, `inscriptions_id`) VALUES
(1, 'vvll0cinfdyukiq1v8fzjxybqwj2auk56n3h6mh_7q8', '2026-09-21 09:23:07.752939', '2026-09-21 09:24:58.002941', 1, 1000000.00, '2026-09-21', 'scolarite', 'especes', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `parents`
--

CREATE TABLE `parents` (
  `id` bigint NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `edited_by` int DEFAULT NULL,
  `nom` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `prenoms` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `profession` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `author_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `parents`
--

INSERT INTO `parents` (`id`, `slug`, `created_at`, `updated_at`, `edited_by`, `nom`, `prenoms`, `telephone`, `profession`, `author_id`) VALUES
(1, 'pkejhrg4r0f69-ars6jbosho5qygdmbchnmr8xkzvig', '2026-09-21 06:30:51.095920', '2026-09-21 06:30:51.095959', NULL, 'Diallo', 'Mamadou Yaya', '622345678', 'Informaticien', 1);

-- --------------------------------------------------------

--
-- Structure de la table `parent_eleves`
--

CREATE TABLE `parent_eleves` (
  `id` bigint NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `edited_by` int DEFAULT NULL,
  `eleves_id` bigint DEFAULT NULL,
  `parents_id` bigint DEFAULT NULL,
  `liens_parente` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `author_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `parent_eleves`
--

INSERT INTO `parent_eleves` (`id`, `slug`, `created_at`, `updated_at`, `edited_by`, `eleves_id`, `parents_id`, `liens_parente`, `author_id`) VALUES
(1, 'gryobefud94crphn9kfwznkdq83qw3sw-8f7bjf8uuw', '2026-09-21 07:46:28.022247', '2026-09-21 07:52:21.990318', 1, 4, 1, 'Tuteur', 1),
(2, '8wsg58e3h6wggc7v3dzof6z7oszq4c1zuemjvbhirda', '2026-09-21 07:51:31.684324', '2026-09-21 07:52:30.978693', 1, 3, 1, 'Tuteur', 1);

-- --------------------------------------------------------

--
-- Structure de la table `periodes`
--

CREATE TABLE `periodes` (
  `id` bigint NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `edited_by` int DEFAULT NULL,
  `libelle` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `annees_id` bigint DEFAULT NULL,
  `author_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `periodes`
--

INSERT INTO `periodes` (`id`, `slug`, `created_at`, `updated_at`, `edited_by`, `libelle`, `date_debut`, `date_fin`, `annees_id`, `author_id`) VALUES
(1, 'lcedo2hl8ipiv_ijlxgm25vne0p6idis9aygz1hy3dy', '2026-09-20 19:29:06.468244', '2026-09-20 19:45:06.605328', 1, 'Trimestre 2', '2026-09-20', '2026-10-11', 1, 1),
(2, 'csvlmzelp7gmaatarsd0tveffnb__dz_vaqhfnsiigc', '2026-09-20 19:31:57.947551', '2026-09-20 19:31:57.947573', NULL, 'Trimestre 1', '2026-09-17', '2026-10-31', 1, 1),
(3, '7rzjia12_mca82glinlnwdyi58ff4ycbfbcqduc_0w0', '2026-09-20 19:38:51.879835', '2026-09-20 19:45:12.771078', 1, 'Trimestre 3', '2026-09-01', '2026-09-26', 1, 1),
(4, 'iubxrkgaxtledwcfcaaf0vvn87tuesqmlczmx0y-wug', '2026-09-20 19:44:58.557351', '2026-09-20 19:44:58.557382', NULL, 'Trimestre 1', '2026-09-01', '2026-09-26', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` bigint NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prenoms` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `edited_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `nom`, `prenoms`, `username`, `telephone`, `email`, `photo`, `slug`, `created_at`, `updated_at`, `edited_by`) VALUES
(1, 'pbkdf2_sha256$1000000$zxZlMvS0b5eHIyd2q4xArQ$oDoCM9DOH9TBv4wexKIXsFGd41ZojZEsF6G1+UTMEdE=', '2026-09-21 05:32:08.431593', 1, '', '', 1, 1, '2026-09-20 16:19:44.849284', NULL, NULL, 'Yassar', NULL, 'yassar@gmail.com', '', 'vvdplg1bqft2ykk01wacx-khqhcezhn7uidkyszbrdq', '2026-09-20', '2026-09-20 16:19:45.615704', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs_groups`
--

CREATE TABLE `utilisateurs_groups` (
  `id` bigint NOT NULL,
  `utilisateur_id` bigint NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs_user_permissions`
--

CREATE TABLE `utilisateurs_user_permissions` (
  `id` bigint NOT NULL,
  `utilisateur_id` bigint NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `absences`
--
ALTER TABLE `absences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `absences_author_id_53c194d3_fk_utilisateurs_id` (`author_id`),
  ADD KEY `absences_inscriptions_id_2e76d0dd_fk_inscriptions_id` (`inscriptions_id`);

--
-- Index pour la table `anneescolaires`
--
ALTER TABLE `anneescolaires`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `libele` (`libele`),
  ADD UNIQUE KEY `date_debut` (`date_debut`),
  ADD KEY `anneescolaires_author_id_b1a9dd44_fk_utilisateurs_id` (`author_id`);

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `classes_annees_id_64df7091_fk_anneescolaires_id` (`annees_id`),
  ADD KEY `classes_author_id_d3dd9ce6_fk_utilisateurs_id` (`author_id`),
  ADD KEY `classes_enseignants_id_579855d2_fk_enseignants_id` (`enseignants_id`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `nom` (`nom`),
  ADD UNIQUE KEY `telephone` (`telephone`),
  ADD KEY `clients_author_id_bfd4e7cd_fk_utilisateurs_id` (`author_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_utilisateurs_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `eleves`
--
ALTER TABLE `eleves`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `eleves_author_id_15c2f345_fk_utilisateurs_id` (`author_id`);

--
-- Index pour la table `enseignants`
--
ALTER TABLE `enseignants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `nom` (`nom`),
  ADD UNIQUE KEY `prenoms` (`prenoms`),
  ADD UNIQUE KEY `telephone` (`telephone`),
  ADD KEY `enseignants_author_id_83041e5f_fk_utilisateurs_id` (`author_id`);

--
-- Index pour la table `enseignements`
--
ALTER TABLE `enseignements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `enseignements_author_id_87daee72_fk_utilisateurs_id` (`author_id`),
  ADD KEY `enseignements_classes_id_ff2243b0_fk_classes_id` (`classes_id`),
  ADD KEY `enseignements_enseignants_id_0f1210c8_fk_enseignants_id` (`enseignants_id`),
  ADD KEY `enseignements_matieres_id_4a1af853_fk_matieres_id` (`matieres_id`);

--
-- Index pour la table `entreprises`
--
ALTER TABLE `entreprises`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `entreprises_author_id_d0c3502a_fk_utilisateurs_id` (`author_id`);

--
-- Index pour la table `groupes`
--
ALTER TABLE `groupes`
  ADD PRIMARY KEY (`group_ptr_id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `groupes_author_id_d684258a_fk_utilisateurs_id` (`author_id`);

--
-- Index pour la table `inscriptions`
--
ALTER TABLE `inscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `inscriptions_author_id_26116ced_fk_utilisateurs_id` (`author_id`),
  ADD KEY `inscriptions_eleves_id_6ee44c90_fk_eleves_id` (`eleves_id`);

--
-- Index pour la table `matieres`
--
ALTER TABLE `matieres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `nom` (`nom`),
  ADD UNIQUE KEY `coefficient` (`coefficient`),
  ADD KEY `matieres_author_id_66b17431_fk_utilisateurs_id` (`author_id`);

--
-- Index pour la table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `notes_author_id_7991aa31_fk_utilisateurs_id` (`author_id`),
  ADD KEY `notes_inscriptions_id_772679c8_fk_inscriptions_id` (`inscriptions_id`),
  ADD KEY `notes_matieres_id_98651779_fk_matieres_id` (`matieres_id`),
  ADD KEY `notes_periodes_id_76855ba7_fk_periodes_id` (`periodes_id`);

--
-- Index pour la table `paiements`
--
ALTER TABLE `paiements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `paiements_author_id_e3c65508_fk_utilisateurs_id` (`author_id`),
  ADD KEY `paiements_inscriptions_id_79c34775_fk_inscriptions_id` (`inscriptions_id`);

--
-- Index pour la table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `parents_author_id_331d7f6f_fk_utilisateurs_id` (`author_id`);

--
-- Index pour la table `parent_eleves`
--
ALTER TABLE `parent_eleves`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `parent_eleves_author_id_94cff039_fk_utilisateurs_id` (`author_id`),
  ADD KEY `parent_eleves_eleves_id_7737733a` (`eleves_id`),
  ADD KEY `parent_eleves_parents_id_c57a6bfb` (`parents_id`);

--
-- Index pour la table `periodes`
--
ALTER TABLE `periodes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `periodes_annees_id_26fd83e7_fk_anneescolaires_id` (`annees_id`),
  ADD KEY `periodes_author_id_f4c464ea_fk_utilisateurs_id` (`author_id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `telephone` (`telephone`);

--
-- Index pour la table `utilisateurs_groups`
--
ALTER TABLE `utilisateurs_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `utilisateurs_groups_utilisateur_id_group_id_80fe46e1_uniq` (`utilisateur_id`,`group_id`),
  ADD KEY `utilisateurs_groups_group_id_7d602c3f_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `utilisateurs_user_permissions`
--
ALTER TABLE `utilisateurs_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `utilisateurs_user_permis_utilisateur_id_permissio_ff3347ce_uniq` (`utilisateur_id`,`permission_id`),
  ADD KEY `utilisateurs_user_pe_permission_id_d710cdb6_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `absences`
--
ALTER TABLE `absences`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `anneescolaires`
--
ALTER TABLE `anneescolaires`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT pour la table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pour la table `eleves`
--
ALTER TABLE `eleves`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `enseignants`
--
ALTER TABLE `enseignants`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `enseignements`
--
ALTER TABLE `enseignements`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `entreprises`
--
ALTER TABLE `entreprises`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `inscriptions`
--
ALTER TABLE `inscriptions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `matieres`
--
ALTER TABLE `matieres`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `paiements`
--
ALTER TABLE `paiements`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `parents`
--
ALTER TABLE `parents`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `parent_eleves`
--
ALTER TABLE `parent_eleves`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `periodes`
--
ALTER TABLE `periodes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `utilisateurs_groups`
--
ALTER TABLE `utilisateurs_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateurs_user_permissions`
--
ALTER TABLE `utilisateurs_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `absences`
--
ALTER TABLE `absences`
  ADD CONSTRAINT `absences_author_id_53c194d3_fk_utilisateurs_id` FOREIGN KEY (`author_id`) REFERENCES `utilisateurs` (`id`),
  ADD CONSTRAINT `absences_inscriptions_id_2e76d0dd_fk_inscriptions_id` FOREIGN KEY (`inscriptions_id`) REFERENCES `inscriptions` (`id`);

--
-- Contraintes pour la table `anneescolaires`
--
ALTER TABLE `anneescolaires`
  ADD CONSTRAINT `anneescolaires_author_id_b1a9dd44_fk_utilisateurs_id` FOREIGN KEY (`author_id`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_annees_id_64df7091_fk_anneescolaires_id` FOREIGN KEY (`annees_id`) REFERENCES `anneescolaires` (`id`),
  ADD CONSTRAINT `classes_author_id_d3dd9ce6_fk_utilisateurs_id` FOREIGN KEY (`author_id`) REFERENCES `utilisateurs` (`id`),
  ADD CONSTRAINT `classes_enseignants_id_579855d2_fk_enseignants_id` FOREIGN KEY (`enseignants_id`) REFERENCES `enseignants` (`id`);

--
-- Contraintes pour la table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_author_id_bfd4e7cd_fk_utilisateurs_id` FOREIGN KEY (`author_id`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_utilisateurs_id` FOREIGN KEY (`user_id`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `eleves`
--
ALTER TABLE `eleves`
  ADD CONSTRAINT `eleves_author_id_15c2f345_fk_utilisateurs_id` FOREIGN KEY (`author_id`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `enseignants`
--
ALTER TABLE `enseignants`
  ADD CONSTRAINT `enseignants_author_id_83041e5f_fk_utilisateurs_id` FOREIGN KEY (`author_id`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `enseignements`
--
ALTER TABLE `enseignements`
  ADD CONSTRAINT `enseignements_author_id_87daee72_fk_utilisateurs_id` FOREIGN KEY (`author_id`) REFERENCES `utilisateurs` (`id`),
  ADD CONSTRAINT `enseignements_classes_id_ff2243b0_fk_classes_id` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `enseignements_enseignants_id_0f1210c8_fk_enseignants_id` FOREIGN KEY (`enseignants_id`) REFERENCES `enseignants` (`id`),
  ADD CONSTRAINT `enseignements_matieres_id_4a1af853_fk_matieres_id` FOREIGN KEY (`matieres_id`) REFERENCES `matieres` (`id`);

--
-- Contraintes pour la table `entreprises`
--
ALTER TABLE `entreprises`
  ADD CONSTRAINT `entreprises_author_id_d0c3502a_fk_utilisateurs_id` FOREIGN KEY (`author_id`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `groupes`
--
ALTER TABLE `groupes`
  ADD CONSTRAINT `groupes_author_id_d684258a_fk_utilisateurs_id` FOREIGN KEY (`author_id`) REFERENCES `utilisateurs` (`id`),
  ADD CONSTRAINT `groupes_group_ptr_id_59533c4b_fk_auth_group_id` FOREIGN KEY (`group_ptr_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `inscriptions`
--
ALTER TABLE `inscriptions`
  ADD CONSTRAINT `inscriptions_author_id_26116ced_fk_utilisateurs_id` FOREIGN KEY (`author_id`) REFERENCES `utilisateurs` (`id`),
  ADD CONSTRAINT `inscriptions_eleves_id_6ee44c90_fk_eleves_id` FOREIGN KEY (`eleves_id`) REFERENCES `eleves` (`id`);

--
-- Contraintes pour la table `matieres`
--
ALTER TABLE `matieres`
  ADD CONSTRAINT `matieres_author_id_66b17431_fk_utilisateurs_id` FOREIGN KEY (`author_id`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_author_id_7991aa31_fk_utilisateurs_id` FOREIGN KEY (`author_id`) REFERENCES `utilisateurs` (`id`),
  ADD CONSTRAINT `notes_inscriptions_id_772679c8_fk_inscriptions_id` FOREIGN KEY (`inscriptions_id`) REFERENCES `inscriptions` (`id`),
  ADD CONSTRAINT `notes_matieres_id_98651779_fk_matieres_id` FOREIGN KEY (`matieres_id`) REFERENCES `matieres` (`id`),
  ADD CONSTRAINT `notes_periodes_id_76855ba7_fk_periodes_id` FOREIGN KEY (`periodes_id`) REFERENCES `periodes` (`id`);

--
-- Contraintes pour la table `paiements`
--
ALTER TABLE `paiements`
  ADD CONSTRAINT `paiements_author_id_e3c65508_fk_utilisateurs_id` FOREIGN KEY (`author_id`) REFERENCES `utilisateurs` (`id`),
  ADD CONSTRAINT `paiements_inscriptions_id_79c34775_fk_inscriptions_id` FOREIGN KEY (`inscriptions_id`) REFERENCES `inscriptions` (`id`);

--
-- Contraintes pour la table `parents`
--
ALTER TABLE `parents`
  ADD CONSTRAINT `parents_author_id_331d7f6f_fk_utilisateurs_id` FOREIGN KEY (`author_id`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `parent_eleves`
--
ALTER TABLE `parent_eleves`
  ADD CONSTRAINT `parent_eleves_author_id_94cff039_fk_utilisateurs_id` FOREIGN KEY (`author_id`) REFERENCES `utilisateurs` (`id`),
  ADD CONSTRAINT `parent_eleves_eleves_id_7737733a_fk_eleves_id` FOREIGN KEY (`eleves_id`) REFERENCES `eleves` (`id`),
  ADD CONSTRAINT `parent_eleves_parents_id_c57a6bfb_fk_parents_id` FOREIGN KEY (`parents_id`) REFERENCES `parents` (`id`);

--
-- Contraintes pour la table `periodes`
--
ALTER TABLE `periodes`
  ADD CONSTRAINT `periodes_annees_id_26fd83e7_fk_anneescolaires_id` FOREIGN KEY (`annees_id`) REFERENCES `anneescolaires` (`id`),
  ADD CONSTRAINT `periodes_author_id_f4c464ea_fk_utilisateurs_id` FOREIGN KEY (`author_id`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `utilisateurs_groups`
--
ALTER TABLE `utilisateurs_groups`
  ADD CONSTRAINT `utilisateurs_groups_group_id_7d602c3f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `utilisateurs_groups_utilisateur_id_4e57b40e_fk_utilisateurs_id` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `utilisateurs_user_permissions`
--
ALTER TABLE `utilisateurs_user_permissions`
  ADD CONSTRAINT `utilisateurs_user_pe_permission_id_d710cdb6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `utilisateurs_user_pe_utilisateur_id_15ce9124_fk_utilisate` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
