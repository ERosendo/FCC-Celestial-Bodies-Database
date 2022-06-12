--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(5,2),
    number_of_stars integer NOT NULL
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
    description text,
    age_in_millions_of_years numeric(5,2),
    distance_from_planet numeric NOT NULL,
    is_sepherical boolean NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(5,2),
    has_life boolean NOT NULL,
    star_id integer NOT NULL,
    number_of_moons integer NOT NULL,
    planet_types_id integer
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(5,2),
    galaxy_id integer NOT NULL,
    number_of_planets integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

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

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Mercedes', 'A gigantic galaxy', 39.80, 1);
INSERT INTO public.galaxy VALUES (2, 'Volvo', 'A dull galaxy', 26.72, 1);
INSERT INTO public.galaxy VALUES (3, 'Porsche', 'A posh galaxy', 55.46, 1);
INSERT INTO public.galaxy VALUES (4, 'Volkswagen', 'A plain galaxy', 27.30, 1);
INSERT INTO public.galaxy VALUES (5, 'Toyota', 'A funky galaxy', 8.62, 1);
INSERT INTO public.galaxy VALUES (6, 'Rolls-Royce', 'A vintage galaxy', 144.35, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'AAPL', 'Apple', 0.37, 48, true, 1);
INSERT INTO public.moon VALUES (2, 'MSFT', 'Microsoft', 0.27, 43, true, 1);
INSERT INTO public.moon VALUES (3, 'KO', 'Coco Cola', 1.35, 68, false, 2);
INSERT INTO public.moon VALUES (4, 'ORCL', 'Oracle', 1.09, 73, false, 2);
INSERT INTO public.moon VALUES (5, 'TWTR', 'Twitter', 2.00, 138, true, 3);
INSERT INTO public.moon VALUES (6, 'GOOG', 'Google', 2.02, 101, false, 3);
INSERT INTO public.moon VALUES (7, 'TSLA', 'Tesla', 1.71, 85, true, 4);
INSERT INTO public.moon VALUES (8, 'CRM', 'Salesforce', 1.87, 91, false, 4);
INSERT INTO public.moon VALUES (9, 'NFLX', 'Netflix', 5.35, 67, false, 5);
INSERT INTO public.moon VALUES (10, 'SHOP', 'Shopify', 6.22, 59, true, 5);
INSERT INTO public.moon VALUES (11, 'PFE', 'Pfizer', 4.10, 128, true, 6);
INSERT INTO public.moon VALUES (12, 'BB', 'Blackberry', 3.05, 104, true, 6);
INSERT INTO public.moon VALUES (14, 'AVGO', 'Broadcom', 2.17, 27, false, 7);
INSERT INTO public.moon VALUES (15, 'SSTK', 'Shutterstock', 1.89, 48, false, 8);
INSERT INTO public.moon VALUES (16, 'DIS', 'Disney', 2.02, 44, true, 8);
INSERT INTO public.moon VALUES (17, 'ZM', 'Zoom', 0.01, 11, false, 9);
INSERT INTO public.moon VALUES (18, 'IMAX', 'Imax', 0.00, 25, false, 9);
INSERT INTO public.moon VALUES (19, 'NVTA', 'Invitae', 0.13, 42, true, 10);
INSERT INTO public.moon VALUES (21, 'JMIA', 'Jumia', 7.21, 52, false, 11);
INSERT INTO public.moon VALUES (22, 'BABA', 'Alibaba', 13.49, 68, true, 11);
INSERT INTO public.moon VALUES (23, 'GRPN', 'Groupon', 17.55, 198, false, 12);
INSERT INTO public.moon VALUES (24, 'FTCH', 'Farfetch', 22.51, 220, false, 12);
INSERT INTO public.moon VALUES (13, 'Nokia', 'NOKIA', 1.55, 18, false, 7);
INSERT INTO public.moon VALUES (20, 'Fiverr', 'Fiver', 0.10, 37, true, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Blue', 'A lonely planet', 1.52, false, 1, 2, 1);
INSERT INTO public.planet VALUES (2, 'Red', 'A cheeky planet', 2.29, false, 1, 2, 2);
INSERT INTO public.planet VALUES (3, 'Yellow', 'A smart planet', 2.37, true, 2, 2, 3);
INSERT INTO public.planet VALUES (4, 'Green', 'A strong lanet', 2.44, false, 2, 2, 4);
INSERT INTO public.planet VALUES (5, 'Black', 'An ambitious planet', 8.68, false, 3, 2, 5);
INSERT INTO public.planet VALUES (6, 'White', 'A kind planet', 7.59, true, 3, 2, 6);
INSERT INTO public.planet VALUES (7, 'Orange', 'A clumsy planet', 5.30, true, 4, 2, 7);
INSERT INTO public.planet VALUES (8, 'Teal', 'A geeky planet', 6.08, false, 4, 2, 8);
INSERT INTO public.planet VALUES (9, 'Brown', 'A quiet planet', 0.01, false, 5, 2, 9);
INSERT INTO public.planet VALUES (10, 'Grey', 'A rational planet', 0.22, false, 5, 2, 10);
INSERT INTO public.planet VALUES (11, 'Azure', 'A sentimenta planet', 27.99, true, 6, 2, 11);
INSERT INTO public.planet VALUES (12, 'Purple', 'A judgmental planet', 36.31, true, 6, 2, 12);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Alpha', 'The first type');
INSERT INTO public.planet_types VALUES (2, 'Beta', 'The second type');
INSERT INTO public.planet_types VALUES (3, 'Gamma', 'The third type');
INSERT INTO public.planet_types VALUES (4, 'Lambda', 'The fourth type');
INSERT INTO public.planet_types VALUES (5, 'Sigma', 'The fifth type');
INSERT INTO public.planet_types VALUES (6, 'Omega', 'The sixth type');
INSERT INTO public.planet_types VALUES (7, 'Delta', 'The seventh type');
INSERT INTO public.planet_types VALUES (8, 'Theta', 'The eighth type');
INSERT INTO public.planet_types VALUES (9, 'Pi', 'The ninth type');
INSERT INTO public.planet_types VALUES (10, 'Mu', 'The tenth type');
INSERT INTO public.planet_types VALUES (11, 'Chi', 'The eleventh type');
INSERT INTO public.planet_types VALUES (12, 'Psi', 'The twelveth type');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Nike', 'A shining star', 3.57, 1, 2);
INSERT INTO public.star VALUES (2, 'Puma', 'A dim star', 4.15, 2, 2);
INSERT INTO public.star VALUES (3, 'Adidas', 'A wicked star', 12.29, 3, 2);
INSERT INTO public.star VALUES (4, 'Reebok', 'A twinkle star', 10.08, 4, 2);
INSERT INTO public.star VALUES (5, 'Acis', 'A lunatic star', 0.57, 5, 2);
INSERT INTO public.star VALUES (6, 'Lulelemon', 'A bright star', 46.95, 6, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_types_id_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


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