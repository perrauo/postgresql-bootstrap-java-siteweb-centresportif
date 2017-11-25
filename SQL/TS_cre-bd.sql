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

--CODED
--First 2 dig of name
--First 2 dig of lat
--First 2 dig of lon
CREATE DOMAIN d_station_id
  CHAR(8)
  CHECK (VALUE SIMILAR TO '[A-Z]{2}[0-9]{6}');

--CODED
--First 2 dig of name
--First 2 dig of lat
--First 2 dig of lon
CREATE DOMAIN d_loc_id
  CHAR(8)
  CHECK (VALUE SIMILAR TO '[A-Z]{2}[0-9]{6}'); --(?:AB|BC|...) other method to code maybe-- 2 lettre (liste des province) suivie de 6 chiffre

CREATE DOMAIN d_Prov
  VARCHAR(30)
  CHECK (VALUE IN ('AB','BC','MB','NB','NL','NT','NS','NU','ON','PE','QC','SK','YT'));--LISTE OFFICIELLE

CREATE DOMAIN d_Lat_range
  DECIMAL(7,4)
  CHECK (VALUE BETWEEN 42 AND 83);--CAST AS????--as per stat can, range from 42N to 83N

CREATE DOMAIN d_Lon_range
  DECIMAL(7,4)
  CHECK  (VALUE BETWEEN 53 AND 141);--CAST AS????-- same but from 53W to 141W

CREATE DOMAIN d_Cata_Name
  VARCHAR(20)
  CHECK (VALUE IN ('Avalanche','Cold event','Drought','Flood','Geomagnetic storm','Heat event','Hurricane','Storm surge','Storm surge','Thunderstorms','Tornado','Wildfire','Winter storm'));

CREATE DOMAIN d_Date_eco
  DATE
  CHECK (VALUE >= '1900-01-01');

CREATE DOMAIN d_temp --en degrees celcius
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

CREATE DOMAIN d_cost
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

--HELPER TABLES
--used to dispatch valid information in the tables
CREATE TABLE STATIONS_DATA(
  station_text VARCHAR(30) NOT NULL,
  latitude VARCHAR(30) NOT NULL,
  longitude VARCHAR(30) NOT NULL
);

CREATE TABLE LOCATIONS_DATA(
  location_text VARCHAR(30) NOT NULL,
  latitude VARCHAR(30) NOT NULL,
  longitude VARCHAR(30) NOT NULL
);

--TODO
CREATE TABLE WEATHER_DATA(
  weather_text VARCHAR(30) NOT NULL,
  latitude VARCHAR(30) NOT NULL,
  longitude VARCHAR(30) NOT NULL
);
--END HELPER TABLES

--MAIN TABLES
CREATE TABLE LOCATION (
  location_id d_loc_id NOT NULL,
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
  station_id d_station_id NOT NULL,
  station_name VARCHAR(80) NOT NULL,
  latitude d_lat_range NOT NULL,
  longitude d_lon_range NOT NULL,
  PRIMARY KEY (station_id)
);

CREATE TABLE OBS_TEMPERATURE (
  _date d_date_eco NOT NULL,
  station_id d_station_id NOT NULL,
  temp_min d_temp NOT NULL,
  temp_max d_temp NOT NULL,
  CONSTRAINT TEMPERATURE_cc0 PRIMARY KEY (_date, station_id),
  CONSTRAINT TEMPERATURE_ce0 CHECK (temp_min<=temp_max)
);

CREATE TABLE OBS_WIND (
  _date d_date_eco NOT NULL,
  station_id d_station_id NOT NULL,
  gust_max d_wind_v NOT NULL,
  gust_direction d_cardinal NOT NULL,
  CONSTRAINT WIND_cc0 PRIMARY KEY (_date, station_id)
);

CREATE TABLE OBS_PRECIPITATION (
  _date d_date_eco NOT NULL,
  station_id d_station_id NOT NULL,
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
  estimated_cost d_cost NOT NULL,
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
  location_id d_loc_id NOT NULL,
  CONSTRAINT DISASTER_LOCATION_CC0 PRIMARY KEY (disaster_id, _date, location_id),
  CONSTRAINT DISASTER_LOCATION_fk0 FOREIGN KEY (disaster_id) REFERENCES DISASTER (disaster_id)
);

CREATE TABLE INFLATION_RATE (
  _year d_Year_rate NOT NULL,
  inflation d_inflation_rate NOT NULL,
  CONSTRAINT INFLATION_RATE_CC0 PRIMARY KEY (_year)
);
--END MAIN TABLES

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

-------------------
--UTILS
-------------------

--Get distance from two points
CREATE OR REPLACE FUNCTION get_dist(x1 DECIMAL(7,4), y1 DECIMAL(7,4), x2 DECIMAL(7,4), y2 DECIMAL(7,4)) RETURNS DECIMAL(7,4) AS
$$
BEGIN
  RETURN sqrt(power(x2-x1, 2)+power(y2-y1, 2));
END;
$$ language plpgsql;

--Get numeric from given latitude
CREATE OR REPLACE FUNCTION la_num(lat_ran d_Lat_range) RETURNS NUMERIC(7,4) AS
$$
DECLARE
  lat NUMERIC(7,4);
BEGIN
 lat := (SUBSTR(VALUE,1,2)::NUMERIC(7,4));
   RETURN lat;
END;
$$ language plpgsql;

--Get numeric from given longitude
CREATE OR REPLACE FUNCTION lon_num(lon_ran d_lon_range) RETURNS NUMERIC(7,4) AS
$$
BEGIN
  RETURN (SUBSTR(VALUE,1,2)::NUMERIC(7,4));
END;
$$ language plpgsql;
--END UTILS


--Get numeric from given longitude
CREATE OR REPLACE FUNCTION lon_num(lon_ran d_lon_range) RETURNS NUMERIC(7,4) AS
$$
BEGIN
  RETURN (SUBSTR(VALUE,1,2)::NUMERIC(7,4));
END;
$$ language plpgsql;



--END UTILS


-------------------
--VALIDATION
------------------
--
CREATE OR REPLACE FUNCTION valid_cardinal(t varchar) RETURNS BOOLEAN AS $$
BEGIN
  PERFORM t::d_Cardinal;
  IF t IS NOT NULL THEN
     RETURN true;
  END IF;
  RETURN false;
EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION valid_cata_id(t varchar) RETURNS BOOLEAN AS $$
BEGIN
  PERFORM t::d_Cata_Id;
  IF t IS NOT NULL THEN
     RETURN true;
  END IF;
  RETURN false;
EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION valid_cata_name(t varchar) RETURNS BOOLEAN AS $$
BEGIN
  PERFORM t::d_Cata_Name;
  IF t IS NOT NULL THEN
     RETURN true;
  END IF;
  RETURN false;
EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION valid_cost(t varchar) RETURNS BOOLEAN AS $$
BEGIN
  PERFORM t::d_cost;
  IF t IS NOT NULL THEN
     RETURN true;
  END IF;
  RETURN false;
EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION valid_date_eco(t varchar) RETURNS BOOLEAN AS $$
BEGIN
  PERFORM t::d_Date_eco;
  IF t IS NOT NULL THEN
     RETURN true;
  END IF;
  RETURN false;
EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION valid_geo_id(t varchar) RETURNS BOOLEAN AS $$
BEGIN
  PERFORM t::d_Geo_Id;
  IF t IS NOT NULL THEN
     RETURN true;
  END IF;
  RETURN false;
EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION valid_inflation_rate(t varchar) RETURNS BOOLEAN AS $$
BEGIN
  PERFORM t::d_Inflation_rate;
  IF t IS NOT NULL THEN
     RETURN true;
  END IF;
  RETURN false;
EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION valid_lat_ran(t varchar) RETURNS BOOLEAN AS $$
BEGIN
  PERFORM t::d_Lat_range;
  IF t IS NOT NULL THEN
     RETURN true;
  END IF;
  RETURN false;
EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;
$$ language plpgsql;


CREATE OR REPLACE FUNCTION valid_lon_ran(t varchar) RETURNS BOOLEAN AS $$
BEGIN
  PERFORM t::d_Lon_range;
  IF t IS NOT NULL THEN
     RETURN true;
  END IF;
  RETURN false;
EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;
$$ language plpgsql;


CREATE OR REPLACE FUNCTION valid_people(t varchar) RETURNS BOOLEAN AS $$
BEGIN
  PERFORM t::d_People;
  IF t IS NOT NULL THEN
     RETURN true;
  END IF;
  RETURN false;
EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION valid_province(t varchar) RETURNS BOOLEAN AS $$
BEGIN
  PERFORM t::d_Prov;
  IF t IS NOT NULL THEN
     RETURN true;
  END IF;
  RETURN false;
EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION valid_rain(t varchar) RETURNS BOOLEAN AS $$
BEGIN
  PERFORM t::d_rain;
  IF t IS NOT NULL THEN
     RETURN true;
  END IF;
  RETURN false;
EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION valid_richter(t varchar) RETURNS BOOLEAN AS $$
BEGIN
  PERFORM t::d_richter;
  IF t IS NOT NULL THEN
     RETURN true;
  END IF;
  RETURN false;
EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION valid_snow(t varchar) RETURNS BOOLEAN AS $$
BEGIN
  PERFORM t::d_snow;
  IF t IS NOT NULL THEN
     RETURN true;
  END IF;
  RETURN false;
EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;
$$ language plpgsql;


CREATE OR REPLACE FUNCTION valid_wind_v(t varchar) RETURNS BOOLEAN AS $$
BEGIN
  PERFORM t::d_Wind_v;
  IF t IS NOT NULL THEN
     RETURN true;
  END IF;
  RETURN false;
EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION valid_year_rate(t varchar) RETURNS BOOLEAN AS $$
BEGIN
  PERFORM t::d_year_rate;
  IF t IS NOT NULL THEN
     RETURN true;
  END IF;
  RETURN false;
EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;
$$ language plpgsql;


CREATE OR REPLACE FUNCTION valid_temperature(t varchar) RETURNS BOOLEAN AS $$
BEGIN
  PERFORM t::d_temp;
  IF t IS NOT NULL THEN
     RETURN true;
  END IF;
  RETURN false;
EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;
$$ language plpgsql;

--END VALIDATION
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
CREATE OR REPLACE FUNCTION valid_data_stations()
RETURNS TRIGGER AS
$$
  DECLARE
    id VARCHAR(6);
  BEGIN
      IF (NEW.latitude NOTNULL &&
      valid_lat_ran(NEW.latitude) &&
      valid_lon_ran(NEW.longitude))
    THEN
     id := substr(NEW.station_text::VARCHAR(100),1,2) || substr(NEW.latitude::VARCHAR(100),1,2) || substr(NEW.longitude::VARCHAR(100),1,2);
      INSERT INTO WEATHER_STATION (station_id, station_name, latitude, longitude)
     values (id, NEW.station_text, NEW.latitude, NEW.longitude);
    END IF;
     RETURN NEW;
      --If there is an exception then just insert inside data and not the main tables
      EXCEPTION WHEN OTHERS THEN
      RETURN NEW;
   END
$$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION valid_data_locations()
RETURNS TRIGGER AS
$$
    DECLARE
      loc_name VARCHAR(80);
      prov VARCHAR(80);
      id VARCHAR(6);
    BEGIN

    loc_name := split_part(NEW.location_text,', ', 1);
    prov := split_part(NEW.location_text,', ', 2);

    IF (NEW.latitude NOTNULL &&
      valid_lat_ran(NEW.latitude) &&
      valid_lon_ran(NEW.longitude))
    THEN
      id := substr(NEW.station_text::VARCHAR(100),1,2) || substr(NEW.latitude::VARCHAR(100),1,2) || substr(NEW.longitude::VARCHAR(100),1,2);
     INSERT INTO LOCATION (location_id, location_name, province, latitude, longitude)
     values (id, loc_name, prov, NEW.latitude, NEW.longitude);
    END IF;
     RETURN NEW;
      --If there is an exception then just insert inside data and not the main tables
      EXCEPTION WHEN OTHERS THEN
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

CREATE TRIGGER on_new_station_data
BEFORE --WHEN:   BEFORE/AFTER/INSTEAD OF
INSERT OR UPDATE --EVENTS: INSERT/DELETE/UPDATE/UPDATE OF(col_name)
  ON STATIONS_DATA
FOR EACH ROW --EXECUTE PROCEDURE FOR EITHER THE WHOLE ACTION OR EACH ROW THAT WAS CHANGED: EACH ROW/STATEMENT
EXECUTE PROCEDURE valid_data_stations();


CREATE TRIGGER on_new_location_data
BEFORE --WHEN:   BEFORE/AFTER/INSTEAD OF
INSERT OR UPDATE --EVENTS: INSERT/DELETE/UPDATE/UPDATE OF(col_name)
  ON LOCATIONS_DATA
FOR EACH ROW --EXECUTE PROCEDURE FOR EITHER THE WHOLE ACTION OR EACH ROW THAT WAS CHANGED: EACH ROW/STATEMENT
EXECUTE PROCEDURE valid_data_locations();

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
            get_dist(A.latitude, A.longitude,
                 other.latitude, other.longitude)
        <
            get_dist(A.latitude, A.longitude,
                 B.latitude, B.longitude)
  )),
  stations_obs_date AS -- Plants ayant plus de trois observations
  (
      SELECT * FROM
      (SELECT * FROM
      OBS_TEMPERATURE
      JOIN
      OBS_WIND USING (_date, station_id)
      JOIN
      OBS_PRECIPITATION
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


/*----
END CREATE VIEWS
-----------------
-----------------
*/----

