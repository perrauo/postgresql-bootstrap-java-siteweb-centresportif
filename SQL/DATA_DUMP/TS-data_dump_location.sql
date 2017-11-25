--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.8
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = pero2102, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: location_data; Type: TABLE; Schema: pero2102; Owner: pero2102
--

CREATE TABLE location_data (
    location_text text,
    latitude numeric,
    longitude numeric
);


ALTER TABLE location_data OWNER TO pero2102;

--
-- Data for Name: location_data; Type: TABLE DATA; Schema: pero2102; Owner: pero2102
--

INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Abbotsford, BC', 49.06, 122.3);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Acton, ON', 43.63, 80.03);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Airdrie, AB', 51.3, 114.02);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Aldergrove, BC', 49.06, 122.5);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Alliston, ON', 44.15, 79.87);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Alma, QC', 48.55, 71.66);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Amherst, NS', 45.83, 64.21);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Amherstburg, ON', 42.1, 83.1);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Amos, QC', 48.57, 78.14);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Angus, ON', 44.32, 79.88);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Arnprior, ON', 45.43, 76.37);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Asbestos, QC', 45.78, 71.95);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Aylmer, ON', 42.78, 80.98);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Baie-Comeau, QC', 49.22, 68.16);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Banff, AB', 51.17, 115.57);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Barrie, ON', 44.38, 79.68);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Bathurst, NB', 47.62, 65.65);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Bay Roberts, NL', 47.59, 53.29);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Beamsville, ON', 43.17, 79.47);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Beaumont, AB', 53.35, 113.42);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Belleville, ON', 44.17, 77.38);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Beloeil, QC', 45.55, 73.23);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Bolton, ON', 43.88, 79.73);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Bonnyville, AB', 54.27, 110.75);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Bowmanville, ON', 43.9, 78.68);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Bracebridge, ON', 45.03, 79.3);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Bradford, ON', 44.12, 79.56);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Brandon, MB', 49.84, 99.96);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Brantford, ON', 43.15, 80.26);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Bridgewater, NS', 44.38, 64.52);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Brockville, ON', 44.61, 75.7);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Brooklin, ON', 43.95, 78.96);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Brooks, AB', 50.57, 111.91);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Buckingham, QC', 45.58, 75.42);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Caledonia, ON', 43.07, 79.95);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Calgary, AB', 51.05, 114.06);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Campbell River, BC', 49.99, 125.23);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Campbellton, NB', 48, 66.68);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Camrose, AB', 53.02, 112.84);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Canmore, AB', 51.09, 115.35);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Carbonear, NL', 47.75, 53.24);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Carleton Place, ON', 45.13, 76.13);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Castlegar, BC', 49.32, 117.67);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Okanagan Falls, BC', 50.03, 119.87);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Charlottetown, PE', 46.24, 63.14);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Chatham, ON', 42.41, 82.19);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Douglastown, ON', 47.03, 65.46);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Chibougamau, QC', 49.87, 74.35);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Chicoutimi, QC', 48.43, 71.08);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Chilliwack, BC', 49.17, 121.96);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Coaldale, AB', 49.73, 112.62);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Coaticook, QC', 45.13, 71.8);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Cobourg, ON', 43.96, 78.17);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Cochrane, AB', 51.19, 114.47);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Collingwood, ON', 44.49, 80.21);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Conception Bay South, NL', 47.5, 53);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Corner Brook, NL', 48.96, 57.96);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Cornwall, ON', 45.03, 74.74);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Courtenay, BC', 49.69, 125);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Cowansville, QC', 45.21, 72.75);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Cranbrook, BC', 49.51, 115.77);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Crystal Beach, ON', 45.05, 79.4);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Dauphin, MB', 51.15, 100.05);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Dawson Creek, BC', 55.76, 120.24);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Dolbeau-Mistassini, QC', 48.87, 72.23);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Donnacona, QC', 46.67, 71.73);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Drayton Valley, AB', 53.22, 114.98);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Drumheller, AB', 51.47, 112.71);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Drummondville, QC', 45.89, 72.49);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Dryden, ON', 49.78, 92.83);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Duck Lake, SK', 49.23, 116.63);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Duncan, BC', 48.78, 123.7);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Dunnville, ON', 42.91, 79.62);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Edmonton, AB', 53.57, 113.54);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Edmundston, NB', 47.38, 68.34);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Edson, AB', 53.58, 116.42);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Elliot Lake, ON', 46.39, 82.66);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Elmira, ON', 43.6, 80.55);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Essex, ON', 42.17, 82.82);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Estevan, SK', 49.14, 103.01);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Farnham, QC', 45.28, 72.97);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Fergus, ON', 43.7, 80.37);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Flin Flon, MB', 54.77, 101.89);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Fort Erie, ON', 42.91, 78.93);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Fort Frances, ON', 48.62, 93.42);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Fort St. John, BC', 56.25, 120.85);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Fredericton, NB', 45.96, 66.66);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Gananoque, ON', 44.33, 76.17);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Gander, NL', 48.95, 54.65);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Gatineau, QC', 45.42, 75.71);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Georgetown, ON', 43.66, 79.93);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Georgina, ON', 44.27, 79.25);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Gibsons, BC', 49.4, 123.5);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Glace Bay, NS', 46.2, 59.97);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Goderich, ON', 43.73, 81.7);
INSERT INTO location_data (location_text, latitude, longitude) VALUES (' Granby, QC', 45.41, 72.73);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Grand Centre, AB', 54.42, 110.22);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Grand Falls, NB', 47.05, 67.73);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Grand Falls-Windsor, NL', 48.93, 55.66);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Grande Prairie, AB', 55.18, 118.8);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Gravenhurst, ON', 44.92, 79.37);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Guelph, ON', 43.56, 80.26);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Haileybury, ON', 47.43, 79.63);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Halifax, NS', 44.67, 63.61);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Hamilton, ON', 43.26, 79.85);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Hanover, ON', 44.15, 81.03);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Happy Valley-Goose Bay, NL', 53.34, 60.4);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Hauterive, QC', 49.18, 68.27);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Hawkesbury, ON', 45.62, 74.6);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('High River, AB', 50.58, 113.87);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Hinton, AB', 53.4, 117.58);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Huntsville, ON', 45.32, 79.22);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Ingersoll, ON', 43.03, 80.88);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Innisfil, ON', 44.26, 79.64);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Iqaluit, NU', 63.74, 68.55);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Joliette, QC', 46.03, 73.45);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Kamloops, BC', 50.68, 120.34);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Kanata, ON', 45.34, 75.88);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Kapuskasing, ON', 49.43, 82.42);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Kelowna, BC', 49.89, 119.46);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Kenora, ON', 49.78, 94.49);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Kentville, NS', 45.08, 64.51);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Kimberley, BC', 49.68, 115.98);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Kincardine, ON', 44.17, 81.63);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Kingston, ON', 44.23, 76.5);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Kingston-greenwood, NS', 44.98, 64.9);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Kirkland Lake, ON', 48.17, 80.03);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Kitchener, ON', 43.46, 80.5);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Kitimat, BC', 54.01, 128.7);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('La Sarre, QC', 48.8, 79.2);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('La Tuque, QC', 47.44, 72.78);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Labrador City, NL', 52.94, 66.92);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Lachute, QC', 45.65, 74.35);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Lacombe, AB', 52.47, 113.73);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Ladysmith, BC', 48.99, 123.82);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Lavaltrie, QC', 45.89, 73.29);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Leamington, ON', 42.06, 82.6);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Leduc, AB', 53.26, 113.56);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Les Coteaux, QC', 45.3, 74.22);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Lethbridge, AB', 49.69, 112.83);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Lindsay, ON', 44.35, 78.74);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Listowel, ON', 43.73, 80.97);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Lively, ON', 46.43, 81.15);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Lloydminster, AB', 53.28, 110.01);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('London, ON', 42.97, 81.24);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Louiseville, QC', 46.25, 72.93);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Magog, QC', 45.26, 72.14);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Marieville, QC', 45.43, 73.17);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Matane, QC', 48.85, 67.53);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Medicine Hat, AB', 50.04, 110.69);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Merritt, BC', 50.12, 120.78);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Midland, ON', 44.75, 79.89);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Milton, ON', 43.51, 79.89);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Moncton, NB', 46.09, 64.78);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Mont-Joli, QC', 48.58, 68.18);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Mont-Laurier, QC', 46.55, 65.75);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Montmagny, QC', 46.97, 70.55);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Montreal, QC', 45.52, 73.57);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Moose Jaw, SK', 50.39, 105.54);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Morden, MB', 49.18, 98.1);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Morinville, AB', 53.8, 113.65);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Nanaimo, BC', 49.21, 123.97);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Nanticoke, ON', 42.81, 80.09);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Napanee, ON', 44.25, 76.95);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Nelson, BC', 49.49, 117.3);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('New Glasgow, NS', 45.59, 62.65);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('New Hamburg, ON', 43.48, 80.72);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('New Waterford, NS', 46.26, 60.11);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('North Battleford, SK', 52.79, 108.29);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('North Bay, ON', 46.3, 79.45);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('North cowichan, BC', 48.82, 123.73);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Okotoks, AB', 50.72, 113.96);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Olds, AB', 51.78, 114.1);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Orangeville, ON', 43.92, 80.1);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Orillia, ON', 44.6, 79.42);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Oromocto, NB', 45.85, 66.47);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Oshawa, ON', 43.89, 78.86);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Ottawa, ON', 45.42, 75.71);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Owen Sound, ON', 44.57, 80.94);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Paris, ON', 43.2, 80.38);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Parkhill, ON', 49.33, 124.33);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Parry Sound, ON', 45.33, 80.03);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Pembroke, ON', 45.83, 77.12);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Penticton, BC', 49.5, 119.59);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Perth, ON', 44.88, 76.23);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Petawawa, ON', 45.9, 77.28);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Peterborough, ON', 44.3, 78.34);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Plessisville, QC', 46.22, 71.77);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Ponoka, AB', 52.68, 113.57);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Porcupine Plain, SK', 48.47, 81.2);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Port Alberni, BC', 49.27, 124.82);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Port Dover, ON', 42.78, 80.2);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Port Elgin, ON', 44.43, 81.38);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Port Hope, ON', 43.96, 78.3);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Port Perry, ON', 44.1, 78.93);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Portage la Prairie, MB', 49.98, 98.31);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Port-alfred-bagotville, QC', 48.33, 70.88);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Port-cartier, QC', 50.04, 66.86);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Powell River, BC', 49.85, 124.52);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Prince Albert, SK', 53.2, 105.75);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Prince George, BC', 53.91, 122.77);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Prince Rupert, BC', 54.32, 130.31);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('QC, QC', 46.82, 71.23);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Quesnel, BC', 52.98, 122.48);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Red Deer, AB', 52.27, 113.83);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Regina, SK', 50.45, 104.61);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Renfrew, ON', 45.48, 76.7);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Revelstoke, BC', 51, 118.18);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Rimouski, QC', 48.44, 68.54);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Riviere-du-Loup, QC', 47.84, 69.54);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Roberval, QC', 48.52, 72.24);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Rockland, ON', 45.53, 75.28);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Rocky Mountain House, AB', 52.37, 114.92);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Rouyn-Noranda, QC', 48.24, 79.03);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Saint catharines-niagara, ON', 43.18, 79.24);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Saint john, ON', 45.29, 66.06);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Saint john''s, NB', 47.58, 52.69);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Saint mary''s, ON', 43.25, 81.13);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Saint Thomas, QC', 42.78, 81.19);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Sainte-agathe-des-monts, QC', 46.03, 74.28);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Sainte-anne-des-monts, QC', 49.12, 66.48);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Sainte-anne-des-plaines, QC', 45.78, 73.82);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Sainte-marie, QC', 46.43, 71.02);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Saint-felicien, QC', 48.65, 72.45);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Saint-georges, QC', 46.13, 70.68);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Saint-hyacinthe, QC', 45.63, 72.96);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Saint-jean-sur-richelieu, QC', 45.31, 73.26);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Saint-jerome, QC', 45.78, 74);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Salaberry-de-Valleyfield, QC', 45.26, 74.14);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Salmon Arm, BC', 50.7, 119.29);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Sarnia, ON', 42.99, 82.4);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Saskatoon, SK', 52.15, 106.66);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Sault Ste. Marie, ON', 46.53, 84.35);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Sechelt, BC', 49.47, 123.77);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Selkirk, MB', 50.14, 96.89);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Sept-Iles, QC', 50.22, 66.38);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Shawinigan, QC', 46.56, 72.75);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Sherbrooke, QC', 45.4, 71.9);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Simcoe, ON', 42.84, 80.31);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Slave Lake, AB', 55.28, 114.78);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Smithers, BC', 54.77, 127.17);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Smiths Falls, ON', 44.91, 76.02);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Sooke, BC', 48.38, 123.73);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Sorel, QC', 46.05, 73.14);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Spruce Grove, AB', 53.53, 113.92);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Squamish, BC', 49.71, 123.17);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Steinbach, MB', 49.52, 96.68);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Stephenville, NL', 48.56, 58.57);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Stony Plain, AB', 53.53, 114);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Stratford, ON', 43.37, 80.98);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Strathmore, AB', 51.04, 113.4);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Strathroy, ON', 42.95, 81.62);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Sturgeon Falls, ON', 46.37, 79.93);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Sudbury, ON', 46.49, 81.01);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Summerland, BC', 49.61, 119.69);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Summerside, NL', 46.4, 63.8);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Sutton, ON', 44.3, 79.37);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Swift Current, SK', 50.3, 107.8);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Sydney, NS', 46.2, 59.97);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Sylvan Lake, AB', 52.31, 114.1);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Taber, AB', 49.78, 112.15);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Terrace, BC', 54.52, 128.61);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('The Pas, MB', 53.82, 101.26);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Thetford Mines, QC', 46.1, 71.31);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Thompson, MB', 55.74, 97.86);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Thunder Bay, ON', 48.42, 89.28);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Tillsonburg, ON', 42.87, 80.73);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Timmins, ON', 48.49, 81.35);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Toronto, ON', 43.65, 79.38);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Trail, BC', 49.1, 117.73);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Trois-Rivieres, QC', 46.35, 72.57);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Truro, NS', 45.36, 63.28);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Uxbridge, ON', 44.1, 79.12);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Val-d`Or, QC', 48.11, 77.79);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Valley East, ON', 46.64, 81.01);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Vancouver, BC', 49.28, 123.13);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Vegreville, AB', 53.5, 112.05);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Vernon, BC', 50.27, 119.28);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Victoria, BC', 48.43, 123.37);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Victoriaville, QC', 46.06, 71.96);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Wallaceburg, ON', 42.59, 82.39);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Walnut grove, BC', 49.19, 122.62);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Wasaga Beach, ON', 44.53, 79.99);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Wetaskiwin, AB', 52.97, 113.38);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Weyburn, SK', 49.67, 103.86);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Whistler, BC', 50.13, 122.97);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Whitchurch-Stouffville, ON', 43.97, 79.25);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('White Rock, BC', 49.03, 122.83);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Whitecourt, AB', 54.13, 115.68);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Whitehorse, YT', 60.73, 135.05);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Williams Lake, BC', 52.13, 122.14);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Windsor, ON', 42.3, 83.03);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Winkler, MB', 49.18, 97.93);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Winnipeg, MB', 49.88, 97.17);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Wood buffalo, AB', 56.74, 111.43);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Woodstock, ON', 43.13, 80.76);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Yarmouth, NS', 43.84, 66.12);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Yellowknife, NT', 62.46, 114.36);
INSERT INTO location_data (location_text, latitude, longitude) VALUES ('Yorkton, SK', 51.21, 102.47);


--
-- PostgreSQL database dump complete
--
