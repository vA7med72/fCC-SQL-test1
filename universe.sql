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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    size_in_km integer NOT NULL,
    is_spherical boolean,
    is_dead boolean NOT NULL,
    radius_in_km integer NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    type text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean NOT NULL,
    is_dead boolean NOT NULL,
    distance_from_planet integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    size numeric NOT NULL,
    color text NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_ud_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_ud_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_ud_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_ud_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_ud_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean NOT NULL,
    is_dead boolean NOT NULL,
    radius integer NOT NULL,
    size numeric NOT NULL,
    age_in_million_of_years integer NOT NULL,
    type text NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    is_spherical boolean NOT NULL,
    is_dead boolean NOT NULL,
    size_in_million_km numeric NOT NULL,
    radius integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    type text NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_planet_id integer NOT NULL
);


ALTER TABLE public.star_planet OWNER TO freecodecamp;

--
-- Name: star_planet_star_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_planet_star_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_planet_star_planet_id_seq OWNER TO freecodecamp;

--
-- Name: star_planet_star_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_planet_star_planet_id_seq OWNED BY public.star_planet.star_planet_id;


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_ud_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_planet star_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet ALTER COLUMN star_planet_id SET DEFAULT nextval('public.star_planet_star_planet_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy1', 14000000, false, false, 10000, 14, 'spiral');
INSERT INTO public.galaxy VALUES (2, 'galaxy2', 15000000, false, false, 11000, 14, 'spiral');
INSERT INTO public.galaxy VALUES (3, 'galaxy3', 28000000, false, false, 20000, 13, 'spiral');
INSERT INTO public.galaxy VALUES (4, 'galaxy4', 26000000, false, false, 19000, 21, 'spiral');
INSERT INTO public.galaxy VALUES (5, 'galaxy5', 21000000, false, false, 15000, 17, 'spiral');
INSERT INTO public.galaxy VALUES (6, 'galaxy6', 18000000, false, false, 13000, 12, 'dwarf');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, '1A1', true, false, 100000, 2, 30000, 'white', 1);
INSERT INTO public.moon VALUES (2, '1A2', true, false, 110000, 2, 30000, 'white', 1);
INSERT INTO public.moon VALUES (3, '1A3', true, false, 120000, 2, 30000, 'white', 1);
INSERT INTO public.moon VALUES (4, '1A4', true, false, 130000, 2, 30000, 'white', 1);
INSERT INTO public.moon VALUES (5, '1A5', true, false, 140000, 2, 30000, 'white', 1);
INSERT INTO public.moon VALUES (6, '1A6', true, false, 150000, 2, 30000, 'white', 1);
INSERT INTO public.moon VALUES (7, '1A7', true, false, 160000, 2, 30000, 'white', 1);
INSERT INTO public.moon VALUES (8, '1A8', true, false, 170000, 2, 30000, 'white', 1);
INSERT INTO public.moon VALUES (9, '1A9', true, false, 180000, 2, 30000, 'white', 1);
INSERT INTO public.moon VALUES (10, '1B1', true, false, 130000, 2, 30000, 'white', 2);
INSERT INTO public.moon VALUES (11, '2A1', true, false, 110000, 2, 30000, 'white', 3);
INSERT INTO public.moon VALUES (12, '2B1', true, false, 120000, 2, 30000, 'white', 4);
INSERT INTO public.moon VALUES (13, '3A1', true, false, 130000, 2, 30000, 'white', 5);
INSERT INTO public.moon VALUES (14, '3B1', true, false, 140000, 2, 30000, 'white', 6);
INSERT INTO public.moon VALUES (15, '4A1', true, false, 150000, 2, 30000, 'white', 7);
INSERT INTO public.moon VALUES (16, '4B1', true, false, 160000, 2, 30000, 'white', 8);
INSERT INTO public.moon VALUES (17, '5A1', true, false, 13000, 6, 10000, 'blue', 9);
INSERT INTO public.moon VALUES (18, '5B1', true, false, 132000, 1, 34000, 'gray', 10);
INSERT INTO public.moon VALUES (19, '6A1', true, false, 130000, 2, 30000, 'white', 11);
INSERT INTO public.moon VALUES (20, '6B1', true, false, 110000, 2, 30000, 'black', 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, '1A', true, false, 12, 48, 3, 'GASEOUS', 1);
INSERT INTO public.planet VALUES (2, '1B', true, false, 9, 36, 2, 'GASEOUS', 1);
INSERT INTO public.planet VALUES (8, '4B', true, false, 4, 16, 4, 'Stony', 4);
INSERT INTO public.planet VALUES (3, '2A', true, false, 1, 4, 2, 'Stony', 2);
INSERT INTO public.planet VALUES (4, '2B', true, false, 2, 8, 3, 'Stony', 3);
INSERT INTO public.planet VALUES (5, '3A', true, false, 8, 32, 2, 'Gaseuos', 3);
INSERT INTO public.planet VALUES (6, '3B', true, false, 3, 12, 4, 'Stony', 3);
INSERT INTO public.planet VALUES (7, '4A', true, false, 10, 40, 4, 'Gaseuos', 4);
INSERT INTO public.planet VALUES (10, '5B', true, false, 7, 28, 3, 'Gaseous', 5);
INSERT INTO public.planet VALUES (9, '5A', true, false, 8, 32, 4, 'Gaseuos', 5);
INSERT INTO public.planet VALUES (11, '6A', true, false, 11, 44, 4, 'Gaseuos', 6);
INSERT INTO public.planet VALUES (12, '6B', true, false, 1, 4, 1, 'Stony', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'star3', true, false, 0.16, 1600, 10, 'Blue Giant', 3);
INSERT INTO public.star VALUES (4, 'star4', true, false, 0.015, 150, 7, 'Brown dwarf', 4);
INSERT INTO public.star VALUES (5, 'star5', true, false, 0.09, 900, 10, 'Red Giant', 5);
INSERT INTO public.star VALUES (2, 'star2', true, false, 0.04, 400, 10, 'Red Giant', 2);
INSERT INTO public.star VALUES (1, 'star1', true, false, 0.03, 300, 10, 'Blue Giant', 1);
INSERT INTO public.star VALUES (6, 'star6', true, false, 0.3, 3000, 12, 'Brown dwarf', 6);


--
-- Data for Name: star_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_planet VALUES (1, '1A1', 1);
INSERT INTO public.star_planet VALUES (3, '2A1', 2);
INSERT INTO public.star_planet VALUES (5, '3A1', 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_ud_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_ud_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_planet_star_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_planet_star_planet_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_planet_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key1 UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_planet star_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_pkey PRIMARY KEY (star_planet_id);


--
-- Name: star_planet star_planet_star_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_star_planet_id_key UNIQUE (star_planet_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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
-- Name: star_planet star_planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

