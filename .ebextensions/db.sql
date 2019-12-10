CREATE TABLE IF NOT EXISTS lugares (
    lugar_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    lugar_nombre VARCHAR (300) NOT NULL,
    lugar_pais VARCHAR (100),
    lugar_departamento VARCHAR (100),
    lugar_localidad VARCHAR (100),
    lugar_direccion VARCHAR (50),
    lugar_lat FLOAT,
    lugar_long FLOAT,
    ligar_tipo INT
);

CREATE TABLE IF NOT EXISTS hechos (
    hecho_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    hecho_tipo INT,
    hecho_descripcion TEXT,
    hecho_actores TEXT,
    hecho_año VARCHAR(10) fk_lugar INT,
    FOREIGN KEY (fk_lugar) REFERENCES lugares (lugar_id) ON
DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS fondos (
    fondo_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fondo_nombre VARCHAR (300) NOT NULL,
    fondo_resena TEXT,
    fondo_sociopolitico TEXT,
    fondo_caracterizacion TEXT,
    fondo_documentos_path VARCHAR (300),
    fondo_responsable_nombre VARCHAR (200),
    fondo_responsable_celular VARCHAR (15),
    fondo_responsable_correo VARCHAR (100),
    fk_lugar INT,
    FOREIGN KEY (fk_lugar) REFERENCES lugares (lugar_id) ON
DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS colecciones (
    coleccion_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    coleccion_nombre VARCHAR (300) NOT NULL,
    coleccion_codigo VARCHAR(20),
    coleccion_tipo VARCHAR(50),
    coleccion_cantidad_piezas MEDIUMINT,
    coleccion_creacion VARCHAR(10),
    coleccion_contexto TEXT,
    coleccion_entidad_nombre VARCHAR(200),
    coleccion_entidad_descripción TEXT,
    coleccion_entidad_url VARCHAR(200),
    coleccion_documentos_path VARCHAR(300),
    fk_fondo INT,
    fk_lugar INT,
    FOREIGN KEY (fk_lugar) REFERENCES lugares (lugar_id) ON
DELETE CASCADE,
    FOREIGN KEY (fk_fondo) REFERENCES fondos (fondo_id) ON
DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS piezas (
    pieza_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pieza_titulo VARCHAR(200),
    pieza_codigo VARCHAR(100),
    pieza_imagen_path TEXT,
    pieza_detalle_path TEXT,
    pieza_autores TEXT,
    pieza_fecha VARHCAR(10),
    coleccion_entidad_nombre VARCHAR(200),
    coleccion_entidad_descripción TEXT,
    coleccion_entidad_url VARCHAR(200),
    pieza_tematicas TEXT,
    pieza_realto MEDIUMTEXT,
    pieza_audio_path TEXT,
    pieza_audio_descriptores TEXT,
    pieza_ancho FLOAT,
    pieza_alto FLOAT,
    pieza_espesor FLOAT,
    pieza_tipo_textil FLOAT,
    pieza_materiales TEXT,
    pieza_tecnicas TEXT,
    pieza_conservacion TEXT,
    pieza_usos TEXT,
    pieza_eventos TEXT,
    pieza_ducumentos_path VARCHAR(300),
    pieza_consentimiento_path VARCHAR(300),
    pieza_galeria_path VARCHAR(300),
    pieza_fotografo VARCHAR(150),
    pieza_autor_ficha VARCHAR(150),
    pieza_fecha_rdttc VARHCAR(10),
    fk_fondo,
    fk_coleccion,
    fk_hecho,
    FOREIGN KEY (fk_fondo) REFERENCES fondos (fondo_id) ON
DELETE CASCADE,
    FOREIGN KEY (fk_coleccion) REFERENCES colecciones (coleccion_id) ON
DELETE CASCADE,
    FOREIGN KEY (fk_hecho) REFERENCES hechos (hecho_id) ON
DELETE CASCADE
)