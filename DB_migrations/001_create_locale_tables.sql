-- Table for storing available locales
CREATE TABLE IF NOT EXISTS `locales` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `code` VARCHAR(10) NOT NULL UNIQUE COMMENT 'e.g., en_US, de_DE, uk_UA',
    `name` VARCHAR(100) NOT NULL COMMENT 'e.g., English (USA)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table for storing generic word types (Titles, Artists, Genres, etc.)
CREATE TABLE IF NOT EXISTS `locale_data` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `locale_code` VARCHAR(10) NOT NULL,
    `data_type` VARCHAR(50) NOT NULL COMMENT 'e.g., song_title, artist_person, genre',
    `value` VARCHAR(255) NOT NULL,
    FOREIGN KEY (`locale_code`) REFERENCES `locales`(`code`) ON DELETE CASCADE,
    UNIQUE KEY (`locale_code`, `data_type`, `value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Initial Data Inserts
INSERT INTO `locales` (`code`, `name`) VALUES 
('en_US', 'English (USA)'),
('de_DE', 'German (Germany)');

-- Sample English Data
INSERT INTO `locale_data` (`locale_code`, `data_type`, `value`) VALUES
('en_US', 'song_title', 'Neon Heartbeat'),
('en_US', 'song_title', 'Quantum Leap'),
('en_US', 'artist_person', 'Sarah K.'),
('en_US', 'artist_band', 'The Code Breakers'),
('en_US', 'genre', 'Electronic'),
('en_US', 'genre', 'Rock');

-- Sample German Data
INSERT INTO `locale_data` (`locale_code`, `data_type`, `value`) VALUES
('de_DE', 'song_title', 'Schnelle Karotte Plus'),
('de_DE', 'song_title', 'Mitternachtsfahrt'),
('de_DE', 'artist_person', 'Lena Müller'),
('de_DE', 'artist_band', 'Die Bootstraps'),
('de_DE', 'genre', 'Pop'),
('de_DE', 'genre', 'Jazz');