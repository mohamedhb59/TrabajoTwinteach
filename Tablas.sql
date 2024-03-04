Create table Profesores (
    IdProfesor INT Primary Key,
    Email Varchar(50),
    Contrasena Varchar(20)
);

Create table Cursos (
    IdCurso INT Primary Key,
    MisCursos INT,
    IdProfesor INT,
    IdTarea INT,
    Foreign Key (IdProfesor) REFERENCES Profesores(IdProfesor)  
);

/* ALTER TABLE Cursos
ADD CONSTRAINT IdTarea
FOREIGN KEY (IdTarea) REFERENCES Tareas(IdTarea); */

Create table Cursos_Profesores (
    IdProfesor INT,
    IdCurso INT,
    Primary Key (IdProfesor,IdCurso),
    Foreign Key (IdProfesor) REFERENCES Profesores(IdProfesor),
    Foreign Key (IdCurso) REFERENCES Cursos(IdCurso)
);

Create table Tareas (
    IdTarea INT Primary Key,
    Calificacion INT,
    Recompensas INT,
    IdCurso INT,
    IdProfesor INT,
    IdAlumno INT,
    Foreign Key (IdProfesor) REFERENCES Profesores(IdProfesor),
    Foreign Key (IdCurso) REFERENCES Cursos(IdCurso),
    Foreign Key (IdAlumno) REFERENCES Alumnos(IdAlumno)
);

Create table Alumnos (
    IdAlumno INT Primary Key,
    Nombre Varchar(50),
    Email Varchar(50),
    Contrasena Varchar(20),
    Avatar INT,
    IdCurso INT,
    Foreign Key (IdCurso) REFERENCES Cursos(IdCurso) 
);

Create table Cursos_Tareas (
    IdCurso INT,
    IdTarea INT,
    Primary Key (IdCurso,IdTarea)
    Foreign Key (IdTarea) REFERENCES Tareas(IdTarea),
    Foreign Key (IdCurso) REFERENCES Cursos(IdCurso)
);

Create table Register (
    Email Varchar(50),
    Contrasena Varchar(20),
    IdAlumno INT,
    IdProfesor INT,
    Primary Key (Email, Contrasena),
    Foreign Key (IdProfesor) REFERENCES Profesores(IdProfesor)
    Foreign Key (IdAlumno) REFERENCES Alumnos(IdAlumno)
);

/* Las columnas de la tabla inventario y la tabla softskills se expresan como INT, porque entendemos que cada articulo tiene un codigo de referencia */

Create table Inventario (
    IdAlumno INT Primary Key,
    Monedas_y_cofres INT,
    Objetos INT,
    Coleccion_de_chibis INT,
    Mascotas INT,
    Foreign Key (IdAlumno) REFERENCES Alumnos(IdAlumno)
);

Create table Softskills (
    IdAlumno INT Primary Key,
    Responsabilidad INT,
    Cooperacion INT,
    Autonomia_e_iniciativa INT,
    Gestion_emocional INT,
    Habilidad_del_Pensamiento INT,
    Foreign Key (IdAlumno) REFERENCES Alumnos(IdAlumno)
);

Create table Mapa (
    IdAlumno INT Primary Key,
    Nº_Casilla INT,
    Recurso_Casilla INT,
    Foreign Key (IdAlumno) REFERENCES Alumnos(IdAlumno)
);

Create table Ranking (
    IdAlumno INT,
    IdTarea INT,
    Calificacion INT,
    Clasificacion INT,
    Primary Key (IdAlumno,IdTarea),
    Foreign Key (IdAlumno) REFERENCES Alumnos(IdAlumno),
    Foreign Key (IdTarea) REFERENCES Tareas(IdTarea)
);


/* LAS CONSULTAS */

Create database Twinteach;
Use Twinteach;

-- Inserts para Tareas
Insert into Tareas (IdTarea, Calificacion, Recompensas, IdCurso, IdProfesor, IdAlumno)
Values 
    (1, 85, 10, 112, 1, 1),
    (2, 90, 15, 334, 5, 2),
    (3, 80, 8, 656, 3, 3),
    (4, 95, 20, 332, 4, 4),
    (5, 88, 12, 666, 2, 5);

-- Inserts para Alumnos
Insert into Alumnos (IdAlumno, Nombre, Email, Contrasena, Avatar, IdCurso)
Values 
    (1, 'Pedro', 'pedro@gmail.com', 'pass123', 1, 112),
    (2, 'María', 'maria@gmail.com', 'pass456', 2, 334),
    (3, 'Juan', 'juan@gmail.com', 'pass789', 3, 656),
    (4, 'Ana', 'ana@gmail.com', 'passabc', 4, 332),
    (5, 'Lucía', 'lucia@gmail.com', 'passdef', 5, 666);

-- Inserts para Cursos_Tareas
Insert into Cursos_Tareas (IdCurso, IdTarea)
Values 
    (112, 1),
    (334, 2),
    (656, 3),
    (332, 4),
    (666, 5);

-- Inserts para Register
Insert into Register (Email, Contrasena, IdAlumno, IdProfesor)
Values 
    ('pedro@gmail.com', 'pass123', 1, NULL),
    ('maria@gmail.com', 'pass456', 2, NULL),
    ('juan@gmail.com', 'pass789', 3, NULL),
    ('ana@gmail.com', 'passabc', 4, NULL),
    ('lucia@gmail.com', 'passdef', 5, NULL);

-- Inserts para Inventario
Insert into Inventario (IdAlumno, Monedas_y_cofres, Objetos, Coleccion_de_chibis, Mascotas)
Values 
    (1, 100, 3, 5, 2),
    (2, 150, 2, 7, 1),
    (3, 80, 4, 3, 3),
    (4, 200, 1, 2, 5),
    (5, 120, 5, 4, 4);

-- Inserts para Softskills
Insert into Softskills (IdAlumno, Responsabilidad, Cooperacion, Autonomia_e_iniciativa, Gestion_emocional, Habilidad_del_Pensamiento)
Values 
    (1, 85, 90, 80, 75, 88),
    (2, 90, 85, 88, 92, 80),
    (3, 80, 88, 82, 85, 90),
    (4, 95, 92, 90, 80, 85),
    (5, 88, 80, 85, 90, 82);

-- Inserts para Mapa
Insert into Mapa (IdAlumno, N_Casilla, Recurso_Casilla)
Values 
    (1, 10, 2),
    (2, 15, 3),
    (3, 8, 1),
    (4, 20, 4),
    (5, 12, 2);
    
-- Inserts para Ranking
Insert into Ranking (IdAlumno, IdTarea, Calificacion, Clasificacion)
Values 
    (1, 1, 85, 1),
    (2, 2, 90, 1),
    (3, 3, 80, 1),
    (4, 4, 95, 1),
    (5, 5, 88, 1);


/* hay que volver a hacer los insert de la tabla Cursos_Profesores y la de Tareas */




