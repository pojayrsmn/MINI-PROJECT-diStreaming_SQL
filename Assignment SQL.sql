-- buat data base distreaming
CREATE DATABASE diStreaming;
show databases;

-- use database distreaming
use diStreaming;

-- 1. buat table users
CREATE TABLE users (
	user_id INT AUTO_INCREMENT NOT NULL primary key,
    fullname VARCHAR(50) not null,
    email VARCHAR(50) not null unique,
	password INT NOT NULL,
    created_at date
); 

-- 2. buat table movies
CREATE TABLE movies (
	movie_id INT auto_increment not null primary key,
    title VARCHAR(50) not null,
    description text not null,
    duration INT not null,
    url_movie varchar(1000) not null,
    release_year YEAR NOT NULL
); 

-- 3. buat table categories
CREATE TABLE categories (
	category_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	category_name VARCHAR(50) NOT NULL,
    description TEXT NOT NULL
);

-- 4. buat table movie_history
CREATE TABLE movie_history (
	watch_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_id INT NOT NULL,
    movie_id INT NOT NULL,
    history_watched INT NOT NULL, -- terakhir di tonton di durasi menit ke berapa
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- menunjukkan kapan waktu film di upload di website
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id) ON DELETE CASCADE
);

-- 5. buat tabel movie_category
CREATE TABLE movie_category (
	movie_category_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    movie_id INT NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE,
    UNIQUE KEY unique_movie_category (movie_id, category_id)
);

-- 6. buat tabel ratings
CREATE TABLE ratings(
	rating_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    movie_id INT NOT NULL,
    user_id INT NOT NULL,
    score_rate decimal NOT NULL,
    comment TEXT NOT NULL,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP
);

-- cek tabel
DESC users;
DESC categories;
DESC movies;
DESC movie_history;
DESC ratings;
DESC movie_category;


-- INSERT DATA USER
-- 1. input data ke tabel users
INSERT INTO users (user_id, fullname, email, password, created_at) values
(1, 'Andi Frimawan', 'andifrimawan@gmail.com', '@andifri123', '2025-11-29'),
(2, 'Budi Yanto', 'budiyanto@gmail.com', 'budiyanto#212', '2025-11-29'),
('Alexandra Grant', 'alexandra.grant@example.com', 'pass123', '2025-11-29'),
('Benjamin Hayes', 'benjamin.hayes@example.com', 'hello456', '2025-11-29'),
('Clara Ivanova', 'clara.ivanova@example.com', 'secret789', '2025-11-29'),
('David Johnson', 'david.johnson@example.com', 'mypass000', '2025-11-29'),
('Elena Kim', 'elena.kim@example.com', 'qwerty123', '2025-11-29'),
('Finn Larsen', 'finn.larsen@example.com', 'abc123def', '2025-11-29'),
('Grace Mitchell', 'grace.mitchell@example.com', 'letmein456', '2025-11-29'),
('Henry Nelson', 'henry.nelson@example.com', 'welcome789', '2025-11-29'),
('Isla Oconnor', 'isla.oconnor@example.com', 'simple321', '2025-11-29'),
('Jack Perry', 'jack.perry@example.com', 'testpass5', '2025-11-29'),
('Karl Monroe', 'karl.monroe@example.com', 'moonlight', '2025-11-29'),
('Luna Nguyen', 'luna.nguyen@example.com', 'star123', '2025-11-29'),
('Mia Olsen', 'mia.olsen@example.com', 'sunshine', '2025-11-29'),
('Noah Parker', 'noah.parker@example.com', 'cloud999', '2025-11-29');

-- 2. input data ke tabel categories
INSERT INTO categories (category_name, detail) VALUES
('Action', 'Genre yang menekankan adegan fisik intens seperti kejar-kejaran, pertarungan, tembak-menembak, dan ledakan. Fokus pada konflik luar (melawan penjahat, penyelamatan dunia)'),
('Adventure', 'Mengisahkan perjalanan atau eksplorasi ke tempat baru, sering dikombinasikan dengan risiko, penemuan, dan tantangan alam. Biasanya protagonis tumbuh selama perjalanan'),
('Animation', 'Film yang dibuat dengan teknik animasi (2D, 3D, stop-motion), tidak selalu untuk anak-anak'),
('Comedy', 'Dirancang untuk menghibur dan membuat penonton tertawa, melalui dialog lucu, situasi konyol, atau karakter eksentrik'),
('Crime', 'Berpusat pada kejahatan, pelaku, korban, atau penegak hukum. Sering mengeksplorasi motif, konsekuensi, dan moralitas'),
('Documentary', 'Film non-fiksi yang bertujuan mendidik atau menginformasikan tentang topik nyata: sejarah, alam, sosial, politik, dll. Menggunakan wawancara, rekaman nyata, arsip'),
('Drama', 'Menekankan pengembangan karakter, emosi, dan konflik interpersonal, Lebih realistis dan mendalam'),
('Family', 'Dirancang untuk ditonton bersama anak dan orang tua. Kandungan konten aman, pesan positif, dan akhir bahagia'),
('Fantasy', 'Mengandung elemen khayalan: sihir, makhluk mitologi, dunia fiksi, atau hukum alam yang berbeda'),
('History', 'Berdasarkan peristiwa, tokoh, atau periode sejarah nyata. Fokus pada akurasi konteks budaya/kejadian'),
('Horror', 'Bertujuan menimbulkan rasa takut, tegang, atau jijik. Elemen: hantu, pembunuh, monster, atau teror psikologis'),
('Music', 'Musik memainkan peran sentral—bisa kisah hidup musisi (biopik), konser, atau narasi yang didorong oleh lagu'),
('Mystery', 'Mengikuti tokoh yang berusaha memecahkan teka-teki—pembunuhan, penghilangan, konspirasi. Penonton diajak menebak bersama'),
('Romance', 'Fokus pada hubungan cinta antara karakter utama, termasuk konflik, rintangan, dan resolusi emosional'),
('Sci-Fi (Science Fiction)', 'Menggunakan konsep ilmiah imajinatif: teknologi canggih, perjalanan waktu, alien, AI, masa depan, atau eksperimen sains. Eksplorasi dampak teknologi pada manusia'),
('Thriller', 'Membangun ketegangan, antisipasi, dan kecemasan. Plot cepat, plot twist, dan ancaman terus-menerus'),
('War', 'Menggambarkan peperangan—baik dari sudut pandang prajurit, sipil, atau komandan. Menekankan keberanian, pengorbanan, dan horror perang'),
('Western', 'Berlatar di Amerika Barat (Wild West), era 1800-an. Elemen: koboi, sheriff, penjahat, kuda, senapan, dan konflik moral di perbatasan hukum'),
('Biography', 'Mengisahkan kehidupan nyata seseorang seperti tokoh sejarah, selebriti, ilmuwan meski bisa ada dramatisasi untuk efek naratif'),
('Sport', 'Berpusat pada olahraga—baik kompetisi, pelatihan, atau perjuangan atlet. Menekankan semangat, kerja tim, dan kemenangan atas rintangan');

-- 3. Input data Tabel Movies

INSERT INTO movies (title, summary, release_year, duration, url_movie) VALUES
('The Wolf of Wall Street', 'A stockbroker rises to wealth through greed and corruption on Wall Street, only to face justice.', 2013, 180, 'https://image.tmdb.org/t/p/w500/pWockMW2dIq1bHnO9G1fz4Rz9Qp.jpg'),
('Gladiator', 'A betrayed Roman general becomes a gladiator and seeks vengeance against the corrupt emperor who murdered his family.', 2000, 155, 'https://image.tmdb.org/t/p/w500/ty8TGRuvJL336bDqAjaz5Z8cTdS.jpg'),
('Casablanca', 'In WWII Morocco, a cynical American expat must choose between love and virtue when his former lover reappears.', 1942, 102, 'https://image.tmdb.org/t/p/w500/5K7cOHoay2mZusSLe2pK1vTrCwS.jpg'),
('The Green Mile', 'A death row corrections officer discovers a gentle giant inmate possesses a miraculous healing gift.', 1999, 189, 'https://image.tmdb.org/t/p/w500/o0lO84FIxXApUJY9D8xGxR4Yj6S.jpg'),
('Se7en', 'Two detectives hunt a serial killer who uses the seven deadly sins as the motif for his murders.', 1995, 127, 'https://image.tmdb.org/t/p/w500/6yoghtyTpznpBik8EngEmJskVUO.jpg'),
('The Revenant', 'A frontiersman survives a brutal bear attack and treks through the wilderness to seek revenge on his betrayers.', 2015, 156, 'https://image.tmdb.org/t/p/w500/kbNNXQUTpKl7ZJl8w0XsHdJk2mR.jpg'),
('A Quiet Place', 'A family survives in a post-apocalyptic world where creatures hunt by sound — forcing them to live in silence.', 2018, 90, 'https://image.tmdb.org/t/p/w500/nAU74GmpUk7t5iklEp3bufwDq4n.jpg'),
('The Imitation Game', 'During WWII, a mathematician leads a team to crack Nazi codes — changing the course of history and hiding his identity.', 2014, 114, 'https://image.tmdb.org/t/p/w500/8R7oH0M4Yw5Bv5zq7Q8V5qJ8Rl3.jpg'),
('The Martian', 'An astronaut is left behind on Mars and must use his wits and science to survive until rescue.', 2015, 144, 'https://image.tmdb.org/t/p/w500/5aOyriWkPecvZx3jQyR4W4Hn3Zj.jpg'),
('Dunkirk', 'Allied soldiers from Belgium, the British Empire, and France are surrounded by the German army during WWII evacuation.', 2017, 106, 'https://image.tmdb.org/t/p/w500/ebSnODDg9lbsMIaWg2uAbjn7TO5.jpg'),
('The Grandmaster', 'A legendary martial artist faces inner and outer battles while preserving tradition during China’s turbulent 20th century.', 2013, 130, 'https://image.tmdb.org/t/p/w500/a7Qj0nG8rXfXJ5Qv3XvH9Xq5qR1.jpg'),
('Parasite: Black-and-White Version', 'A monochrome reimagining of the Oscar-winning thriller about class struggle and deception in modern Seoul.', 2020, 132, 'https://image.tmdb.org/t/p/w500/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg'),
('Soul (Indonesian Version)', 'Versi lokal dari kisah guru musik yang menemukan makna hidup di Dunia Jiwa — dengan dialog Bahasa Indonesia.', 2020, 100, 'https://image.tmdb.org/t/p/w500/hm58Jw4Lw8OIeJgKf6qPWLDhIh3.jpg'),
('Laskar Pelangi', 'Sepuluh anak miskin di Belitung berjuang mengejar pendidikan di sekolah sederhana yang nyaris ditutup.', 2008, 138, 'https://image.tmdb.org/t/p/w500/bHl2FZqQkFvV1vGzJvY5R5XrW7j.jpg'),
('Dilan 1990', 'Kisah cinta remaja di Bandung tahun 1990 antara Milea dan Dilan, si ganteng misterius yang penuh pesona.', 2018, 105, 'https://image.tmdb.org/t/p/w500/5YvW5aG4XJqQ6Qk5KxXwQwqQrR6.jpg'),
('Ada Apa dengan Cinta?', 'Dua siswa SMA dengan latar belakang berbeda jatuh cinta, menghadapi prasangka dan harapan keluarga.', 2002, 110, 'https://image.tmdb.org/t/p/w500/4Xr7h6QJt8xW6xQXqXqXqXqXqXq.jpg'),
('Naga Bonar', 'Seorang mantan preman berubah jadi pengusaha sukses setelah kemerdekaan Indonesia — penuh humor dan kritik sosial.', 1987, 120, 'https://image.tmdb.org/t/p/w500/5Xr7h6QJt8xW6xQXqXqXqXqXqXq.jpg'),
('Marlina the Murderer in Four Acts', 'Seorang janda di Sumba membalas dendam pada perampok yang menyerangnya — dalam empat babak puitis dan kuat.', 2017, 93, 'https://image.tmdb.org/t/p/w500/8Xr7h6QJt8xW6xQXqXqXqXqXqXq.jpg'),
('Gundala', 'Seorang pria biasa mendapat kekuatan super setelah disambar petir, lalu menjadi pahlawan melawan kejahatan korup.', 2019, 121, 'https://image.tmdb.org/t/p/w500/9Xr7h6QJt8xW6xQXqXqXqXqXqXq.jpg'),
('KKN di Desa Penari', 'Mahasiswa KKN mengalami kejadian misterius di desa terpencil yang menyimpan rahasia gelap tentang tarian larangan.', 2022, 112, 'https://image.tmdb.org/t/p/w500/aXr7h6QJt8xW6xQXqXqXqXqXqXq.jpg'),
('SpongeBob SquarePants: The Movie', 'SpongeBob and Patrick journey to Shell City to retrieve King Neptune’s stolen crown and save Mr. Krabs.', 2004, 87, 'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg'),
('The Lego Movie', 'An ordinary LEGO construction worker is mistaken for the “Special” and must save the world from tyranny.', 2014, 100, 'https://image.tmdb.org/t/p/w500/3YRSiO7wL4R4FbT9cQxZqJ8Rl3m.jpg'),
('Paddington 2', 'The beloved bear is framed for theft and must clear his name while making friends in prison.', 2017, 103, 'https://image.tmdb.org/t/p/w500/6Tgc7UjJ5JpVtHJzJjQxZqJ8Rl3.jpg'),
('Coraline', 'A girl discovers a secret door to an alternate world that seems perfect — until its sinister truth is revealed.', 2009, 100, 'https://image.tmdb.org/t/p/w500/7Qv7vH2RQZ6VJb3JvY5R5XrW7j.jpg'),
('Kiki’s Delivery Service', 'A young witch leaves home at 13 to start her apprenticeship, using her flying broom to deliver packages in a coastal town.', 1989, 103, 'https://image.tmdb.org/t/p/w500/2KJ4zE7K1JtRQZ6VJb3JvY5R5Xr.jpg'),
('How to Train Your Dragon', 'A Viking teen befriends a feared dragon instead of killing it — changing his world and his people’s beliefs.', 2010, 98, 'https://image.tmdb.org/t/p/w500/yHkTb57N4zGZ4xQZ6VJb3JvY5R5.jpg'),
('Big Hero 6', 'A robotics prodigy and his inflatable robot Baymax form a team of heroes to solve a mystery in futuristic San Fransokyo.', 2014, 102, 'https://image.tmdb.org/t/p/w500/2KJ4zE7K1JtRQZ6VJb3JvY5R5Xr.jpg'),
('The Princess Bride', 'A farmhand and a princess face pirates, giants, and rodents of unusual size in this fairy tale adventure.', 1987, 98, 'https://image.tmdb.org/t/p/w500/3YRSiO7wL4R4FbT9cQxZqJ8Rl3m.jpg'),
('Back to the Future', 'A teenager accidentally travels 30 years into the past and must ensure his parents fall in love — or he’ll cease to exist.', 1985, 116, 'https://image.tmdb.org/t/p/w500/fNOH9f1aA7XRTzl1sAOx9iF553Q.jpg'),
('Ferris Bueller’s Day Off', 'A clever high schooler skips school for a day of fun in Chicago — all while avoiding his principal and parents.', 1986, 103, 'https://image.tmdb.org/t/p/w500/8BwWJZQzJvY5R5XrW7j.jpg'),
('The Truman Show', 'A man discovers his entire life is a staged TV show, with everyone he knows acting except him.', 1998, 103, 'https://image.tmdb.org/t/p/w500/vuza0WqYz7u2J1nL5QY4GqK4v6Q.jpg'),
('E.T. the Extra-Terrestrial', 'A boy befriends a stranded alien and helps him return home while evading government agents.', 1982, 115, 'https://image.tmdb.org/t/p/w500/an0nD6uOJphQRrMn85Q2QY4K4v6.jpg'),
('Jurassic Park', 'A theme park of cloned dinosaurs turns deadly when the animals escape containment.', 1993, 127, 'https://image.tmdb.org/t/p/w500/oU7Oq2kFAAlG7ZQX7nV8bF2Xj9Y.jpg'),
('Star Wars: A New Hope', 'A young farm boy joins a rebellion to save a princess and defeat a galaxy-spanning evil empire.', 1977, 121, 'https://image.tmdb.org/t/p/w500/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg'),
('The Terminator', 'A cyborg assassin is sent from the future to kill a woman whose unborn son will lead humanity’s resistance.', 1984, 107, 'https://image.tmdb.org/t/p/w500/q5c8n2JQZ6VJb3JvY5R5XrW7j.jpg'),
('Love Actually', 'Ten interconnected stories explore different forms of love — romantic, familial, and platonic — in London during Christmas.', 2003, 135, 'https://image.tmdb.org/t/p/w500/iiDDjT7xGcY3T7pJpYmZ3yY5sRl.jpg'),
('Crazy, Stupid, Love.', 'A middle-aged man reboots his love life with help from a suave bachelor, sparking chaos across generations of his family.', 2011, 118, 'https://image.tmdb.org/t/p/w500/n6d3X3YQzJvY5R5XrW7j.jpg'),
('Love & Basketball', 'Two neighbors and aspiring athletes navigate friendship, rivalry, and romance from childhood to professional basketball careers.', 2000, 124, 'https://image.tmdb.org/t/p/w500/9Qv7vH2RQZ6VJb3JvY5R5XrW7j.jpg'),
('P.S. I Love You', 'After her husband’s death, a young widow receives letters he wrote before dying — guiding her back to life and love.', 2007, 126, 'https://image.tmdb.org/t/p/w500/4Xr7h6QJt8xW6xQXqXqXqXqXqXq.jpg'),
('To All the Boys I’ve Loved Before', 'A teen’s secret love letters are accidentally sent to five crushes — turning her quiet life upside down.', 2018, 99, 'https://image.tmdb.org/t/p/w500/5YvW5aG4XJqQ6Qk5KxXwQwqQrR6.jpg'),
('Love, Simon', 'A closeted gay teen struggles with coming out — until an anonymous classmate’s email sparks a heartfelt journey.', 2018, 110, 'https://image.tmdb.org/t/p/w500/a7Qj0nG8rXfXJ5Qv3XvH9Xq5qR1.jpg');

-- 4.Input Data Tabel movie_history
INSERT INTO movie_history (user_id, movie_id, watched_till, updated_at) VALUES
(1, 1, 89, '2025-11-29'),
(1, 2, 70, '2025-11-29'),
(2, 3, 54, '2025-11-29'),
(2, 4, 50, '2025-11-29'),
(3, 4, 118, '2025-11-29'),
(3, 5, 47, '2025-11-29'),
(4, 6, 44, '2025-11-29'),
(4, 7, 24, '2025-11-29'),
(5, 3, 36, '2025-11-29'),
(5, 8, 77, '2025-11-29'),
(6, 12, 19, '2025-11-29'),
(6, 9, 51, '2025-11-29'),
(7, 14, 61, '2025-11-29'),
(8, 13, 66, '2025-11-29'),
(9, 15, 37, '2025-11-29'),
(10, 16, 48, '2025-11-29'),
(11, 18, 72, '2025-11-29'),
(12, 21, 51, '2025-11-29'),
(13, 22, 63, '2025-11-29'),
(14, 23, 43, '2025-11-29'),
(15, 24, 25, '2025-11-29'),
(16, 23, 44, '2025-11-29');

-- 5.Input data Tabel Ratings
INSERT INTO ratings (user_id, movie_id, score_rate, comment) VALUES
(1, 1, 9.0, 'Absolutely breathtaking. The cinematography alone is worth 5 stars'),
(2, 2, 9.2, 'Good, but overhyped. Expected more from the ending'),
(3, 3, 9.1, 'Cried like a baby. Emotional rollercoaster in the best way'),
(4, 4, 8.6, 'Perfect family movie — my kids watched it 3 times this week!'),
(5, 5, 9.3, 'The soundtrack elevated every scene. Chills!'),
(6, 6, 8.9, 'Confusing plot, but the visuals saved it'),
(7, 7, 8.8, 'Not my genre, but I respected the craft. Solid 4/5'),
(8, 8, 9.4, 'Rewatched it just for that one scene — pure magic'),
(9, 9, 8.8, 'Felt like a 2-hour trailer. Where’s the substance?'),
(10, 10, 8.7, 'Realistic portrayal of mob life'),
(11, 11, 7.8, 'Too long. Could’ve been 30 minutes shorter'),
(12, 12, 8.5, 'A timeless animated classic'),
(13, 13, 8.4, 'Epic conclusion to the saga'),
(14, 14, 9.0, '10/10 would let this film ruin my sleep schedule again'),
(15, 15, 8.5, 'Intense and gripping');

-- 6. Input Data Tabel movie_Category
INSERT INTO movie_category (movie_id, category_id) VALUES
(1, 7),   -- The Wolf of Wall Street → Drama
(2, 1),   -- Gladiator → Action
(3, 14),  -- Casablanca → Romance
(4, 7),   -- The Green Mile → Drama
(5, 16),  -- Se7en → Thriller
(6, 2),   -- The Revenant → Adventure
(7, 11),  -- A Quiet Place → Horror
(8, 19),  -- The Imitation Game → Biography
(9, 15),  -- The Martian → Sci-Fi
(10, 17), -- Dunkirk → War
(11, 1),  -- The Grandmaster → Action
(12, 7),  -- Parasite → Drama
(13, 3),  -- Soul → Animation
(14, 7),  -- Laskar Pelangi → Drama
(15, 14), -- Dilan 1990 → Romance
(16, 14), -- AADC → Romance
(17, 4),  -- Naga Bonar → Comedy
(18, 5),  -- Marlina → Crime
(19, 1),  -- Gundala → Action
(20, 11), -- KKN → Horror
(21, 3),  -- SpongeBob → Animation
(22, 3),  -- Lego Movie → Animation
(23, 4),  -- Paddington 2 → Comedy
(24, 9),  -- Coraline → Fantasy
(25, 3),  -- Kiki → Animation
(26, 3),  -- HTTYD → Animation
(27, 3),  -- Big Hero 6 → Animation
(28, 9),  -- Princess Bride → Fantasy
(29, 15), -- BTTF → Sci-Fi
(30, 4),  -- Ferris Bueller → Comedy
(31, 7),  -- Truman Show → Drama
(32, 15), -- E.T. → Sci-Fi
(33, 15), -- Jurassic Park → Sci-Fi
(34, 15), -- Star Wars → Sci-Fi
(35, 15), -- Terminator → Sci-Fi
(36, 14), -- Love Actually → Romance
(37, 14), -- Crazy, Stupid, Love → Romance
(38, 20), -- Love & Basketball → Sport
(39, 14), -- P.S. I Love You → Romance
(40, 14), -- To All the Boys → Romance
(41, 14); -- Love, Simon → Romance

CREATE INDEX idx_mc_category_id ON movie_category(category_id); -- mencari film berdasarkan kategori
CREATE INDEX idx_ratings_movie_id ON Ratings(movie_id); -- mencari rating berdasarkan film.
CREATE INDEX idx_ratings_user_id ON Ratings(user_id); -- mencari rating yang diberikan oleh user tertentu

-- cek data

SELECT * FROM users;
SELECT * FROM categories;
SELECT * FROM movies;
SELECT * FROM movie_history;
SELECT * FROM ratings;
SELECT * FROM movie_category;

-- test pakai index --
EXPLAIN
SELECT *
FROM movie_category
WHERE category_id = 6;

-- Test index: idx_mc_category_id (pakai index yang dibikin) --
EXPLAIN
SELECT *
FROM movie_category FORCE INDEX (idx_mc_category_id)
WHERE category_id = 6;

-- Test index: idx_ratings_movie_id
EXPLAIN
SELECT *
FROM Ratings
WHERE movie_id = 9;

-- -------------------------SQL FUNDAMENTALS---------------------------- ---
-- 1. Tampilkan seluruh film dari tabel Movies.
SELECT * FROM movies;

-- 2. tampilkan film dengan rating diatas 8.0
SELECT m.title, m.release_year, r.score_rate
FROM movies m
JOIN ratings r ON m.movie_id = r.movie_id
WHERE r.score_rate > 8.0;

-- 3, Tampilkan 5 user pertama berdasarkan nama (A–Z)
SELECT * FROM users
ORDER BY fullname ASC
LIMIT 5;

-- 4. Tampilkan film yang judulnya mengandung kata “Love”
SELECT * FROM movies
WHERE title LIKE '%Love%';

-- 5. Tampilkan film yang rilis pada tahun tertentu (2018)
SELECT * FROM movies
WHERE release_year = 2018;

-- -------------------------Aggregate & Conditional Logic-------------------------------
-- 1. Hitung total user yang terdaftar.
SELECT COUNT(*) AS total_users FROM users;

-- 2. Hitung jumlah film per kategori (COUNT + GROUP BY category_id).
SELECT c.category_name, COUNT(mc.movie_id) AS jumlah_film
FROM categories c
LEFT JOIN movie_Category mc ON c.category_id = mc.category_id
GROUP BY c.category_id, c.category_name;

-- 3. Buat kategori film (kolom baru) berdasarkan rating menggunakan CASE WHEN:
SELECT m.title, r.score_rate,
    CASE
        WHEN r.score_rate >= 8.5 THEN 'Top Rated'
        WHEN r.score_rate >= 7.0 AND r.score_rate <= 8.4 THEN 'Popular'
        ELSE 'Regular'
    END AS rating_kategori
FROM movies m
JOIN ratings r ON m.movie_id = r.movie_id;


-- --Join Statements--
-- 1. Tampilkan daftar film lengkap (kategori film, rating(score), release year) Tambahan(title, reviewer)
SELECT
    m.title,
    m.release_year,
    c.category_name,
    r.score_rate,
    u.fullname AS reviewer
FROM movies m
LEFT JOIN movie_category mc ON m.movie_id = mc.movie_id
LEFT JOIN categories c ON mc.category_id = c.category_id
LEFT JOIN ratings r ON m.movie_id = r.movie_id
LEFT JOIN users u ON r.user_id = u.user_id;

-- 2. Tampilkan kategori yang belum memiliki film sama sekali
SELECT c.category_name
FROM categories c
LEFT JOIN movie_category mc ON c.category_id = mc.category_id
WHERE mc.category_id IS NULL;

-- Tambahan EXPLAIN Statement
EXPLAIN
SELECT
    m.title,
    m.release_year,
    c.category_name,
    r.score_rate,
    u.fullname AS reviewer
FROM Movies m
LEFT JOIN Movie_Category mc ON m.movie_id = mc.movie_id
LEFT JOIN Categories c ON mc.category_id = c.category_id
LEFT JOIN Ratings r ON m.movie_id = r.movie_id
LEFT JOIN Users u ON r.user_id = u.user_id;
