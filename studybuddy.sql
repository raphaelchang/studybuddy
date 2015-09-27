-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 27, 2015 at 01:31 AM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `studybuddy`
--

-- --------------------------------------------------------

--
-- Table structure for table `activation_keys`
--

CREATE TABLE `activation_keys` (
  `user_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `attendees`
--

CREATE TABLE `attendees` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendees`
--

INSERT INTO `attendees` (`id`, `user_id`, `post_id`) VALUES
(10, 4, 10);

-- --------------------------------------------------------

--
-- Table structure for table `colleges`
--

CREATE TABLE `colleges` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `colleges`
--

INSERT INTO `colleges` (`id`, `name`, `domain`) VALUES
(1, 'Massachusetts Institute of Technology', 'mit.edu'),
(2, 'Georgia Institute of Technology', 'gatech.edu'),
(3, 'University of Illinois Urbana-Champaign', 'uiuc.edu');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `college_id` int(11) NOT NULL,
  `department` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `college_id`, `department`, `number`, `title`) VALUES
(1, 1, '6', '.002', 'Circuits & Electronics'),
(2, 1, '6', '.01', 'Introduction to EECS I'),
(3, 1, '6', '.02', 'Introduction to EECS II'),
(4, 1, '6', '.003', 'Signals & Systems'),
(5, 1, '18', '.01', 'Calculus I'),
(6, 1, '18', '.02', 'Calculus II'),
(7, 1, '18', '.03', 'Differential Equations'),
(8, 2, 'ME', ' 2110', 'Creative Decisions and Design'),
(9, 2, 'MSE', ' 2001', 'Materials Science'),
(10, 2, 'COE', ' 3001', 'Deformable Bodies'),
(11, 2, 'CS', ' 1371', 'Computing for Engineers'),
(12, 2, 'PHYS', ' 2212', 'Physics 2: E&M'),
(13, 2, 'MATH', ' 2552', 'Differential Equations'),
(14, 2, 'COE', ' 2001', 'Statics'),
(15, 2, 'ID', ' 2202', 'History of Chairs'),
(16, 2, 'CHEM', ' 1212', 'Chemistry'),
(17, 3, 'AAS', '100', 'Intro Asian American Studies'),
(18, 3, 'AAS', '120', 'Intro to Asian Am Pop Culture'),
(19, 3, 'AAS', '215', 'US Citizenship Comparatively'),
(20, 3, 'AAS', '250', 'Asian American Ethnic Groups'),
(21, 3, 'AAS', '265', 'Politics of Hip Hop'),
(22, 3, 'AAS', '281', 'Constructing Race in America'),
(23, 3, 'AAS', '283', 'Asian American History'),
(24, 3, 'AAS', '286', 'Asian American Literature'),
(25, 3, 'AAS', '297', 'Asian Families in America'),
(26, 3, 'AAS', '299', 'Begin Topics Asian Am Studies'),
(27, 3, 'AAS', '310', 'Race and Cultural Diversity'),
(28, 3, 'AAS', '317', 'Asian American Politics'),
(29, 3, 'AAS', '365', 'Asian American Media and Film'),
(30, 3, 'AAS', '390', 'Intermed Topics Asian Am St'),
(31, 3, 'AAS', '501', 'Theory and Methods in AAS'),
(32, 3, 'AAS', '539', 'Youth, Culture and Society'),
(33, 3, 'AAS', '561', 'Race and Cultural Critique'),
(34, 3, 'ABE', '141', 'ABE Principles: Biological'),
(35, 3, 'ABE', '199', 'Undergraduate Open Seminar'),
(36, 3, 'ABE', '225', 'ABE Principles: Bioenvironment'),
(37, 3, 'ABE', '226', 'ABE Principles: Bioprocessing'),
(38, 3, 'ABE', '397', 'Independent Study'),
(39, 3, 'ABE', '425', 'Engrg Measurement Systems'),
(40, 3, 'ABE', '436', 'Renewable Energy Systems'),
(41, 3, 'ABE', '440', 'Applied Statistical Methods I'),
(42, 3, 'ABE', '445', 'Statistical Methods'),
(43, 3, 'ABE', '446', 'Biological Nanoengineering'),
(44, 3, 'ABE', '456', 'Land & Water Resources Engrg'),
(45, 3, 'ABE', '457', 'NPS Pollution Processes'),
(46, 3, 'ABE', '458', 'NPS Pollution Modeling'),
(47, 3, 'ABE', '469', 'Industry-Linked Design Project'),
(48, 3, 'ABE', '497', 'Independent Study'),
(49, 3, 'ABE', '498', 'Special Topics'),
(50, 3, 'ABE', '594', 'Graduate Seminar'),
(51, 3, 'ABE', '597', 'Independent Study'),
(52, 3, 'ABE', '599', 'Thesis Research'),
(53, 3, 'ACCY', '199', 'Undergraduate Open Seminar'),
(54, 3, 'ACCY', '200', 'Fundamentals of Accounting'),
(55, 3, 'ACCY', '201', 'Accounting and Accountancy I'),
(56, 3, 'ACCY', '202', 'Accounting and Accountancy II'),
(57, 3, 'ACCY', '290', 'Prof Internship in Accountancy'),
(58, 3, 'ACCY', '301', 'Atg Measurement & Disclosure'),
(59, 3, 'ACCY', '302', 'Decision Making for Atg'),
(60, 3, 'ACCY', '303', 'Atg Institutions and Reg'),
(61, 3, 'ACCY', '304', 'Accounting Control Systems'),
(62, 3, 'ACCY', '312', 'Principles of Taxation'),
(63, 3, 'ACCY', '321', 'Principles of Public Policy'),
(64, 3, 'ACCY', '352', 'Database Design and Management'),
(65, 3, 'ACCY', '353', 'Info Sys Analysis and Design'),
(66, 3, 'ACCY', '398', 'Practical Problems in Atg'),
(67, 3, 'ACCY', '405', 'Assurance and Attestation'),
(68, 3, 'ACCY', '410', 'Advanced Financial Reporting'),
(69, 3, 'ACCY', '451', 'Advanced Income Tax Problems'),
(70, 3, 'ACCY', '499', 'Senior Research'),
(71, 3, 'ACCY', '500', 'Atg Measuremnt, Rpting & Cntrl'),
(72, 3, 'ACCY', '503', 'Managerial Accounting'),
(73, 3, 'ACCY', '504', 'Auditing'),
(74, 3, 'ACCY', '510', 'Financial Reporting Standards'),
(75, 3, 'ACCY', '511', 'Risk Measurement/Reporting I'),
(76, 3, 'ACCY', '512', 'Risk Measurement/Reporting II'),
(77, 3, 'ACCY', '515', 'Auditing & Assurance Standards'),
(78, 3, 'ACCY', '517', 'Financial Statement Analysis'),
(79, 3, 'ACCY', '552', 'Partnership Income Taxation'),
(80, 3, 'ACCY', '555', 'Inc Tx Acctg & Multistate Tx'),
(81, 3, 'ACCY', '557', 'Advanced Topics in Taxation'),
(82, 3, 'ACCY', '561', 'Taxes and Business Strategy'),
(83, 3, 'ACCY', '593', 'Special Research Problems'),
(84, 3, 'ACCY', '594', 'Doctoral Research Seminar'),
(85, 3, 'ACCY', '595', 'Models of Decision and Choice'),
(86, 3, 'ACCY', '599', 'Thesis Research'),
(87, 3, 'ACE', '100', 'Agr Cons and Resource Econ'),
(88, 3, 'ACE', '161', 'Microcomputer Applications'),
(89, 3, 'ACE', '199', 'Undergraduate Open Seminar'),
(90, 3, 'ACE', '231', 'Food and Agribusiness Mgt'),
(91, 3, 'ACE', '232', 'Management of Farm Enterprises'),
(92, 3, 'ACE', '240', 'Personal Financial Planning'),
(93, 3, 'ACE', '251', 'The World Food Economy'),
(94, 3, 'ACE', '254', 'Economic Systems in Africa'),
(95, 3, 'ACE', '261', 'Applied Statistical Methods'),
(96, 3, 'ACE', '270', 'Consumer Economics'),
(97, 3, 'ACE', '293', 'Off-Campus Internship'),
(98, 3, 'ACE', '294', 'On-Campus Internship'),
(99, 3, 'ACE', '295', 'Independent Study'),
(100, 3, 'ACE', '310', 'Natural Resource Economics'),
(101, 3, 'ACE', '360', 'Spreadsheet Models & Applic'),
(102, 3, 'ACE', '396', 'Honors Research or Thesis'),
(103, 3, 'ACE', '398', 'Seminar'),
(104, 3, 'ACE', '403', 'Agricultural Law'),
(105, 3, 'ACE', '406', 'Environmental Law'),
(106, 3, 'ACE', '427', 'Commodity Price Analysis'),
(107, 3, 'ACE', '428', 'Commodity Futures and Options'),
(108, 3, 'ACE', '430', 'Food Marketing'),
(109, 3, 'ACE', '431', 'Agri-food Strategic Management'),
(110, 3, 'ACE', '435', 'Global Agribusiness Management'),
(111, 3, 'ACE', '436', 'Intl Business Immersion'),
(112, 3, 'ACE', '440', 'Finan Plan for Professionals'),
(113, 3, 'ACE', '444', 'Finan Serv & Invest Plan'),
(114, 3, 'ACE', '445', 'Intermediate Personal Fin Plan'),
(115, 3, 'ACE', '446', 'Modeling App''s Finan Plan'),
(116, 3, 'ACE', '448', 'Rural Real Estate Appraisal'),
(117, 3, 'ACE', '449', 'Retirement & Benefit Planning'),
(118, 3, 'ACE', '451', 'Agriculture in Intl Dev'),
(119, 3, 'ACE', '452', 'The Latin American Economies'),
(120, 3, 'ACE', '456', 'Agr and Food Policies'),
(121, 3, 'ACE', '474', 'Econ of Consumption'),
(122, 3, 'ACE', '476', 'Family Economics'),
(123, 3, 'ACE', '496', 'Practicum'),
(124, 3, 'ACE', '499', 'Seminar'),
(125, 3, 'ACE', '502', 'Demand/Supply/Firms/Households'),
(126, 3, 'ACE', '503', 'Equilibrium and Welfare Econ'),
(127, 3, 'ACE', '516', 'Environmental Economics'),
(128, 3, 'ACE', '528', 'Research in Futures Markets'),
(129, 3, 'ACE', '530', 'Microeconometrics'),
(130, 3, 'ACE', '557', 'Food, Poverty and Development'),
(131, 3, 'ACE', '559', 'Food, Trade and Development'),
(132, 3, 'ACE', '561', 'Adv Res and Scholarly Comm'),
(133, 3, 'ACE', '563', 'Math Program App Econ I'),
(134, 3, 'ACE', '567', 'Math Program App Econ II'),
(135, 3, 'ACE', '591', 'Independent Study'),
(136, 3, 'ACE', '592', 'Special Topics'),
(137, 3, 'ACE', '594', 'Seminars and Workshops'),
(138, 3, 'ACE', '599', 'Thesis Research'),
(139, 3, 'ACES', '199', 'Undergraduate Open Seminar'),
(140, 3, 'ACES', '293', 'International Internship'),
(141, 3, 'ACES', '298', 'International Experience'),
(142, 3, 'ACES', '299', 'ACES Study Abroad'),
(143, 3, 'ACES', '396', 'UG Honors Research or Thesis'),
(144, 3, 'ACES', '399', 'Honors Seminar'),
(145, 3, 'ACES', '501', 'Advanced Bioenergy Topics'),
(146, 3, 'ADV', '150', 'Introduction to Advertising'),
(147, 3, 'ADV', '199', 'Undergraduate Seminar'),
(148, 3, 'ADV', '281', 'Advertising Research Methods'),
(149, 3, 'ADV', '283', 'Content, Contact, Connections'),
(150, 3, 'ADV', '284', 'Consumer Insight'),
(151, 3, 'ADV', '310', 'Intro to Public Relations'),
(152, 3, 'ADV', '312', 'Advertising History'),
(153, 3, 'ADV', '315', 'Emerging Media'),
(154, 3, 'ADV', '350', 'Writing for Public Relations'),
(155, 3, 'ADV', '390', 'Content Creation'),
(156, 3, 'ADV', '393', 'Advertising and Society'),
(157, 3, 'ADV', '399', 'Advertising Study Abroad'),
(158, 3, 'ADV', '400', 'Special Problems'),
(159, 3, 'ADV', '410', 'Advanced Public Relations'),
(160, 3, 'ADV', '454', 'Creative Concepts II'),
(161, 3, 'ADV', '460', 'Innovation in Advertising'),
(162, 3, 'ADV', '475', 'Multicultural Advertising'),
(163, 3, 'ADV', '483', 'Audience Analysis'),
(164, 3, 'ADV', '484', 'Quantitative Research Methods'),
(165, 3, 'ADV', '490', 'Special Topics in Advertising'),
(166, 3, 'ADV', '495', 'Internship Seminar'),
(167, 3, 'ADV', '581', 'Quanti Research Methods in Adv'),
(168, 3, 'ADV', '588', 'Graduate Seminar II'),
(169, 3, 'ADV', '590', 'Special Topics in Advertising'),
(170, 3, 'ADV', '599', 'Thesis Research'),
(171, 3, 'AE', '100', 'Intro to Aerospace Engineering'),
(172, 3, 'AE', '199', 'Undergraduate Open Seminar'),
(173, 3, 'AE', '202', 'Aerospace Flight Mechanics'),
(174, 3, 'AE', '298', 'Special Topics'),
(175, 3, 'AE', '312', 'Compressible Flow'),
(176, 3, 'AE', '323', 'Applied Aerospace Structures'),
(177, 3, 'AE', '353', 'Aerospace Control Systems'),
(178, 3, 'AE', '370', 'Aerospace Numerical Methods'),
(179, 3, 'AE', '395', 'Honors Project'),
(180, 3, 'AE', '396', 'Honors Seminar'),
(181, 3, 'AE', '397', 'Independent Study'),
(182, 3, 'AE', '403', 'Spacecraft Attitude Control'),
(183, 3, 'AE', '410', 'Computational Aerodynamics'),
(184, 3, 'AE', '419', 'Aircraft Flight Mechanics'),
(185, 3, 'AE', '420', 'Finite Element Analysis'),
(186, 3, 'AE', '434', 'Rocket Propulsion'),
(187, 3, 'AE', '435', 'Electric Propulsion'),
(188, 3, 'AE', '443', 'Aerospace Systems Design II'),
(189, 3, 'AE', '461', 'Structures & Control Lab'),
(190, 3, 'AE', '497', 'Independent Study'),
(191, 3, 'AE', '498', 'Special Topics'),
(192, 3, 'AE', '502', 'Advanced Orbital Mechanics'),
(193, 3, 'AE', '514', 'Boundary Layer Theory'),
(194, 3, 'AE', '515', 'Wing Theory'),
(195, 3, 'AE', '522', 'Dynamic Response of Materials'),
(196, 3, 'AE', '526', 'Composites Manufacturing'),
(197, 3, 'AE', '538', 'Combustion Fundamentals'),
(198, 3, 'AE', '543', 'Aerospace Syst Engineering II'),
(199, 3, 'AE', '554', 'Dynamical Systems Theory'),
(200, 3, 'AE', '555', 'Multivariable Control Design'),
(201, 3, 'AE', '590', 'Seminar'),
(202, 3, 'AE', '597', 'Independent Study'),
(203, 3, 'AE', '598', 'Special Topics'),
(204, 3, 'AE', '599', 'Thesis Research'),
(205, 3, 'AFAS', '102', 'Leadership Laboratory'),
(206, 3, 'AFAS', '112', 'Found of the US Air Force II'),
(207, 3, 'AFAS', '222', 'Evolution Air & Space Power II'),
(208, 3, 'AFAS', '332', 'USAF Leadership Studies II'),
(209, 3, 'AFAS', '342', 'Nat Sec Afrs/Prep Actv Duty II'),
(210, 3, 'AFRO', '100', 'Intro to African American St'),
(211, 3, 'AFRO', '101', 'Black America, 1619-Present'),
(212, 3, 'AFRO', '102', 'Researching the African Am Exp'),
(213, 3, 'AFRO', '103', 'Black Women in the Diaspora'),
(214, 3, 'AFRO', '105', 'Black Literature in America'),
(215, 3, 'AFRO', '199', 'Undergraduate Open Seminar'),
(216, 3, 'AFRO', '212', 'Intro African American Theat'),
(217, 3, 'AFRO', '215', 'US Citizenship Comparatively'),
(218, 3, 'AFRO', '220', 'Intro to Research Methods AfAm'),
(219, 3, 'AFRO', '225', 'Race and Ethnicity'),
(220, 3, 'AFRO', '260', 'Afro-American Literature II'),
(221, 3, 'AFRO', '261', 'Intro to the African Diaspora'),
(222, 3, 'AFRO', '275', 'Afro-American History to 1877'),
(223, 3, 'AFRO', '276', 'Afro-American Hist Since 1877'),
(224, 3, 'AFRO', '281', 'Constructing Race in America'),
(225, 3, 'AFRO', '287', 'African-American Women'),
(226, 3, 'AFRO', '298', 'Spec Topics African-Am Studies'),
(227, 3, 'AFRO', '310', 'Race and Cultural Diversity'),
(228, 3, 'AFRO', '340', 'Dancing Black Popular Culture'),
(229, 3, 'AFRO', '341', 'Gov & Pol in Africa'),
(230, 3, 'AFRO', '383', 'Hist of Blk Women''s Activism'),
(231, 3, 'AFRO', '410', 'Hate Crimes'),
(232, 3, 'AFRO', '415', 'Africana Feminisms'),
(233, 3, 'AFRO', '421', 'Racial and Ethnic Families'),
(234, 3, 'AFRO', '460', 'Slavery in the United States'),
(235, 3, 'AFRO', '495', 'Senior Thesis Seminar'),
(236, 3, 'AFRO', '498', 'Spec Topics African Am Studies'),
(237, 3, 'AFRO', '501', 'Problems African American Hist'),
(238, 3, 'AFRO', '502', 'Res Method on Racial Community'),
(239, 3, 'AFRO', '531', 'Race and Cultural Critique'),
(240, 3, 'AFRO', '595', 'Directed Independent Readings'),
(241, 3, 'AFRO', '598', 'Res Sem in African-Am Studies'),
(242, 3, 'AFST', '103', 'Black Women in the Diaspora'),
(243, 3, 'AFST', '199', 'Undergraduate Open Seminar'),
(244, 3, 'AFST', '232', 'Elementary Swahili II'),
(245, 3, 'AFST', '242', 'Elementary Wolof II'),
(246, 3, 'AFST', '254', 'Economic Systems in Africa'),
(247, 3, 'AFST', '410', 'Modern African Fiction'),
(248, 3, 'AFST', '420', 'Africana Feminisms'),
(249, 3, 'AFST', '434', 'Intermediate Swahili II'),
(250, 3, 'AFST', '436', 'Advanced Swahili II'),
(251, 3, 'AFST', '444', 'Intermediate Wolof II'),
(252, 3, 'AFST', '446', 'Advanced Wolof II'),
(253, 3, 'AFST', '478', 'African Immigrants in Europe'),
(254, 3, 'AFST', '510', 'Problems in African History'),
(255, 3, 'AFST', '550', 'Special Topics'),
(256, 3, 'AFST', '599', 'Thesis Research'),
(257, 3, 'AGCM', '199', 'Undergraduate Open Seminar'),
(258, 3, 'AGCM', '220', 'Communicating Agriculture'),
(259, 3, 'AGCM', '293', 'Communications Internship'),
(260, 3, 'AGCM', '294', 'Research Internship'),
(261, 3, 'AGCM', '295', 'Independent Study or Research'),
(262, 3, 'AGCM', '315', 'Emerging Media'),
(263, 3, 'AGCM', '320', 'Public Information Campaigns'),
(264, 3, 'AGCM', '330', 'Environmental Communications'),
(265, 3, 'AGCM', '396', 'Honors Research or Thesis'),
(266, 3, 'AGED', '250', 'Observation and Program Analys'),
(267, 3, 'AGED', '260', 'Intro to Leadership Studies'),
(268, 3, 'AGED', '293', 'Ag Leadership Internship'),
(269, 3, 'AGED', '295', 'Independent Study or Research'),
(270, 3, 'AGED', '300', 'Training and Development'),
(271, 3, 'AGED', '310', 'Prof Dev in Leadership Ed'),
(272, 3, 'AGED', '360', 'Advanced Leadership Studies'),
(273, 3, 'AGED', '380', 'Leadership in Groups and Teams'),
(274, 3, 'AGED', '396', 'Honors Research or Thesis'),
(275, 3, 'AGED', '410', 'Grad Early Field Experience'),
(276, 3, 'AGED', '420', 'Curr Design & Instruction'),
(277, 3, 'AGED', '430', 'Youth Development Programs'),
(278, 3, 'AGED', '450', 'Program Delivery and Eval'),
(279, 3, 'AGED', '451', 'Professional Dev in Ag Ed'),
(280, 3, 'AGED', '480', 'Collaborative Leadership'),
(281, 3, 'AGED', '545', 'Research Methods & Design'),
(282, 3, 'AGED', '549', 'Independent Study'),
(283, 3, 'AGED', '551', 'Advanced Program Evaluation'),
(284, 3, 'AGED', '599', 'Thesis Research'),
(285, 3, 'AHS', '125', 'Freshmen Scholars Seminar'),
(286, 3, 'AHS', '199', 'Undergraduate Open Seminar'),
(287, 3, 'AHS', '292', 'AHS Study Abroad'),
(288, 3, 'AHS', '365', 'Civic Engagement in Wellness'),
(289, 3, 'AHS', '375', 'Comm Partners & Health'),
(290, 3, 'AHS', '399', 'Advanced Open Seminar'),
(291, 3, 'AIS', '101', 'Intro to Amer Indian Studies'),
(292, 3, 'AIS', '165', 'Lang & Culture Native North Am'),
(293, 3, 'AIS', '199', 'Undergraduate Open Seminar'),
(294, 3, 'AIS', '275', 'Am Indian and Indigenous Film'),
(295, 3, 'AIS', '285', 'Indigenous Thinkers'),
(296, 3, 'AIS', '288', 'American Indians of Illinois'),
(297, 3, 'AIS', '291', 'Independent Study'),
(298, 3, 'AIS', '295', 'US Citizenship Comparatively'),
(299, 3, 'AIS', '459', 'Topics in American Indian Lit'),
(300, 3, 'AIS', '491', 'Readings in Am Ind Studies'),
(301, 3, 'AIS', '502', 'Indigenous Decolonial Methods'),
(302, 3, 'AIS', '591', 'Problems in Indigenous Studies'),
(303, 3, 'ANSC', '100', 'Intro to Animal Sciences'),
(304, 3, 'ANSC', '101', 'Contemporary Animal Issues'),
(305, 3, 'ANSC', '103', 'Working With Farm Animals'),
(306, 3, 'ANSC', '110', 'Life With Animals and Biotech'),
(307, 3, 'ANSC', '199', 'Undergraduate Open Seminar'),
(308, 3, 'ANSC', '204', 'Intro Dairy Cattle Evaluation'),
(309, 3, 'ANSC', '205', 'World Animal Resources'),
(310, 3, 'ANSC', '207', 'Companion Animal Biology &Care'),
(311, 3, 'ANSC', '209', 'Meat Animal Carcass Eval'),
(312, 3, 'ANSC', '211', 'Breeding Animal Evaluation'),
(313, 3, 'ANSC', '223', 'Animal Nutrition'),
(314, 3, 'ANSC', '224', 'Animal Reproduction and Growth'),
(315, 3, 'ANSC', '250', 'Companion Animals in Society'),
(316, 3, 'ANSC', '298', 'Undergraduate Seminar'),
(317, 3, 'ANSC', '305', 'Human Animal Interactions'),
(318, 3, 'ANSC', '306', 'Equine Science'),
(319, 3, 'ANSC', '363', 'Behavior of Domestic Animals'),
(320, 3, 'ANSC', '366', 'Animal Behavior'),
(321, 3, 'ANSC', '398', 'UG Experiential Learning'),
(322, 3, 'ANSC', '402', 'Sheep Production'),
(323, 3, 'ANSC', '403', 'Pork Production'),
(324, 3, 'ANSC', '404', 'Poultry Science'),
(325, 3, 'ANSC', '406', 'Zoo Animal Conservation Sci'),
(326, 3, 'ANSC', '407', 'Animal Shelter Management'),
(327, 3, 'ANSC', '409', 'Meat Science'),
(328, 3, 'ANSC', '422', 'Companion Animal Nutrition'),
(329, 3, 'ANSC', '423', 'Advanced Dairy Nutrition'),
(330, 3, 'ANSC', '438', 'Lactation Biology'),
(331, 3, 'ANSC', '440', 'Applied Statistical Methods I'),
(332, 3, 'ANSC', '445', 'Statistical Methods'),
(333, 3, 'ANSC', '446', 'Population Genetics'),
(334, 3, 'ANSC', '448', 'Math Modeling in Life Sciences'),
(335, 3, 'ANSC', '498', 'Integrating Animal Sciences'),
(336, 3, 'ANSC', '499', 'Seminar'),
(337, 3, 'ANSC', '509', 'Muscle Biology'),
(338, 3, 'ANSC', '520', 'Protein and Energy Nutrition'),
(339, 3, 'ANSC', '521', 'Regulation of Metabolism'),
(340, 3, 'ANSC', '525', 'Topics in Nutrition Research'),
(341, 3, 'ANSC', '543', 'Bioinformatics'),
(342, 3, 'ANSC', '561', 'Animal Stress Physiology'),
(343, 3, 'ANSC', '590', 'Animal Sciences Seminar'),
(344, 3, 'ANSC', '593', 'Res Studies in Animal Sciences'),
(345, 3, 'ANSC', '599', 'Thesis Research'),
(346, 3, 'ANTH', '101', 'Introduction to Anthropology'),
(347, 3, 'ANTH', '103', 'Anthro in a Changing World'),
(348, 3, 'ANTH', '109', 'Religion & Society in West II'),
(349, 3, 'ANTH', '165', 'Lang & Culture Native North Am'),
(350, 3, 'ANTH', '180', 'The Archaeology of Death'),
(351, 3, 'ANTH', '182', 'Latin American Cultures'),
(352, 3, 'ANTH', '199', 'Undergraduate Open Seminar'),
(353, 3, 'ANTH', '210', 'Families in Global Perspective'),
(354, 3, 'ANTH', '224', 'Tourist Cities and Sites'),
(355, 3, 'ANTH', '230', 'Sociocultural Anthropology'),
(356, 3, 'ANTH', '240', 'Biological Anthropology'),
(357, 3, 'ANTH', '241', 'Human Variation and Race'),
(358, 3, 'ANTH', '250', 'The World Through Museums'),
(359, 3, 'ANTH', '259', 'Latina/o Cultures'),
(360, 3, 'ANTH', '261', 'Intro to the African Diaspora'),
(361, 3, 'ANTH', '270', 'Language in Culture'),
(362, 3, 'ANTH', '271', 'Language in Culture-ACP'),
(363, 3, 'ANTH', '275', 'The World of Jewish Sepharad'),
(364, 3, 'ANTH', '278', 'Climate Change & Civilization'),
(365, 3, 'ANTH', '287', 'Contemporary East Asia'),
(366, 3, 'ANTH', '288', 'American Indians of Illinois'),
(367, 3, 'ANTH', '342', 'Animal Behavior'),
(368, 3, 'ANTH', '343', 'Behavior and Biology of Women'),
(369, 3, 'ANTH', '361', 'Ecology and Human Health'),
(370, 3, 'ANTH', '376', 'Aztec Civilization'),
(371, 3, 'ANTH', '390', 'Individual Study'),
(372, 3, 'ANTH', '391', 'Honors Individual Study'),
(373, 3, 'ANTH', '399', 'Special Topics'),
(374, 3, 'ANTH', '404', 'Disability, Culture & Society'),
(375, 3, 'ANTH', '414', 'Writing Ethnography'),
(376, 3, 'ANTH', '420', 'Case Studies Global Heritage'),
(377, 3, 'ANTH', '423', 'Economic Anthropology'),
(378, 3, 'ANTH', '432', 'Genes and Behavior'),
(379, 3, 'ANTH', '434', 'Comparative Vertebrate Anatomy'),
(380, 3, 'ANTH', '444', 'Methods in Bioanthropology'),
(381, 3, 'ANTH', '445', 'Research in Bioanthropology'),
(382, 3, 'ANTH', '452', 'Stone Tool Technology Analysis'),
(383, 3, 'ANTH', '454', 'Archaeological Field School'),
(384, 3, 'ANTH', '455', 'Lab Analysis in Archaeology'),
(385, 3, 'ANTH', '456', 'Human Osteology'),
(386, 3, 'ANTH', '462', 'Museum Theory and Practice'),
(387, 3, 'ANTH', '472', 'Border Latina, Latino Cultures'),
(388, 3, 'ANTH', '478', 'African Immigrants in Europe'),
(389, 3, 'ANTH', '495', 'Honors Senior Thesis'),
(390, 3, 'ANTH', '496', 'Individual Field Research'),
(391, 3, 'ANTH', '497', 'Individual Field Data Analysis'),
(392, 3, 'ANTH', '499', 'Topics in Anthropology'),
(393, 3, 'ANTH', '504', 'Colonialism & Postcolonialism'),
(394, 3, 'ANTH', '515', 'Seminar in Anthropology'),
(395, 3, 'ANTH', '552', 'Res Prob in Archaeology'),
(396, 3, 'ANTH', '565', 'Race and Cultural Critique'),
(397, 3, 'ANTH', '570', 'Cultural Aspects of Tourism'),
(398, 3, 'ANTH', '589', 'Readings in Anthropology'),
(399, 3, 'ANTH', '590', 'Dissertation Readings'),
(400, 3, 'ANTH', '594', 'Cultural Heritage'),
(401, 3, 'ANTH', '599', 'Thesis Research'),
(402, 3, 'ARAB', '150', 'Lang&Culture of Arab World'),
(403, 3, 'ARAB', '202', 'Elementary Standard Arabic II'),
(404, 3, 'ARAB', '211', 'Colloquial Arabic II'),
(405, 3, 'ARAB', '404', 'Intermediate Stand Arabic II'),
(406, 3, 'ARAB', '406', 'Advanced Standard Arabic II'),
(407, 3, 'ARAB', '408', 'Topics Stand Arabic LangLit II'),
(408, 3, 'ARAB', '410', 'AdvTop Stand Arabic LangLit II'),
(409, 3, 'ARCH', '199', 'Undergraduate Open Seminar'),
(410, 3, 'ARCH', '210', 'Intro to the Hist of Arch'),
(411, 3, 'ARCH', '233', 'Construction of Buildings'),
(412, 3, 'ARCH', '272', 'Strategies of Arch Design'),
(413, 3, 'ARCH', '314', 'History of World Landscapes'),
(414, 3, 'ARCH', '341', 'Environment Tech HVAC'),
(415, 3, 'ARCH', '342', 'Environment Tech Ltg & Acoust'),
(416, 3, 'ARCH', '352', 'Mech of Mat & Design Appl'),
(417, 3, 'ARCH', '374', 'Arch Design and the City'),
(418, 3, 'ARCH', '400', 'Senior Honors in Architecture'),
(419, 3, 'ARCH', '401', 'Independent Study'),
(420, 3, 'ARCH', '403', 'Spec Topics in Arch History'),
(421, 3, 'ARCH', '409', 'Special Topics in Spanish Arch'),
(422, 3, 'ARCH', '410', 'Ancient Egyptian & Greek Arch'),
(423, 3, 'ARCH', '412', 'Medieval Architecture'),
(424, 3, 'ARCH', '416', 'Modern American Architecture'),
(425, 3, 'ARCH', '419', 'Historic Building Preservation'),
(426, 3, 'ARCH', '452', 'Theory of Reinforced Concrete'),
(427, 3, 'ARCH', '468', 'Overseas Architectural Studies'),
(428, 3, 'ARCH', '472', 'Arch Des in Landscape & Cities'),
(429, 3, 'ARCH', '476', 'Arch Design & Exploration'),
(430, 3, 'ARCH', '499', 'Off-Campus Study'),
(431, 3, 'ARCH', '501', 'Architectural Practice'),
(432, 3, 'ARCH', '510', 'History of World Landscapes'),
(433, 3, 'ARCH', '511', 'Seminar in Ancient Arch'),
(434, 3, 'ARCH', '544', 'Bldg Sys & Design Integration'),
(435, 3, 'ARCH', '550', 'Reinforced Concrete Design'),
(436, 3, 'ARCH', '552', 'Soil Mech and Foundations'),
(437, 3, 'ARCH', '553', 'Adv Reinforced Concrete Design'),
(438, 3, 'ARCH', '556', 'Advanced Structural Planning'),
(439, 3, 'ARCH', '563', 'Soc/Beh Research Designed Env'),
(440, 3, 'ARCH', '571', 'Design:Detail & Architectonics'),
(441, 3, 'ARCH', '572', 'Design: Behavior & Environment'),
(442, 3, 'ARCH', '573', 'Design:Technology &Performance'),
(443, 3, 'ARCH', '574', 'Design:Arch/Urban&Preservation'),
(444, 3, 'ARCH', '576', 'Architectural Design Seminar'),
(445, 3, 'ARCH', '590', 'Directed Research'),
(446, 3, 'ARCH', '591', 'Spec Prob Arch Hist & Pres'),
(447, 3, 'ARCH', '593', 'Spec Prob Arch Practice & Mgt'),
(448, 3, 'ARCH', '597', 'Spec Prob Arch Design'),
(449, 3, 'ARCH', '599', 'Thesis Research'),
(450, 3, 'ART', '100', 'Understanding Visual Culture'),
(451, 3, 'ART', '102', 'Drawing for Non-Majors'),
(452, 3, 'ART', '103', 'Painting for Non-Majors'),
(453, 3, 'ART', '104', 'Sculpture for Non-Majors'),
(454, 3, 'ART', '140', 'Introduction to Art'),
(455, 3, 'ART', '191', 'Unit One Studio/Seminar'),
(456, 3, 'ART', '199', 'Undergraduate Open Seminar'),
(457, 3, 'ART', '202', 'Art in the Elementary Grades'),
(458, 3, 'ART', '310', 'Design Thinking'),
(459, 3, 'ART', '350', 'Writing with Video'),
(460, 3, 'ART', '550', 'Writing with Video Workshop'),
(461, 3, 'ARTD', '202', 'Industrial Design II'),
(462, 3, 'ARTD', '216', 'Introduction to Image Making'),
(463, 3, 'ARTD', '228', 'Computer Applications'),
(464, 3, 'ARTD', '260', 'Basic Photography'),
(465, 3, 'ARTD', '261', 'Photography II'),
(466, 3, 'ARTD', '299', 'Spec Topics in Design Courses'),
(467, 3, 'ARTD', '302', 'Industrial Design IV'),
(468, 3, 'ARTD', '311', 'Intermediate Graphic Design II'),
(469, 3, 'ARTD', '326', 'Sustainability & Manufacturing'),
(470, 3, 'ARTD', '362', 'Photography Workshop'),
(471, 3, 'ARTD', '391', 'Special Problems in Design'),
(472, 3, 'ARTD', '393', 'Contemporary Art and Ideas'),
(473, 3, 'ARTD', '399', 'Internship in Design'),
(474, 3, 'ARTD', '402', 'Industrial Design VI'),
(475, 3, 'ARTD', '411', 'Advanced Graphic Design II'),
(476, 3, 'ARTD', '415', 'Ninth Letter'),
(477, 3, 'ARTD', '448', 'Professional Design Practice'),
(478, 3, 'ARTD', '460', 'Advanced Photography'),
(479, 3, 'ARTD', '490', 'Senior Honors'),
(480, 3, 'ARTD', '499', 'Special Topics in Design'),
(481, 3, 'ARTD', '502', 'Industrial Design II'),
(482, 3, 'ARTD', '504', 'Industrial Design IV'),
(483, 3, 'ARTD', '506', 'Industrial Design VI'),
(484, 3, 'ARTD', '591', 'Special Problems in Design'),
(485, 3, 'ARTD', '599', 'Industrial Design Thesis');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `post_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `course_id`, `content`, `post_time`, `active`) VALUES
(10, 1, 1, 'Anybody want to study for the test tomorrow right now? I''m in the library.', '2015-09-26 20:04:05', 1),
(11, 1, 1, '', '2015-09-26 20:52:32', 0),
(12, 4, 1, 'Hi', '2015-09-26 20:48:51', 0),
(13, 4, 1, 'Hi', '2015-09-26 20:50:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `session` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `ip`, `session`, `user_id`) VALUES
(18, '::1', '$2a$08$L7GvlxxzoLk9E0Ry5mkLeOIulAc1sdF8PophGwHVxb.5FUg1m8dWS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `activated` int(11) NOT NULL,
  `lat` varchar(255) NOT NULL,
  `long` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `first_name`, `last_name`, `activated`, `lat`, `long`) VALUES
(1, 'raphaelchang@mit.edu', '$2a$08$Xsl/MjenTN092XoX2ixQc.99ptt1yuwJ9f1X7X/sbenxJQvJMyKhm', 'Raphael', 'Chang', 1, '33.7766835', '-84.39627569999999'),
(2, 'mchan47@gatech.edu', '$2a$08$/7KDiGyF.FaIFPjgoX/QEum9SXdccvnKuY9CFXQ8AP3xQ9WWNx5fu', 'Myles', 'Chan', 1, '33.7766835', '-84.39627569999999'),
(3, 'miles.j.chan@gatech.edu', '$2a$08$gW/pcL2K4LojDsGsRphNMO4CfupLM8pyGHqy1LaCmB8zPfmNDvgZe', 'Miles', 'Chan', 1, '33.7766835', '-84.39627569999999'),
(4, 'raphc@mit.edu', '$2a$08$UTT65hZXNhltk/cZN/4JCu.TncWQEHqBRk3l.BHAglrWbAZC01xgm', 'Raphael', 'Chang', 1, '33.7766835', '-84.39627569999999');

-- --------------------------------------------------------

--
-- Table structure for table `user_courses`
--

CREATE TABLE `user_courses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_courses`
--

INSERT INTO `user_courses` (`id`, `user_id`, `course_id`) VALUES
(9, 2, 10),
(10, 2, 11),
(11, 2, 8),
(12, 2, 9),
(13, 3, 12),
(14, 3, 16),
(15, 3, 10),
(16, 3, 8),
(17, 3, 13),
(18, 4, 1),
(30, 1, 1),
(31, 1, 3),
(32, 1, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendees`
--
ALTER TABLE `attendees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colleges`
--
ALTER TABLE `colleges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_courses`
--
ALTER TABLE `user_courses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendees`
--
ALTER TABLE `attendees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `colleges`
--
ALTER TABLE `colleges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=486;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_courses`
--
ALTER TABLE `user_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;