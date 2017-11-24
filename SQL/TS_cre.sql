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

CREATE DOMAIN d_Geo_Id
  CHAR(8)
  CHECK (VALUE SIMILAR TO '[A-Z]{2}[0-9]{6}'); --(?:AB|BC|...) other method to code maybe-- 2 lettre (liste des province) suivie de 6 chiffre

CREATE DOMAIN d_Prov
  VARCHAR(30)
  CHECK (VALUE IN ('AB','BC','MB','NB','NL','NT','NS','NU','ON','PE','QC','SK','YT'));--LISTE OFFICIELLE

CREATE DOMAIN d_Lat_range
  CHAR(3)
  CHECK ((VALUE SIMILAR TO '[0-9]{2}N') AND (SUBSTR(VALUE,1,2)::DECIMAL(7,4) BETWEEN 42 AND 83));--CAST AS????--as per stat can, range from 42N to 83N

CREATE DOMAIN d_Lon_range
  CHAR(3)
  CHECK ((VALUE SIMILAR TO '[0-9]{2}W') AND (SUBSTR(VALUE,1,2)::DECIMAL(7,4) BETWEEN 53 AND 141));--CAST AS????-- same but from 53W to 141W

CREATE DOMAIN d_Cata_Name
  VARCHAR(20)
  CHECK (VALUE IN ('Avalanche','Cold event','Drought','Flood','Geomagnetic storm','Heat event','Hurricane','Storm surge','Storm surge','Thunderstorms','Tornado','Wildfire','Winter storm'));

CREATE DOMAIN d_Date_eco
  DATE
  CHECK (VALUE >= '1900-01-01');

CREATE DOMAIN Temp --en degrees celcius
  NUMERIC(4,1)
  CHECK (VALUE BETWEEN -100 AND 60); --a l'interieur des records terrestres

CREATE DOMAIN d_Wind_v --en km/h
  SMALLINT
  CHECK (VALUE BETWEEN 0 AND 450); --la plus forte rafale jamais repertoriée

CREATE DOMAIN d_Cardinal
  CHAR(2)
  CHECK (VALUE IN ('N','NNE','NE','ENE','E','ESE','SE','SSE','S','SSW','SW','WSW','W','WNW','NW','NNW')); --PER CONVENTION

CREATE DOMAIN d_Rain --in mm
  NUMERIC(5,1)
  CHECK (VALUE BETWEEN 0 AND 2000); --a l'interieur des records enregistrees dans le monde avec marge d'environ 10%

CREATE DOMAIN d_Snow -- in cm
  NUMERIC(4,1)
  CHECK (VALUE BETWEEN 0 AND 200); --a l'interieur des records enregistrees dans le monde (78.5 pouce * 2.54)

CREATE DOMAIN d_Cata_Id
  INT
  CHECK (VALUE BETWEEN 0 AND 999999);--1 MILLION POSSIBLE DISASTER IN BD LIFETIME

CREATE DOMAIN Cost
  INT
  CHECK (VALUE BETWEEN 0 AND 100000000000);--100 MILLIARDS CAN DOLLAR IS ENOUGH

CREATE DOMAIN d_People
  INT
  CHECK (VALUE BETWEEN 0 AND 50000000); --30% MORE THAN ACTUAL POPULATION

CREATE DOMAIN d_Richter
  NUMERIC(2,1)
  CHECK (VALUE BETWEEN 1.0 AND 9.9);--Richter scale

CREATE DOMAIN d_Year_rate
  SMALLINT
  CHECK (VALUE BETWEEN 1914 AND extract(YEAR FROM now()));--DATA not available prior to 1914

CREATE DOMAIN d_Inflation_rate
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
  location_id d_geo_id NOT NULL,
  location_name VARCHAR(80) NOT NULL,--no longer name in CANADA
  province d_prov NOT NULL,
  latitude d_lat_range NOT NULL,
  longitude d_lon_range NOT NULL,
  CONSTRAINT LOCATION_cc0 PRIMARY KEY (location_id)
);

CREATE TABLE DISASTER_TYPE (
  type_name d_cata_name NOT NULL,
  information VARCHAR(80) NOT NULL,
  CONSTRAINT DISASTER_TYPE_cc0 PRIMARY KEY (type_name)
);

CREATE TABLE WEATHER_STATION (
  station_id d_geo_id NOT NULL,
  station_name VARCHAR(80) NOT NULL,
  province d_prov NOT NULL,
  latitude d_lat_range NOT NULL,
  longitude d_lon_range NOT NULL,
  PRIMARY KEY (station_id)
);

CREATE TABLE TEMPERATURE (
  _date d_date_eco NOT NULL,
  station_id d_geo_Id NOT NULL,
  temp_min Temp NOT NULL,
  temp_max Temp NOT NULL,
  CONSTRAINT TEMPERATURE_cc0 PRIMARY KEY (_date, station_id),
  CONSTRAINT TEMPERATURE_ce0 CHECK (temp_min<=temp_max)
);

CREATE TABLE WIND (
  _date d_date_eco NOT NULL,
  station_id d_geo_id NOT NULL,
  gust_max d_wind_v NOT NULL,
  gust_direction d_cardinal NOT NULL,
  CONSTRAINT WIND_cc0 PRIMARY KEY (_date, station_id)
);

CREATE TABLE PRECIPITATION (
  _date d_date_eco NOT NULL,
  station_id d_geo_id NOT NULL,
  prec_rain d_rain NOT NULL,
  prec_snow d_snow NOT NULL,
  prec_total d_rain NOT NULL,
  CONSTRAINT PRECIPITATION_cc0 PRIMARY KEY (_date, station_id),
  CONSTRAINT PRECIPITATION_ce0 CHECK(prec_rain+(prec_snow*10)=prec_total)
);

CREATE TABLE DISASTER (
  disaster_id d_cata_Id NOT NULL,
  date_debut d_date_eco NOT NULL,
  type_name d_cata_name NOT NULL,
  estimated_cost cost NOT NULL,
  nb_casualties d_people NOT NULL,
  nb_wounded d_people NOT NULL,
  nb_deaths d_people NOT NULL,
  nb_evacuees d_people NOT NULL,
  magnitude d_Richter NOT NULL,
  CONSTRAINT DISASTER_CC0 PRIMARY KEY (disaster_id),
  CONSTRAINT TEMPERATURE_fk0 FOREIGN KEY (type_name) REFERENCES DISASTER_TYPE (type_name)
);

CREATE TABLE DISASTER_LOCATION (
  disaster_id d_Cata_Id NOT NULL,
  _date d_Date_eco NOT NULL,
  location_id d_Geo_Id NOT NULL,
  CONSTRAINT DISASTER_LOCATION_CC0 PRIMARY KEY (disaster_id, _date, location_id),
  CONSTRAINT DISASTER_LOCATION_fk0 FOREIGN KEY (disaster_id) REFERENCES DISASTER (disaster_id)
);


CREATE TABLE INFLATION_RATE (
  _year d_Year_rate NOT NULL,
  inflation d_inflation_rate NOT NULL,
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
BEGIN CREATE FUNCTIONS
*/----

CREATE OR REPLACE FUNCTION get_dist(x1 DECIMAL(7,4), y1 DECIMAL(7,4), x2 DECIMAL(7,4), y2 DECIMAL(7,4)) RETURNS DECIMAL(7,4) AS
$$
BEGIN
  RETURN sqrt(power(x2-x1, 2)+power(y2-y1, 2));
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION lanum(lat_ran d_Lat_range) RETURNS DECIMAL(7,4) AS
$$
BEGIN
  RETURN (SUBSTR(VALUE,1,2)::DECIMAL(7,4));
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION lonnum(lat_ran d_lon_range) RETURNS DECIMAL(7,4) AS
$$
BEGIN
  RETURN (SUBSTR(VALUE,1,2)::DECIMAL(7,4));
END;
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

/*CREATE TRIGGER correct_id
BEFORE
INSERT
ON
FOR EACH ROW
EXECUTE PROCEDURE valid_data();*/


/*----
END CREATE TRIGGERS
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
  WITH
  stations_disaster_closest AS -- Plants ayant plus de trois observations
  (
    SELECT * FROM
    (DISASTER_LOCATION JOIN LOCATION USING (location_id)) AS A
    CROSS JOIN WEATHER_STATION AS B
    WHERE NOT EXISTS(  --WHERE DOES NOT EXIST A METEO STATION THAT IS CLOSER
        SELECT longitude, latitude
        FROM WEATHER_STATION AS other
        WHERE
            get_dist(lanum(A.latitude), lonnum(A.longitude),
                 lanum(other.latitude), lonnum(other.longitude))
        <
            get_dist(lanum(A.latitude), lonnum(A.longitude),
                 lanum(B.latitude), lonnum(B.longitude))
  )),
  stations_obs_date AS -- Plants ayant plus de trois observations
  (
      SELECT * FROM
      (SELECT * FROM
      TEMPERATURE
      JOIN
      WIND USING (_date, station_id)
      JOIN
      PRECIPITATION
      USING (_date, station_id)) AS A
      JOIN
      WEATHER_STATION
        USING (station_id)
  )
  SELECT
  stations_disaster_closest.disaster_id,
  stations_obs_date._date,
  stations_obs_date.longitude,
  stations_obs_date.latitude,
  stations_obs_date.temp_min,
  stations_obs_date.temp_max,
  stations_obs_date.gust_direction,
  stations_obs_date.gust_max,
  stations_obs_date.prec_rain,
  stations_obs_date.prec_snow,
  stations_obs_date.prec_total
  FROM
    stations_disaster_closest
    JOIN
    stations_obs_date
    USING(station_id, _date);






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

