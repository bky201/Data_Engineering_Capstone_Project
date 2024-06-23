--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)

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
-- Name: softcartDimCategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."softcartDimCategory" (
    categoryid integer NOT NULL,
    category character varying(10) NOT NULL
);


ALTER TABLE public."softcartDimCategory" OWNER TO postgres;

--
-- Name: softcartDimCountry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."softcartDimCountry" (
    countryid integer NOT NULL,
    country character varying NOT NULL
);


ALTER TABLE public."softcartDimCountry" OWNER TO postgres;

--
-- Name: softcartDimDate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."softcartDimDate" (
    dateid integer NOT NULL,
    date date NOT NULL,
    "Year" integer NOT NULL,
    "QuarterName" character varying(2) NOT NULL,
    "Quarter" integer NOT NULL,
    "Month" integer NOT NULL,
    "MonthName" character varying(10) NOT NULL,
    "Day" integer NOT NULL,
    "Weekday" integer NOT NULL,
    "WeekdayName" character varying(10) NOT NULL
);


ALTER TABLE public."softcartDimDate" OWNER TO postgres;

--
-- Name: softcartDimItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."softcartDimItem" (
    itemid integer NOT NULL,
    item character varying(10) NOT NULL
);


ALTER TABLE public."softcartDimItem" OWNER TO postgres;

--
-- Name: softcartFactSales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."softcartFactSales" (
    orderid integer NOT NULL,
    dateid integer NOT NULL,
    categoryid integer NOT NULL,
    itemeid integer NOT NULL,
    countryid integer NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public."softcartFactSales" OWNER TO postgres;

--
-- Data for Name: softcartDimCategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."softcartDimCategory" (categoryid, category) FROM stdin;
\.


--
-- Data for Name: softcartDimCountry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."softcartDimCountry" (countryid, country) FROM stdin;
\.


--
-- Data for Name: softcartDimDate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."softcartDimDate" (dateid, date, "Year", "QuarterName", "Quarter", "Month", "MonthName", "Day", "Weekday", "WeekdayName") FROM stdin;
\.


--
-- Data for Name: softcartDimItem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."softcartDimItem" (itemid, item) FROM stdin;
\.


--
-- Data for Name: softcartFactSales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."softcartFactSales" (orderid, dateid, categoryid, itemeid, countryid, price) FROM stdin;
\.


--
-- Name: softcartDimCategory softcartDimCategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."softcartDimCategory"
    ADD CONSTRAINT "softcartDimCategory_pkey" PRIMARY KEY (categoryid);


--
-- Name: softcartDimCountry softcartDimCountry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."softcartDimCountry"
    ADD CONSTRAINT "softcartDimCountry_pkey" PRIMARY KEY (countryid);


--
-- Name: softcartDimDate softcartDimDate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."softcartDimDate"
    ADD CONSTRAINT "softcartDimDate_pkey" PRIMARY KEY (dateid);


--
-- Name: softcartDimItem softcartDimItem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."softcartDimItem"
    ADD CONSTRAINT "softcartDimItem_pkey" PRIMARY KEY (itemid);


--
-- Name: softcartFactSales softcartFactSales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."softcartFactSales"
    ADD CONSTRAINT "softcartFactSales_pkey" PRIMARY KEY (orderid);


--
-- Name: softcartFactSales softcartFactSales_categoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."softcartFactSales"
    ADD CONSTRAINT "softcartFactSales_categoryid_fkey" FOREIGN KEY (categoryid) REFERENCES public."softcartDimCategory"(categoryid) NOT VALID;


--
-- Name: softcartFactSales softcartFactSales_countryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."softcartFactSales"
    ADD CONSTRAINT "softcartFactSales_countryid_fkey" FOREIGN KEY (countryid) REFERENCES public."softcartDimCountry"(countryid) NOT VALID;


--
-- Name: softcartFactSales softcartFactSales_dateid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."softcartFactSales"
    ADD CONSTRAINT "softcartFactSales_dateid_fkey" FOREIGN KEY (dateid) REFERENCES public."softcartDimDate"(dateid) NOT VALID;


--
-- Name: softcartFactSales softcartFactSales_itemeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."softcartFactSales"
    ADD CONSTRAINT "softcartFactSales_itemeid_fkey" FOREIGN KEY (itemeid) REFERENCES public."softcartDimItem"(itemid) NOT VALID;


--
-- PostgreSQL database dump complete
--

