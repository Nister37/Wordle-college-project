--This is the player table

CREATE TABLE IF NOT EXISTS users (
    user_id INT CONSTRAINT pk_user_id PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    gender VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    birthdate DATE NOT NULL
);



CREATE TABLE IF NOT EXISTS words (
    word_id INT CONSTRAINT pk_word_id PRIMARY KEY,
    word_to_guess VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS game_sessions (
    game_session_id INT,
    user_id INT,
    duration INT NOT NULL,
    time_stamp TIMESTAMP NOT NULL,
    word_id INT CONSTRAINT fk_word_id REFERENCES words(word_id),
    attempts_num INT,
    score INT,
    constraint pk_game_session_id PRIMARY KEY (game_session_id, user_id),
    constraint fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS cell (
    cell_id SERIAL PRIMARY KEY,
    game_session_id INT NOT NULL,
    user_id INT NOT NULL,
    position INT NOT NULL,
    character VARCHAR(1) NOT NULL,
    status VARCHAR(20),
    CONSTRAINT fk_game_session FOREIGN KEY (game_session_id, user_id) REFERENCES game_sessions(game_session_id, user_id)
);

--Test data for each table
INSERT INTO users (user_id, username, gender, email, birthdate)
VALUES (1, 'test', 'M', 'test@gmail.com', '1990-01-01');

-- Insert mock-up data into the 'users' table
INSERT INTO users (user_id, username, gender, email, birthdate)
VALUES
    (2, 'john_doe', 'M', 'john.doe@example.com', '1992-02-02'),
    (3, 'jane_doe', 'F', 'jane.doe@example.com', '1993-03-03'),
    (4, 'player_one', 'M', 'player1@example.com', '1994-04-04'),
    (5, 'gamer_girl', 'F', 'gamer.girl@example.com', '1995-05-05'),
    (6, 'speedster', 'M', 'speedster@example.com', '1996-06-06'),
    (7, 'sharp_shooter', 'F', 'sharpshooter@example.com', '1997-07-07'),
    (8, 'stealth_fox', 'M', 'stealth.fox@example.com', '1998-08-08'),
    (9, 'agent99', 'F', 'agent99@example.com', '1999-09-09'),
    (10, 'dragon_slayer', 'M', 'dragonslayer@example.com', '2000-10-10'),
    (11, 'knight_rider', 'M', 'knightrider@example.com', '1989-11-11'),
    (12, 'cyber_wolf', 'F', 'cyberwolf@example.com', '1991-12-12'),
    (13, 'alien_hunter', 'M', 'alienhunter@example.com', '1988-01-13'),
    (14, 'phantom_ace', 'F', 'phantomace@example.com', '1987-02-14'),
    (15, 'master_mind', 'M', 'mastermind@example.com', '1986-03-15'),
    (16, 'shadow_blade', 'M', 'shadowblade@example.com', '1985-04-16');


-- Insert mock-up data into the 'game_sessions' table
INSERT INTO game_sessions (game_session_id, user_id, duration, time_stamp, word_id, attempts_num, score)
VALUES
    (1, 1, 120, '2024-12-01 10:00:00', 101, 3, 50),
    (2, 2, 180, '2024-12-01 11:00:00', 102, 2, 80),
    (3, 3, 90, '2024-12-01 12:00:00', 103, 1, 100),
    (4, 4, 200, '2024-12-02 09:30:00', 104, 4, 30),
    (5, 5, 150, '2024-12-02 10:15:00', 105, 3, 60),
    (6, 6, 300, '2024-12-02 11:45:00', 106, 5, 20),
    (7, 7, 220, '2024-12-03 14:00:00', 107, 3, 70),
    (8, 8, 180, '2024-12-03 15:30:00', 108, 2, 90),
    (9, 9, 240, '2024-12-03 16:00:00', 109, 3, 80),
    (10, 10, 60, '2024-12-04 08:00:00', 110, 1, 100),
    (11, 11, 180, '2024-12-04 09:00:00', 111, 2, 85),
    (12, 12, 120, '2024-12-04 10:30:00', 112, 3, 75),
    (13, 13, 200, '2024-12-05 13:00:00', 113, 4, 50),
    (14, 14, 150, '2024-12-05 14:30:00', 114, 2, 95),
    (15, 15, 90, '2024-12-05 15:45:00', 115, 1, 100),
    (16, 16, 300, '2024-12-06 17:00:00', 116, 5, 20);


-- Insert mock-up 5-letter words into the 'words' table
INSERT INTO words (word_id, word_to_guess)
VALUES
    (101, 'grape'),
    (102, 'peach'),
    (103, 'mango'),
    (104, 'berry'),
    (105, 'lemon'),
    (106, 'plums'),
    (107, 'charm'),
    (108, 'dream'),
    (109, 'flame'),
    (110, 'glory'),
    (111, 'trace'),
    (112, 'bliss'),
    (113, 'spark'),
    (114, 'shine'),
    (115, 'cloud'),
    (116, 'stone');


INSERT INTO game_sessions (game_session_id, user_id, duration, time_stamp)
VALUES (1, 1, 100, '2021-01-01 00:00:00');

INSERT INTO words (word_id, word_to_guess)
VALUES (1, 'test');

-- INSERT INTO users (user_id, username, gender, email, birthdate)
-- VALUES (1, 'test', 'M', 'test@gmail.com', '1990-01-01');

-- INSERT INTO game_sessions (game_session_id, user_id, duration, time_stamp)
-- VALUES (1, 1, 100, '2021-01-01 00:00:00');

-- INSERT INTO words (word_id, word_to_guess)
-- VALUES (1, 'test');

-- INSERT INTO cell (cell_id, attempt_id, position, character)
-- VALUES (1, 1, 1, 't');

TRUNCATE TABLE game_sessions CASCADE ;
TRUNCATE TABLE words CASCADE ;
TRUNCATE TABLE cell CASCADE ;
TRUNCATE TABLE users CASCADE ;

DROP TABLE game_sessions;
DROP TABLE words Cascade ;
DROP TABLE cell CASCADE ;
DROP TABLE users CASCADE ;

SELECT * FROM users
WHERE username = 'zayd' AND email = 'zaydxb@gmail.com';

INSERT INTO cell (game_session_id, user_id, position, character, status)
VALUES (16, 16, 10, 'A', 'WRONG');
DELETE FROM cell WHERE game_session_id=6 AND user_id=11;