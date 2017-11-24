/*
-- =========================================================================== A
Activité : IFT187
Trimestre : 2017-1

Auteur: Samuel Lapointe
        Christophe Pigeon
        Olivier Perrault (16212377)
        Marc-Antoine Dugal
        Marc-Antoine Gauthier

Email : Samuel.Z.Lapointe@usherbrooke.ca
        olivier.perrault@usherbrooke.ca
        livier.perrault@usherbrooke.ca TODO
        livier.perrault@usherbrooke.ca TODO
        livier.perrault@usherbrooke.ca TODO

-- =========================================================================== A
*/

/*
---------------------------SCRIPT DE CREATION----------------------------------
*/


/*----
-----------------
-----------------
BEGIN CREATE DOMAINS
*/----

CREATE DOMAIN Geo_Id
  CHAR(8)
  CHECK (VALUE SIMILAR TO '[A-Z]{2}[0-9]{6}'); --(?:AB|BC|...) other method to code maybe-- 2 lettre (liste des province) suivie de 6 chiffre

CREATE DOMAIN Prov
  VARCHAR(30)
  CHECK (VALUE IN ('AB','BC','MB','NB','NL','NT','NS','NU','ON','PE','QC','SK','YT'));--LISTE OFFICIELLE

CREATE DOMAIN Lat_range
  CHAR(3)
  CHECK ((VALUE SIMILAR TO '[0-9]{2}N') AND (SUBSTR(VALUE,1,2)::DECIMAL(7,4) BETWEEN 42 AND 83));--CAST AS????--as per stat can, range from 42N to 83N

CREATE DOMAIN Lon_range
  CHAR(3)
  CHECK ((VALUE SIMILAR TO '[0-9]{2}W') AND (SUBSTR(VALUE,1,2)::DECIMAL(7,4) BETWEEN 53 AND 141));--CAST AS????-- same but from 53W to 141W

CREATE DOMAIN Cata_Name
  VARCHAR(20)
  CHECK (VALUE IN ('Avalanche','Cold event','Drought','Flood','Geomagnetic storm','Heat event','Hurricane','Storm surge','Storm surge','Thunderstorms','Tornado','Wildfire','Winter storm'));

CREATE DOMAIN Date_eco
  DATE
  CHECK (VALUE >= '1900-01-01');

CREATE DOMAIN Temp --en degrees celcius
  NUMERIC(4,1)
  CHECK (VALUE BETWEEN -100 AND 60); --a l'interieur des records terrestres

CREATE DOMAIN Wind_v --en km/h
  SMALLINT
  CHECK (VALUE BETWEEN 0 AND 450); --la plus forte rafale jamais repertoriée

CREATE DOMAIN Cardinal
  CHAR(2)
  CHECK (VALUE IN ('N','NNE','NE','ENE','E','ESE','SE','SSE','S','SSW','SW','WSW','W','WNW','NW','NNW')); --PER CONVENTION

CREATE DOMAIN Rain --in mm
  NUMERIC(5,1)
  CHECK (VALUE BETWEEN 0 AND 2000); --a l'interieur des records enregistrees dans le monde avec marge d'environ 10%

CREATE DOMAIN Snow -- in cm
  NUMERIC(4,1)
  CHECK (VALUE BETWEEN 0 AND 200); --a l'interieur des records enregistrees dans le monde (78.5 pouce * 2.54)

CREATE DOMAIN Cata_Id
  INT
  CHECK (VALUE BETWEEN 0 AND 999999);--1 MILLION POSSIBLE DISASTER IN BD LIFETIME

CREATE DOMAIN Cost
  INT
  CHECK (VALUE BETWEEN 0 AND 100000000000);--100 MILLIARDS CAN DOLLAR IS ENOUGH

CREATE DOMAIN People
  INT
  CHECK (VALUE BETWEEN 0 AND 50000000); --30% MORE THAN ACTUAL POPULATION

CREATE DOMAIN Richter
  NUMERIC(2,1)
  CHECK (VALUE BETWEEN 1.0 AND 9.9);--Richter scale

CREATE DOMAIN Year_rate
  SMALLINT
  CHECK (VALUE BETWEEN 1914 AND extract(YEAR FROM now()));--DATA not available prior to 1914

CREATE DOMAIN Inflation_rate
  NUMERIC(4,4)
  CHECK (VALUE BETWEEN 0.7 AND 1.3);--IN RANGE OF HISTORICAL LOWEST (-17.8%) AND HIGHEST 21.6%) http://www.inflation.eu

/*----
END CREATE DOMAINS
-----------------
-----------------
*/----


/*----
-----------------
-----------------
BEGIN CREATE TABLES
*/----

CREATE TABLE LOCATION (
  location_id Geo_Id NOT NULL,
  location_name VARCHAR(80) NOT NULL,--no longer name in CANADA
  province Prov NOT NULL,
  latitude Lat_range NOT NULL,
  longitude Lon_range NOT NULL,
  CONSTRAINT LOCATION_cc0 PRIMARY KEY (location_id)
);

CREATE TABLE DISASTER_TYPE (
  type_name Cata_Name NOT NULL,
  information VARCHAR(80) NOT NULL,
  CONSTRAINT DISASTER_TYPE_cc0 PRIMARY KEY (type_name)
);

CREATE TABLE WEATHER_STATION (
  station_id Geo_id NOT NULL,
  station_name VARCHAR(80) NOT NULL,
  province Prov NOT NULL,
  latitude Lat_range NOT NULL,
  longitude Lon_range NOT NULL,
  PRIMARY KEY (station_id)
);

CREATE TABLE TEMPERATURE (
  _date Date_eco NOT NULL,
  station_id Geo_Id NOT NULL,
  temp_min Temp NOT NULL,
  temp_max Temp NOT NULL,
  CONSTRAINT TEMPERATURE_cc0 PRIMARY KEY (_date, station_id),
  CONSTRAINT TEMPERATURE_ce0 CHECK (temp_min<=temp_max)
);

CREATE TABLE WIND (
  _date Date_eco NOT NULL,
  station_id Geo_id NOT NULL,
  gust_max Wind_v NOT NULL,
  gust_direction Cardinal NOT NULL,
  CONSTRAINT WIND_cc0 PRIMARY KEY (_date, station_id)
);

CREATE TABLE PRECIPITATION (
  _date Date_eco NOT NULL,
  station_id Geo_Id NOT NULL,
  prec_rain Rain NOT NULL,
  prec_snow Snow NOT NULL,
  prec_total Rain NOT NULL,
  CONSTRAINT PRECIPITATION_cc0 PRIMARY KEY (_date, station_id),
  CONSTRAINT PRECIPITATION_ce0 CHECK(prec_rain+(prec_snow*10)=prec_total)
);

CREATE TABLE DISASTER (
  disaster_id Cata_Id NOT NULL,
  date_debut Date_eco NOT NULL,
  type_name Cata_Name NOT NULL,
  estimated_cost Cost NOT NULL,
  nb_casualties People NOT NULL,
  nb_wounded People NOT NULL,
  nb_deaths People NOT NULL,
  nb_evacuees People NOT NULL,
  magnitude Richter NOT NULL,
  CONSTRAINT DISASTER_CC0 PRIMARY KEY (disaster_id),
  CONSTRAINT TEMPERATURE_fk0 FOREIGN KEY (type_name) REFERENCES DISASTER_TYPE (type_name)
);

CREATE TABLE DISASTER_LOCATION (
  disaster_id Cata_Id NOT NULL,
  _date Date_eco NOT NULL,
  location_id Geo_Id NOT NULL,
  CONSTRAINT DISASTER_LOCATION_CC0 PRIMARY KEY (disaster_id, _date, location_id),
  CONSTRAINT DISASTER_LOCATION_fk0 FOREIGN KEY (disaster_id) REFERENCES DISASTER (disaster_id)
);


CREATE TABLE INFLATION_RATE (
  _year Year_rate NOT NULL,
  inflation Inflation_rate NOT NULL,
  CONSTRAINT INFLATION_RATE_CC0 PRIMARY KEY (_year)
);

/*----
END CREATE TABLES
-----------------
-----------------
*/----



/*----
-----------------
-----------------
BEGIN CREATE VIEWS
*/----

--devrait etre une view ou une requete avec calcul de distance par rapport a la station meteo la plus proche
CREATE OR REPLACE VIEW DISASTER_METEO AS
  SELECT 
  disaster_id,
  type_name,
  _date,
  location_id,
  temp_min,
  temp_max,
  gust_max,
  gust_direction,
  prec_rain,
  prec_snow,
  prec_total,
  FROM DISASTER JOIN WEATHER_CONDITION
    JOIN WIND USING (_date)
    JOIN PRECIPITATION USING (_date)
;;



--était clairement une vue comme dans le tp sur carnet meteo
CREATE OR REPLACE VIEW WEATHER_CONDITION AS
  SELECT _date,
    station_id,
    temp_min,
    temp_max,
    gust_max,
    gust_direction,
    prec_rain,
    prec_snow,
    prec_total
  FROM TEMPERATURE
    JOIN WIND USING (_date)
    JOIN PRECIPITATION USING (_date)
;

/*----
END CREATE VIEWS
-----------------
-----------------
*/----



/*----
-----------------
-----------------
BEGIN CREATE FUNCTIONS
*/----

CREATE OR REPLACE FUNCTION is_ensol(e varchar) returns boolean as $$
begin
  perform e::INT;
  IF e IS NOT NULL AND e::INT BETWEEN 0 AND 1440 THEN
     RETURN true;
  END IF;
  RETURN false;
exception when others then
  RETURN false;
end;
$$ language plpgsql;

/*----
END CREATE FUNCTIONS
-----------------
-----------------
*/----



/*----
-----------------
-----------------
BEGIN CREATE PROCEDURES
*/----

CREATE OR REPLACE FUNCTION valid_data()
RETURNS TRIGGER AS
$$
   BEGIN
IF is_date(NEW.date) THEN
IF is_temp(NEW.temp_min) AND is_temp(NEW.temp_max) AND NEW.temp_min::DECIMAL(6, 4) <= NEW.temp_max::DECIMAL(6, 4) AND
   NOT EXISTS (SELECT * FROM obs_temp WHERE _date = NEW.date::date) THEN
INSERT INTO obs_temp (_date, temp_min, temp_max) values (NEW.date::date, NEW.temp_min::DECIMAL(6, 4), NEW.temp_max::DECIMAL(6, 4));
END IF;
IF is_vent(NEW.vent_min) AND is_vent(NEW.vent_max) AND NEW.vent_min::DECIMAL(7, 4) <= NEW.vent_max::DECIMAL(7, 4) AND
   NOT EXISTS (SELECT * FROM obs_vent WHERE _date = NEW.date::date) THEN
INSERT INTO obs_vent (_date, vent_min, vent_max) values (NEW.date::date, NEW.vent_min::DECIMAL(7, 4), NEW.vent_max::DECIMAL(7, 4));
END IF;
IF is_pres(NEW.pres_min) AND is_pres(NEW.pres_max) AND NEW.pres_min::DECIMAL(7, 4) <= NEW.pres_max::DECIMAL(7, 4) AND
   NOT EXISTS (SELECT * FROM obs_press WHERE _date = NEW.date::date) THEN
INSERT INTO obs_press (_date, press_min, press_max) values (NEW.date::date, NEW.pres_min::DECIMAL(7, 4), NEW.pres_max::DECIMAL(7, 4));
END IF;
IF is_hum(NEW.hum_min) AND is_hum(NEW.hum_max) AND NEW.hum_min::SMALLINT <= NEW.hum_max::SMALLINT AND
   NOT EXISTS (SELECT * FROM obs_hum WHERE _date = NEW.date::date) THEN
INSERT INTO obs_hum (_date, hum_min, hum_max) values (NEW.date::date, NEW.hum_min::SMALLINT, NEW.hum_max::SMALLINT);
END IF;
IF is_prec_mm(NEW.prec_mm) AND
   NOT EXISTS (SELECT * FROM obs_prec WHERE _date = NEW.date::date) AND
   EXISTS (SELECT * FROM type_precipitation WHERE type = NEW.prec_typ) THEN
INSERT INTO obs_prec (_date, prec_type, prec_mm) values (NEW.date::date, NEW.prec_typ, NEW.prec_mm::DECIMAL(6, 2));
END IF;
IF is_ensol(NEW.ensol) AND
   NOT EXISTS (SELECT * FROM obs_ensol WHERE _date = NEW.date::date) THEN
INSERT INTO obs_ensol (_date, ensol) values (NEW.date::date, NEW.ensol::INT);
END IF;
END IF;
     RETURN NEW;
   END
$$
LANGUAGE plpgsql;

/*----
END CREATE PROCEDURES
-----------------
-----------------
*/----



/*----
-----------------
-----------------
BEGIN CREATE TRIGGERS
*/----


CREATE TRIGGER correct_id
BEFORE
INSERT
ON
FOR EACH ROW
EXECUTE PROCEDURE valid_data();


/*----
END CREATE TRIGGERS
-----------------
-----------------
*/----
