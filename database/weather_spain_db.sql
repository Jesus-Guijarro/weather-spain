-- CREATE CITY_STATION TABLE

CREATE TABLE CITIES (
    city_id SERIAL PRIMARY KEY,
    postal_code VARCHAR(100) NOT NULL,
    station_code VARCHAR(100) NOT NULL,
    city_name VARCHAR(100) NOT NULL,
    station_name VARCHAR(100) NOT NULL,
    province VARCHAR(100) NOT NULL,
    UNIQUE (postal_code)
);

-- INSERT DATA IN TABLE CITY_STATION

INSERT INTO CITIES (postal_code, station_code, city_name, station_name, province)
VALUES

-- Valencia
('46250', '8416X', 'Valencia', 'VALENCIA, UPV', 'Valencia'),
('46220', '8446Y', 'Sagunto', 'SAGUNT/SAGUNTO', 'Valencia'),
('46145', '8293X', 'Xàtiva', 'XÀTIVA', 'Valencia'),
('46071', '8270X', 'Bicorp', 'BICORP', 'Valencia'),
('46083', '8300X', 'Carcaixent', 'CARCAIXENT', 'Valencia'),
('46001', '8381X', 'Ademuz', 'ADEMUZ', 'Valencia'),
('46248', '8337X', 'Turís', 'TURÍS', 'Valencia'),
('46142', '8193E', 'Jalance', 'JALANCE', 'Valencia'),
('46106', '8395X', 'Chelva', 'CHELVA', 'Valencia'),
('46184', '8283X', 'Ontinyent', 'ONTINYENT', 'Valencia'),
('46197', '8325X', 'Polinyà de Xúquer', 'POLINYÀ DE XÚQUER', 'Valencia'),
('46046', '8072Y', 'Barx', 'BARX', 'Valencia'),
('46168', '8058Y', 'Miramar', 'MIRAMAR', 'Valencia'),
('46147', '8409X', 'Llíria', 'LLÍRIA', 'Valencia'),
('46263', '8203O', 'Zarra', 'ZARRA', 'Valencia'),
('46124', '8005X', 'Fontanars dels Alforins', 'FONTANARS DELS ALFORINS', 'Valencia'),
('46249', '8309X', 'Utiel', 'UTIEL', 'Valencia'),

-- Alicante
('03014', '8025', 'Alicante/Alacant', 'ALACANT/ALICANTE', 'Alicante'),
('03031', '8036Y', 'Benidorm', 'BENIDORM', 'Alicante'),
('03009', '8059C', 'Alcoy', 'ALCOI/ALCOY', 'Alicante'),
('03099', '7244X', 'Orihuela', 'ORIHUELA', 'Alicante'),
('03065', '8019', 'Elche', 'ALICANTE-ELCHE AEROPUERTO', 'Alicante'),
('03140', '8008Y', 'Villena', 'VILLENA', 'Alicante'),
('03102', '8057C', 'Pego', 'PEGO', 'Alicante'),
('03093', '8013X', 'Novelda', 'NOVELDA', 'Alicante'),
('03113', '7261X', 'Rojales', 'ROJALES', 'Alicante'),
('03105', '7247X', 'Pinoso ', 'EL PINÓS/PINOSO', 'Alicante'),
('03082', '8050X', 'Jávea', 'JÁVEA/ XÀBIA', 'Alicante'),

-- Murcia
('30030', '7178I', 'Murcia', 'MURCIA', 'Murcia'),
('30016', '7012C', 'Cartagena', 'CARTAGENA', 'Murcia'),
('30024', '7209', 'Lorca', 'LORCA', 'Murcia'),
('30026', '7007Y', 'Mazarrón', 'MAZARRÓN/LAS TORRES', 'Murcia'),
('30003', '7002Y', 'Águilas', 'ÁGUILAS', 'Murcia'),
('30001', '7250C', 'Abanilla', 'ABANILLA', 'Murcia'),
('30039', '7218Y', 'Totana', 'TOTANA', 'Murcia'),
('30013', '7121A', 'Calasparra', 'CALASPARRA', 'Murcia'),
('30015', '7195X', 'Caravaca de la Cruz', 'CARAVACA DE LA CRUZ, LOS ROYOS', 'Murcia'),
('30029', '7172X', 'Mula', 'MULA', 'Murcia'),
('30037', '7026X', 'Torre-Pacheco', 'TORRE-PACHECO', 'Murcia'),
('30027', '7237E', 'Molina de Segura', 'MOLINA DE SEGURA', 'Murcia'),
('30043', '7275C', 'Yecla', 'YECLA', 'Murcia'),
('30021', '7023X', 'Fuente Álamo de Murcia', 'FUENTE ÁLAMO DE MURCIA', 'Murcia'),
('30009', '7158X', 'Archena', 'ARCHENA', 'Murcia'),
('30005', '7228', 'Alcantarilla', 'ALCANTARILLA, BASE AÉREA', 'Murcia'),
('30028', '7080X', 'Moratalla', 'MORATALLA', 'Murcia'),
('30033', '7211B', 'Puerto Lumbreras', 'PUERTO LUMBRERAS', 'Murcia'),
('30022', '7138B', 'Jumilla', 'JUMILLA', 'Murcia'),
('30012', '7127X', 'Bullas', 'BULLAS', 'Murcia'),
('30019', '7145D', 'Cieza', 'CIEZA', 'Murcia'),

-- Almeria

('04013', '6325O', 'Almería', 'ALMERÍA AEROPUERTO', 'Almeria'),
('04057', '6307X', 'Láujar de Andarax', 'LÁUJAR DE ANDARAX', 'Almeria'),
('04003', '6277B', 'Adra', 'ADRA', 'Almeria'),
('04001', '6302A', 'Abla', 'ABLA', 'Almeria'),
('04006', '6364X', 'Albox', 'ALBOX', 'Almeria'),
('04098', '5060X', 'Vélez-Blanco', 'VÉLEZ BLANCO - TOPARES', 'Almeria'),
('04902', '6291B', 'El Ejido', 'EL EJIDO', 'Almeria'),
('04049', '6340X', 'Garrucha', 'GARRUCHA, PUERTO', 'Almeria'),
('04053', '6367B', 'Huércal-Overa', 'HUÉRCAL-OVERA', 'Almeria');


CREATE TABLE WEATHER_DATA (
    city_id SERIAL PRIMARY KEY,
    date DATE NOT NULL,

    -- Prediction data
    temperature_predicted_avg FLOAT,
    temperature_predicted_max FLOAT,
    temperature_predicted_min FLOAT,
    humidity_predicted_avg INTEGER,
    humidity_predicted_max INTEGER,
    humidity_predicted_min INTEGER,
    precipitations JSON,
    prob_precipitation JSON,
    prob_storm JSON,

    -- Meteo data
    temperature_measured_avg FLOAT,
    temperature_measured_max FLOAT,
    temperature_measured_min FLOAT,
    humidity_measured_avg INTEGER,
    humidity_measured_max INTEGER,
    humidity_measured_min INTEGER,
    precipitation FLOAT,

    FOREIGN KEY (city_id ) REFERENCES CITIES(city_id),
    UNIQUE (city_id, date)
);