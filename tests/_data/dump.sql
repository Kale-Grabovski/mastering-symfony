--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.task DROP CONSTRAINT fk_527edb25a76ed395;
ALTER TABLE ONLY public.task DROP CONSTRAINT fk_527edb25166d1f9c;
ALTER TABLE ONLY public.project DROP CONSTRAINT fk_2fb3d0ee82d40a1f;
DROP INDEX public.idx_527edb25a76ed395;
DROP INDEX public.idx_527edb25166d1f9c;
DROP INDEX public.idx_2fb3d0ee82d40a1f;
ALTER TABLE ONLY public.workspace DROP CONSTRAINT workspace_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.task DROP CONSTRAINT task_pkey;
ALTER TABLE ONLY public.project DROP CONSTRAINT project_pkey;
DROP SEQUENCE public.workspace_id_seq;
DROP TABLE public.workspace;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.task_id_seq;
DROP TABLE public.task;
DROP SEQUENCE public.project_id_seq;
DROP TABLE public.project;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE project (
    id integer NOT NULL,
    workspace_id integer,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    due_date timestamp(0) with time zone NOT NULL
);


ALTER TABLE project OWNER TO postgres;

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project_id_seq OWNER TO postgres;

--
-- Name: task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE task (
    id integer NOT NULL,
    project_id integer,
    user_id integer,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    due_date timestamp(0) with time zone NOT NULL,
    attachment boolean
);


ALTER TABLE task OWNER TO postgres;

--
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE task_id_seq OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    bio text NOT NULL,
    email character varying(255) NOT NULL
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- Name: workspace; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE workspace (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL
);


ALTER TABLE workspace OWNER TO postgres;

--
-- Name: workspace_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE workspace_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE workspace_id_seq OWNER TO postgres;

--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY project (id, workspace_id, title, description, due_date) FROM stdin;
1	1	Symfony book	Some descriptions for Symfony book project	2014-10-20 00:00:00+00
\.


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('project_id_seq', 1, true);


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY task (id, project_id, user_id, title, description, due_date, attachment) FROM stdin;
1	1	1	writing chapter 1	descriptions for writing ch1	2014-10-14 00:00:00+00	\N
2	1	2	reviewing chapter 1	descriptions for reviewing ch1	2014-10-16 00:00:00+00	\N
3	1	2	editing chapter 1	descriptions for editing ch1	2014-10-18 00:00:00+00	\N
\.


--
-- Name: task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('task_id_seq', 3, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, name, bio, email) FROM stdin;
1	John	He is a cool guy	john@mava.info
2	Jack	He is a cool guy too	jack@mava.info
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- Data for Name: workspace; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY workspace (id, name, description) FROM stdin;
1	Writing	info for writing Workspace
\.


--
-- Name: workspace_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('workspace_id_seq', 1, true);


--
-- Name: project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: workspace_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY workspace
    ADD CONSTRAINT workspace_pkey PRIMARY KEY (id);


--
-- Name: idx_2fb3d0ee82d40a1f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_2fb3d0ee82d40a1f ON project USING btree (workspace_id);


--
-- Name: idx_527edb25166d1f9c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_527edb25166d1f9c ON task USING btree (project_id);


--
-- Name: idx_527edb25a76ed395; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_527edb25a76ed395 ON task USING btree (user_id);


--
-- Name: fk_2fb3d0ee82d40a1f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY project
    ADD CONSTRAINT fk_2fb3d0ee82d40a1f FOREIGN KEY (workspace_id) REFERENCES workspace(id);


--
-- Name: fk_527edb25166d1f9c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fk_527edb25166d1f9c FOREIGN KEY (project_id) REFERENCES project(id);


--
-- Name: fk_527edb25a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fk_527edb25a76ed395 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

