-- ================================================
-- CinéBase — Schéma relationnel SQL
-- SAÉ RT3
-- ================================================

CREATE TABLE categorie (
    id_categorie    INT PRIMARY KEY AUTO_INCREMENT,
    nom             VARCHAR(100) NOT NULL,
    descriptif      TEXT
);

CREATE TABLE film (
    id_film         INT PRIMARY KEY AUTO_INCREMENT,
    titre           VARCHAR(255) NOT NULL,
    annee_sortie    INT,
    affiche         VARCHAR(255),
    realisateur     VARCHAR(255),
    id_categorie    INT,
    FOREIGN KEY (id_categorie) REFERENCES categorie(id_categorie)
);

CREATE TABLE acteur (
    id_acteur       INT PRIMARY KEY AUTO_INCREMENT,
    nom             VARCHAR(100) NOT NULL,
    prenom          VARCHAR(100) NOT NULL,
    age             INT,
    photo           VARCHAR(255)
);

CREATE TABLE film_acteur (
    id_film         INT,
    id_acteur       INT,
    PRIMARY KEY (id_film, id_acteur),
    FOREIGN KEY (id_film)   REFERENCES film(id_film),
    FOREIGN KEY (id_acteur) REFERENCES acteur(id_acteur)
);

CREATE TABLE personne (
    id_personne     INT PRIMARY KEY AUTO_INCREMENT,
    pseudo          VARCHAR(150) NOT NULL UNIQUE,
    nom_prenom      VARCHAR(255),
    mail            VARCHAR(255) NOT NULL UNIQUE,
    mot_de_passe    VARCHAR(255) NOT NULL,
    type            VARCHAR(20) NOT NULL  -- 'professionnel' ou 'amateur'
);

CREATE TABLE commentaire (
    id_commentaire  INT PRIMARY KEY AUTO_INCREMENT,
    id_film         INT NOT NULL,
    id_personne     INT NOT NULL,
    note            INT NOT NULL CHECK (note BETWEEN 1 AND 10),
    commentaire     TEXT,
    date_commentaire DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_film)     REFERENCES film(id_film),
    FOREIGN KEY (id_personne) REFERENCES personne(id_personne)
);
