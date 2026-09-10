DROP DATABASE IF EXISTS todo_db;
CREATE DATABASE todo_db;
USE todo_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    task VARCHAR(255) NOT NULL,
    is_completed BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Password Login untuk semua user:
-- password123

INSERT INTO users (username, email, password) VALUES
('Andi', 'andi@example.com', 'hashed_pass_1'),
('Budi', 'budi@example.com', 'hashed_pass_2'),
('Citra', 'citra@example.com', 'hashed_pass_3'),
('Doni', 'doni@example.com', 'hashed_pass_4');

INSERT INTO todos (user_id, task, is_completed) VALUES
(1, 'Mengerjakan tugas sebelum deadline', FALSE),
(1, 'Merapikan folder tugas kuliah', TRUE),
(1, 'Belajar untuk ujian besok', FALSE),
(2, 'Mengerjakan laporan praktikum', FALSE),
(2, 'Push project ke GitHub', TRUE),
(2, 'Jangan lupa tidur sebelum jam 3 pagi', FALSE),
(3, 'Menyelesaikan tugas kelompok', FALSE),
(3, 'Membuat slide presentasi', FALSE),
(3, 'Cari tempat nyaman untuk nugas', TRUE),
(4, 'Mengerjakan tugas yang sudah ditunda seminggu', FALSE),
(4, 'Review materi sebelum praktikum', FALSE),
(4, 'Membalas chat kelompok yang sudah menunggu', TRUE);
