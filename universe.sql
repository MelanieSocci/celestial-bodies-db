--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_id_seq OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer DEFAULT nextval('public.asteroid_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_moon boolean,
    diameter integer,
    radius integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer DEFAULT nextval('public.galaxy_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    size_light_years integer NOT NULL,
    galaxy_type text,
    num_of_stars integer,
    has_black_hole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer DEFAULT nextval('public.moon_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    radius integer,
    diameter integer,
    is_spherical boolean,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer DEFAULT nextval('public.planet_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean,
    mass numeric,
    distance_from_star integer,
    age_in_millions_of_years integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer DEFAULT nextval('public.star_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    magnitude numeric,
    temperature integer,
    distance_from_earth integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'uno', 'descripcion', false, 4002120, 50000);
INSERT INTO public.asteroid VALUES (2, 'dos', 'descripcion', false, 6862120, 50000);
INSERT INTO public.asteroid VALUES (3, 'tres', 'descripcion', true, 120120, 50000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 200000, 'Spiral', 100000000, true);
INSERT INTO public.galaxy VALUES (2, 'Messier 82', 12000000, 'Spiral', 25000000, true);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 500000, 'Elliptical', 78000000, true);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 62000, 'Spiral', 400000000, false);
INSERT INTO public.galaxy VALUES (5, 'Via Lactea', 10000, 'Spiral', 84000000, true);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 580000, 'Spiral', 1100000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'uno', 1, 4212120, 6100, false, 'descripcion');
INSERT INTO public.moon VALUES (2, 'dos', 1, 4324000, 610008, true, 'descripcion');
INSERT INTO public.moon VALUES (3, 'tres', 1, 4324000, 6656988, false, 'descripcion');
INSERT INTO public.moon VALUES (4, 'cuatro', 1, 4374000, 66056988, true, 'descripcion');
INSERT INTO public.moon VALUES (5, 'cinco', 1, 72524000, 606506988, false, 'descripcion');
INSERT INTO public.moon VALUES (6, 'seis', 1, 49624000, 6656988, true, 'descripcion');
INSERT INTO public.moon VALUES (9, 'nueve', 1, 524000, 656988, false, 'descripcion');
INSERT INTO public.moon VALUES (11, 'once', 1, 994000, 1656988, false, 'descripcion');
INSERT INTO public.moon VALUES (12, 'doce', 1, 32320, 1356988, false, 'descripcion');
INSERT INTO public.moon VALUES (13, 'trece', 1, 456650, 6656988, false, 'descripcion');
INSERT INTO public.moon VALUES (14, 'catorce', 1, 5524014, 6656988, true, 'descripcion');
INSERT INTO public.moon VALUES (16, 'dieciseis', 1, 455645, 6656988, false, 'descripcion');
INSERT INTO public.moon VALUES (17, 'diecisiete', 1, 56465400, 6656988, true, 'descripcion');
INSERT INTO public.moon VALUES (18, 'dieciocho', 1, 546000, 6656988, false, 'descripcion');
INSERT INTO public.moon VALUES (19, 'diecinueve', 1, 48768770, 6656988, true, 'descripcion');
INSERT INTO public.moon VALUES (20, 'veinte', 1, 4324000, 6656988, false, 'descripcion');
INSERT INTO public.moon VALUES (15, 'quince', 1, 606906, 6656988, true, 'descripcion');
INSERT INTO public.moon VALUES (10, 'diez', 5, 824000, 9988658, false, 'descripcion');
INSERT INTO public.moon VALUES (7, 'siete', 1, 874000, 6645788, false, 'descripcion');
INSERT INTO public.moon VALUES (8, 'ocho', 1, 5324000, 77887788, true, 'descripcion');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 1, false, 1000000, 248652188, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, 4324000, 6656988, 4510000);
INSERT INTO public.planet VALUES (3, 'Tierra', 1, true, 3332000, 54644988, 1200006);
INSERT INTO public.planet VALUES (4, 'Marte', 1, false, 63330000, 411988, 456);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, 563000, 413138, 444411);
INSERT INTO public.planet VALUES (6, 'Saturno', 1, false, 100000000, 6656988, 4565456);
INSERT INTO public.planet VALUES (7, 'Urano', 1, false, 100000000, 6656988, 4565456);
INSERT INTO public.planet VALUES (8, 'Neptuno', 1, false, 100000000, 6656988, 4565456);
INSERT INTO public.planet VALUES (9, 'Pluton', 1, false, 100000000, 6656988, 4565456);
INSERT INTO public.planet VALUES (10, 'Seres', 1, false, 100000000, 6656988, 4565456);
INSERT INTO public.planet VALUES (11, 'Eris', 1, false, 100000000, 6656988, 4565456);
INSERT INTO public.planet VALUES (12, 'Haumea', 1, false, 100000000, 6656988, 4565456);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4.83, 5778, 150000000);
INSERT INTO public.star VALUES (2, 'Alpha A', 1, 4.40, 5790, 480000000);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 5.53, 6522, 250000000);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 6.05, 2335, 587000000);
INSERT INTO public.star VALUES (5, 'Rigel', 1, -6.70, 5444, 470000000);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 2.00, 4000, 60000000);


--
-- Name: asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_id_seq', 1, false);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 1, false);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 1, false);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 3, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid unique_asteroid_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_asteroid_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

