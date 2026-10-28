/*
Requêtes : essais de conversion de TRI COVADIS en CNIG à partir du projet de geostandard
Auteur : Stanislas Besson - DDT38/SIMAJE/SIG-OBS
Date : 20 octobre 2026
*/

/*
TRI testé : VIENNE
GASPAR : 42DREAL20160001
Classe iso hauteur : oui
Ouvrages : Oui
Zone suraléa : oui
Enjeux : Oui
*/

-- Initialisation
-- creation schema au nom de l'identifiant du TRI

CREATE SCHEMA frd_tri_vienne;
COMMENT ON SCHEMA frd_tri_vienne IS 'Tables de la cartographie du territoire à risques d''inondation de Vienne approuvé le 11/12/2019';

-- ---------------------------------
-- table de valeurs typereferencetri
-- ---------------------------------

CREATE TABLE frd_tri_vienne.typereferencetri (
code varchar(3),
libelle varchar(200),
CONSTRAINT typereferencetri_pk PRIMARY KEY (code)
);

INSERT INTO frd_tri_vienne.typereferencetri VALUES 
('Nat','Plateforme nationale'),
('Reg','Plateforme régionale')
;

-- ------------------------------------
-- table de valeurs typeprobalilitealea
-- ------------------------------------

CREATE TABLE frd_tri_vienne.typeprobalilitealea (
code varchar(10),
libelle varchar(100),
CONSTRAINT typeprobalilitealea_pk PRIMARY KEY (code)
);

INSERT INTO frd_tri_vienne.typeprobalilitealea VALUES
('For', 'Aléa de forte probabilité'),
('Forcc_ct', 'Aléa de forte probabilité avec prise en compte du changement climatique à court terme'),
('Forcc_100', 'Aléa de forte probabilité avec prise en compte du changement climatique à échéance 100 ans'),
('Moy', 'Aléa de moyenne probabilité'),
('Moycc_ct', 'Aléa de moyenne probabilité avec prise en compte du changement climatique à court terme'),
('Moycc_100', 'Aléa de moyenne probabilité avec prise en compte du changement climatique à échéance 100 ans'),
('Fai', 'Aléa de faible probabilité'),
('Faicc_ct', 'Aléa de faible probabilité avec prise en compte du changement climatique à court terme'),
('Faicc_100', 'Aléa de faible probabilité avec prise en compte du changement climatique à échéance 100 ans')
;

-- --------------------------------
-- table de valeurs typealeacartodi
-- --------------------------------

CREATE TABLE frd_tri_vienne.typealeacartodi (
code varchar(10),
libelle varchar(100),
CONSTRAINT typealeacartodi_pk PRIMARY KEY (code)
);

INSERT INTO frd_tri_vienne.typealeacartodi VALUES
('112', 'Risque naturel ; Inondation ; Par une crue à débordement lent de cours d''eau'),
('113', 'Risque naturel ; Inondation ; Par une crue torrentielle ou à montée rapide de cours d''eau'),
('114', 'Risque naturel ; Inondation ; Par ruissellement et coulée de boue'),
('115', 'Risque naturel ; Inondation ; Par lave torrentielle (torrent et talweg)'),
('116', 'Risque naturel ; Inondation ; Par remontées de nappes naturelles'),
('117', 'Risque naturel ; Inondation ; Par submersion marine')
;

-- -------------------------------------
-- table de valeurs typeclassehauteureau
-- -------------------------------------

CREATE TABLE frd_tri_vienne.typeclassehauteureau (
code varchar(10),
libelle varchar(100),
CONSTRAINT typeclassehauteureau_pk PRIMARY KEY (code)
);

INSERT INTO frd_tri_vienne.typeclassehauteureau VALUES
('Emerg', 'Zone émergée'),
('Inf05', 'Inférieur à 0,5m'),
('05-1m', 'Entre 0,5m et 1m'),
('1m-2m', 'Entre 1m et 2m'),
('Sup2m', 'Supérieur à 2m')
;

-- --------------------------------------
-- table de valeurs typerefexterneouvrage
-- --------------------------------------

CREATE TABLE frd_tri_vienne.typerefexterneouvrage (
code varchar(2),
libelle varchar(50),
CONSTRAINT typerefexterneouvrage_pk PRIMARY KEY (code)
);

INSERT INTO frd_tri_vienne.typerefexterneouvrage VALUES
('01', 'ROE'),
('02', 'SIOUH II'),
('99', 'autre')
;

-- --------------------------------------
-- table de valeurs typeouvrageprotecteur
-- --------------------------------------

CREATE TABLE frd_tri_vienne.typeouvrageprotecteur (
code varchar(3),
libelle varchar(100),
CONSTRAINT typeouvrageprotecteur_pk PRIMARY KEY (code)
);

INSERT INTO frd_tri_vienne.typeouvrageprotecteur VALUES
('1', 'Ouvrage ou installation pouvant influencer les inondations'),
('11', 'Ouvrage de protection contre les inondations'),
('111', 'Ouvrage appartenant à un système d''endiguement'),
('112', 'Aménagement hydraulique'),
('119', 'Autre ouvrage de protection contre les inondations'),
('12', 'Ouvrage ou installation influençant les écoulements sans fonction de protection')
;

-- ---------------------------------
-- table de valeurs typeenjeucartodi
-- ---------------------------------

CREATE TABLE frd_tri_vienne.typeenjeucartodi (
code varchar(6),
libelle varchar(100),
CONSTRAINT typeenjeucartodi_pk PRIMARY KEY (code)
);

INSERT INTO frd_tri_vienne.typeenjeucartodi VALUES
('030101', 'Ports, zones d''activités portuaires et d''activités balnéaires'),
('030102', 'Campings et hôtellerie de plein air'),
('030103', 'Zones d''activités agricoles spécifiques'),
('040000', 'Projets d''aménagement futurs du territoire'),
('060101', 'Zone d''industrie'),
('060102', 'Services de type commerces'),
('060104', 'Zone de carrières ou gravières'),
('070100', 'Etablissements sensibles ou difficilement évacuables'),
('070101', 'Crêche'),
('070102', 'Ecole'),
('070103', 'Hopital'),
('070104', 'Ehpad'),
('070105', 'Prison'),
('070200', 'Equipements stratégiques pour la gestion de crise'),
('070201', 'Caserne de pompiers'),
('070202', 'Forces de l''ordre'),
('070300', 'Equipements collectifs de type ERP ou espaces publics ouverts'),
('070301', 'Mairie'),
('070302', 'Préfecture'),
('070501', 'Autoroute ou quasi autoroute'),
('070502', 'Route liaison principale'),
('070503', 'Route liaison régionale'),
('070504', 'Voie ferrée principale'),
('070505', 'Aéroport'),
('070600', 'Réseaux et équipements sensibles'),
('070601', 'Installation SEVESO'),
('070602', 'Installation nucléaire de base'),
('070603', 'Installation de la directive IED'),
('070604', 'Station de traitement des eaux usées'),
('080200', 'Patrimoine culturel'),
('080300', 'Zones protégées de la directive cadre eau'),
('080301', 'Zone de captage d''eau potable'),
('080302', 'Baignades'),
('080303', 'Zones Natura 2000')
;
-- -----
-- tri_s
-- -----

CREATE TABLE frd_tri_vienne.tri_s ( 
id_tri varchar(50),
nom varchar(245),
id_procedure varchar(30) not null,
lib_procedure varchar(245),
date_procedure date not null,
url_ref varchar(254) not null,
type_ref varchar(3) not null,
geom geometry(multipolygon,2154) not null,
CONSTRAINT tri_s_pk PRIMARY KEY (id_tri),
CONSTRAINT tri_typeref_fk FOREIGN KEY (type_ref) REFERENCES frd_tri_vienne.typereferencetri (code)
);

CREATE INDEX tri_s_sdx ON frd_tri_vienne.tri_s USING gist (geom) ;

-- ---------------------------
-- carte_surfaces_inondables_s
-- ---------------------------

CREATE TABLE frd_tri_vienne.carte_surfaces_inondables_s (
id_csi varchar(8),
id_tri varchar(50) not null,
date_carte date not null,
occurrence varchar(10) not null,
geom geometry(polygon,2154) not null,
CONSTRAINT carte_surfaces_inondables_s_pk PRIMARY KEY (id_csi),
CONSTRAINT csi_tri_fk FOREIGN KEY (id_tri) REFERENCES frd_tri_vienne.tri_s (id_tri),
CONSTRAINT csi_occ_fk FOREIGN KEY (occurrence) REFERENCES frd_tri_vienne.typeprobalilitealea (code)
);

CREATE INDEX csi_s_sdx ON frd_tri_vienne.carte_surfaces_inondables_s USING gist (geom) ;

-- --------------------------
-- carte_risques_inondation_s
-- --------------------------

CREATE TABLE frd_tri_vienne.carte_risques_inondation_s (
id_cri varchar(9),
id_tri varchar(50) not null,
date_carte date not null,
geom geometry(polygon,2154) not null,
CONSTRAINT carte_risques_inondation_s_pk PRIMARY KEY (id_cri),
CONSTRAINT cri_tri_fk FOREIGN KEY (id_tri) REFERENCES frd_tri_vienne.tri_s (id_tri)
);

CREATE INDEX cri_s_sdx ON frd_tri_vienne.carte_risques_inondation_s USING gist (geom) ;

-- -------------------
-- surface_inondable_s
-- -------------------

CREATE TABLE frd_tri_vienne.surface_inondable_s (
id_sin varchar(9),
id_tri varchar(50) not null,
type_alea varchar(3) not null,
occurrence varchar(10) not null,
date_calcul date,
origine_inond varchar(50),
geom geometry(polygon,2154) not null,
CONSTRAINT surface_inondable_s_pk PRIMARY KEY (id_sin),
CONSTRAINT sin_tri_fk FOREIGN KEY (id_tri) REFERENCES frd_tri_vienne.tri_s (id_tri),
CONSTRAINT sin_alea_fk FOREIGN KEY (type_alea) REFERENCES frd_tri_vienne.typealeacartodi (code),
CONSTRAINT sin_occ_fk FOREIGN KEY (occurrence) REFERENCES frd_tri_vienne.typeprobalilitealea (code)
);

CREATE INDEX sin_s_sdx ON frd_tri_vienne.surface_inondable_s USING gist (geom) ;

-- -------------------------
-- zone_iso_classe_hauteur_s
-- -------------------------

CREATE TABLE frd_tri_vienne.zone_iso_classe_hauteur_s (
id_zch varchar(10),
id_tri varchar(50) not null,
id_sin varchar(10) not null,
palier_hauteur varchar(10) not null,
origine_inond varchar(50),
geom geometry(polygon,2154) not null,
CONSTRAINT zone_iso_classe_hauteur_s_pk PRIMARY KEY (id_zch),
CONSTRAINT zch_tri_fk FOREIGN KEY (id_tri) REFERENCES frd_tri_vienne.tri_s (id_tri),
CONSTRAINT zch_sin_fk FOREIGN KEY (id_sin) REFERENCES frd_tri_vienne.surface_inondable_s (id_sin),
CONSTRAINT zch_haut_fk FOREIGN KEY (palier_hauteur) REFERENCES frd_tri_vienne.typeclassehauteureau (code)
);

CREATE INDEX zch_s_sdx ON frd_tri_vienne.zone_iso_classe_hauteur_s USING gist (geom) ;

-- ---------------
-- zone_protegee_s
-- ---------------

CREATE TABLE frd_tri_vienne.zone_protegee_s (
id_zpr varchar(10),
id_tri varchar(50) not null,
description varchar(100),
occurrence varchar(10) not null,
niveau_protec varchar(50),
geom geometry(multipolygon,2154) not null,
CONSTRAINT zone_protegee_s_pk PRIMARY KEY (id_zpr),
CONSTRAINT zpr_tri_fk FOREIGN KEY (id_tri) REFERENCES frd_tri_vienne.tri_s (id_tri),
CONSTRAINT zpr_occ_fk FOREIGN KEY (occurrence) REFERENCES frd_tri_vienne.typeprobalilitealea (code)
);

CREATE INDEX zpr_s_sdx ON frd_tri_vienne.zone_protegee_s USING gist (geom) ;

-- -------------------
-- ouvrageprotecteur_l
-- -------------------

CREATE TABLE frd_tri_vienne.ouvrageprotecteur_l (
id_ouv varchar(10),
id_tri varchar(50) not null,
nom varchar(100),
id_ref_ext varchar(20),
ref_externe varchar(2) not null,
ref_externe_autre varchar(50),
type_ouv_protec varchar(3) not null,
role_protection boolean,
occurrence varchar(10),
geom geometry(multilinestring,2154) not null,
CONSTRAINT ouvrageprotecteur_l_pk PRIMARY KEY (id_ouv),
CONSTRAINT ouv_tri_fk FOREIGN KEY (id_tri) REFERENCES frd_tri_vienne.tri_s (id_tri),
CONSTRAINT ouv_ref_ext_fk FOREIGN KEY (ref_externe) REFERENCES frd_tri_vienne.typerefexterneouvrage (code),
CONSTRAINT ouv_type_ouv_fk FOREIGN KEY (type_ouv_protec) REFERENCES frd_tri_vienne.typeouvrageprotecteur (code),
CONSTRAINT ouv_occ_fk FOREIGN KEY (occurrence) REFERENCES frd_tri_vienne.typeprobalilitealea (code)
);

CREATE INDEX ouv_l_sdx ON frd_tri_vienne.ouvrageprotecteur_l USING gist (geom) ;

-- -------------
-- zonesuralea_s
-- -------------

CREATE TABLE frd_tri_vienne.zonesuralea_s (
id_zsa varchar(10),
id_tri varchar(50) not null,
description varchar(100),
occurrence varchar(10) not null,
geom geometry(multipolygon,2154) not null,
CONSTRAINT zonesuralea_s_pk PRIMARY KEY (id_zsa),
CONSTRAINT zsa_tri_fk FOREIGN KEY (id_tri) REFERENCES frd_tri_vienne.tri_s (id_tri),
CONSTRAINT zsa_occ_fk FOREIGN KEY (occurrence) REFERENCES frd_tri_vienne.typeprobalilitealea (code)
);

CREATE INDEX zsa_s_sdx ON frd_tri_vienne.zonesuralea_s USING gist (geom) ;

-- -------
-- enjeu_s
-- -------

CREATE TABLE frd_tri_vienne.enjeu_s (
id_enj varchar(10),
id_tri varchar(50) not null,
nom varchar(50) not null,
id_ref_externe varchar(50),
ref_externe varchar(20),
type_enjeu varchar(6) not null,
date_enjeu date,
geom geometry(multipolygon,2154) not null,
CONSTRAINT enjeu_s_pk PRIMARY KEY (id_enj),
CONSTRAINT enj_s_tri_fk FOREIGN KEY (id_tri) REFERENCES frd_tri_vienne.tri_s (id_tri),
CONSTRAINT enj_s_type_fk FOREIGN KEY (type_enjeu) REFERENCES frd_tri_vienne.typeenjeucartodi (code)
);

CREATE INDEX enj_s_sdx ON frd_tri_vienne.enjeu_s USING gist (geom) ;

-- -------
-- enjeu_l
-- -------

CREATE TABLE frd_tri_vienne.enjeu_l (
id_enj varchar(10),
id_tri varchar(50) not null,
nom varchar(50) not null,
id_ref_externe varchar(50),
ref_externe varchar(20),
type_enjeu varchar(6) not null,
date_enjeu date,
geom geometry(multilinestring,2154) not null,
CONSTRAINT enjeu_l_pk PRIMARY KEY (id_enj),
CONSTRAINT enj_l_tri_fk FOREIGN KEY (id_tri) REFERENCES frd_tri_vienne.tri_s (id_tri),
CONSTRAINT enj_l_type_fk FOREIGN KEY (type_enjeu) REFERENCES frd_tri_vienne.typeenjeucartodi (code)
);

CREATE INDEX enj_l_sdx ON frd_tri_vienne.enjeu_l USING gist (geom) ;
CONSTRAINT ert_tri_fk FOREIGN KEY (id_tri) REFERENCES frd_tri_vienne.tri_s (id_tri),
CONSTRAINT ert_occ_fk FOREIGN KEY (occurrence) REFERENCES frd_tri_vienne.typeprobalilitealea (code)
);

-- -------
-- enjeu_p
-- -------

CREATE TABLE frd_tri_vienne.enjeu_p (
id_enj varchar(10),
id_tri varchar(50) not null,
nom varchar(50) not null,
id_ref_externe varchar(50),
ref_externe varchar(20),
type_enjeu varchar(6) not null,
date_enjeu date,
geom geometry(point,2154) not null,
CONSTRAINT enjeu_p_pk PRIMARY KEY (id_enj),
CONSTRAINT enj_p_tri_fk FOREIGN KEY (id_tri) REFERENCES frd_tri_vienne.tri_s (id_tri),
CONSTRAINT enj_p_type_fk FOREIGN KEY (type_enjeu) REFERENCES frd_tri_vienne.typeenjeucartodi (code)
);

CREATE INDEX enj_p_sdx ON frd_tri_vienne.enjeu_p USING gist (geom) ;

-- --------------------
-- enjeux_rapportes_tri
-- --------------------

CREATE TABLE frd_tri_vienne.enjeux_rapportes_tri (
id_ert varchar(10),
id_tri varchar(50) not null,
occurrence varchar(10) not null,
nb_hab_perm integer not null,
nb_hab_sais integer not null,
nb_emplois integer not null,
CONSTRAINT ert_pk PRIMARY KEY (id_ert),
CONSTRAINT ert_tri_fk FOREIGN KEY (id_tri) REFERENCES frd_tri_vienne.tri_s (id_tri),
CONSTRAINT ert_occ_fk FOREIGN KEY (occurrence) REFERENCES frd_tri_vienne.typeprobalilitealea (code)
);

-- -------------------------------
-- contrôle qualité des géométries
-- -------------------------------

SELECT 'tri_s' as nom_couche,
(select count(*) as nb_geom_ko FROM frd_tri_vienne.tri_s WHERE NOT ST_IsValid(geom)),
(select count(*) as nb_obj_som_ko FROM frd_tri_vienne.tri_s WHERE  ST_NPoints(geom) >50000), 
(select count(*) as nb_obj_ppp_ko FROM frd_tri_vienne.tri_s WHERE  10*ST_NPoints(geom)/st_perimeter(geom) > 1), 
(select count(*) as nb_obj_trou_ko FROM frd_tri_vienne.tri_s WHERE  ST_NumInteriorRing(geom) >500), 
(select count(*) as nb_obj_parties_ko FROM frd_tri_vienne.tri_s WHERE  ST_NumGeometries(geom) >500),
(select count(*) as nb_obj_perim_ko FROM frd_tri_vienne.tri_s WHERE ST_Perimeter(geom) < 5),
(select count(*) as nb_obj_area_ko FROM frd_tri_vienne.tri_s WHERE ST_Area(geom) < 100)
UNION
SELECT 'carte_surfaces_inondables_s' as nom_couche,
(select count(*) as nb_geom_ko FROM frd_tri_vienne.carte_surfaces_inondables_s WHERE NOT ST_IsValid(geom)),
(select count(*) as nb_obj_som_ko FROM frd_tri_vienne.carte_surfaces_inondables_s WHERE  ST_NPoints(geom) >50000), 
(select count(*) as nb_obj_ppp_ko FROM frd_tri_vienne.carte_surfaces_inondables_s WHERE  10*ST_NPoints(geom)/st_perimeter(geom) > 1), 
(select count(*) as nb_obj_trou_ko FROM frd_tri_vienne.carte_surfaces_inondables_s WHERE  ST_NumInteriorRing(geom) >500), 
(select count(*) as nb_obj_parties_ko FROM frd_tri_vienne.carte_surfaces_inondables_s WHERE  ST_NumGeometries(geom) >500),
(select count(*) as nb_obj_perim_ko FROM frd_tri_vienne.carte_surfaces_inondables_s WHERE ST_Perimeter(geom) < 5),
(select count(*) as nb_obj_area_ko FROM frd_tri_vienne.carte_surfaces_inondables_s WHERE ST_Area(geom) < 100)
UNION
SELECT 'carte_risques_inondation_s' as nom_couche,
(select count(*) as nb_geom_ko FROM frd_tri_vienne.carte_risques_inondation_s WHERE NOT ST_IsValid(geom)),
(select count(*) as nb_obj_som_ko FROM frd_tri_vienne.carte_risques_inondation_s WHERE  ST_NPoints(geom) >50000), 
(select count(*) as nb_obj_ppp_ko FROM frd_tri_vienne.carte_risques_inondation_s WHERE  10*ST_NPoints(geom)/st_perimeter(geom) > 1), 
(select count(*) as nb_obj_trou_ko FROM frd_tri_vienne.carte_risques_inondation_s WHERE  ST_NumInteriorRing(geom) >500), 
(select count(*) as nb_obj_parties_ko FROM frd_tri_vienne.carte_risques_inondation_s WHERE  ST_NumGeometries(geom) >500),
(select count(*) as nb_obj_perim_ko FROM frd_tri_vienne.carte_risques_inondation_s WHERE ST_Perimeter(geom) < 5),
(select count(*) as nb_obj_area_ko FROM frd_tri_vienne.carte_risques_inondation_s WHERE ST_Area(geom) < 100)
UNION
SELECT 'surface_inondable_s' as nom_couche,
(select count(*) as nb_geom_ko FROM frd_tri_vienne.surface_inondable_s WHERE NOT ST_IsValid(geom)),
(select count(*) as nb_obj_som_ko FROM frd_tri_vienne.surface_inondable_s WHERE  ST_NPoints(geom) >50000), 
(select count(*) as nb_obj_ppp_ko FROM frd_tri_vienne.surface_inondable_s WHERE  10*ST_NPoints(geom)/st_perimeter(geom) > 1), 
(select count(*) as nb_obj_trou_ko FROM frd_tri_vienne.surface_inondable_s WHERE  ST_NumInteriorRing(geom) >500), 
(select count(*) as nb_obj_parties_ko FROM frd_tri_vienne.surface_inondable_s WHERE  ST_NumGeometries(geom) >500),
(select count(*) as nb_obj_perim_ko FROM frd_tri_vienne.surface_inondable_s WHERE ST_Perimeter(geom) < 5),
(select count(*) as nb_obj_area_ko FROM frd_tri_vienne.surface_inondable_s WHERE ST_Area(geom) < 100)
UNION
SELECT 'zone_iso_classe_hauteur_s' as nom_couche,
(select count(*) as nb_geom_ko FROM frd_tri_vienne.zone_iso_classe_hauteur_s WHERE NOT ST_IsValid(geom)),
(select count(*) as nb_obj_som_ko FROM frd_tri_vienne.zone_iso_classe_hauteur_s WHERE  ST_NPoints(geom) >50000), 
(select count(*) as nb_obj_ppp_ko FROM frd_tri_vienne.zone_iso_classe_hauteur_s WHERE  10*ST_NPoints(geom)/st_perimeter(geom) > 1), 
(select count(*) as nb_obj_trou_ko FROM frd_tri_vienne.zone_iso_classe_hauteur_s WHERE  ST_NumInteriorRing(geom) >500), 
(select count(*) as nb_obj_parties_ko FROM frd_tri_vienne.zone_iso_classe_hauteur_s WHERE  ST_NumGeometries(geom) >500),
(select count(*) as nb_obj_perim_ko FROM frd_tri_vienne.zone_iso_classe_hauteur_s WHERE ST_Perimeter(geom) < 5),
(select count(*) as nb_obj_area_ko FROM frd_tri_vienne.zone_iso_classe_hauteur_s WHERE ST_Area(geom) < 100)
UNION 
SELECT 'zone_protegee_s' as nom_couche,
(select count(*) as nb_geom_ko FROM frd_tri_vienne.zone_protegee_s WHERE NOT ST_IsValid(geom)),
(select count(*) as nb_obj_som_ko FROM frd_tri_vienne.zone_protegee_s WHERE  ST_NPoints(geom) >50000), 
(select count(*) as nb_obj_ppp_ko FROM frd_tri_vienne.zone_protegee_s WHERE  10*ST_NPoints(geom)/st_perimeter(geom) > 1), 
(select count(*) as nb_obj_trou_ko FROM frd_tri_vienne.zone_protegee_s WHERE  ST_NumInteriorRing(geom) >500), 
(select count(*) as nb_obj_parties_ko FROM frd_tri_vienne.zone_protegee_s WHERE  ST_NumGeometries(geom) >500),
(select count(*) as nb_obj_perim_ko FROM frd_tri_vienne.zone_protegee_s WHERE ST_Perimeter(geom) < 5),
(select count(*) as nb_obj_area_ko FROM frd_tri_vienne.zone_protegee_s WHERE ST_Area(geom) < 100)
UNION 
SELECT 'zonesuralea_s' as nom_couche,
(select count(*) as nb_geom_ko FROM frd_tri_vienne.zonesuralea_s WHERE NOT ST_IsValid(geom)),
(select count(*) as nb_obj_som_ko FROM frd_tri_vienne.zonesuralea_s WHERE  ST_NPoints(geom) >50000), 
(select count(*) as nb_obj_ppp_ko FROM frd_tri_vienne.zonesuralea_s WHERE  10*ST_NPoints(geom)/st_perimeter(geom) > 1), 
(select count(*) as nb_obj_trou_ko FROM frd_tri_vienne.zonesuralea_s WHERE  ST_NumInteriorRing(geom) >500), 
(select count(*) as nb_obj_parties_ko FROM frd_tri_vienne.zonesuralea_s WHERE  ST_NumGeometries(geom) >500),
(select count(*) as nb_obj_perim_ko FROM frd_tri_vienne.zonesuralea_s WHERE ST_Perimeter(geom) < 5),
(select count(*) as nb_obj_area_ko FROM frd_tri_vienne.zonesuralea_s WHERE ST_Area(geom) < 100)
UNION 
SELECT 'enjeu_s' as nom_couche,
(select count(*) as nb_geom_ko FROM frd_tri_vienne.enjeu_s WHERE NOT ST_IsValid(geom)),
(select count(*) as nb_obj_som_ko FROM frd_tri_vienne.enjeu_s WHERE  ST_NPoints(geom) >50000), 
(select count(*) as nb_obj_ppp_ko FROM frd_tri_vienne.enjeu_s WHERE  10*ST_NPoints(geom)/st_perimeter(geom) > 1), 
(select count(*) as nb_obj_trou_ko FROM frd_tri_vienne.enjeu_s WHERE  ST_NumInteriorRing(geom) >500), 
(select count(*) as nb_obj_parties_ko FROM frd_tri_vienne.enjeu_s WHERE  ST_NumGeometries(geom) >500),
(select count(*) as nb_obj_perim_ko FROM frd_tri_vienne.enjeu_s WHERE ST_Perimeter(geom) < 5),
(select count(*) as nb_obj_area_ko FROM frd_tri_vienne.enjeu_s WHERE ST_Area(geom) < 100)
ORDER BY nom_couche
;
