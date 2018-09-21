-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 06 août 2018 à 14:20
-- Version du serveur :  5.7.19
-- Version de PHP :  7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `kindle`
--

-- --------------------------------------------------------

--
-- Structure de la table `author`
--

DROP TABLE IF EXISTS `author`;
CREATE TABLE IF NOT EXISTS `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature` varchar(96) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `author`
--

INSERT INTO `author` (`id`, `name`, `image`, `description`, `signature`) VALUES
(1, ' Rachel erika Henderson', 'author2.jpg', 'I am a poet. My poetry is about life, love, happiness, peace, war, nature it is very 60\'s inspired with a new age twist. I write with heart and soul. \r\n\r\n\r\nRachels writes have been featured such places as Noble house, Poesia and Image, Write the page, Little pink shack, Poem hunter, Hello poetry, Original poetry, Neopoet, The consuming flame to name a few. This latest book once again is delivered with passion and poetry.\'\r\nhttp://rachelerikahenderson.moonfruit.com/\r\nThe beat generation \'poetry for the soul\'\r\nhttp://www.blurb.com/my/book/detail/1140015', 'signature1.jpg'),
(2, 'Jenn Faulk', 'jenn-faulk.jpg', 'Jenn Faulk is a native Texan who enjoys reading and writing chick lit. She\'s a pastor\'s wife, a stay-at-home mom, and a marathon enthusiast who loves talking about Jesus and what a difference He\'s made in her life. She has a BA in Creative Writing from the University of Houston and a MA in Missiology from Southwestern Baptist Theological Seminary.\r\n\r\nExcerpt From: Jenn Faulk. “Happily Ever After.” iBooks.', NULL),
(3, 'Bill Taylor', 'bill-taylor.jpg', 'Bill Taylor is a writer, speaker, and entrepreneur who chronicles the best ways to compete, innovate, and succeed. As cofounder and founding editor of Fast Company, Bill launched a magazine that won countless awards, earned a passionate following among executives and entrepreneurs around the world, and became a legendary business success. More than two decades after its founding, Fast Company continues to shape the global conversation about business.', 'signature-bill-taylor.jpg'),
(4, 'Joe Blow', 'author1.jpg', 'Joe Blow is the pseudonym for a man who, though currently happy and high functioning, has had a long history of mental illness, including endogenous depression, bipolar disorder and obsessive compulsive disorder. His writing is the product of a lifelong struggle to integrate flashes of insight and powerful symbols which appeared to him, often during what we might define as psychotic episodes, with observable reality and a rudimentary knowledge of science by appropriating useful concepts from the work of such iconoclastic thinkers as Wilhelm Reich, R. D. Laing, Keith Johnstone, William Blake and Oscar Wilde.\r\n\r\nIf asked whether this approach and this conceptual framework have provided him with a secure foundation for emotional stability, happiness and flowering creativity, Blow would reply, “Well, so far so good.”\r\n\r\nHe also writes humorous erotica under the pseudonym Aussiescribbler.', 'signature-joe-blow.jpg'),
(5, 'Tracie Puckett', 'tracy-puckett.png', 'Tracie Puckett is an award-winning stage actress, an international bestselling author, and the proud owner of an ever-growing collection of Vera Wang dresses. She\'s published eighteen titles in both young and new adult, and her newest series is scheduled to debut in February 2016. Tracie spends most of her daytime hours writing, reading, and daydreaming... and romance is always the name of the game! \r\n\r\nAlongside her best friend and fellow romance author, Lashell Collins, Tracie co-created (and now hosts) the monthly internet show Book Chat. A perfect parallel to their real lives, each of the broadcasts focuses heavily on books, writing, and romance. Tracie considers this new journey one of the best filled timeslots in her schedule, as there\'s nothing she enjoys more than talking, learning, and laughing with other romance writers. \r\n\r\nIn the rare occasions when she\'s not playing matchmaker to fictional characters or planning out the next segment of Book Chat, you can likely find Tracie zooming down the hills of Ohio\'s greatest roller coasters!', 'signature-tracie-pucket.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `chapter`
--

DROP TABLE IF EXISTS `chapter`;
CREATE TABLE IF NOT EXISTS `chapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ebook_id` int(11) NOT NULL,
  `title` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F981B52E76E71D49` (`ebook_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `chapter`
--

INSERT INTO `chapter` (`id`, `ebook_id`, `title`, `text`, `number`) VALUES
(1, 1, 'Douglas Donohue', 'Douglas Donohue is a struggling artist plodding through his mundane everyday life.', 1),
(2, 1, 'Erica', 'Erica enters the classroom as the still life model. Doug\'s world will never be the same.', 2),
(3, 1, 'The chemistry', ' The chemistry between them is explosive, fueled by an intense sexual and spiritual connection', 3),
(4, 1, 'Joanne', 'Doug regretfully decides not to tell her about Joanne. It could be a huge mistake!', 4),
(5, 1, 'San Francisco', ' Erica is working hard to travel to San Francisco', 5),
(6, 3, 'YOUTH CAMP', 'It had been the most amazing week of her life. Thus far, at least.\r\n\r\nAt seventeen, Cammie Evans was a girl with a profound calling. She’d given Jesus her heart at six, had given Him every choice since then, and had, just that week at her last summer of youth camp ever, given Him the future.', 1),
(7, 3, 'THE STATES', '“Ten Years Later\r\n“And that was that,” Camille sighed, finishing the last bite on her plate, then pushing it to the center of the table.\r\n\r\nShe was amazed she’d been able to eat so quickly, given how much she’d been talking.”', 2),
(8, 3, '~David~', '“David Connor shut the vents off in the car not even two minutes into the drive.\r\nWhy were Americans always using so much AC, anyway? The buildings were like ice boxes, and the cars they drove were freezing.”', 3),
(9, 3, '~Cammie~', '“The man on the elevator was sweaty.\r\n\r\nIt had been a full morning for Camille as she’d led a breakout session on short-term opportunities for a group of about two hundred teenagers. She’d talked about the different continents where she’d served, talked about the kind of work she’d done, and talked about how there were opportunities, even now, for them as teenagers to go and do summer trips, semester trips during college, and beyond.”\r\n\r\nExcerpt From: Jenn Faulk. “Happily Ever After.” iBooks.', 4),
(10, 3, 'Namibia', '“An international flight for Camille Evans always involved a lot of drugs.\r\n\r\nBack when she’d felt the call to foreign missions, she’d never actually been on an airplane. Her first experience with flying had been to a training session in Virginia, and before she even left the ground in Dallas, there had been an issue with the plane. Once the small airline deemed it safe to fly, they took off with Camille nervously chewing her lip and looking out the window, wondering at every bump and sway, praying silently that they’d make it.”', 5),
(11, 3, 'Swakopmund', '“Winter turned to spring, and spring turned to summer.\r\n\r\nAnd there was sand everywhere.\r\n\r\nCamille still wasn’t accustomed to the grainy sand that followed her wherever she went. She’d adjusted to seaside life fairly easily, but she was still surprised to find that no matter how careful she was, how tedious she was in cleaning her space in the house she still shared with Kait, how meticulous she was in keeping the sand from her hair and her body... well, it was still always there. In crevices and folds in her purses and clothes, in between her toes, always under her fingernails, and in every step she took.”', 6),
(12, 5, 'Introduction', '“The aim of this book is to set you free. But free from what? Free from neurosis. Free from the feeling that you have to obey authority. Free from emotional intimidation. Free from addiction. Free from inhibition.\r\nThe key to happiness, mental health and being the most that we can be is absolute and unconditional self-acceptance. The paradox is that many of our problems are caused by trying to improve ourselves, censor our thinking, make up for past misdeeds and struggling with our negative feelings whether of depression or aggression.”\r\n\r\nExcerpt From: Joe Blow. “How to Be Free.” iBooks.', 1),
(13, 5, 'What I’m Not', '“Let me explain here that I have never done any academic training in the field of psychology. I’m not an expert, at least in that sense.\r\nI’m an individual who has suffered greatly from depression throughout a significant portion of my life. And I’ve been diagnosed as being bipolar, having experienced several psychotic breakdowns.\r\nThe thinking which has lead to the ideas I express here has been driven by two things -”\r\n\r\nExcerpt From: Joe Blow. “How to Be Free.” iBooks.', 2),
(14, 5, 'Why Joe Blow?', '“Joe Blow is a name used for someone who is nobody special. This is an appropriate pseudonym for me to use because it emphasises that I take no credit for any useful ideas or insights that might be contained in this work.\r\nNobody creates ideas or truths. They simply exist. We either see them or we don’t. And the fact that we may see them is not a sign of strength or achievement on our part. It takes an act of will to maintain a delusion, to cling to a belief in spite of any contrary evidence. But when we have useful ideas or discover truths it is often because we lack the will or the ability to protect ourselves against them.', 3),
(15, 5, 'Radical Self-acceptance', '“Let’s take a look at what self-acceptance means in practice.\r\nI’ll use an example from my own life. When I was around 20 I went through a terrible depression. A new mother was staying in our house with her baby. At a point early in the depression an image occurred to me of myself throwing the baby down onto the floor and killing it. In my imagination those present didn’t worry about the baby but turned their attention to me and asked what made me do such a thing. At first I dismissed this thought, but it just wouldn’t go away and over time it came to obsess me, and I thought that I might actually carry it out. After the mother and baby left, when this was no longer a possibility, I continued to spiral deeper and deeper into depression. “How could I even think about such a terrible thing?” I asked myself. “Surely I must be evil. There must be some horrible sickness in me.” And the more I tried to find a solution to this problem the worse it got.', 4),
(16, 5, 'Emotional Scars', '“Often we will have an experience which will leave us with painful feelings long after it is over in a physical sense. But if that experience was inflicted on us by a person who is no longer present or the result of a situation we are no longer in, then that individual or situation is no longer the source of our suffering. We are suffering because of the nature of our thinking about that event. We are torturing ourselves for no good reason, since the past cannot be changed.”\r\n\r\nExcerpt From: Joe Blow. “How to Be Free.” iBooks.', 5),
(17, 5, 'The Inner Child', '“While it is true that, in our neurotic state, our inner child suffers greatly, we need to understand that the inner child is not vulnerable in the way that a real child is vulnerable. Nothing can ever kill or injure the inner child in any way. Our scars are a part of our neurotic ego, our inner child, suffer as it may, can never be scarred.\r\nThe essence of the inner child (or our original nature) is unconditional love.  We are capable of feeling love that does not depend on the behaviour or nature of the one loved. And this capacity is a function of our inner child.”\r\n\r\nExcerpt From: Joe Blow. “How to Be Free.” iBooks.', 6),
(18, 5, 'What is Consciousness?', '“We experience our lives. We think our thoughts. We have our feelings. But what or who is the “we” that experiences these things?\r\nWe have a body. We have a mind. We have an ego structure or personality. These give structure to our experience. They are media through which we experience.”\r\n\r\nExcerpt From: Joe Blow. “How to Be Free.” iBooks.', 7),
(19, 5, 'YOUTH CAMP', 'sdfsdf', 8),
(20, 6, '“Call me Steph.”', '“He glanced down to the transcript, and I watched him closer, studying the way perplexity darkened his expression.\r\n“Steph?” \r\nHe didn’t get it. I understood that. That transcript in his hand didn’t really help matters much. It would’ve been much easier for both of us if the paper had read Steph, but nothing in my life ever came so easily. It said Abcdef, my legal name. And with a first name like that, wouldn’t you figure that my last name was Ghijk? Yup! I had the honor of answering to the first eleven letters of the English alphabet, and I had no one but my erratic, impulsive mother to thank.”\r\n\r\nExcerpt From: Tracie Puckett. “(Smashwords Pages) The New Girl.” iBooks.', 1),
(21, 6, '“Nervous?”', '“Nervous?” I asked as we walked into the auditorium at five o\'clock.\r\n“Of course not.”\r\n“Speak for yourself,” Nate interrupted Bridget. “I\'m gonna barf.”\r\nThe theater was large; there were aisles among aisles of red, plush folding seats already filling with hopeful cast and crewmembers. The students faced a stage that expanded from one wall to the next; some were excitedly socializing while others remained silent, seemingly on the verge of throwing up at any given moment. Nate wasn’t alone in his moment of nervous-nausea. \r\n“This is quite a turn out.”\r\n\r\nExcerpt From: Tracie Puckett. “(Smashwords Pages) The New Girl.” iBooks.', 2),
(22, 6, 'Mr. Rivera', '“I stood at Mr. Rivera\'s closed door the next morning and read the list. Bridget was going to be thrilled to learn that she\'d been cast as Juliet. Nate, on the other hand, would shudder to learn that his time on stage wasn\'t limited to one audition at the loss of a bet; he was playing her Romeo.\r\nI scanned down the rest of the cast list and didn\'t recognize any of the remaining names. Rachel Canter, though, was named understudy for Juliet. I’d kinda be lying if I said I wasn’t a little excited to see her face when she learned she was only second best to Bridget.”\r\n\r\nExcerpt From: Tracie Puckett. “(Smashwords Pages) The New Girl.” iBooks.', 3),
(23, 6, 'the costumes', '“Shouldn\'t you be working on the costumes?” Bridget asked as I unlocked the front door.\r\n“Nope. I finished the final designs on Sunday, and I\'m running them by the directors tomorrow. I\'ll have my crew start constructing the pieces as soon as I get the green light from Mr. Rivera.”\r\n“Can I see whatcha got so far?”\r\n“Sure,” I said, walking up the stairs with Bridget close behind.”\r\n\r\nExcerpt From: Tracie Puckett. “(Smashwords Pages) The New Girl.” iBooks.', 4),
(24, 6, 'Bridget', '“What\'s up, Steph?” Bridget asked.\r\nI\'d rushed upstairs and called her on the webcam as quickly as my fingers could move.\r\n“You won\'t believe the night I\'ve had,” I said through tears. “He proposed to her, Bridget! Proposed!”\r\n“Whoa. No he didn’t!” She shook her head. “What’d she say?”\r\n“Yes!”\r\n“Noooo,” Bridget said, lowering her voice. “Oh, Steph. I’m so sorry. Are you okay? Should I come over?”\r\n\r\nExcerpt From: Tracie Puckett. “(Smashwords Pages) The New Girl.” iBooks.', 5),
(25, 6, 'The envelope', '“Two weeks had passed since Mr. Rivera gave me the application for the design program—which, by the way, turned out to be Adriana Holbrook\'s summer internship in Paris. In the envelope, he included a raving letter of recommendation and an invitation for one of Adriana\'s assistants to attend the opening night production of Romeo and Juliet to view the costume designs. I’d sincerely thanked him a million times in passing and took his advice and applied for one of the open spots. I put a design proposal together and sent the information the following Friday. The anticipation of hearing back was both exciting and terrifying.”\r\n\r\nExcerpt From: Tracie Puckett. “(Smashwords Pages) The New Girl.” iBooks.', 6);

-- --------------------------------------------------------

--
-- Structure de la table `download`
--

DROP TABLE IF EXISTS `download`;
CREATE TABLE IF NOT EXISTS `download` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ebook_id` int(11) NOT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_781A827076E71D49` (`ebook_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `download`
--

INSERT INTO `download` (`id`, `ebook_id`, `username`, `date`) VALUES
(1, 1, 'marie', '2018-07-01 00:00:00'),
(5, 1, 'marc', '2018-08-03 14:39:14'),
(6, 1, 'admin', '2018-08-03 14:39:55'),
(7, 3, 'marie', '2018-07-03 00:00:00'),
(8, 6, 'admin', '2018-08-04 18:04:15'),
(9, 6, 'jean', '2018-06-04 18:08:00'),
(10, 6, 'admin', '2018-08-04 18:25:04'),
(21, 6, 'admin', '2018-08-04 20:14:33'),
(22, 6, 'admin', '2018-08-04 20:16:36'),
(23, 6, 'admin', '2018-08-04 20:18:30'),
(24, 6, 'admin', '2018-08-04 20:22:29'),
(25, 6, 'admin', '2018-08-04 20:24:05'),
(26, 6, 'admin', '2018-08-04 20:25:56'),
(27, 6, 'admin', '2018-08-04 20:27:22'),
(28, 6, 'admin', '2018-08-04 20:27:56'),
(29, 6, 'admin', '2018-08-04 20:28:32'),
(30, 6, 'admin', '2018-08-04 20:29:17'),
(31, 6, 'admin', '2018-08-04 20:29:41'),
(32, 6, 'admin', '2018-08-04 20:30:13'),
(33, 6, 'admin', '2018-08-04 20:30:22'),
(34, 6, 'admin', '2018-08-04 20:30:41'),
(35, 6, 'admin', '2018-08-04 20:30:59'),
(36, 6, 'jean', '2018-08-04 20:33:57'),
(37, 6, 'admin', '2018-08-04 21:32:52'),
(38, 6, 'admin', '2018-08-06 11:21:18'),
(39, 6, 'admin', '2018-08-06 11:52:54'),
(40, 6, 'admin', '2018-08-06 12:02:07'),
(41, 4, 'admin', '2018-08-06 13:48:57'),
(42, 6, 'admin', '2018-08-06 13:49:45'),
(43, 6, 'admin', '2018-08-06 13:50:02'),
(44, 6, 'admin', '2018-08-06 13:52:07'),
(45, 6, 'admin', '2018-08-06 13:53:49'),
(46, 6, 'admin', '2018-08-06 13:54:18');

-- --------------------------------------------------------

--
-- Structure de la table `ebook`
--

DROP TABLE IF EXISTS `ebook`;
CREATE TABLE IF NOT EXISTS `ebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overview` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_total` int(11) NOT NULL,
  `active_readers` int(11) NOT NULL,
  `awards` int(11) NOT NULL,
  `display_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7D51730DF675F31B` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ebook`
--

INSERT INTO `ebook` (`id`, `author_id`, `title`, `image`, `overview`, `pages_total`, `active_readers`, `awards`, `display_date`) VALUES
(1, 1, 'Untamed Butterflies', 'untamed-butterflies.jpg', 'Set in the 1960\'s America. When 2 paths collide with such a force, neither will be the same again. A story of love, hurt, betrayal and ultimately fate working itself out.', 112, 1172, 3, '2018-08-03 00:00:00'),
(3, 2, 'Happily Ever After', 'happily-ever-after.jpg', 'Happily Ever After is a love story about friends, faith, and finding out who you are.', 457, 234, 4, '2018-08-03 00:00:00'),
(4, 3, 'Focus', 'focus.jpg', 'In a world that is ever changing there is still one thing that stands alone as the “Gold Standard” for life. Alternative versions of his declarations have been presented to us on a regular basis over time but we don’t get to change that which heaven has authorized. As I peruse today’s landscape I’m left to wonder if we truly know that?', 20, 57, 0, '2018-08-04 00:00:00'),
(5, 4, 'How to Be Free', 'how-to-be-free.jpg', 'How can we free ourselves from mental suffering? How can we unlock what the poet William Blake referred to as “the mind-forged manacles” - those unhelpful, unfounded and inflexible habits of thought which keep us from reaching our true creative potential?\r\n\r\nThis book provides practical advice on how to achieve this.\r\n\r\nBut it also offers an imaginative holistic theoretical framework for an understanding of the nature of the universe, the psychological history of the human race and the meaning of life.', 142, 234, 3, '2018-08-05 00:00:00'),
(6, 5, 'The New Girl', 'the-new-girl.jpg', 'Webster Grove, Book 1.\r\n\r\nSeventeen-year-old Steph has her heart set on a new beginning for the eleventh time. A move to Webster Grove introduces her to a new school, new friends, and new experiences—including a few tender glances from her sexy English teacher. When she learns that Mr. Rivera is only a few months away from becoming family—his brother is marrying her mom!—she must do whatever she can to fight all of the growing suspicions about the time they’re spending together.\r\n\r\nWhen odd family circumstances only push her closer to the man she’s dreaming of, Steph has no choice but to hold it together … or risk losing it all.', 97, 133, 6, '2018-08-06 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `file`
--

DROP TABLE IF EXISTS `file`;
CREATE TABLE IF NOT EXISTS `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ebook_id` int(11) NOT NULL,
  `format` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8C9F361076E71D49` (`ebook_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `file`
--

INSERT INTO `file` (`id`, `ebook_id`, `format`, `file_name`) VALUES
(1, 1, 'pdf', 'Untamed-Butterflies.pdf'),
(2, 1, 'epub', 'Untamed-Butterflies.epub'),
(3, 3, 'epub', 'happily-ever-after.epub'),
(4, 3, 'mobi (kindle)', 'happily-ever-after.mobi'),
(5, 3, 'pdf', 'happily-ever-after.pdf'),
(6, 4, 'epub', 'focus.epub'),
(7, 4, 'mobi (kindle)', 'focus.mobi'),
(8, 4, 'pdf', 'focus.pdf'),
(9, 4, 'pdb', 'focus.pdb'),
(10, 4, 'txt', 'focus.txt'),
(11, 5, 'epub', 'how-to-be-free.epub'),
(12, 5, 'mobi (kindle)', 'how-to-be-free.mobi'),
(13, 5, 'pdf', 'how-to-be-free.pdf'),
(14, 6, 'epub', 'the-new-girl.epub'),
(15, 6, 'pdf', 'the-new-girl.pdf'),
(16, 6, 'mobi (kindle)', 'the-new-girl.mobi');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`) VALUES
('20180801132115'),
('20180802132329'),
('20180802145012'),
('20180803112630'),
('20180804100039'),
('20180804103718'),
('20180804134549');

-- --------------------------------------------------------

--
-- Structure de la table `social`
--

DROP TABLE IF EXISTS `social`;
CREATE TABLE IF NOT EXISTS `social` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `platform` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7161E187F675F31B` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `social`
--

INSERT INTO `social` (`id`, `author_id`, `platform`, `link`) VALUES
(1, 1, 'facebook', 'https://www.facebook.com/rachelngom'),
(2, 1, 'google-plus', 'https://plus.google.com/100935072361478703558'),
(3, 1, 'twitter', 'https://twitter.com/ericafails/status/1000823705617002501?lang=en'),
(4, 1, 'instagram', 'https://www.instagram.com/ericafails/?hl=en'),
(5, 2, 'facebook', 'https://www.facebook.com/jennfaulkbooks/'),
(6, 3, 'twitter', 'https://twitter.com/williamctaylor'),
(7, 3, 'linkedin', 'https://www.linkedin.com/in/bill-taylor-984a7b1'),
(8, 3, 'youtube', 'https://www.youtube.com/c/BillTaylorVideos'),
(9, 4, 'facebook', 'https://www.facebook.com/JoeBlowPhoto/'),
(10, 4, 'instagram', 'https://www.instagram.com/explore/locations/634372394/jo-blows-glass/'),
(11, 5, 'instagram', 'https://www.instagram.com/traciedpuckett/?hl=en'),
(12, 5, 'facebook', 'https://www.facebook.com/traciepuckettnovels/'),
(13, 5, 'twitter', 'https://twitter.com/traciedpuckett?lang=en');

-- --------------------------------------------------------

--
-- Structure de la table `testimonial`
--

DROP TABLE IF EXISTS `testimonial`;
CREATE TABLE IF NOT EXISTS `testimonial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ebook_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(96) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_position` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E6BDCDF776E71D49` (`ebook_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `testimonial`
--

INSERT INTO `testimonial` (`id`, `ebook_id`, `name`, `image`, `job_position`, `company`, `comment`) VALUES
(1, 5, 'Deborah Johnson', 'Deborah-Johnson-400x450.jpg', 'Artistic Director', 'Johnson Studios Inc', '\"I just wanted to thank you for publishing \'How to Be Free\'. It helped me through many hard times that have recently occurred. My self-esteem has been raised because of you.\"'),
(2, 5, 'John Kaskez', 'John-Kaskez-400x450.jpg', 'Lead Guitarist', 'The Kaskez Brothers', '\"...it fucking changed my life.\"'),
(3, 5, 'Julia Marin', 'Julia-Marin-400x450.jpg', 'Consultant', 'ACDG Consulting', '\"This book is dark, deep and brilliantly written. I\'m very moved by the author\'s candidness about mental illnesses, a subject that has become extinct in our conversations and dealings. Here is a person who reached deep inside himself and spilled his soul out onto each page... and he did it so eloquently. I applaud him for bringing me to tears.\"'),
(4, 5, 'Lioba Heikkinen', 'Lioba-Heikkinen-400x450.jpg', 'Owner', 'Heikkinen Fitness OY', '\"Really loved the book. It made me think, self reflect and take a deeper look at my own self.\"'),
(5, 6, 'Pedro Sinbutu', 'Pedro-Sinbutu.jpg', 'lawyer', 'Sinbutu & Partners', 'This was a quick read and pretty well-written. I loved how the author broke each part of the heroine\'s life into a section making it a five part series, which in the end, constitutes one whole book. I usually enjoy the YA genre so I thought I\'d try this one since it was short and looked cute. The story line was sweet, if not a wee bit far-fetched. But the concept was realistic.'),
(6, 6, 'Herbert Suez', 'Herbert-Suez-400x450.jpg', 'Writer and Composer', NULL, 'Reread September 2017 but for me it comes across a bit too immaturely.\r\nNot my favorite novel.'),
(7, 6, 'Samira Niels', 'Samira-Niels-400x450.jpg', 'actress', NULL, 'I\'m not really sure what to think of this story. I mean it is a teacher and student which...I don\'t know about. Plus the story just ended. No lead up to an ending or lead up to a cliffhanger, it just stopped like the author just took a break and said eh that is good enough. It does make me curious as to where the next story starts, but I don\'t know if I will read it.'),
(8, 6, 'Jessica David', 'jessica-david.jpg', 'manager', 'Hashikawa Ltd', 'Let me just start by saying: do not be mislead by the cover. When I found this on goodreads, I admit to thinking that it was probably going to be some tooty fruity love story with nothing really good coming out of it. I feel bad for that immediate judgment because, to be honest, I absolutely adored these short stories. It\'s a brilliant start to an ever improving YA series - one that I highly recommend that you pick up and try. It\'s an excellent book to pick up if you need a cheer up, a pick me up, are wanting something light and quick... This book hits all of the right spots and damn, it hits them well!');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chapter`
--
ALTER TABLE `chapter`
  ADD CONSTRAINT `FK_F981B52E76E71D49` FOREIGN KEY (`ebook_id`) REFERENCES `ebook` (`id`);

--
-- Contraintes pour la table `download`
--
ALTER TABLE `download`
  ADD CONSTRAINT `FK_781A827076E71D49` FOREIGN KEY (`ebook_id`) REFERENCES `ebook` (`id`);

--
-- Contraintes pour la table `ebook`
--
ALTER TABLE `ebook`
  ADD CONSTRAINT `FK_7D51730DF675F31B` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`);

--
-- Contraintes pour la table `file`
--
ALTER TABLE `file`
  ADD CONSTRAINT `FK_8C9F361076E71D49` FOREIGN KEY (`ebook_id`) REFERENCES `ebook` (`id`);

--
-- Contraintes pour la table `social`
--
ALTER TABLE `social`
  ADD CONSTRAINT `FK_7161E187F675F31B` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`);

--
-- Contraintes pour la table `testimonial`
--
ALTER TABLE `testimonial`
  ADD CONSTRAINT `FK_E6BDCDF776E71D49` FOREIGN KEY (`ebook_id`) REFERENCES `ebook` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
