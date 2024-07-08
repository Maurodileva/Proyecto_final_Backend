-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS Cine;
USE Cine;

-- Tabla para el idioma original de las películas
CREATE TABLE IF NOT EXISTS Lenguaje_Original (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(30) NOT NULL
);

-- Insertar idioma original
INSERT INTO Lenguaje_Original (Nombre) VALUES ('Inglés');
INSERT INTO Lenguaje_Original (Nombre) VALUES ('Español');
INSERT INTO Lenguaje_Original (Nombre) VALUES ('Alemán');
INSERT INTO Lenguaje_Original (Nombre) VALUES ('Francés');
INSERT INTO Lenguaje_Original (Nombre) VALUES ('Portugués');
INSERT INTO Lenguaje_Original (Nombre) VALUES ('Indio');

-- Tabla para los géneros de las películas
CREATE TABLE IF NOT EXISTS Generos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Genero_Nombre VARCHAR(40) NOT NULL
);

-- Insertar géneros
INSERT INTO Generos (Genero_Nombre) VALUES
('Drama'),
('Crimen'),
('Biografía'),
('Historia'),
('Thriller'),
('Animación'),
('Aventura'),
('Acción'),
('Ciencia ficción'),
('Guerra'),
('Comedia'),
('Familia'),
('Fantasía');

-- Tabla para los directores de las películas
CREATE TABLE IF NOT EXISTS Directores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Director_Nombre VARCHAR(50) NOT NULL
);

-- Insertar directores
INSERT INTO Directores (Director_Nombre) VALUES
('Frank Darabont'),
('Francis Ford Coppola'),
('Steven Spielberg'),
('Sidney Lumet'),
('Pete Docter'),
('Matt Reeves'),
('George Miller'),
('Adil El Arbi'),
('Bilall Fallah'),
('Adam Wingard'),
('Shawn Levy'),
('Alex Pina'),
('Joe Russo'),
('Anthony Russo'),
('Julian Fellowes'),
('John Krasinski'),
('Jennifer Yuh Nelson'),
('Noah Baumbach'),
('Pierre Coffin'),
('Rosie Matheson'),
('Mike Flanagan'),
('Jenji Kohan'),
('Katsuhiro Otomo'),
('Michael Bay');

-- Tabla para los estados de las películas
CREATE TABLE IF NOT EXISTS Estados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL
);

-- Insertar estados
INSERT INTO Estados (Nombre) VALUES
('Estreno'),
('Post-Estreno'),
('Pre-Producción');

-- Tabla para las películas
CREATE TABLE IF NOT EXISTS Peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Pelicula_Nombre VARCHAR(255) NOT NULL,
    Pelicula_Nombre_Original VARCHAR(255) NOT NULL,
    Anio DATE,
    Sinopsis TEXT,
    id_Estado INT,
    Lenguaje_Original_id INT,
    PresupuestoUSD DECIMAL(15,2),
    IngresosUSD DECIMAL(15,2),
    FOREIGN KEY (Lenguaje_Original_id) REFERENCES Lenguaje_Original(id),
    FOREIGN KEY (id_Estado) REFERENCES Estados(id)
);

-- Insertar datos de las películas
INSERT INTO Peliculas (Pelicula_Nombre, Pelicula_Nombre_Original, Anio, Sinopsis, id_Estado, Lenguaje_Original_id, PresupuestoUSD, IngresosUSD)
VALUES
('Cadena de la Primavera', 'The Shawshank Redemption', '1994-01-01', 'Dos hombres encarcelados se encuentran y forman una amistad única a lo largo de los años, encontrando redención y esperanza a través de actos de humanidad común.', 1, 1, 25000000.00, 28341469.00),
('El Padrino', 'The Godfather', '1972-01-01', 'El patriarca de una dinastía del crimen organizado transfiere el control de su imperio clandestino a su reacio hijo.', 1, 1, 6000000.00, 246120974.00),
('El Padrino Parte II', 'The Godfather Part II', '1974-01-01', 'La vida temprana y la carrera de Vito Corleone en la década de 1920 en la ciudad de Nueva York se retrata mientras su hijo, Michael, amplía y fortalece su dominio en el sindicato del crimen familiar.', 1, 1, 13000000.00, 48000000.00),
('La Lista de Schindler', 'Schindler''s List', '1993-01-01', 'En la Polonia ocupada por los alemanes durante la Segunda Guerra Mundial, el industrial Oskar Schindler se preocupa gradualmente por su fuerza laboral judía después de presenciar su persecución por parte de los nazis.', 1, 1, 22000000.00, 322100000.00),
('Doce Hombres en Pugna', '12 Angry Men', '1957-01-01', 'Un miembro del jurado intenta evitar una injusticia forzando a sus colegas a reconsiderar la evidencia.', 1, 1, 350000.00, 24000000.00),
('Intensa-Mente', 'Inside Out', '2015-01-01', 'Después de que la joven Riley es desarraigada de su vida en el Medio Oeste y trasladada a San Francisco, sus emociones: Alegría, Miedo, Ira, Disgusto y Tristeza, luchan por decidir la mejor manera de navegar por una nueva ciudad, casa y escuela.', 1, 1, 175000000.00, 857611174.00),
('Intensa-Mente 2', 'Inside Out 2', '2022-01-01', 'Trama desconocida. La continuación de la película de Disney-Pixar de 2015, ''Inside Out''.', 3, 1, 0.00, 0.00),
('El Amanecer del Planeta de los Simios', 'Dawn of the Planet of the Apes', '2014-01-01', 'Una creciente nación de simios genéticamente evolucionados dirigida por César se ve amenazada por un grupo de humanos que han sobrevivido al devastador virus desatado hace una década.', 1, 1, 170000000.00, 710644566.00),
('Furiosa: Una Saga de Mad Max', 'Furiosa: A Mad Max Saga', '2023-01-01', 'La historia de origen de Furiosa antes de que se uniera a Max Rockatansky en ''Mad Max: Fury Road''.', 3, 1, 0.00, 0.00),
('Bad Boys: Ride or Die', 'Bad Boys: Ride or Die', '2023-01-01', 'Trama desconocida.', 3, 1, 0.00, 0.00),
('Godzilla vs. Kong: El Nuevo Imperio', 'Godzilla vs. Kong: The New Empire', '2020-01-01', 'El próximo capítulo épico del Monsterverse cinematográfico enfrenta a dos de los mayores iconos de la historia del cine en movimiento: el temible Godzilla y el poderoso Kong, con la humanidad atrapada en el equilibrio.', 1, 1, 200000000.00, 467000000.00),
('Sr. 9: Hacer o Morir', 'Mr. 9: Do or Die', '2022-01-01', 'Trama desconocida.', 3, 1, 0.00, 0.00),
('Bajo París', 'Under Paris', '2022-01-01', 'Trama desconocida.', 3, 1, 0.00, 0.00),
('Guerra Civil', 'Civil War', '2023-01-01', 'Trama desconocida.', 3, 1, 0.00, 0.00),
('Si', 'If', '2022-01-01', 'Trama desconocida.', 3, 1, 0.00, 0.00),
('Gru 4', 'Despicable Me 4', '2024-01-01', 'Trama desconocida.', 3, 1, 0.00, 0.00),
('La Redada: Sin Salida', 'The Roundup: No Way Out', '2022-01-01', 'Trama desconocida.', 3, 1, 0.00, 0.00),
('Aviso de Disparo', 'Trigger Warning', '2022-01-01', 'Trama desconocida.', 3, 1, 0.00, 0.00),
('Sin Tiempo Para Morir', 'No Time to Die', '2021-01-01', 'James Bond ha dejado el servicio activo. Su paz es efímera cuando Felix Leiter, un viejo amigo de la CIA, aparece pidiendo ayuda, llevando a Bond tras la pista de un villano armado con una nueva y peligrosa tecnología.', 2, 1, 250000000.00, 774153007.00);

-- Tabla para relacionar películas y géneros
CREATE TABLE IF NOT EXISTS Peliculas_Generos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Pelicula_id INT,
    Genero_id INT,
    FOREIGN KEY (Pelicula_id) REFERENCES Peliculas(id),
    FOREIGN KEY (Genero_id) REFERENCES Generos(id)
);

-- Relacionar películas y géneros
INSERT INTO Peliculas_Generos (Pelicula_id, Genero_id) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 3),
(4, 4),
(5, 1),
(5, 5),
(6, 6),
(6, 7),
(7, 6),
(7, 7),
(8, 1),
(8, 7),
(8, 8),
(9, 1),
(9, 8),
(10, 1),
(10, 8),
(11, 9),
(12, 1),
(12, 8),
(13, 5),
(14, 8),
(15, 8),
(16, 1),
(16, 8),
(17, 7),
(18, 10),
(19, 1),
(19, 8);

-- Tabla para relacionar películas y directores
CREATE TABLE IF NOT EXISTS Peliculas_Directores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Pelicula_id INT,
    Director_id INT,
    FOREIGN KEY (Pelicula_id) REFERENCES Peliculas(id),
    FOREIGN KEY (Director_id) REFERENCES Directores(id)
);

-- Relacionar películas y directores
INSERT INTO Peliculas_Directores (Pelicula_id, Director_id) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 3),
(5, 4),
(6, 5),
(7, 5),
(8, 6),
(9, 7),
(10, 8),
(10, 9),
(11, 10),
(12, 11),
(13, 12),
(14, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19);


-- Tabla para las imágenes de las películas
CREATE TABLE IF NOT EXISTS Peliculas_Imagenes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Pelicula_id INT,
    link_imagen VARCHAR(255),
    FOREIGN KEY (Pelicula_id) REFERENCES Peliculas(id)
);

-- Insertar imágenes de las películas
INSERT INTO Peliculas_Imagenes (Pelicula_id, link_imagen) VALUES
(1, 'peli_1.jpg'),
(2, 'peli_2.jpg'),
(3, 'peli_3.jpg'),
(4, 'peli_4.jpg'),
(5, 'peli_5.jpg'),
(6, 'peli_6.jpg'),
(7, 'peli_7.jpg'),
(8, 'peli_8.jpg'),
(9, 'peli_9.jpg'),
(10, 'peli_10.jpg'),
(11, 'peli_11.jpg'),
(12, 'peli_12.jpg'),
(13, 'peli_13.jpg'),
(14, 'peli_14.jpg'),
(15, 'peli_15.jpg'),
(16, 'peli_16.jpg'),
(17, 'peli_17.jpg'),
(18, 'peli_18.jpg'),
(19, 'peli_19.jpg');


-- Select de comprobación
SELECT
    Peliculas.Pelicula_Nombre,
    Peliculas.Pelicula_Nombre_Original,
    Peliculas.Anio,
    Peliculas.Sinopsis,
    Estados.Nombre AS Estado,
    Lenguaje_Original.Nombre AS Lenguaje,
    Peliculas.PresupuestoUSD,
    Peliculas.IngresosUSD,
    GROUP_CONCAT(DISTINCT Generos.Genero_Nombre SEPARATOR ', ') AS Generos,
    GROUP_CONCAT(DISTINCT Directores.Director_Nombre SEPARATOR ', ') AS Directores,
    GROUP_CONCAT(DISTINCT Peliculas_Imagenes.link_imagen SEPARATOR ', ') AS Imagenes
FROM
    Peliculas
JOIN
    Estados ON Peliculas.id_Estado = Estados.id
JOIN
    Lenguaje_Original ON Peliculas.Lenguaje_Original_id = Lenguaje_Original.id
JOIN
    Peliculas_Generos ON Peliculas.id = Peliculas_Generos.Pelicula_id
JOIN
    Generos ON Peliculas_Generos.Genero_id = Generos.id
JOIN
    Peliculas_Directores ON Peliculas.id = Peliculas_Directores.Pelicula_id
JOIN
    Directores ON Peliculas_Directores.Director_id = Directores.id
JOIN
    Peliculas_Imagenes ON Peliculas.id = Peliculas_Imagenes.Pelicula_id
GROUP BY
    Peliculas.id;
