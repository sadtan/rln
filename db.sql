
# COMANDOS PARA CONSULTAR LA BASE DE DATOS
show databases;
use undbtest;
show tables;

    # EJECUTAR 1 por 1
    select * from fondos;
    select * from colecciones;
    select * from lugares;
    select * from piezas;
    select * from hechos;


# COMANDOS DE INICIALIZACIÓN (NO EJECUTAR)
    drop table piezas;
    drop table hechos;
    drop table colecciones;
    drop table fondos;
    drop table lugares;

    CREATE TABLE IF NOT EXISTS lugares (
        lugar_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        lugar_nombre VARCHAR (300) NOT NULL,
        lugar_pais VARCHAR (100),
        lugar_departamento VARCHAR (100),
        lugar_localidad VARCHAR (150),
        lugar_direccion VARCHAR (100),
        lugar_lat FLOAT,
        lugar_long FLOAT,
        lugar_tipo BIT
    );

    CREATE TABLE IF NOT EXISTS fondos (
        fondo_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        fondo_nombre VARCHAR (300) NOT NULL,
        fondo_tipo INT,
        fondo_imagen_path TEXT,
        fondo_resena TEXT,
        fondo_sociopolitico TEXT,
        fondo_caracterizacion TEXT,
        fondo_documentos_json TEXT,
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
        coleccion_codigo VARCHAR(100),
        coleccion_tipo INT,
        coleccion_cantidad_piezas MEDIUMINT,
        coleccion_creacion VARCHAR(10),
        coleccion_contexto TEXT,
        coleccion_documentos_json VARCHAR(200),
        fk_fondo INT,
        fk_lugar INT,
        FOREIGN KEY (fk_lugar) REFERENCES lugares (lugar_id) ON
    DELETE CASCADE,
        FOREIGN KEY (fk_fondo) REFERENCES fondos (fondo_id) ON
    DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS hechos (
        hecho_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        hecho_tipo INT,
        hecho_descripcion TEXT,
        hecho_actores TEXT,
        hecho_anio VARCHAR(10),
        fk_lugar INT,
        FOREIGN KEY (fk_lugar) REFERENCES lugares (lugar_id) ON
    DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS piezas (
        pieza_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        pieza_titulo VARCHAR(200),
        pieza_codigo VARCHAR(100),
        pieza_imagen_path TEXT,
        pieza_detalle_path TEXT,
        pieza_autores TEXT,
        pieza_fecha VARCHAR(10),
        pieza_entidad_json TEXT,
        pieza_tematicas TEXT,
        pieza_relato MEDIUMTEXT,
        pieza_audio_path TEXT,
        pieza_descriptores TEXT,
        pieza_ancho FLOAT,
        pieza_alto FLOAT,
        pieza_espesor FLOAT,
        pieza_tipo_textil VARCHAR(200),
        pieza_materiales TEXT,
        pieza_tecnicas TEXT,
        pieza_conservacion TEXT,
        pieza_usos TEXT,
        pieza_eventos_json TEXT,
        pieza_ducumentos_json TEXT,
        pieza_consentimiento_path TEXT,
        pieza_galeria_path TEXT,
        pieza_fotografo VARCHAR(150),
        pieza_autor_ficha VARCHAR(150),
        pieza_fecha_rdttc VARCHAR(10),
        fk_fondo INT,
        fk_coleccion INT,
        fk_hecho INT,
        FOREIGN KEY (fk_fondo) REFERENCES fondos (fondo_id) ON
    DELETE CASCADE,
        FOREIGN KEY (fk_coleccion) REFERENCES colecciones (coleccion_id) ON
    DELETE CASCADE,
        FOREIGN KEY (fk_hecho) REFERENCES hechos (hecho_id) ON
    DELETE CASCADE
    );

    insert into hechos (hecho_id, hecho_tipo, hecho_descripcion, hecho_actores, hecho_anio, fk_lugar) values (
        1, 1, null, null, null, null
    );

    INSERT INTO lugares(lugar_id, lugar_nombre, lugar_pais, lugar_departamento, lugar_localidad, lugar_direccion, lugar_lat, lugar_long, lugar_tipo) VALUES (
        1,
        "Taller Choibá Subestación",
        "Colombia",
        "Chocó",
        "Quibdó",
        "Calle 7a No. 8 – 22",
        5.6845800,
        -76.6453400,
        0
    );

    INSERT INTO lugares(lugar_id, lugar_nombre, lugar_pais, lugar_departamento, lugar_localidad, lugar_direccion, lugar_lat, lugar_long, lugar_tipo) VALUES (
        2,
        "Casa de la cultura municipal Roberto Jaramillo Arango",
        "Colombia",
        "Antioquia",
        "Sosón",
        "Cl. 7 #8-18",
        5.7093920,
        -75.3109280,
        0
    );

    INSERT INTO lugares(lugar_id, lugar_nombre, lugar_pais, lugar_departamento, lugar_localidad, lugar_direccion, lugar_lat, lugar_long, lugar_tipo) VALUES (
        3,
        "Sonsón",
        "Colombia",
        "Antioquia",
        "null",
        "Cl. 7 #8-18",
        5.7099700,
        -75.3101500,
        0
    );

    insert into fondos(fondo_id, fondo_nombre, fk_lugar, fondo_tipo, fondo_imagen_path, fondo_resena, fondo_sociopolitico, fondo_caracterizacion, fondo_documentos_json, fondo_responsable_nombre, fondo_responsable_celular, fondo_responsable_correo) values(
        1,
        "Grupo de Artesanías Choibá  ",
        1,
        2, 
        "Choiba/principal.jpg",
        "Las mujeres que conforman el Grupo de Artesanías Choibá llegaron a Quibdó hace veinte años desde distintos municipios del Chocó y del Urabá Antioqueño huyendo de la guerra. Son mujeres que se encontraron en diciembre de 1998 en la toma que hicieron más de 280 personas desplazadas al Coliseo Municipal de la ciudad como protesta contra la poca atención recibida y la falta de agilidad en la garantía de seguridad para el regreso a sus territorios. Estando allí, mientras esperaban respuestas sobre su situación, aprendieron de la mano de la teóloga y psicóloga Úrsula Holzapfel a construir muñecas, a tejer, bordar y coser, un conocimiento que después las motivaría a crear un proyecto productivo autónomo. Actualmente, son un grupo de 10 mujeres y un hombre que se dedican a la elaboración de muñecas de trapo, telones, ropa, llaveros, bolsos, artículos de cocina, entre otros elementos. Como la madera del Choibá ellas, desde su oficio textil, desde el manejo de la aguja y el hilo, han sido fuertes durante estos veinte años para responder a la precariedades y exclusiones que deja la guerra, por eso, su trabajo también se ha enfocado en la trasmisión de sus conocimientos a otros grupos o colectivos que buscan generar alternativas productivas y sociales propias.",
        "Quibdó es la capital del departamento del Chocó, está localizada en la región del Pacífico sobre la margen derecha del río Atrato. Es una zona de gran biodiversidad, con importantes recursos hídricos y minerales, sin embargo, el 70% de la población no cuenta con servicio de agua potable y depende del agua lluvia. Tiene 27 corregimientos y 14 resguardos indígenas.
    En el territorio coexisten dos tipos de economías, la extractiva de recursos naturales como madera y minerales, y las prácticas productivas tradicionales asociadas a la pesca y el cultivo de plátano, arroz, yuca y caña. En la zona urbana predomina la economía informal y comercio lo que la ubica como la ciudad con mayor tasa de desempleo en el país, un 18,9% respecto a un promedio nacional de 12,8%.
    La disputa entre actores sociales, económicos y políticos por el control de la capital chocoana y sus vías de conexión con el río Atrato y el río San Juan fueron la principal causa del surgimiento del conflicto armado en la región. La extracción de recursos en el departamento, convierten a Quibdó en uno de los centros urbanos geoestratégicos para la movilidad y la expansión de los actores armados.
    La presencia de diferentes actores armados en la región (Autodefensas Unidas de Colombia Bloque Élmer Cárdenas, Ejército de Liberación Nacional (ELN), FARC-EP) convirtieron a Quibdó en el mayor receptor de población desplazada del departamento. En la zona urbana hay más de 10 asentamientos de comunidades indígenas desplazadas y decenas de barrios informales que demandan la atención del estado y garantías para la no repetición de las violencias sufridas que en el contexto urbano se reproducen en un ciclo interminable. ",
        "El grupo de Artesanías Choibá fue creado en el año 2002 por mujeres, afrodescendientes, víctimas de desplazamiento forzado que llegaron a Quibdó hace 20 años, provenientes de distintos municipios del Chocó y del Urabá Antioqueño.   ",
        NULL,
        "Luz Romaña ",
        "3104336578",
        "choiba@prueba.com;"
    );


    INSERT INTO colecciones(coleccion_id, coleccion_nombre, coleccion_codigo, coleccion_tipo, coleccion_cantidad_piezas, coleccion_creacion, coleccion_contexto, coleccion_documentos_json, fk_fondo, fk_lugar) VALUES (
        1,
        "Telones",
        "GAC-001",
        2,
        5,
        2002,
        null,
        null,
        1, 
        1
    );

    INSERT INTO piezas (pieza_id, fk_fondo, fk_coleccion, pieza_titulo, pieza_codigo, pieza_imagen_path, pieza_detalle_path, pieza_autores, pieza_fecha, pieza_entidad_json, pieza_tematicas, fk_hecho, pieza_relato, pieza_audio_path, pieza_descriptores, pieza_ancho, pieza_alto, pieza_espesor, pieza_tipo_textil, pieza_materiales, pieza_tecnicas, pieza_conservacion, pieza_usos, pieza_eventos_json, pieza_ducumentos_json, pieza_consentimiento_path, pieza_galeria_path, pieza_fotografo, pieza_autor_ficha, pieza_fecha_rdttc) VALUES (
        1, 
        1, 
        1, 
        "Telón Choibá Atrateño",
        "GAC-001-001",
        "Choiba/GAC-001/001/principal.jpg",
        "Choiba/GAC-001/001/detalle.jpg",
        "Gloria, Millo, Yaneth, Rubiela, Luz, Rosa, Lucy, Úrsula",
        "2004",
        '[
            {"nombre":"Comisión Justicia y Paz. - Diócesis de Quibdó.", "descripcion": "null", "url": "null"}
        ]',
        "Vida cotidiana; Trayectorias de vida; Conmemoracion ",
        1,
        "Letra por letra, franja por franja, crece una obra de arte, un trabajo comunitario construyendo vida digna”, así presentan las mujeres del grupo Artesanías Choibá en uno de sus catálogos una de sus piezas textiles más queridas: el telón Choibá Atrateño. En él está bordado el poema que así se titula y fue escrito por el sacerdote Gonzalo de la Torre como un regalo para las mujeres y hombres que integran este grupo, quienes como el árbol del Choibá que crece en las selvas atrateñas con raíces y ramas resistentes e intensas flores moradas, han sido fuertes para mantener la vida pese al despojo, el desplazamiento forzado y las distintas violencias que se han perpetuado en su territorio.

    Luz Romaña, una de las integrantes más antiguas y quien cuida el archivo del grupo, cuenta que este telón fue uno de los primeros trabajos colectivos y ha sido uno de los más significativos, pues lo hicieron en el momento en el que ellas estaban aprendiendo a bordar para llenarse de resistencia ante las adversidades sufridas como consecuencia de la guerra en el río Atrato. Bordar el telón implicó revivir los momentos felices en el campo, retratar los buenos recuerdos del río, de los árboles y de sus casas, y narrar mediante letras, colores y figuras toda la belleza de la naturaleza chocona.

    El telón fue elaborado como una colcha de retazos forrados y bordados y es una marca de identidad para el grupo. En los lugares visitados por Artesanías Choibá para compartir experiencias o para publicitar sus productos este es expuesto como una manera de presentación del grupo, su historia y el lugar de donde provienen.",
        "Choiba/GAC-001/001/audios/",
        "Poema, árbol de Choibá, selva, río Atrato, casas, flores",
        119,
        83,
        0.5,
        "Telón",
        "Telas de algodón,  hilos de bordar y coser.",
        "Bordado y costura",
        "La pieza está deteriorada por el paso del tiempo y la humedad, tiene manchas, decoloración en la tela y los hilos, tiene roturas. Esta pieza debe tratarse con cuidado para garantizar su conservación. ",
        "La pieza se exhibió mucho tiempo en el taller de Artesanías Choibá, en el punto de venta para identificarlas. Hoy esta guardada para preservarla y es exhibida solo en exposiciones, como la conmemoración de los 20 años de trabajo del grupo.
    Esta pieza es considerada la pieza emblemática por ser el primer telón elaborado por el grupo.",
        '[
            {"nombre":"Exposición 20 años de resistencia", "fecha": "09/2019", "lugar": "Quibdó, chocó"}
        ]',
        null,
        "Choiba/GAC-001/001/audios/consentimientos.pdf",
        "Choiba/GAC-001/001/galeria/",
        "Equipo apropiación proyecto Remedar lo Nuevo ",
        "Isabel González",
        "nov.-19"
    );

    select fondos.fondo_id, fondos.fondo_nombre, fondos.fk_lugar, lugares.lugar_lat, lugares.lugar_long FROM fondos INNER JOIN lugares ON fondos.fk_lugar = lugares.lugar_id;