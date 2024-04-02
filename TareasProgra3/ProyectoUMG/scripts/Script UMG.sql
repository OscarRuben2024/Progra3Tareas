-- DROP DATABASE UMG_Estructura;
CREATE DATABASE UMG_Estructura;
USE UMG_Estructura;

CREATE TABLE Alumnos(
Nombre_Alumno VARCHAR(50) NOT NULL,
    Carné VARCHAR(20) NOT NULL,
    Carrera VARCHAR(45) NOT NULL,
    Sede_Universitario VARCHAR(35) NOT NULL,
    Facultad VARCHAR(45) NOT NULL,
    CorreoUMG_Alumno VARCHAR(40) NOT NULL,
    Curso VARCHAR(15),
    Pago_Inscripción INT NOT NULL,
    PRIMARY KEY (Carné)
)ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE Sedes (
    ID_Sede INT NOT NULL PRIMARY KEY,
    Nombre_Sede VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100),
    Telefono VARCHAR(20),
    Ciudad VARCHAR(50),
    Pais VARCHAR(50),
    Cantidad_Salones INT,
    INDEX (ID_Sede)
)ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE Salones (
    ID_Salon INT NOT NULL PRIMARY KEY,
    Nombre_Salon VARCHAR(20) NOT NULL,
    ID_Sede INT,
    Capacidad INT,
    FOREIGN KEY (ID_Sede) REFERENCES Sedes (ID_Sede)
)ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE Cursos (
    ID_Curso INT NOT NULL PRIMARY KEY,
    Nombre_Curso VARCHAR(50) NOT NULL,
    Descripcion TEXT,
    Duracion VARCHAR(20),
    Creditos INT,
    Costo FLOAT
)ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE Facultades (
    ID_Facultad INT NOT NULL PRIMARY KEY,
    Nombre_Facultad VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20),
    Direccion VARCHAR(100),
    Ciudad VARCHAR(50),
    Pais VARCHAR(50)
)ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE Maestros(
    Carné_Maestro VARCHAR(20) NOT NULL,
    Nombre_Completo VARCHAR(50) NOT NULL,
    Licenciatura VARCHAR(50) NOT NULL,
    CorreoUMG_Maestro VARCHAR(50) NOT NULL,
    Asignación_Sede VARCHAR(25) NOT NULL,
    Asignación_Salones VARCHAR(15) NOT NULL,
    Encargo_Cursos VARCHAR(30) NOT NULL,
    No_Cuenta_Banco INT NOT NULL,
    Sueldo_Mensual INT NOT NULL,
    PRIMARY KEY (Carné_Maestro),
    INDEX (Encargo_Cursos)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE Carreras(
	Nombre_carrera VARCHAR(30) NOT NULL,
    Carné_Alumno VARCHAR(20) NOT NULL,
    Sede_Universitaria INT NOT NULL,
    Grado_académico VARCHAR(15) NOT NULL,
    Duración VARCHAR(10) NOT NULL,
    Modalidades VARCHAR(20) NOT NULL,
    Jornadas VARCHAR(15) NOT NULL,
    Traslados VARCHAR(20) NOT NULL,
    PRIMARY KEY (Carné_Alumno),
    FOREIGN KEY (Carné_Alumno) REFERENCES Alumnos (Carné),
    FOREIGN KEY (Sede_Universitaria) REFERENCES Sedes (ID_Sede)
)ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE Horarios (
    ID_Horario INT NOT NULL AUTO_INCREMENT,
    ID_Curso INT NOT NULL,
    ID_Salon INT NOT NULL,
    Dia_Semana VARCHAR(15) NOT NULL,
    Hora_Inicio TIME NOT NULL,
    Hora_Fin TIME NOT NULL,
    PRIMARY KEY (ID_Horario),
    FOREIGN KEY (ID_Curso) REFERENCES Cursos (ID_Curso),
    FOREIGN KEY (ID_Salon) REFERENCES Salones (ID_Salon)
)ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE Bancos(
	Nombre_banco VARCHAR(30) NOT NULL,
    Num_cuenta VARCHAR(20) NOT NULL,
    Carné_Alumno VARCHAR(20) NOT NULL,
    Pagos_pendientes VARCHAR(30) NOT NULL,
    ID_Sede INT NOT NULL PRIMARY KEY,
    ID_Curso INT NOT NULL,
    Costo_inscripción INT NOT NULL,
    Costo_mensualidad INT NOT NULL,
    FOREIGN KEY (Carné_Alumno) REFERENCES Alumnos (Carné),
    FOREIGN KEY (ID_Sede) REFERENCES Sedes (ID_Sede),
    FOREIGN KEY (ID_Curso) REFERENCES Cursos (ID_Curso)
)ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE Edificios(
 Edificio VARCHAR(30) NOT NULL,
    ID_Sede INT NOT NULL,
    Sede_Universitaria INT NOT NULL,
    Direccion VARCHAR(100),
    Ciudad VARCHAR(50),
    Pais VARCHAR(50),
    FOREIGN KEY (Sede_Universitaria) REFERENCES Sedes (ID_Sede)
)ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE Notas(
	Carné_Alumno VARCHAR(20) NOT NULL,
    Encargo_Cursos VARCHAR(30) NOT NULL,
    Nota_Primer_Parcial INT NOT NULL,
    Nota_Segundo_Parcial INT NOT NULL,
    Nota_Final_Parcial INT NOT NULL,
    Actividades INT NOT NULL,
    FOREIGN KEY (Carné_Alumno) REFERENCES Alumnos (Carné),
    FOREIGN KEY (Encargo_Cursos) REFERENCES Maestros (Encargo_Cursos),
    PRIMARY KEY (Carné_Alumno, Encargo_Cursos)
)ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE Pagos(
    Carné VARCHAR(20) NOT NULL,
    Pago_Inscripción INT NOT NULL,
    Pago_Colegiatura INT NOT NULL,
    Sueldo_Mensual INT NOT NULL,
    PRIMARY KEY (Carné),
    FOREIGN KEY (Carné) REFERENCES Maestros (Carné_Maestro)
)ENGINE=INNODB DEFAULT CHARSET=latin1;