CREATE TABLE  Administrador 
(
  id_admon  int NOT NULL AUTO_INCREMENT ,
  nombre    varchar(250) NOT NULL ,
  apellido  varchar(250) NOT NULL ,
  email     varchar(250) NOT NULL ,
  password  varchar(250) NOT NULL ,
PRIMARY KEY ( id_admon ),
UNIQUE INDEX ( email )
) AUTO_INCREMENT=1;

CREATE TABLE  Locutor 
(
  id_locutor  int NOT NULL AUTO_INCREMENT ,
  nombre      varchar(250) NOT NULL ,
  apellido    varchar(250) NOT NULL ,
  email       varchar(250) NOT NULL ,
PRIMARY KEY ( id_locutor ),
UNIQUE INDEX ( email )
) AUTO_INCREMENT=1;

CREATE TABLE  Concurso 
(
  id_concurso    int NOT NULL AUTO_INCREMENT ,
  nombre         varchar(250) NOT NULL ,
  id_admon       int NOT NULL ,
  logo           varchar(250) NOT NULL ,
  url            varchar(250) NOT NULL ,
  fecha_inicio   date NOT NULL ,
  fecha_fin      date NOT NULL ,
  valor          integer NOT NULL ,
  guion          varchar(500) NOT NULL ,
  recomendacion  varchar(500) NOT NULL ,
PRIMARY KEY ( id_concurso ),
KEY  FK_admon  ( id_admon ),
CONSTRAINT  FK_admon_concurso  FOREIGN KEY  FK_admon  ( id_admon ) REFERENCES  Administrador  ( id_admon )
) AUTO_INCREMENT=1;

CREATE TABLE  Propuesta 
(
  id_propuesta    int NOT NULL AUTO_INCREMENT ,
  fecha           date NOT NULL ,
  id_locutor      int NOT NULL ,
  id_concurso     int NOT NULL ,
  estado          varchar(250) NOT NULL ,
  voz_original    varchar(250) NOT NULL ,
  voz_convertida  varchar(250) NULL ,
  mensaje         varchar(500) NOT NULL ,
PRIMARY KEY ( id_propuesta ),
KEY  FK_concurso  ( id_concurso ),
CONSTRAINT  FK_concurso_propuesta  FOREIGN KEY  FK_concurso  ( id_concurso ) REFERENCES  Concurso  ( id_concurso ),
KEY  FK_locutor  ( id_locutor ),
CONSTRAINT  FK_locutor_propuesta  FOREIGN KEY  FK_locutor  ( id_locutor ) REFERENCES  Locutor  ( id_locutor )
) AUTO_INCREMENT=1;
