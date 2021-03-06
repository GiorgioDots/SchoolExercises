-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 09, 2020 alle 15:01
-- Versione del server: 10.4.8-MariaDB
-- Versione PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `examskeleton`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `actor`
--

CREATE TABLE `actor` (
  `actor_id` int(11) UNSIGNED NOT NULL,
  `surname` text NOT NULL,
  `name` text NOT NULL,
  `gender` text NOT NULL,
  `birthday` date NOT NULL,
  `nationality` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `actor`
--

INSERT INTO `actor` (`actor_id`, `surname`, `name`, `gender`, `birthday`, `nationality`) VALUES
(1, 'Monterroso', 'Cormak', 'female', '1973-12-02', 'Cameroon'),
(2, 'Beutnagel', 'Eduards', 'female', '1999-06-07', 'Libya'),
(3, 'Olcott', 'Aaryan', 'female', '1979-11-19', 'Cook Islands'),
(4, 'Fiala', 'Farhan', 'female', '1984-10-12', 'Brunei'),
(5, 'Pruiett', 'Kairn', 'male', '1998-02-17', 'Jamaica'),
(6, 'Valer', 'Ronan-Benedict', 'male', '1977-12-16', 'Bosnia &amp; Herzegovina'),
(7, 'Kerska', 'Litrell', 'female', '1993-07-05', 'Gambia'),
(8, 'Babst', 'Zaak', 'male', '1980-12-12', 'Fiji'),
(9, 'Fude', 'Saad', 'male', '1986-12-10', 'Netherlands'),
(10, 'Moncivais', 'Andrew', 'female', '1993-06-29', 'Portugal'),
(11, 'Albarez', 'Mael', 'male', '1989-07-12', 'Cameroon'),
(12, 'Daill', 'Simon', 'female', '2007-07-13', 'Dominican Republic'),
(13, 'Gearheart', 'Dorian', 'female', '1975-06-16', 'Nepal'),
(14, 'Darjean', 'Boyd', 'male', '1977-01-01', 'Argentina'),
(15, 'Depont', 'Ayden', 'male', '1978-02-07', 'Anguilla'),
(16, 'Rimar', 'Dakota', 'female', '1974-05-18', 'Guinea'),
(17, 'Suddath', 'Tai', 'male', '2010-06-18', 'Cook Islands'),
(18, 'Boddorf', 'Eddie', 'female', '1973-05-30', 'Guyana'),
(19, 'Barroso', 'Declain', 'female', '1993-09-07', 'Kazakhstan'),
(20, 'Clanin', 'Josan', 'male', '1997-05-05', 'Madagascar'),
(21, 'Raupach', 'Eroni', 'female', '1993-05-16', 'Oman'),
(22, 'Caffie', 'Graeme', 'male', '2001-08-15', 'Liechtenstein'),
(23, 'Skemp', 'Maanav', 'male', '1987-01-27', 'Angola'),
(24, 'Sanmarco', 'Darrel', 'female', '2002-10-25', 'San Marino'),
(25, 'Berken', 'Rikki', 'female', '1988-08-09', 'Libya'),
(26, 'Partelow', 'Gurardass', 'female', '2008-04-04', 'Namibia'),
(27, 'Devincenzi', 'Kehinde', 'female', '1980-08-11', 'St Kitts &amp; Nevis'),
(28, 'Legard', 'Orin', 'male', '2006-11-27', 'Malawi'),
(29, 'Hersha', 'Daniel-James', 'female', '1978-10-09', 'Faroe Islands'),
(30, 'Dorie', 'Areeb', 'male', '1987-10-17', 'Aruba'),
(31, 'Luis', 'Kingston', 'female', '1979-08-03', 'Netherlands Antilles'),
(32, 'Fornicola', 'Alfred', 'female', '1977-01-08', 'Brunei'),
(33, 'Luker', 'Manus', 'female', '2007-03-27', 'Czech Republic'),
(34, 'Alborn', 'Hogan', 'male', '1985-12-26', 'Macau'),
(35, 'Parlor', 'Connor', 'male', '1973-07-11', 'Nepal'),
(36, 'Holberton', 'Patrick', 'male', '1970-07-10', 'Bahamas'),
(37, 'Barboza', 'Jeevan', 'male', '1987-03-02', 'Bangladesh'),
(38, 'Flumerfelt', 'Maitlind', 'male', '1988-07-05', 'Burundi'),
(39, 'Hedspeth', 'Korrin', 'male', '2002-12-05', 'Nicaragua'),
(40, 'Slappey', 'Santiago', 'male', '1999-07-24', 'Belarus'),
(41, 'Saballos', 'Kenzy', 'male', '2008-02-11', 'Ukraine'),
(42, 'Rasmusson', 'Alec', 'female', '1976-04-20', 'Angola'),
(43, 'Sabeiha', 'Rorie', 'male', '2008-07-30', 'Singapore'),
(44, 'Carrico', 'Lachlan', 'male', '1994-04-15', 'Cyprus'),
(45, 'Stevey', 'Garrett', 'female', '1990-04-18', 'Morocco'),
(46, 'Porche', 'Samir', 'male', '2000-08-21', 'Latvia'),
(47, 'Noeldner', 'Teo', 'female', '1990-03-03', 'San Marino'),
(48, 'Olona', 'Kristian', 'female', '1979-08-24', 'Switzerland'),
(49, 'Alvis', 'Enzo', 'male', '2002-09-11', 'El Salvador'),
(50, 'Raducha', 'Fares', 'female', '2000-03-26', 'Falkland Islands'),
(51, 'Kiewiet', 'Colm', 'male', '2006-12-04', 'Malawi'),
(52, 'Bracklin', 'Abdurraheem', 'male', '1991-04-17', 'Tonga'),
(53, 'Oh', 'Chimsom', 'female', '1974-12-13', 'Malawi'),
(54, 'Ksiazek', 'Believe', 'female', '1981-07-20', 'St Kitts &amp; Nevis'),
(55, 'Butaud', 'Kyel', 'female', '1997-08-29', 'Fiji'),
(56, 'Foerster', 'Tristan', 'male', '1989-05-13', 'Denmark'),
(57, 'Hindall', 'Alessio', 'female', '1979-10-25', 'Malawi'),
(58, 'Gehrking', 'Stanislaw', 'female', '1974-10-10', 'Haiti'),
(59, 'Hoppin', 'Zeeshan', 'male', '1982-06-06', 'Cape Verde'),
(60, 'Brohl', 'Kenzi', 'female', '1999-03-03', 'Maldives'),
(61, 'Pengelly', 'Eliot', 'female', '1971-07-04', 'Namibia'),
(62, 'Berks', 'Idrees', 'male', '2007-12-02', 'Madagascar'),
(63, 'Pruskowski', 'Kyel', 'female', '1977-12-12', 'Saint Pierre &amp; Miquelon'),
(64, 'Gabriele', 'Roderick', 'male', '1976-07-03', 'French Polynesia'),
(65, 'Lehtinen', 'Deklain-Jaimes', 'female', '1995-12-28', 'Swaziland'),
(66, 'Baillie', 'Firaaz', 'male', '1972-07-22', 'Monaco'),
(67, 'Gallup', 'Farren', 'female', '1991-07-30', 'Mali'),
(68, 'Paquin', 'Kian', 'female', '1973-04-14', 'Uruguay'),
(69, 'Cariker', 'Dre', 'male', '1995-08-11', 'Taiwan'),
(70, 'Valeri', 'Deshawn', 'female', '1973-07-03', 'Cruise Ship'),
(71, 'Theilen', 'Yannick', 'male', '1999-05-15', 'Anguilla'),
(72, 'Rodrigres', 'Rahim', 'female', '1992-09-13', 'Congo'),
(73, 'Tremore', 'Manson', 'female', '1974-04-22', 'Liechtenstein'),
(74, 'Loh', 'Gurdeep', 'male', '1977-06-18', 'St Vincent'),
(75, 'Antrobus', 'Alvin', 'male', '1996-10-10', 'Bulgaria'),
(76, 'Haboush', 'Dylin', 'male', '1976-02-05', 'Peru'),
(77, 'Stemper', 'Logan', 'female', '2008-07-06', 'Colombia'),
(78, 'Lamango', 'Jackie', 'male', '1982-02-03', 'Argentina'),
(79, 'Sindelar', 'Baye', 'male', '1987-09-05', 'Malaysia'),
(80, 'Rinks', 'Kieran-Scott', 'male', '1990-06-09', 'Libya'),
(81, 'Lipovsky', 'Maryk', 'female', '2002-07-14', 'Cote D Ivoire'),
(82, 'Wetzell', 'Nikash', 'female', '1972-07-10', 'Nepal'),
(83, 'Yeaman', 'Malo', 'female', '2005-01-03', 'Suriname'),
(84, 'Serviss', 'Zakk', 'male', '2000-05-11', 'Cambodia'),
(85, 'Piszczatowski', 'Harnek', 'female', '1997-05-18', 'Panama'),
(86, 'Pelino', 'Habeeb', 'male', '2008-08-21', 'Rwanda'),
(87, 'Guerera', 'Luca', 'female', '1999-12-15', 'Dominican Republic'),
(88, 'Harrower', 'Kacper', 'male', '1979-08-05', 'Georgia'),
(89, 'Clinard', 'Ze', 'female', '1989-12-30', 'Oman'),
(90, 'Laware', 'Wojciech', 'male', '1984-08-29', 'Kazakhstan'),
(91, 'Riggert', 'Dilraj', 'male', '1990-08-28', 'Swaziland'),
(92, 'Denbo', 'Clifford', 'male', '1970-02-23', 'Saint Pierre &amp; Miquelon'),
(93, 'Alcott', 'Micah', 'female', '1996-04-26', 'Vietnam'),
(94, 'Prodan', 'Jimmy', 'male', '2010-05-18', 'Colombia'),
(95, 'Blan', 'Lenon', 'female', '1993-03-12', 'Faroe Islands'),
(96, 'Britain', 'Saffi', 'female', '1987-05-04', 'Israel'),
(97, 'Killary', 'Jon', 'male', '1972-11-30', 'Cyprus'),
(98, 'Vanzandt', 'Robby', 'female', '1977-09-01', 'Mexico'),
(99, 'Aquilino', 'Maaz', 'female', '1974-08-05', 'Mali');

-- --------------------------------------------------------

--
-- Struttura della tabella `cinema`
--

CREATE TABLE `cinema` (
  `cinema_id` int(11) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `seats` int(11) NOT NULL,
  `city` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `cinema`
--

INSERT INTO `cinema` (`cinema_id`, `name`, `seats`, `city`) VALUES
(1, 'Ouchi', 59, 'Waterloo'),
(2, 'Tongate', 101, 'Fremont'),
(3, 'Bradstreet', 235, 'Muskegon'),
(4, 'Schafer', 71, 'Las Vegas'),
(5, 'Jui', 224, 'Vallejo'),
(6, 'Benneth', 285, 'North Charleston'),
(7, 'Headd', 228, 'Santa Cruz'),
(8, 'Tinkey', 258, 'Davidson County'),
(9, 'Dunnahoo', 85, 'Gilbert'),
(10, 'Eubanks', 119, 'West Covina'),
(11, 'Rohweder', 123, 'San Diego'),
(12, 'Arvidson', 257, 'St. Paul'),
(13, 'Fenrich', 128, 'Mobile'),
(14, 'Sarnicola', 196, 'Gainesville'),
(15, 'Paradee', 147, 'Thornton'),
(16, 'Klapp', 213, 'Poughkeepsie'),
(17, 'Chagolla', 102, 'Thornton'),
(18, 'Radde', 217, 'Chicago'),
(19, 'Bacco', 280, 'Rancho Cucamonga'),
(20, 'Bang', 92, 'Sioux City'),
(21, 'Haut', 101, 'Stamford'),
(22, 'Karkut', 117, 'Eugene'),
(23, 'Sosbee', 114, 'Henderson'),
(24, 'Swingen', 120, 'Asheville'),
(25, 'Girvin', 139, 'Santa Maria'),
(26, 'Brochard', 179, 'Saint Petersburg'),
(27, 'Rainge', 82, 'Mesa'),
(28, 'Pullano', 153, 'Saint Paul'),
(29, 'Manhardt', 126, 'Kaneohe'),
(30, 'Zaneski', 209, 'Howell'),
(31, 'Derider', 166, 'Westminster'),
(32, 'Dunk', 206, 'Reading'),
(33, 'Laxton', 198, 'Denver'),
(34, 'Wiegand', 62, 'Tuscaloosa'),
(35, 'Montreuil', 238, 'Naples'),
(36, 'Girad', 230, 'Saint Petersburg'),
(37, 'Husson', 207, 'Gainesville'),
(38, 'Arent', 296, 'Topeka'),
(39, 'Marrion', 185, 'Miramar'),
(40, 'Bruzas', 207, 'McHenry'),
(41, 'Neahr', 289, 'Providence'),
(42, 'Volpa', 129, 'Plano'),
(43, 'Frohman', 82, 'Barnstable'),
(44, 'Folta', 169, 'Jefferson'),
(45, 'Pupa', 205, 'Salinas'),
(46, 'Nigh', 267, 'Jackson'),
(47, 'Degrenier', 233, 'Yonkers'),
(48, 'Leidecker', 130, 'Fresno'),
(49, 'Sprong', 235, 'Grand Prairie'),
(50, 'Popescu', 241, 'Santa Clarita'),
(51, 'Skordahl', 149, 'Abilene'),
(52, 'Wormuth', 243, 'Buffalo'),
(53, 'Clymer', 260, 'Fontana'),
(54, 'Redell', 55, 'Gulfport-Biloxi'),
(55, 'Tarley', 70, 'Tulsa'),
(56, 'Dresser', 292, 'Monroe'),
(57, 'Maulding', 247, 'Nashville'),
(58, 'Haak', 279, 'Buffalo'),
(59, 'Knepshield', 151, 'Colorado Springs'),
(60, 'Litscher', 201, 'Santa Maria'),
(61, 'Reigh', 150, 'Yonkers'),
(62, 'Stoutamyer', 75, 'Santa Cruz'),
(63, 'Borgmeyer', 72, 'Newark'),
(64, 'Palczewski', 65, 'Indianapolis'),
(65, 'Lantieri', 240, 'Norwalk'),
(66, 'Cansler', 98, 'Bridgeport'),
(67, 'Channel', 285, 'Columbus'),
(68, 'Linen', 82, 'Glendale'),
(69, 'Miu', 170, 'Chattanooga'),
(70, 'Felmet', 258, 'Lacey'),
(71, 'Piette', 268, 'Saint Petersburg'),
(72, 'Ibbetson', 103, 'Inglewood'),
(73, 'Walljasper', 75, 'Lansing'),
(74, 'Cuckler', 97, 'Pittsburgh'),
(75, 'Trulson', 247, 'Santa Ana'),
(76, 'Oligee', 283, 'Green Bay'),
(77, 'Blanco', 278, 'Naperville'),
(78, 'Dorow', 67, 'Killeen'),
(79, 'Fichter', 79, 'Olympia'),
(80, 'Mccommons', 90, 'Fort Lauderdale'),
(81, 'Hwee', 96, 'Jackson'),
(82, 'Barroso', 226, 'Tucson'),
(83, 'Allnutt', 216, 'Birmingham'),
(84, 'Mazariegos', 278, 'Marina'),
(85, 'Watral', 255, 'Fresno'),
(86, 'Merone', 245, 'Austin'),
(87, 'Kreinbring', 252, 'Seattle'),
(88, 'Silver', 104, 'El Monte'),
(89, 'Reinart', 110, 'Buffalo'),
(90, 'Thoren', 113, 'Chesapeake'),
(91, 'Nola', 84, 'Atlantic City'),
(92, 'Bake', 182, 'Dallas'),
(93, 'Kirkendoll', 149, 'Dayton'),
(94, 'Wommack', 274, 'Charleston'),
(95, 'Koepp', 259, 'Tucson'),
(96, 'Hanz', 293, 'Denton'),
(97, 'Kareem', 198, 'Las Cruces'),
(98, 'Eschenburg', 193, 'Las Cruces'),
(99, 'Reinart', 75, 'Grand Rapids'),
(100, 'Preist', 291, 'Monroe');

-- --------------------------------------------------------

--
-- Struttura della tabella `film`
--

CREATE TABLE `film` (
  `film_id` int(11) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `production_year` int(11) DEFAULT NULL,
  `production_place` text NOT NULL,
  `director_surname` text NOT NULL,
  `genre` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `film`
--

INSERT INTO `film` (`film_id`, `title`, `production_year`, `production_place`, `director_surname`, `genre`) VALUES
(1, 'Girl on the Run', 1958, 'Cambodia', 'Mckillip', 'Drama'),
(2, 'Beyond the Stars', 1989, 'Slovenia', 'Gonsior', 'Drama'),
(3, 'The Flying Cat', 1951, 'Indonesia', 'Weihe', 'Animated'),
(4, 'The Bag Man', 2014, 'Azerbaijan', 'Mam', 'Action'),
(5, 'The Dying Rooms', 1995, 'Andorra', 'Speraw', 'Documentary'),
(6, 'Adrift', 2018, 'Ukraine', 'Vlk', 'Drama'),
(7, 'Peyton Place', 1957, 'Antigua &amp; Barbuda', 'Baez', 'Drama'),
(8, 'Sidewalk Stories', 1989, 'Benin', 'Cullars', 'Comedy'),
(9, 'Take Shelter', 2011, 'Oman', 'Serrand', 'Drama'),
(10, '633 Squadron', 1964, 'Tanzania', 'Zayicek', 'War'),
(11, 'Married to the Mob', 1988, 'Uganda', 'Baldrey', 'Comedy'),
(12, 'Money, Women and Guns', 1958, 'Thailand', 'Meirick', 'Western'),
(13, 'Busting', 1974, 'Isle of Man', 'Parfitt', 'Crime'),
(14, 'Mad Max Beyond Thunderdome', 1985, 'Mongolia', 'Musni', 'Action'),
(15, 'Red Dragon', 2002, 'Satellite', 'Beckerdite', 'Crime'),
(16, 'The Las Vegas Story', 1952, 'Latvia', 'Ayola', 'Noir'),
(17, 'Black Magic', 1949, 'Turks &amp; Caicos', 'Bierl', 'Drama'),
(18, 'Reversal of Fortune', 1990, 'Bahamas', 'Sweatman', 'Drama'),
(19, 'The Phobic', 2006, 'Russia', 'Karayan', 'Thriller'),
(20, 'Cat Chaser', 1989, 'Angola', 'Damis', 'Drama'),
(21, 'Two-Minute Warning', 1976, 'Macedonia', 'Vitucci', 'Thriller'),
(22, 'Women of the Prehistoric Planet', 1966, 'Ukraine', 'Sirolli', 'Science Fiction'),
(23, 'Twice Upon a Time', 1983, 'Pakistan', 'Adrian', 'Animated'),
(24, 'Stars and Bars', 1988, 'Yemen', 'Shankland', 'Comedy'),
(25, 'Gnomeo and Juliet', 2011, 'Iran', 'Kahre', 'Animated'),
(26, 'The Decline of Western Civilization', 1981, 'Honduras', 'Broberg', 'Documentary'),
(27, 'The Lord of the Rings: The Return of the King', 2003, 'Zimbabwe', 'Axelrad', 'Adventure'),
(28, 'The Little Orphan', 1948, 'Trinidad &amp; Tobago', 'Jenne', 'Animated'),
(29, 'Little Man', 2006, 'Guinea Bissau', 'Plante', 'Comedy'),
(30, 'T.R. Baskin', 1971, 'Faroe Islands', 'Loter', 'Drama'),
(31, 'The Killing of a Sacred Deer', 2017, 'Slovakia', 'Reper', 'Comedy'),
(32, 'Under Age', 1964, 'Liechtenstein', 'Grainger', 'Drama'),
(33, 'Mr. Saturday Night', 1992, 'Jersey', 'Vallo', 'Comedy'),
(34, 'Pay or Die', 1960, 'Kyrgyz Republic', 'Lapatra', 'Crime'),
(35, 'What Price Glory?', 1952, 'Morocco', 'Jarocki', 'War'),
(36, 'Thunderheart', 1992, 'Lesotho', 'Buckovitch', 'Crime'),
(37, 'Love and Death on Long Island', 1997, 'Bahamas', 'Arocha', 'Drama'),
(38, 'The Caine Mutiny', 1954, 'Thailand', 'Hottell', 'War'),
(39, 'Aladdin and His Lamp', 1952, 'Gabon', 'Nervis', 'Adventure'),
(40, 'Hamburger Hill', 1987, 'Indonesia', 'Pavelski', 'War'),
(41, 'Riding Giants', 2004, 'Serbia', 'Oats', 'Documentary'),
(42, 'Round Midnight', 1986, 'Sri Lanka', 'Serge', 'Drama'),
(43, 'Phantasm II', 1988, 'Anguilla', 'Guillote', 'Horror'),
(44, 'Poolhall Junkies', 2002, 'Guernsey', 'Karen', 'Thriller'),
(45, 'Thinner', 1996, 'Ukraine', 'Tolar', 'Horror'),
(46, 'The Last Crooked Mile', 1946, 'Tunisia', 'Strey', 'Crime'),
(47, 'Girls in the Night', 1953, 'Cyprus', 'Yoders', 'Noir'),
(48, 'Montana Incident', 1952, 'Laos', 'Sahsman', 'Western'),
(49, 'Paparazzi', 2004, 'Equatorial Guinea', 'Desroberts', 'Action'),
(50, 'The Intruder', 1962, 'Costa Rica', 'Tallerico', 'Drama'),
(51, 'Coffee and Cigarettes', 2003, 'Lesotho', 'Giacone', 'Comedy'),
(52, 'Two Days', 2003, 'Andorra', 'Capasso', 'Drama'),
(53, 'Sex and the Single Girl', 1964, 'Algeria', 'Bellue', 'Romance'),
(54, 'The Black Scorpion', 1957, 'Iceland', 'Molzahn', 'Science Fiction'),
(55, 'Bite the Bullet', 1975, 'Mozambique', 'Mckamie', 'Western'),
(56, 'Baby Boom', 1987, 'Zambia', 'Pesnell', 'Comedy'),
(57, 'Night of the Living Dead', 1990, 'Cuba', 'Vais', 'Horror'),
(58, 'The Patriot', 1986, 'Liberia', 'Belieu', 'Action'),
(59, 'Get Him to the Greek', 2010, 'Bangladesh', 'Korando', 'Comedy'),
(60, 'Lionheart', 1987, 'Egypt', 'Amisano', 'Fantasy'),
(61, 'The Odd Couple II', 1998, 'Bermuda', 'Kownacki', 'Comedy'),
(62, 'Cattle Empire', 1958, 'Cayman Islands', 'Haugen', 'Western'),
(63, 'Toad Warrior', 1996, 'Estonia', 'Papike', 'Action'),
(64, 'Harper', 1966, 'French West Indies', 'Mersch', 'Crime'),
(65, 'My Teacher Ate My Homework', 1997, 'Cape Verde', 'Dawes', 'Comedy'),
(66, 'For a Good Time, Call...', 2012, 'Monaco', 'Solarz', 'Comedy'),
(67, 'One from the Heart', 1982, 'Jamaica', 'Lucio', 'Drama'),
(68, 'Silent Conflict', 1948, 'Mozambique', 'Famulare', 'Western'),
(69, 'Thunder Island', 1963, 'United Arab Emirates', 'Brevil', 'Drama'),
(70, 'Tea and Sympathy', 1956, 'Greece', 'Catalina', 'Drama'),
(71, 'Walk of Shame', 2014, 'Haiti', 'Thom', 'Comedy'),
(72, 'Another Time, Another Place', 1958, 'Ethiopia', 'Niederhauser', 'Drama'),
(73, 'The Naked Man', 1998, 'Jersey', 'Castellonese', 'Comedy'),
(74, 'Outlaws of Texas', 1950, 'Mauritius', 'Henggeler', 'Western'),
(75, 'Chappie', 2015, 'Afghanistan', 'Denyes', 'Science Fiction'),
(76, 'Into the Arms of Strangers: Stories of the Kindertransport', 2000, 'Turks &amp; Caicos', 'Degeyter', 'Documentary'),
(77, 'LOL', 2006, 'Algeria', 'Durrance', 'Comedy'),
(78, 'Promises in the Dark', 1979, 'Greece', 'Moor', 'Drama'),
(79, 'Beat Street', 1984, 'Austria', 'Poeppel', 'Drama'),
(80, 'The Turning', 1992, 'Senegal', 'Urankar', 'Drama'),
(81, 'Monster A Go-Go', 1965, 'Benin', 'Currans', 'Science Fiction'),
(82, 'The Longest Day', 1962, 'Estonia', 'Dimoulakis', 'War'),
(83, 'Wanted: Dead or Alive', 1987, 'Nigeria', 'Colindres', 'Action'),
(84, 'Lonelyhearts', 1958, 'Malawi', 'Troup', 'Noir'),
(85, 'The Kettles in the Ozarks', 1956, 'Syria', 'Eddens', 'Comedy'),
(86, 'Fire with Fire', 1986, 'Hungary', 'Theule', 'Romance'),
(87, 'Dolores Claiborne', 1995, 'Georgia', 'Cariaga', 'Crime'),
(88, 'Joe Dakota', 1957, 'Ethiopia', 'Markins', 'Western'),
(89, 'The Shadow on the Window', 1957, 'Portugal', 'Nute', 'Crime'),
(90, 'North Shore', 1987, 'British Virgin Islands', 'Mercando', 'Sport'),
(91, 'Picture Perfect', 1997, 'Mexico', 'Tortelli', 'Romance'),
(92, 'And So It Goes', 2014, 'Burundi', 'Akes', 'Romance'),
(93, 'You Have to Run Fast', 1961, 'United Arab Emirates', 'Goyda', 'Drama'),
(94, 'What If...', 2010, 'Bahrain', 'Yidiaris', 'Comedy'),
(95, 'Step Down to Terror', 1958, 'Madagascar', 'Pottorf', 'Noir'),
(96, 'The Little Shepherd of Kingdom Come', 1961, 'Finland', 'Velega', 'Drama'),
(97, 'Rich Kids', 1979, 'Monaco', 'Canaway', 'Comedy'),
(98, 'Bugs Bunny: Superstar', 1975, 'Niger', 'Feiler', 'Animated'),
(99, 'Madison Avenue', 1962, 'Cyprus', 'Requa', 'Drama'),
(100, 'Snow Falling on Cedars', 1999, 'Venezuela', 'Nuuanu', 'Drama');

-- --------------------------------------------------------

--
-- Struttura della tabella `interprets`
--

CREATE TABLE `interprets` (
  `actor_id_fk` int(11) UNSIGNED NOT NULL,
  `film_id_fk` int(11) UNSIGNED NOT NULL,
  `character` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `interprets`
--

INSERT INTO `interprets` (`actor_id_fk`, `film_id_fk`, `character`) VALUES
(1, 240, 'Aziz Grumbine'),
(2, 77, 'Jody Brea'),
(2, 252, 'Daniil Almada'),
(3, 28, 'Humza Yauck'),
(3, 55, 'Karl Dingwall'),
(3, 63, 'Raheem Loiacono'),
(3, 66, 'Zuriel Zhen'),
(4, 2, 'Chase Loukidis'),
(4, 62, 'Atom Meerdink'),
(5, 123, 'Mohd Mcwaters'),
(5, 333, 'Leyland Schierenbeck'),
(6, 581, 'Ainslie Elkington'),
(7, 68, 'Ruaraidh Obyrne'),
(7, 544, 'Lewis Helfenbein'),
(8, 19, 'Haroon Olgvin'),
(9, 3, 'Immanuel Goad'),
(9, 199, 'Adil Hippe'),
(10, 17, 'Kaan Puddy'),
(11, 64, 'Abdallah Quintela'),
(12, 55, 'Diesel Sodervick'),
(12, 237, 'Prabodhan Kushlan'),
(13, 53, 'Rahil Schueneman'),
(13, 82, 'Dyllan Barad'),
(13, 310, 'Charlie Cusick'),
(14, 33, 'Coray Henretta'),
(14, 66, 'Korrin Holahan'),
(14, 488, 'Jimmy Horse'),
(16, 29, 'Arrham Palek'),
(16, 69, 'Immanuel Luetmer'),
(16, 160, 'Eljon Wolken'),
(16, 169, 'Ritchie Brickley'),
(17, 21, 'Manolo Karnopp'),
(17, 56, 'Nicki Summerill'),
(17, 80, 'Jaxson Kalamaras'),
(17, 367, 'Kiyonari Stachowicz'),
(18, 161, 'Raith Vanvliet'),
(19, 26, 'Masson Badura'),
(19, 92, 'Torquil Triffo'),
(19, 230, 'Lincon Didonna'),
(21, 84, 'Ammar Brigg'),
(21, 501, 'Wiktor Galley'),
(22, 16, 'Colin Truitt'),
(22, 53, 'Loghan Seniff'),
(23, 50, 'Anis Hele'),
(23, 155, 'Kerr Wibeto'),
(24, 72, 'Luc Luga'),
(24, 100, 'Phoevos Deconti'),
(24, 138, 'Coll Gavles'),
(24, 228, 'Lenny Hennon'),
(25, 39, 'Tom Hooks'),
(25, 45, 'Shaarvin Mckines'),
(26, 54, 'Darragh Croker'),
(26, 86, 'Kayden Sundseth'),
(26, 221, 'Emlyn Marroquin'),
(27, 23, 'Afonso Thormer'),
(27, 628, 'Dayem Mondaine'),
(28, 41, 'Obieluem Falk'),
(28, 324, 'Keeman Cuda'),
(28, 695, 'Barney Kilts'),
(29, 27, 'Otto Mcdonough'),
(29, 112, 'Jameel Jure'),
(29, 145, 'Sebastien Titmus'),
(29, 220, 'Nayan Fillingham'),
(29, 237, 'Anis Histand'),
(30, 26, 'Talorcan Coltharp'),
(30, 562, 'Musse Sunder'),
(31, 41, 'Jaymie Bundette'),
(31, 397, 'Pravin Ater'),
(32, 58, 'Ahtasham Guerero'),
(32, 70, 'Kyan Klusman'),
(32, 86, 'Jayden-Lee Ellenbogen'),
(33, 58, 'Brody Dougher'),
(33, 71, 'Brian Krumbein'),
(33, 74, 'Ayub Barria'),
(34, 12, 'Motade Hooton'),
(34, 91, 'Patrikas Rifkin'),
(34, 527, 'Andrew Fairless'),
(34, 872, 'Tanzeel Lucchetti'),
(35, 15, 'Bony Angelino'),
(35, 21, 'Millar Adonis'),
(35, 164, 'Prabodhan Bartolome'),
(35, 512, 'Titus Rusteberg'),
(36, 7, 'Syed Schwarting'),
(36, 210, 'Jak Spicer'),
(36, 221, 'Fruin Mcphearson'),
(36, 510, 'Jamal Banik'),
(37, 17, 'Craig-James Bahn'),
(37, 75, 'Jenson Tyo'),
(37, 158, 'Gus Tung'),
(38, 12, 'Micheal Cerverizzo'),
(38, 55, 'Mika Argrow'),
(38, 139, 'Rohit Lagonia'),
(39, 6, 'Conan Chaddick'),
(39, 47, 'Brian Hennigh'),
(39, 203, 'Xavier Pipper'),
(39, 367, 'Hunter Orlando'),
(40, 115, 'Reagan Morock'),
(40, 195, 'Alistar Netz'),
(41, 91, 'Kirwin Palamino'),
(41, 98, 'Idris Manser'),
(41, 296, 'Dominic Bastos'),
(42, 43, 'Promise Binkerd'),
(42, 81, 'Mohd Petrocco'),
(43, 35, 'Rylie Turlington'),
(43, 94, 'CJ Kallam'),
(43, 224, 'Alfie Mcwherter'),
(43, 290, 'Konan Kovacic'),
(44, 268, 'Finlay Roades'),
(45, 131, 'Kaiwen Stancoven'),
(45, 221, 'Marlin Barad'),
(45, 284, 'Conghaile Sindt'),
(46, 57, 'Turner Alphonso'),
(46, 160, 'Wasif Joachin'),
(46, 243, 'Mackenzie Mitch'),
(46, 372, 'Drew Salata'),
(46, 487, 'Windsor Devon'),
(47, 2, 'Moore Landaverde'),
(47, 66, 'Ricards Emdee'),
(47, 101, 'Christopher Kailey'),
(47, 142, 'Toluwalase Weddle'),
(47, 222, 'Gallagher Littau'),
(47, 274, 'Daniele Rudie'),
(47, 492, 'Kaiden Bienvenue'),
(48, 35, 'Kaydan Bayani'),
(48, 336, 'Alex Sabin'),
(49, 7, 'Adain Isett'),
(49, 233, 'Andy Iacobelli'),
(49, 418, 'Jonothan Kragh'),
(49, 550, 'Ranolph Tibbles'),
(49, 798, 'Russel Schilk'),
(50, 42, 'Dre Gulisano'),
(50, 227, 'Kenneth Prigg'),
(51, 41, 'Luic Gusler'),
(51, 94, 'Gregory Kolaga'),
(52, 51, 'Karsyn Bonker'),
(52, 92, 'Beau Taulbee'),
(52, 298, 'Thom Gamma'),
(54, 32, 'Ryleigh Skeets'),
(55, 145, 'Sung Lepo'),
(56, 66, 'Brad Gnau'),
(56, 204, 'Jakub Dehmer'),
(57, 526, 'Exodi Gissel'),
(58, 3, 'Brendon Almy'),
(59, 49, 'Ruslan Kuca'),
(59, 60, 'Kaidinn Stenbeck'),
(59, 80, 'Zuriel Wangstad'),
(59, 565, 'Kasra Sichel'),
(60, 20, 'Riyaj Kosuta'),
(60, 35, 'Thorben Denina'),
(60, 70, 'Meftah Macurdy'),
(60, 160, 'Zakk Rimson'),
(60, 178, 'Adil Tamashiro'),
(60, 245, 'Valentino Vietzke'),
(61, 47, 'Robbie-lee Gayner'),
(61, 136, 'Ayren Chaplen'),
(61, 291, 'Hussnain Brisk'),
(61, 429, 'Daragh Oquin'),
(62, 7, 'Jordi Murnan'),
(62, 37, 'Russell Laurance'),
(62, 105, 'Connor-David Linson'),
(62, 651, 'Bailley Greeb'),
(63, 126, 'Gian Pfirsch'),
(64, 89, 'Akan Weyhrauch'),
(64, 95, 'Roary Widdoes'),
(65, 38, 'Muhammad Rifenburg'),
(65, 59, 'Windsor Vasquiz'),
(65, 301, 'Damien Florens'),
(66, 20, 'Kalum Plan'),
(66, 46, 'Yves Memolo'),
(66, 129, 'Rhian Ruszala'),
(66, 143, 'Evan Gallmon'),
(66, 334, 'Zaine Marz'),
(66, 533, 'Chang-Ha Bonker'),
(67, 8, 'Valentino Fruehling'),
(67, 38, 'Morgan Lampel'),
(67, 46, 'Lance Pagett'),
(67, 94, 'Murry Beshears'),
(67, 582, 'Riyadh Sale'),
(68, 86, 'Sahil Mahrer'),
(68, 180, 'Noel Bingman'),
(68, 182, 'Aidian Maffey'),
(68, 262, 'Gurardass Trolinger'),
(68, 303, 'Aleksander Dowell'),
(68, 327, 'Raith Bigger'),
(68, 371, 'Sherwyn Davisson'),
(69, 91, 'Coupar Parreira'),
(70, 60, 'Owain Stradford'),
(70, 256, 'Rico Lonn'),
(70, 376, 'Bezalel Depietro'),
(71, 80, 'Rhoridh Schrader'),
(71, 199, 'Kayleb Essick'),
(71, 478, 'Raphael Ruda'),
(71, 557, 'Gustav Alhambra'),
(71, 645, 'Will Briola'),
(72, 19, 'Oisin Otto'),
(72, 48, 'Keeman Inlow'),
(72, 60, 'Phoevos Fariss'),
(72, 81, 'Dhyia Casad'),
(72, 189, 'Aleksandrs Greig'),
(72, 379, 'Ahoua Boord'),
(73, 60, 'Regan Fitzhenry'),
(73, 124, 'Mantej Croce'),
(73, 159, 'Rihards Zaccagnini'),
(73, 234, 'Koddi Liddicoat'),
(74, 224, 'Arun Laos'),
(75, 56, 'Michee Shortridge'),
(75, 73, 'Dhyia Rieth'),
(75, 171, 'Noor Gillion'),
(77, 4, 'Daksh Bast'),
(77, 17, 'Syed Goldenstein'),
(77, 53, 'Gerard Wytch'),
(77, 91, 'Lauren Clingman'),
(77, 366, 'Oakley Williamis'),
(78, 30, 'Ayden Kostel'),
(78, 35, 'Aytug Beuter'),
(78, 70, 'Shae Burland'),
(79, 17, 'Ryan-Lee Vanwoert'),
(79, 312, 'Ehsan Manger'),
(80, 16, 'Keilan Chesebro'),
(80, 24, 'Deklain-Jaimes Maenhout'),
(80, 25, 'Cieran Ditch'),
(80, 51, 'Tian Abdelmuti'),
(80, 67, 'Kian Blackwood'),
(81, 78, 'Odhran Topolski'),
(81, 364, 'Renars Bousman'),
(82, 543, 'Peni Juba'),
(83, 14, 'Sung Baillet'),
(84, 38, 'Darrach Boutiette'),
(84, 151, 'Calen Puca'),
(84, 159, 'Ines Dorsinville'),
(84, 238, 'Shazil Ulmen'),
(84, 346, 'Lagan Jalbert'),
(84, 905, 'Malo Tamondong'),
(85, 15, 'Rubin Varron'),
(85, 229, 'Rohaan Langel'),
(86, 34, 'Ruaridh Kumar'),
(86, 75, 'Jia Bevis'),
(86, 78, 'Jerrick Mansi'),
(86, 555, 'Howie Deffenbaugh'),
(87, 69, 'Marc Marentis'),
(87, 126, 'Jude Strope'),
(87, 271, 'Clarke Chayka'),
(88, 230, 'Wyatt Tanguma'),
(89, 529, 'Aiadan Cusimano'),
(90, 8, 'Cadon Saracco'),
(90, 245, 'Tyrone Patcher'),
(90, 325, 'Broghan Boisseau'),
(91, 8, 'Daniyal Eisaman'),
(91, 50, 'Alistair Alesse'),
(91, 143, 'Ruaridh Palau'),
(91, 195, 'Konrad Falin'),
(91, 234, 'Idahosa Deming'),
(92, 168, 'Sean-Ray Vallegos'),
(93, 39, 'Antonyo Kozusko'),
(93, 341, 'Arun Nagode'),
(94, 5, 'Masson Leonard'),
(94, 57, 'Grzegorz Shanholtzer'),
(94, 375, 'Todd Reinholdt');

-- --------------------------------------------------------

--
-- Struttura della tabella `planned`
--

CREATE TABLE `planned` (
  `film_id_fk` int(11) UNSIGNED NOT NULL,
  `cinema_id_fk` int(11) UNSIGNED NOT NULL,
  `takings` int(11) NOT NULL,
  `projection_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `planned`
--

INSERT INTO `planned` (`film_id_fk`, `cinema_id_fk`, `takings`, `projection_date`) VALUES
(5, 1, 670882213, '2001-02-02'),
(102, 1, 156434349, '1971-12-13'),
(315, 1, 450619061, '1983-02-05'),
(48, 2, 704754530, '1972-02-18'),
(75, 2, 104434504, '2010-05-29'),
(93, 2, 292440123, '1986-08-14'),
(105, 2, 96804499, '1986-03-24'),
(18, 3, 176161000, '1999-12-23'),
(24, 3, 389401815, '2006-10-13'),
(72, 3, 653827835, '1991-03-05'),
(203, 3, 43041769, '1984-07-09'),
(133, 4, 221909980, '1987-05-19'),
(459, 4, 487186549, '2009-02-25'),
(60, 5, 47190958, '1983-11-30'),
(64, 6, 463740713, '1998-01-21'),
(278, 6, 407830802, '1973-03-08'),
(553, 6, 29723922, '1996-09-25'),
(47, 8, 607725118, '2007-04-13'),
(106, 8, 78461738, '1979-03-17'),
(252, 8, 737558633, '2008-11-10'),
(9, 9, 905884540, '1976-12-02'),
(354, 9, 452110539, '1984-11-02'),
(33, 10, 865059012, '1974-04-27'),
(36, 10, 644336713, '1989-06-23'),
(293, 10, 878968811, '1983-08-01'),
(539, 10, 450147639, '1990-09-25'),
(266, 11, 94510811, '1995-12-15'),
(244, 12, 972179281, '2007-08-01'),
(306, 12, 603587377, '2010-04-11'),
(40, 13, 390518387, '1981-10-25'),
(35, 14, 228917072, '1981-04-24'),
(629, 14, 461007344, '1988-10-12'),
(12, 15, 353587929, '2002-03-19'),
(82, 15, 165926013, '2008-07-12'),
(93, 15, 656732990, '1981-05-18'),
(109, 15, 801007192, '2000-11-17'),
(284, 15, 899520982, '2006-07-10'),
(334, 15, 947228806, '1983-06-28'),
(617, 15, 238982418, '1994-01-07'),
(16, 16, 183545602, '1989-12-01'),
(26, 17, 115248444, '2003-03-18'),
(49, 18, 68762514, '1975-01-19'),
(60, 18, 613592864, '2007-01-23'),
(141, 18, 21407196, '2004-06-30'),
(51, 20, 474951131, '1973-08-19'),
(79, 20, 483860548, '1985-06-27'),
(94, 20, 743886095, '1976-09-21'),
(315, 20, 631926980, '1982-12-01'),
(320, 20, 606789443, '1999-12-31'),
(336, 20, 770305934, '2007-12-22'),
(293, 21, 138164571, '2010-05-28'),
(335, 21, 654169395, '1976-02-22'),
(367, 22, 864476872, '1994-09-10'),
(16, 23, 443728237, '1983-11-20'),
(29, 23, 104458729, '1994-08-30'),
(92, 23, 749342680, '2010-03-27'),
(41, 24, 2206355, '1982-06-01'),
(87, 24, 920244286, '2005-09-11'),
(93, 24, 901460381, '1982-10-06'),
(83, 25, 714737387, '1994-06-24'),
(97, 25, 517273717, '1970-10-16'),
(346, 25, 271991073, '1970-12-30'),
(11, 26, 761395266, '1972-02-02'),
(13, 26, 114133158, '1970-09-07'),
(132, 26, 262521589, '1990-08-03'),
(664, 26, 257452752, '1998-04-20'),
(23, 27, 368201092, '1991-08-03'),
(49, 27, 679055168, '1987-11-15'),
(147, 27, 560366426, '1994-02-22'),
(258, 27, 116262260, '1995-02-27'),
(335, 27, 286674929, '2000-02-13'),
(56, 28, 969119785, '1974-07-17'),
(89, 28, 187202157, '1996-02-18'),
(260, 28, 502984943, '2009-12-22'),
(9, 29, 977820242, '2006-07-02'),
(48, 29, 857609276, '2002-04-29'),
(72, 29, 619781684, '1974-08-12'),
(223, 29, 885691601, '1986-05-08'),
(632, 30, 254644682, '1979-10-19'),
(2, 31, 542543284, '1970-02-02'),
(933, 31, 499136934, '2006-12-12'),
(30, 32, 105515404, '1995-03-06'),
(32, 32, 334706513, '1992-07-14'),
(478, 32, 380777752, '1991-07-27'),
(3, 34, 255067223, '1998-04-19'),
(45, 34, 315048944, '2002-10-19'),
(243, 34, 964712898, '1977-12-10'),
(57, 35, 57372234, '1975-12-23'),
(368, 35, 147240801, '1983-01-06'),
(468, 35, 273060422, '1995-09-15'),
(498, 35, 753979731, '2001-02-26'),
(41, 36, 732369819, '1978-09-13'),
(329, 36, 388783731, '2002-08-17'),
(193, 37, 983288375, '1971-09-27'),
(739, 37, 641288220, '1985-06-08'),
(225, 38, 108704028, '2001-12-08'),
(26, 39, 281078393, '2008-02-05'),
(88, 39, 234411389, '1971-08-06'),
(38, 40, 226639574, '1993-12-22'),
(42, 40, 806473569, '1992-01-17'),
(83, 40, 290698380, '2007-05-07'),
(185, 40, 422632723, '1983-02-16'),
(310, 40, 14492258, '1981-12-08'),
(434, 40, 989091698, '1999-12-14'),
(558, 40, 370656162, '1982-06-30'),
(91, 41, 952832562, '1974-03-24'),
(85, 42, 109100571, '1972-03-20'),
(276, 42, 206159155, '2006-10-23'),
(374, 42, 350843051, '1993-06-09'),
(599, 42, 727464039, '1975-05-20'),
(21, 43, 112019724, '2007-01-01'),
(64, 43, 297014618, '1988-07-28'),
(365, 44, 751128218, '2003-05-21'),
(212, 45, 910263592, '1991-02-25'),
(491, 46, 787522519, '1971-07-28'),
(619, 46, 130821522, '2003-11-25'),
(13, 47, 835910663, '1998-05-12'),
(34, 47, 198059364, '1998-05-20'),
(150, 47, 990235596, '1988-08-11'),
(29, 48, 30414774, '1992-04-20'),
(35, 48, 262729475, '1985-03-14'),
(427, 48, 523996375, '1999-06-13'),
(24, 50, 15455170, '1970-07-06'),
(38, 50, 523922507, '1980-06-29'),
(43, 51, 603302065, '1977-06-20'),
(92, 51, 787913600, '1991-04-28'),
(10, 52, 439884251, '2001-12-29'),
(79, 52, 941107195, '2005-03-19'),
(82, 52, 608329662, '2005-08-27'),
(31, 53, 500555026, '1997-10-14'),
(354, 53, 207785364, '1996-01-07'),
(474, 53, 245624536, '1977-02-05'),
(585, 53, 11042497, '1981-12-10'),
(78, 54, 605478525, '1971-03-26'),
(302, 54, 381577462, '2005-12-26'),
(559, 54, 762970168, '2008-08-07'),
(1, 55, 167382988, '1975-01-04'),
(27, 55, 760360036, '1973-05-11'),
(30, 55, 711079505, '1972-03-02'),
(124, 55, 366963803, '1988-03-26'),
(395, 55, 198792705, '1993-03-15'),
(7, 56, 795934419, '1995-07-17'),
(157, 56, 915134041, '1991-02-21'),
(329, 56, 106136864, '2004-03-16'),
(40, 57, 859595392, '1999-03-02'),
(75, 57, 57400919, '1989-11-17'),
(78, 57, 995250867, '1985-11-24'),
(90, 57, 311231432, '1971-11-11'),
(47, 58, 892692931, '1979-09-03'),
(476, 58, 212456682, '1990-07-11'),
(5, 59, 343751624, '1985-02-25'),
(6, 59, 17737196, '2009-08-02'),
(74, 59, 912791014, '1991-04-03'),
(78, 59, 279491272, '1974-05-13'),
(473, 61, 3560119, '1993-02-02'),
(50, 62, 180268715, '1970-11-25'),
(572, 62, 838921105, '2005-08-20'),
(597, 62, 13471515, '1978-10-23'),
(359, 63, 950808414, '1980-03-19'),
(4, 64, 391057474, '1975-10-14'),
(112, 64, 48325410, '1989-12-12'),
(224, 64, 983684833, '1974-02-12'),
(280, 64, 127446820, '1996-09-30'),
(338, 64, 697423983, '1991-10-19'),
(60, 65, 97903594, '2000-12-03'),
(74, 65, 216377364, '1988-09-12'),
(281, 65, 51626992, '2000-09-09'),
(466, 65, 75477332, '1987-02-08'),
(13, 66, 172778939, '1999-05-11'),
(39, 66, 838408832, '1988-08-21'),
(48, 66, 823579404, '2008-07-21'),
(78, 67, 337326309, '2001-05-06'),
(93, 67, 9494098, '2000-04-14'),
(82, 68, 593835211, '1975-04-30'),
(17, 69, 890966350, '1988-11-10'),
(27, 69, 623356929, '2008-06-09'),
(66, 69, 837050604, '1970-08-30'),
(68, 69, 53267772, '2005-07-01'),
(31, 70, 792250637, '1999-01-11'),
(76, 71, 552918634, '2003-12-09'),
(83, 71, 537994512, '1984-07-06'),
(93, 71, 420087390, '1972-09-21'),
(779, 71, 724618955, '2001-03-11'),
(86, 72, 119591922, '1992-03-15'),
(112, 72, 238926009, '2009-04-18'),
(260, 72, 871278894, '1977-12-27'),
(474, 73, 951535228, '1987-03-10'),
(584, 73, 320548925, '1992-09-09'),
(203, 74, 209583092, '1995-08-18'),
(279, 74, 89776175, '1986-12-26'),
(297, 74, 134875933, '2002-07-24'),
(615, 74, 911772599, '1983-07-25'),
(34, 75, 268465232, '1995-10-19'),
(81, 75, 387535583, '1985-06-05'),
(521, 75, 304793087, '1980-05-09'),
(302, 76, 785626032, '1973-05-26'),
(75, 77, 983410878, '1989-11-02'),
(86, 77, 238711906, '2007-04-20'),
(93, 78, 556232556, '1994-10-25'),
(134, 78, 368095267, '1994-01-19'),
(304, 78, 712261141, '1979-12-17'),
(373, 78, 317890167, '2007-08-06'),
(61, 80, 454265440, '1988-04-10'),
(30, 81, 939829234, '2002-01-08'),
(91, 81, 992570049, '1973-08-21'),
(6, 82, 843547411, '1972-01-19'),
(141, 82, 601549397, '1990-05-14'),
(214, 82, 11790764, '1985-09-28'),
(860, 82, 751555958, '1998-04-15'),
(43, 83, 825285945, '1986-12-29'),
(51, 83, 302512167, '2000-04-01'),
(111, 83, 219029849, '2002-03-11'),
(70, 85, 23551075, '1997-03-03'),
(157, 85, 541615150, '1997-04-25'),
(136, 86, 414479806, '1989-12-08'),
(36, 88, 264755190, '1994-05-28'),
(371, 88, 632206396, '2007-01-28'),
(702, 88, 558754312, '1999-11-18'),
(16, 89, 580563459, '1986-08-17'),
(49, 89, 184532432, '1992-04-07');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`actor_id`);

--
-- Indici per le tabelle `cinema`
--
ALTER TABLE `cinema`
  ADD PRIMARY KEY (`cinema_id`);

--
-- Indici per le tabelle `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`film_id`);

--
-- Indici per le tabelle `interprets`
--
ALTER TABLE `interprets`
  ADD PRIMARY KEY (`actor_id_fk`,`film_id_fk`),
  ADD KEY `film_id_fk` (`film_id_fk`);

--
-- Indici per le tabelle `planned`
--
ALTER TABLE `planned`
  ADD PRIMARY KEY (`cinema_id_fk`,`film_id_fk`),
  ADD KEY `film_id_fk` (`film_id_fk`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `actor`
--
ALTER TABLE `actor`
  MODIFY `actor_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=996;

--
-- AUTO_INCREMENT per la tabella `cinema`
--
ALTER TABLE `cinema`
  MODIFY `cinema_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT per la tabella `film`
--
ALTER TABLE `film`
  MODIFY `film_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=947;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `interprets`
--
ALTER TABLE `interprets`
  ADD CONSTRAINT `interprets_ibfk_1` FOREIGN KEY (`actor_id_fk`) REFERENCES `actor` (`actor_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `interprets_ibfk_2` FOREIGN KEY (`film_id_fk`) REFERENCES `film` (`film_id`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `planned`
--
ALTER TABLE `planned`
  ADD CONSTRAINT `planned_ibfk_1` FOREIGN KEY (`film_id_fk`) REFERENCES `film` (`film_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `planned_ibfk_2` FOREIGN KEY (`cinema_id_fk`) REFERENCES `cinema` (`cinema_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
