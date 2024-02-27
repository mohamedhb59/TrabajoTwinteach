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
    Primary Key (Email,Contrasena),
    Foreign Key (IdProfesor) REFERENCES Profesores(IdProfesor),
    Foreign Key (IdAlumno) REFERENCES Alumnos(IdAlumno),
    Foreign Key (Email) REFERENCES Alumnos(Email),
    Foreign Key (Email) REFERENCES Profesores(Email),
    Foreign Key (Contrasena) REFERENCES Profesores(Contrasena),
    Foreign Key (Contrasena) REFERENCES Alumnos(Contrasena)
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

Insert into Profesores (IdProfesor,Email,Contrasena)
Values ('1','manololama@gmail.com','gkjdfhgkskljd'),
('2','pepeeldelmadrid@yahoo.es','dfhaskhfew'),
('3','rodrigoelcuevas@educastur.org','odihqowghfq'),
('4','federicogarcialorca@hotmail.com','qwooohfeyhfo'),
('5','sergioelbruxu@gmail.es','aofhqwoifhqeoiw');

Insert into Cursos (IdCurso,MisCursos,IdProfesor)
Values ('334','2','5'),
('112','4','1'),
('656','3','3'),
('332','2','4'),
('666','6','2');

Insert into Cursos_Profesores (IdProfesor,IdCurso)
Values ('1','656'),
('2','666'),
('3','332'),
('4','112'),
('5','334');

Insert into Tareas (IdTarea,Calificacion,Recompensas,IdCurso,IdProfesor,IdAlumno)
Values ('255','')
/* hay que volver a hacer los insert de la tabla Cursos_Profesores y la de Tareas */




