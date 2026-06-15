--
-- PostgreSQL database dump
--

\restrict lBhb8XbsDg7mTDLtWnxeiAu7uFZJF08BCh65hOaEM39SCZJXPJTAuSfwtGzkuYB

-- Dumped from database version 16.14 (Debian 16.14-1.pgdg13+1)
-- Dumped by pg_dump version 16.14 (Debian 16.14-1.pgdg13+1)

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

ALTER TABLE IF EXISTS ONLY public.users_user_user_permissions DROP CONSTRAINT IF EXISTS users_user_user_permissions_user_id_20aca447_fk_users_user_id;
ALTER TABLE IF EXISTS ONLY public.users_user_user_permissions DROP CONSTRAINT IF EXISTS users_user_user_perm_permission_id_0b93982e_fk_auth_perm;
ALTER TABLE IF EXISTS ONLY public.users_user_groups DROP CONSTRAINT IF EXISTS users_user_groups_user_id_5f6f5a90_fk_users_user_id;
ALTER TABLE IF EXISTS ONLY public.users_user_groups DROP CONSTRAINT IF EXISTS users_user_groups_group_id_9afc8d0e_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.projects_project_skills DROP CONSTRAINT IF EXISTS projects_project_skills_skill_id_69311f1e_fk_projects_skill_id;
ALTER TABLE IF EXISTS ONLY public.projects_project_skills DROP CONSTRAINT IF EXISTS projects_project_ski_project_id_f72fc0fe_fk_projects_;
ALTER TABLE IF EXISTS ONLY public.projects_project_participants DROP CONSTRAINT IF EXISTS projects_project_participants_user_id_5905fe7e_fk_users_user_id;
ALTER TABLE IF EXISTS ONLY public.projects_project_participants DROP CONSTRAINT IF EXISTS projects_project_par_project_id_977bbd69_fk_projects_;
ALTER TABLE IF EXISTS ONLY public.projects_project DROP CONSTRAINT IF EXISTS projects_project_owner_id_b940de39_fk_users_user_id;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_user_id_c564eba6_fk_users_user_id;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
DROP INDEX IF EXISTS public.users_user_user_permissions_user_id_20aca447;
DROP INDEX IF EXISTS public.users_user_user_permissions_permission_id_0b93982e;
DROP INDEX IF EXISTS public.users_user_phone_fe37f55c_like;
DROP INDEX IF EXISTS public.users_user_groups_user_id_5f6f5a90;
DROP INDEX IF EXISTS public.users_user_groups_group_id_9afc8d0e;
DROP INDEX IF EXISTS public.users_user_email_243f6e77_like;
DROP INDEX IF EXISTS public.projects_skill_name_e80ac73f_like;
DROP INDEX IF EXISTS public.projects_project_skills_skill_id_69311f1e;
DROP INDEX IF EXISTS public.projects_project_skills_project_id_f72fc0fe;
DROP INDEX IF EXISTS public.projects_project_participants_user_id_5905fe7e;
DROP INDEX IF EXISTS public.projects_project_participants_project_id_977bbd69;
DROP INDEX IF EXISTS public.projects_project_owner_id_b940de39;
DROP INDEX IF EXISTS public.django_session_session_key_c0390e0f_like;
DROP INDEX IF EXISTS public.django_session_expire_date_a5c62663;
DROP INDEX IF EXISTS public.django_admin_log_user_id_c564eba6;
DROP INDEX IF EXISTS public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX IF EXISTS public.auth_permission_content_type_id_2f476e4b;
DROP INDEX IF EXISTS public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX IF EXISTS public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX IF EXISTS public.auth_group_name_a6ea08ec_like;
ALTER TABLE IF EXISTS ONLY public.users_user_user_permissions DROP CONSTRAINT IF EXISTS users_user_user_permissions_user_id_permission_id_43338c45_uniq;
ALTER TABLE IF EXISTS ONLY public.users_user_user_permissions DROP CONSTRAINT IF EXISTS users_user_user_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.users_user DROP CONSTRAINT IF EXISTS users_user_pkey;
ALTER TABLE IF EXISTS ONLY public.users_user DROP CONSTRAINT IF EXISTS users_user_phone_key;
ALTER TABLE IF EXISTS ONLY public.users_user_groups DROP CONSTRAINT IF EXISTS users_user_groups_user_id_group_id_b88eab82_uniq;
ALTER TABLE IF EXISTS ONLY public.users_user_groups DROP CONSTRAINT IF EXISTS users_user_groups_pkey;
ALTER TABLE IF EXISTS ONLY public.users_user DROP CONSTRAINT IF EXISTS users_user_email_key;
ALTER TABLE IF EXISTS ONLY public.projects_skill DROP CONSTRAINT IF EXISTS projects_skill_pkey;
ALTER TABLE IF EXISTS ONLY public.projects_skill DROP CONSTRAINT IF EXISTS projects_skill_name_key;
ALTER TABLE IF EXISTS ONLY public.projects_project_skills DROP CONSTRAINT IF EXISTS projects_project_skills_project_id_skill_id_8f3bb086_uniq;
ALTER TABLE IF EXISTS ONLY public.projects_project_skills DROP CONSTRAINT IF EXISTS projects_project_skills_pkey;
ALTER TABLE IF EXISTS ONLY public.projects_project DROP CONSTRAINT IF EXISTS projects_project_pkey;
ALTER TABLE IF EXISTS ONLY public.projects_project_participants DROP CONSTRAINT IF EXISTS projects_project_participants_project_id_user_id_64171833_uniq;
ALTER TABLE IF EXISTS ONLY public.projects_project_participants DROP CONSTRAINT IF EXISTS projects_project_participants_pkey;
ALTER TABLE IF EXISTS ONLY public.django_session DROP CONSTRAINT IF EXISTS django_session_pkey;
ALTER TABLE IF EXISTS ONLY public.django_migrations DROP CONSTRAINT IF EXISTS django_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_name_key;
DROP TABLE IF EXISTS public.users_user_user_permissions;
DROP TABLE IF EXISTS public.users_user_groups;
DROP TABLE IF EXISTS public.users_user;
DROP TABLE IF EXISTS public.projects_skill;
DROP TABLE IF EXISTS public.projects_project_skills;
DROP TABLE IF EXISTS public.projects_project_participants;
DROP TABLE IF EXISTS public.projects_project;
DROP TABLE IF EXISTS public.django_session;
DROP TABLE IF EXISTS public.django_migrations;
DROP TABLE IF EXISTS public.django_content_type;
DROP TABLE IF EXISTS public.django_admin_log;
DROP TABLE IF EXISTS public.auth_permission;
DROP TABLE IF EXISTS public.auth_group_permissions;
DROP TABLE IF EXISTS public.auth_group;
-- *not* dropping schema, since initdb creates it
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

-- *not* creating schema, since initdb creates it


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: projects_project; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects_project (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    description text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    github_url character varying(200) NOT NULL,
    status character varying(10) NOT NULL,
    owner_id bigint NOT NULL
);


--
-- Name: projects_project_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.projects_project ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.projects_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: projects_project_participants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects_project_participants (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    user_id bigint NOT NULL
);


--
-- Name: projects_project_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.projects_project_participants ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.projects_project_participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: projects_project_skills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects_project_skills (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    skill_id bigint NOT NULL
);


--
-- Name: projects_project_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.projects_project_skills ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.projects_project_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: projects_skill; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects_skill (
    id bigint NOT NULL,
    name character varying(124) NOT NULL
);


--
-- Name: projects_skill_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.projects_skill ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.projects_skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(254) NOT NULL,
    name character varying(124) NOT NULL,
    surname character varying(124) NOT NULL,
    avatar character varying(100) NOT NULL,
    phone character varying(12),
    github_url character varying(200) NOT NULL,
    about text NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.users_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.users_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.users_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add Пользователь	6	add_user
22	Can change Пользователь	6	change_user
23	Can delete Пользователь	6	delete_user
24	Can view Пользователь	6	view_user
25	Can add Навык	7	add_skill
26	Can change Навык	7	change_skill
27	Can delete Навык	7	delete_skill
28	Can view Навык	7	view_skill
29	Can add Проект	8	add_project
30	Can change Проект	8	change_project
31	Can delete Проект	8	delete_project
32	Can view Проект	8	view_project
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	users	user
7	projects	skill
8	projects	project
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2026-06-15 11:26:21.191691+00
2	contenttypes	0002_remove_content_type_name	2026-06-15 11:26:21.196415+00
3	auth	0001_initial	2026-06-15 11:26:21.217999+00
4	auth	0002_alter_permission_name_max_length	2026-06-15 11:26:21.220792+00
5	auth	0003_alter_user_email_max_length	2026-06-15 11:26:21.223446+00
6	auth	0004_alter_user_username_opts	2026-06-15 11:26:21.226264+00
7	auth	0005_alter_user_last_login_null	2026-06-15 11:26:21.228932+00
8	auth	0006_require_contenttypes_0002	2026-06-15 11:26:21.229915+00
9	auth	0007_alter_validators_add_error_messages	2026-06-15 11:26:21.232549+00
10	auth	0008_alter_user_username_max_length	2026-06-15 11:26:21.235193+00
11	auth	0009_alter_user_last_name_max_length	2026-06-15 11:26:21.237819+00
12	auth	0010_alter_group_name_max_length	2026-06-15 11:26:21.241143+00
13	auth	0011_update_proxy_permissions	2026-06-15 11:26:21.243623+00
14	auth	0012_alter_user_first_name_max_length	2026-06-15 11:26:21.246402+00
15	users	0001_initial	2026-06-15 11:26:21.27285+00
16	admin	0001_initial	2026-06-15 11:26:21.284738+00
17	admin	0002_logentry_remove_auto_add	2026-06-15 11:26:21.288442+00
18	admin	0003_logentry_add_action_flag_choices	2026-06-15 11:26:21.29248+00
19	projects	0001_initial	2026-06-15 11:26:21.300047+00
20	projects	0002_initial	2026-06-15 11:26:21.325438+00
21	sessions	0001_initial	2026-06-15 11:26:21.33177+00
22	projects	0003_alter_project_status	2026-06-15 12:00:57.10611+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
2ml7kjhnzp3a6xqfa4tq9u1mqhrws8cb	.eJxVjEsOAiEQBe_C2hBohQaX7j0D6eYjowaSYWZlvLtOMgvdvqp6LxFoXWpYR57DlMRZOHH43ZjiI7cNpDu1W5ext2WeWG6K3OmQ157y87K7fweVRv3WaLEAokNrCyhUx1KMiwadRvBMoMCT9YlBp-zZQ7FkEE6ODWiiQuL9AbfNNzA:1wZ5bZ:Z1twYUpnUegeJErp2hZ_KtQqswuwDgNTyXdt_bkLB_w	2026-06-29 11:35:49.941695+00
5zd2k9wltexeg6aptv5swxy07rqjoe3a	.eJxVjEEOwiAQRe_C2hCZgRFcuvcMBDpTqRpISrsy3l2bdKHb_977LxXTupS4dpnjxOqsQB1-t5yGh9QN8D3VW9NDq8s8Zb0peqddXxvL87K7fwcl9fKt08kYxISB_DhaBzmLIbbAQsLowdngGCgfyQRgBPDM5AJ6DjYQevX-AMtLNss:1wZ60Q:CYj7YnuB_cwrbZSU05FtiOzioAluIsS64q3iVOjbCbQ	2026-06-29 12:01:30.956743+00
\.


--
-- Data for Name: projects_project; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.projects_project (id, name, description, created_at, github_url, status, owner_id) FROM stdin;
1	Умный трекер задач #1	Pet-проект «Умный трекер задач #1». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.256741+00	https://github.com/teamfinder/project-1	closed	2
2	Командный агрегатор #2	Pet-проект «Командный агрегатор #2». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.264015+00		open	3
3	Открытый монитор #3	Pet-проект «Открытый монитор #3». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.270974+00		open	4
4	Быстрый мессенджер #4	Pet-проект «Быстрый мессенджер #4». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.273299+00	https://github.com/teamfinder/project-4	open	5
5	Зелёный каталог #5	Pet-проект «Зелёный каталог #5». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.279319+00		open	6
6	Социальный маркетплейс #6	Pet-проект «Социальный маркетплейс #6». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.286358+00		closed	7
7	Мобильный конструктор #7	Pet-проект «Мобильный конструктор #7». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.289475+00	https://github.com/teamfinder/project-7	open	2
8	Облачный портал #8	Pet-проект «Облачный портал #8». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.295559+00		open	3
9	Гибкий дашборд #9	Pet-проект «Гибкий дашборд #9». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.302015+00		open	4
10	Надёжный редактор #10	Pet-проект «Надёжный редактор #10». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.308438+00	https://github.com/teamfinder/project-10	open	5
11	Креативный планировщик #11	Pet-проект «Креативный планировщик #11». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.31413+00		closed	6
12	Цифровой помощник #12	Pet-проект «Цифровой помощник #12». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.317845+00		open	7
13	Умный трекер задач #13	Pet-проект «Умный трекер задач #13». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.323528+00	https://github.com/teamfinder/project-13	open	2
14	Командный агрегатор #14	Pet-проект «Командный агрегатор #14». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.328001+00		open	3
15	Открытый монитор #15	Pet-проект «Открытый монитор #15». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.332649+00		open	4
16	Быстрый мессенджер #16	Pet-проект «Быстрый мессенджер #16». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.337567+00	https://github.com/teamfinder/project-16	closed	5
17	Зелёный каталог #17	Pet-проект «Зелёный каталог #17». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.342905+00		open	6
18	Социальный маркетплейс #18	Pet-проект «Социальный маркетплейс #18». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.349636+00		open	7
19	Мобильный конструктор #19	Pet-проект «Мобильный конструктор #19». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.355003+00	https://github.com/teamfinder/project-19	open	2
20	Облачный портал #20	Pet-проект «Облачный портал #20». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.362048+00		open	3
21	Гибкий дашборд #21	Pet-проект «Гибкий дашборд #21». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.366519+00		closed	4
22	Надёжный редактор #22	Pet-проект «Надёжный редактор #22». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.369874+00	https://github.com/teamfinder/project-22	open	5
23	Креативный планировщик #23	Pet-проект «Креативный планировщик #23». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.373485+00		open	6
24	Цифровой помощник #24	Pet-проект «Цифровой помощник #24». Ищем единомышленников в команду для совместной разработки. Присоединяйтесь!	2026-06-15 11:31:36.378139+00		open	7
\.


--
-- Data for Name: projects_project_participants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.projects_project_participants (id, project_id, user_id) FROM stdin;
1	1	4
2	2	2
3	2	7
4	2	6
5	4	6
6	5	4
7	5	3
8	7	3
9	7	6
10	8	7
11	8	5
12	9	2
13	9	3
14	10	4
15	10	3
16	10	6
17	12	5
18	13	5
19	14	6
20	14	5
21	15	3
22	15	6
23	16	3
24	16	7
25	17	4
26	17	3
27	17	2
28	18	3
29	19	7
30	19	6
31	19	5
32	20	5
33	20	2
34	23	4
35	24	8
\.


--
-- Data for Name: projects_project_skills; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.projects_project_skills (id, project_id, skill_id) FROM stdin;
1	1	2
2	1	1
3	1	5
4	1	4
5	2	2
6	2	11
7	2	9
8	2	12
9	3	4
10	3	9
11	4	4
12	4	11
13	4	9
14	4	7
15	5	5
16	5	1
17	5	3
18	5	7
19	6	6
20	6	2
21	7	2
22	7	6
23	7	11
24	8	2
25	8	7
26	8	12
27	8	9
28	9	4
29	9	2
30	9	1
31	9	12
32	10	7
33	10	5
34	11	4
35	11	11
36	11	5
37	12	11
38	12	3
39	12	9
40	12	4
41	13	5
42	13	11
43	13	9
44	14	4
45	14	1
46	15	4
47	15	10
48	16	11
49	16	8
50	16	3
51	17	9
52	17	12
53	17	5
54	17	7
55	18	8
56	18	2
57	18	1
58	18	11
59	19	7
60	19	10
61	19	2
62	19	12
63	20	9
64	20	1
65	20	2
66	21	7
67	21	3
68	21	8
69	22	12
70	22	5
71	22	9
72	22	3
73	23	5
74	23	11
75	23	9
76	23	4
77	24	9
78	24	12
\.


--
-- Data for Name: projects_skill; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.projects_skill (id, name) FROM stdin;
1	Python
2	Django
3	JavaScript
4	React
5	PostgreSQL
6	Docker
7	Figma
8	UI/UX
9	DevOps
10	Go
11	TypeScript
12	REST API
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users_user (id, password, last_login, is_superuser, email, name, surname, avatar, phone, github_url, about, is_active, is_staff, date_joined) FROM stdin;
1	pbkdf2_sha256$1000000$W8qKPhLsbObehLwoG7zY6I$7APGQ8Bgj6xCADV1M2Gy0y3X1vvrc1GdfuOc27VxhWA=	\N	t	admin@teamfinder.local	Админ	Платформы	avatars/avatar_7d90d322-82e0-4fac-9bb4-a60987e0ad3d.png	\N			t	t	2026-06-15 11:31:35.441917+00
4	pbkdf2_sha256$1000000$FjDQ9LNHfmNrkYP3mULn2b$kLSvAUXCTPIy1q7qLNr+KMwp5w1ajPi06rULs/fF3Mo=	\N	f	dmitry@example.com	Дмитрий	Кузнецов	avatars/avatar_20df0db7-fc3c-46d2-9a59-a71ccbd4b050.png	\N			t	f	2026-06-15 11:31:35.85036+00
5	pbkdf2_sha256$1000000$Rs0DR76vgzXRS4UqmacAKj$GCeybabTbH34T8ZGpQkxudZnipgLAtU+yxXVCck9RAo=	\N	f	maria@example.com	Мария	Иванова	avatars/avatar_096464ab-7cca-4046-9cb9-719ec2081d8f.png	\N			t	f	2026-06-15 11:31:35.974203+00
6	pbkdf2_sha256$1000000$XSZKfZ49pAfwwpZ0DQh71B$MSqykNx02SeFob70usd85l/KCil+VX0L4+N8S4uFj44=	\N	f	sergey@example.com	Сергей	Волков	avatars/avatar_1342a661-e433-4b08-8775-c41557301b86.png	\N			t	f	2026-06-15 11:31:36.100148+00
7	pbkdf2_sha256$1000000$HmD0OigqYPs1ulLinMduJK$BGhvBlFGsdHBZJ9wRBd8OsBge4H8xQAzkel0Jua0VzE=	2026-06-15 11:34:51.596029+00	f	olga@example.com	Ольга	Морозова	avatars/avatar_45126a98-a84f-4eb8-91ea-d6d193f8220f.png	\N			t	f	2026-06-15 11:31:36.225408+00
8	pbkdf2_sha256$1000000$IAR4Nr1a2COPx8jtCfsWez$QlMutOhtEIh2ORD4suWuhBYCN7tZ7KOVm8zl54QzrL8=	2026-06-15 11:35:49.940148+00	f	olage@example.com	Олег	Тинькофф	avatars/avatar_542a58f8-6ed3-4111-8fc0-9320343c2340.png	\N			t	f	2026-06-15 11:35:20.039234+00
3	pbkdf2_sha256$1000000$6xzDmKLYeZDWsLG5dVNLMz$CEjc5/vIUgDVpM280gkCwIrHm0YE9Q54Mr/0y9D8C4Y=	2026-06-15 12:01:30.813399+00	f	anna@example.com	Анна	Сидорова	avatars/avatar_fb9bafa5-191f-4fa1-8383-4bbede03bda8.png	\N			t	f	2026-06-15 11:31:35.728006+00
2	pbkdf2_sha256$1000000$QPLOQSQwxdX2tRXrbFr48J$lQigaw1hegg149KTrMzuOH8HvHkwe2obExQPA4mW8Jk=	2026-06-15 12:01:30.955554+00	f	ivan@example.com	Иван	Петров	avatars/avatar_ff9ba16c-2ac9-4e61-a24d-343a18e0b602.png	\N			t	f	2026-06-15 11:31:35.594729+00
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);


--
-- Name: projects_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.projects_project_id_seq', 25, true);


--
-- Name: projects_project_participants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.projects_project_participants_id_seq', 35, true);


--
-- Name: projects_project_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.projects_project_skills_id_seq', 79, true);


--
-- Name: projects_skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.projects_skill_id_seq', 13, true);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_user_id_seq', 9, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: projects_project_participants projects_project_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects_project_participants
    ADD CONSTRAINT projects_project_participants_pkey PRIMARY KEY (id);


--
-- Name: projects_project_participants projects_project_participants_project_id_user_id_64171833_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects_project_participants
    ADD CONSTRAINT projects_project_participants_project_id_user_id_64171833_uniq UNIQUE (project_id, user_id);


--
-- Name: projects_project projects_project_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects_project
    ADD CONSTRAINT projects_project_pkey PRIMARY KEY (id);


--
-- Name: projects_project_skills projects_project_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects_project_skills
    ADD CONSTRAINT projects_project_skills_pkey PRIMARY KEY (id);


--
-- Name: projects_project_skills projects_project_skills_project_id_skill_id_8f3bb086_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects_project_skills
    ADD CONSTRAINT projects_project_skills_project_id_skill_id_8f3bb086_uniq UNIQUE (project_id, skill_id);


--
-- Name: projects_skill projects_skill_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects_skill
    ADD CONSTRAINT projects_skill_name_key UNIQUE (name);


--
-- Name: projects_skill projects_skill_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects_skill
    ADD CONSTRAINT projects_skill_pkey PRIMARY KEY (id);


--
-- Name: users_user users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_phone_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_phone_key UNIQUE (phone);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: projects_project_owner_id_b940de39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX projects_project_owner_id_b940de39 ON public.projects_project USING btree (owner_id);


--
-- Name: projects_project_participants_project_id_977bbd69; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX projects_project_participants_project_id_977bbd69 ON public.projects_project_participants USING btree (project_id);


--
-- Name: projects_project_participants_user_id_5905fe7e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX projects_project_participants_user_id_5905fe7e ON public.projects_project_participants USING btree (user_id);


--
-- Name: projects_project_skills_project_id_f72fc0fe; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX projects_project_skills_project_id_f72fc0fe ON public.projects_project_skills USING btree (project_id);


--
-- Name: projects_project_skills_skill_id_69311f1e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX projects_project_skills_skill_id_69311f1e ON public.projects_project_skills USING btree (skill_id);


--
-- Name: projects_skill_name_e80ac73f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX projects_skill_name_e80ac73f_like ON public.projects_skill USING btree (name varchar_pattern_ops);


--
-- Name: users_user_email_243f6e77_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_phone_fe37f55c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_user_phone_fe37f55c_like ON public.users_user USING btree (phone varchar_pattern_ops);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_project projects_project_owner_id_b940de39_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects_project
    ADD CONSTRAINT projects_project_owner_id_b940de39_fk_users_user_id FOREIGN KEY (owner_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_project_participants projects_project_par_project_id_977bbd69_fk_projects_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects_project_participants
    ADD CONSTRAINT projects_project_par_project_id_977bbd69_fk_projects_ FOREIGN KEY (project_id) REFERENCES public.projects_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_project_participants projects_project_participants_user_id_5905fe7e_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects_project_participants
    ADD CONSTRAINT projects_project_participants_user_id_5905fe7e_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_project_skills projects_project_ski_project_id_f72fc0fe_fk_projects_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects_project_skills
    ADD CONSTRAINT projects_project_ski_project_id_f72fc0fe_fk_projects_ FOREIGN KEY (project_id) REFERENCES public.projects_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_project_skills projects_project_skills_skill_id_69311f1e_fk_projects_skill_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects_project_skills
    ADD CONSTRAINT projects_project_skills_skill_id_69311f1e_fk_projects_skill_id FOREIGN KEY (skill_id) REFERENCES public.projects_skill(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\unrestrict lBhb8XbsDg7mTDLtWnxeiAu7uFZJF08BCh65hOaEM39SCZJXPJTAuSfwtGzkuYB

