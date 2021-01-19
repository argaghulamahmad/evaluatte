--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: core_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_client (
    id integer NOT NULL,
    full_name character varying(254) NOT NULL,
    profile_image character varying(254),
    cv_url character varying(254),
    email character varying(254) NOT NULL,
    phone_number character varying(254) NOT NULL,
    linkedin_profile character varying(254),
    instagram_profile character varying(254),
    title character varying(254) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.core_client OWNER TO postgres;

--
-- Name: core_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_client_id_seq OWNER TO postgres;

--
-- Name: core_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_client_id_seq OWNED BY public.core_client.id;


--
-- Name: core_consultant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_consultant (
    id integer NOT NULL,
    profile_image character varying(254) NOT NULL,
    full_name character varying(254),
    role character varying(254),
    company character varying(254),
    email character varying(254),
    linkedin_profile character varying(254),
    phone_number character varying(254),
    is_active boolean,
    cv_price numeric(100,2),
    experience text,
    note text,
    interview_price numeric(100,2),
    is_cv boolean,
    is_interview boolean,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.core_consultant OWNER TO postgres;

--
-- Name: core_consultant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_consultant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_consultant_id_seq OWNER TO postgres;

--
-- Name: core_consultant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_consultant_id_seq OWNED BY public.core_consultant.id;


--
-- Name: core_meet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_meet (
    id integer NOT NULL,
    type character varying(254),
    datetime timestamp with time zone NOT NULL,
    is_complete boolean NOT NULL,
    meet_url character varying(254),
    testimony text,
    testimony_proof character varying(254),
    show_testimony boolean NOT NULL,
    rating integer NOT NULL,
    show_rating boolean NOT NULL,
    price numeric(100,2),
    note text,
    client_id integer NOT NULL,
    consultant_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    is_paid boolean NOT NULL,
    paid_proof character varying(254)
);


ALTER TABLE public.core_meet OWNER TO postgres;

--
-- Name: core_meet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_meet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_meet_id_seq OWNER TO postgres;

--
-- Name: core_meet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_meet_id_seq OWNED BY public.core_meet.id;


--
-- Name: core_meet_payment; Type: TABLE; Schema: public; Owner: arga
--

CREATE TABLE public.core_meet_payment (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    due_datetime timestamp with time zone NOT NULL,
    method character varying(254),
    price numeric(100,2),
    admin_cost numeric(100,2),
    total numeric(100,2),
    note text,
    meet_id integer NOT NULL
);


ALTER TABLE public.core_meet_payment OWNER TO arga;

--
-- Name: core_meet_payroll; Type: TABLE; Schema: public; Owner: arga
--

CREATE TABLE public.core_meet_payroll (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    price numeric(100,2),
    for_consultant numeric(100,2),
    for_company numeric(100,2),
    is_consultant_paid boolean NOT NULL,
    meet_id integer NOT NULL,
    note text,
    consultant_paid_proof character varying(254),
    consultant_id integer NOT NULL
);


ALTER TABLE public.core_meet_payroll OWNER TO arga;

--
-- Name: core_meet_payroll_id_seq; Type: SEQUENCE; Schema: public; Owner: arga
--

CREATE SEQUENCE public.core_meet_payroll_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_meet_payroll_id_seq OWNER TO arga;

--
-- Name: core_meet_payroll_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arga
--

ALTER SEQUENCE public.core_meet_payroll_id_seq OWNED BY public.core_meet_payroll.id;


--
-- Name: core_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: arga
--

CREATE SEQUENCE public.core_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_payment_id_seq OWNER TO arga;

--
-- Name: core_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arga
--

ALTER SEQUENCE public.core_payment_id_seq OWNED BY public.core_meet_payment.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: office_team_member; Type: TABLE; Schema: public; Owner: arga
--

CREATE TABLE public.office_team_member (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    profile_image character varying(254) NOT NULL,
    full_name character varying(254) NOT NULL,
    "position" character varying(254) NOT NULL,
    is_show boolean,
    linkedin_profile character varying(254),
    instagram_profile character varying(254)
);


ALTER TABLE public.office_team_member OWNER TO arga;

--
-- Name: office_team_member_id_seq; Type: SEQUENCE; Schema: public; Owner: arga
--

CREATE SEQUENCE public.office_team_member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.office_team_member_id_seq OWNER TO arga;

--
-- Name: office_team_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arga
--

ALTER SEQUENCE public.office_team_member_id_seq OWNED BY public.office_team_member.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: core_client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_client ALTER COLUMN id SET DEFAULT nextval('public.core_client_id_seq'::regclass);


--
-- Name: core_consultant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_consultant ALTER COLUMN id SET DEFAULT nextval('public.core_consultant_id_seq'::regclass);


--
-- Name: core_meet id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_meet ALTER COLUMN id SET DEFAULT nextval('public.core_meet_id_seq'::regclass);


--
-- Name: core_meet_payment id; Type: DEFAULT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.core_meet_payment ALTER COLUMN id SET DEFAULT nextval('public.core_payment_id_seq'::regclass);


--
-- Name: core_meet_payroll id; Type: DEFAULT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.core_meet_payroll ALTER COLUMN id SET DEFAULT nextval('public.core_meet_payroll_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: office_team_member id; Type: DEFAULT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.office_team_member ALTER COLUMN id SET DEFAULT nextval('public.office_team_member_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
2	Chief
3	Sales
4	Consultant
5	Client
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	2	44
2	3	44
3	4	44
4	5	44
6	2	28
7	2	32
8	2	36
10	3	28
11	3	32
12	3	36
14	4	28
15	4	32
16	4	36
18	5	28
19	5	32
20	5	36
21	2	41
22	2	42
23	2	43
25	2	25
26	2	26
27	2	27
29	2	29
30	2	30
31	2	31
33	3	41
34	3	42
36	3	25
37	3	26
39	3	29
40	3	30
54	2	33
55	2	34
60	3	43
64	3	27
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
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
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add client	7	add_client
26	Can change client	7	change_client
27	Can delete client	7	delete_client
28	Can view client	7	view_client
29	Can add consultant	8	add_consultant
30	Can change consultant	8	change_consultant
31	Can delete consultant	8	delete_consultant
32	Can view consultant	8	view_consultant
33	Can add team member	9	add_teammember
34	Can change team member	9	change_teammember
35	Can delete team member	9	delete_teammember
36	Can view team member	9	view_teammember
37	Can add interview	10	add_interview
38	Can change interview	10	change_interview
39	Can delete interview	10	delete_interview
40	Can view interview	10	view_interview
41	Can add meet	11	add_meet
42	Can change meet	11	change_meet
43	Can delete meet	11	delete_meet
44	Can view meet	11	view_meet
45	Can add payment	12	add_payment
46	Can change payment	12	change_payment
47	Can delete payment	12	delete_payment
48	Can view payment	12	view_payment
49	Can add meet payroll	13	add_meetpayroll
50	Can change meet payroll	13	change_meetpayroll
51	Can delete meet payroll	13	delete_meetpayroll
52	Can view meet payroll	13	view_meetpayroll
53	Can add meet payment	12	add_meetpayment
54	Can change meet payment	12	change_meetpayment
55	Can delete meet payment	12	delete_meetpayment
56	Can view meet payment	12	view_meetpayment
57	Can add team member	14	add_teammember
58	Can change team member	14	change_teammember
59	Can delete team member	14	delete_teammember
60	Can view team member	14	view_teammember
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$216000$r4bkjC3sY0yT$hUsfVt5qEni8+mPcupCB1LLwPpKWxHH2yGgHBbUy3LE=	2021-01-17 13:22:23+07	f	teguh			teguh@evaluatte.com	t	t	2021-01-16 15:52:01+07
2	pbkdf2_sha256$216000$NYieCPJoPC4y$mfPRi6/o9HsIeWFfO8SmECmf59A2ZtNEhw8Ill2HGvg=	2021-01-19 06:39:01.643138+07	t	arga			arga@evaluatte.com	t	t	2021-01-16 15:53:41.825922+07
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	1	2
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: core_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_client (id, full_name, profile_image, cv_url, email, phone_number, linkedin_profile, instagram_profile, title, created, modified) FROM stdin;
4	Rachel Vonny	https://media-exp1.licdn.com/dms/image/C5603AQFkzRMXwICwVw/profile-displayphoto-shrink_200_200/0/1610555932124?e=1616025600&v=beta&t=eDr4VWC3JkZH1KKHdtyKWBAmg3MjW4Wcr6zjUukvLxU	\N	rachel@gmail.com	0866666666	\N	\N	Fresh Graduate	2021-01-18 14:05:07.883341+07	2021-01-18 14:05:07.890306+07
3	Pandu Aji Wijaya	https://media-exp1.licdn.com/dms/image/C5603AQFkzRMXwICwVw/profile-displayphoto-shrink_200_200/0/1610555932124?e=1616025600&v=beta&t=eDr4VWC3JkZH1KKHdtyKWBAmg3MjW4Wcr6zjUukvLxU	https://media-exp1.licdn.com/dms/image/C5603AQFkzRMXwICwVw/profile-displayphoto-shrink_200_200/0/1610555932124?e=1616025600&v=beta&t=eDr4VWC3JkZH1KKHdtyKWBAmg3MjW4Wcr6zjUukvLxU	pandu@gmail.com	087777777777	\N	\N	Fresh Graduate	2021-01-18 14:05:07.883341+07	2021-01-18 19:47:45.249618+07
\.


--
-- Data for Name: core_consultant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_consultant (id, profile_image, full_name, role, company, email, linkedin_profile, phone_number, is_active, cv_price, experience, note, interview_price, is_cv, is_interview, created, modified) FROM stdin;
1	https://media-exp1.licdn.com/dms/image/C5603AQG0HG4HCiF-aw/profile-displayphoto-shrink_200_200/0/1608091934393?e=1616025600&v=beta&t=Xt0ty1CekbjkE7hqyef4lRmvsT6YYPgmCqiBQh8RFJI	Teguh Priyantono	Talent Sourcer	IDN Media	teguh@evaluatte.com	https://www.linkedin.com/in/teguh-priyantono/	085591202747	t	75000.00	- Memposting lowongan pekerjaan dari IDN Media ke berbagai portal website (Kalibrr, LinkedIn, & TIA)\n- Melakukan Screening dan Shortlisting CV Kandidat baik dengan ATS & Manual (Biasanya, Teguh melakukan Screening CV Kandidat sebanyak 300 – 500 CV dan Menshortlist < 10 CV setiap harinya\n- Melakukan Approaching terhadap “The Best Talent” dari berbagai sumber seperti LinkedIn & Kalibrr\n- Menjadwalkan Interview baik dengan HR maupun User\n- Melakukan Interview tahap awal dengan kandidat\n- Membuat dan Mengupdate result interview		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
4	https://media-exp1.licdn.com/dms/image/C5635AQH782dgk5sg1w/profile-framedphoto-shrink_200_200/0/1608219479646?e=1610881200&v=beta&t=btXG7DM2XWWoxartQ-60Lanhoi8RE4oNWWbGfoGF8Ik	Merina Anindita	Senior Talent Acquisition	IDN Media	merinaanindita@gmail.com	https://www.linkedin.com/in/merina-anindita-2a106b62/	081289219413	t	100000.00	- Bertanggungjawab atas kebutuhan IDN Media Surabaya, Jakarta dan Kepanduan Regional\n- Menentukan kriteria seleksi dengan user\n- Melakukan sourcing potensial kandidat melalui saluran online (misalnya Email, kalibrr, Tech in Asia, Linkedin.)\n- Merencanakan dan melakukan proses perekrutan dan seleksi (wawancara, phone screening, background check, dll.)\n- Merancang poster pekerjaan dan handbook karyawan.\n- Mengembangkan strategi perekrutan dan orientasi\n- Employer branding\n- Melakukan boarding untuk karyawan baru"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
3	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
2	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
6	https://media-exp1.licdn.com/dms/image/C5635AQH782dgk5sg1w/profile-framedphoto-shrink_200_200/0/1608219479646?e=1610881200&v=beta&t=btXG7DM2XWWoxartQ-60Lanhoi8RE4oNWWbGfoGF8Ik	Merina Anindita	Senior Talent Acquisition	IDN Media	merinaanindita@gmail.com	https://www.linkedin.com/in/merina-anindita-2a106b62/	081289219413	t	100000.00	- Bertanggungjawab atas kebutuhan IDN Media Surabaya, Jakarta dan Kepanduan Regional\n- Menentukan kriteria seleksi dengan user\n- Melakukan sourcing potensial kandidat melalui saluran online (misalnya Email, kalibrr, Tech in Asia, Linkedin.)\n- Merencanakan dan melakukan proses perekrutan dan seleksi (wawancara, phone screening, background check, dll.)\n- Merancang poster pekerjaan dan handbook karyawan.\n- Mengembangkan strategi perekrutan dan orientasi\n- Employer branding\n- Melakukan boarding untuk karyawan baru"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
7	https://media-exp1.licdn.com/dms/image/C5635AQH782dgk5sg1w/profile-framedphoto-shrink_200_200/0/1608219479646?e=1610881200&v=beta&t=btXG7DM2XWWoxartQ-60Lanhoi8RE4oNWWbGfoGF8Ik	Merina Anindita	Senior Talent Acquisition	IDN Media	merinaanindita@gmail.com	https://www.linkedin.com/in/merina-anindita-2a106b62/	081289219413	t	100000.00	- Bertanggungjawab atas kebutuhan IDN Media Surabaya, Jakarta dan Kepanduan Regional\n- Menentukan kriteria seleksi dengan user\n- Melakukan sourcing potensial kandidat melalui saluran online (misalnya Email, kalibrr, Tech in Asia, Linkedin.)\n- Merencanakan dan melakukan proses perekrutan dan seleksi (wawancara, phone screening, background check, dll.)\n- Merancang poster pekerjaan dan handbook karyawan.\n- Mengembangkan strategi perekrutan dan orientasi\n- Employer branding\n- Melakukan boarding untuk karyawan baru"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
8	https://media-exp1.licdn.com/dms/image/C5635AQH782dgk5sg1w/profile-framedphoto-shrink_200_200/0/1608219479646?e=1610881200&v=beta&t=btXG7DM2XWWoxartQ-60Lanhoi8RE4oNWWbGfoGF8Ik	Merina Anindita	Senior Talent Acquisition	IDN Media	merinaanindita@gmail.com	https://www.linkedin.com/in/merina-anindita-2a106b62/	081289219413	t	100000.00	- Bertanggungjawab atas kebutuhan IDN Media Surabaya, Jakarta dan Kepanduan Regional\n- Menentukan kriteria seleksi dengan user\n- Melakukan sourcing potensial kandidat melalui saluran online (misalnya Email, kalibrr, Tech in Asia, Linkedin.)\n- Merencanakan dan melakukan proses perekrutan dan seleksi (wawancara, phone screening, background check, dll.)\n- Merancang poster pekerjaan dan handbook karyawan.\n- Mengembangkan strategi perekrutan dan orientasi\n- Employer branding\n- Melakukan boarding untuk karyawan baru"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
10	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
11	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
12	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
13	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
14	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
15	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
16	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
17	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
18	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
19	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
20	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
5	https://media-exp1.licdn.com/dms/image/C5603AQEEB4kj7Hs5aw/profile-displayphoto-shrink_200_200/0/1599613888361?e=1616025600&v=beta&t=szQMH8MRgPeoGWJZhpT2UFZyuP_W1oAs7GU1PoCBSJc	Arga Ghulam Ahmad	Founder	ARGA.	\N	\N	\N	f	\N			\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
9	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	f	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \r\n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \r\n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \r\n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \r\n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
\.


--
-- Data for Name: core_meet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_meet (id, type, datetime, is_complete, meet_url, testimony, testimony_proof, show_testimony, rating, show_rating, price, note, client_id, consultant_id, created, modified, is_paid, paid_proof) FROM stdin;
2	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
3	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
4	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
5	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
6	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
7	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
8	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
9	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
10	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
11	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
12	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
13	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
14	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
15	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
17	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
18	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
19	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
16	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	3	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
20	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	3	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
1	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	1	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
21	INTERVIEW	2021-01-18 14:44:55+07	f	\N		\N	f	3	f	\N		4	1	2021-01-18 14:45:51.455949+07	2021-01-18 14:45:51.455961+07	f	\N
\.


--
-- Data for Name: core_meet_payment; Type: TABLE DATA; Schema: public; Owner: arga
--

COPY public.core_meet_payment (id, created, modified, due_datetime, method, price, admin_cost, total, note, meet_id) FROM stdin;
2	2021-01-19 07:34:00.611617+07	2021-01-19 07:34:00.611631+07	2021-01-19 07:33:56+07	BCA	100000.00	5000.00	105000.00		1
1	2021-01-19 06:43:42.232778+07	2021-01-19 08:05:09.526365+07	2021-01-19 06:43:33+07	BCA	500000.00	50000.00	550000.00	sudah dibayar menggunakan mobile banking bca	1
\.


--
-- Data for Name: core_meet_payroll; Type: TABLE DATA; Schema: public; Owner: arga
--

COPY public.core_meet_payroll (id, created, modified, price, for_consultant, for_company, is_consultant_paid, meet_id, note, consultant_paid_proof, consultant_id) FROM stdin;
2	2021-01-19 07:57:14.129437+07	2021-01-19 07:57:25.461023+07	100000.00	60000.00	40000.00	f	1		\N	1
3	2021-01-19 07:57:33.614092+07	2021-01-19 07:57:33.614102+07	100000.00	60000.00	40000.00	f	6		\N	1
1	2021-01-19 07:39:35.925542+07	2021-01-19 08:04:31.392206+07	200000.00	120000.00	80000.00	t	1		https://stackoverflow.com/questions/11754877/troubleshooting-related-field-has-invalid-lookup-icontains	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-01-17 08:13:52.584591+07	1	Teguh Priyantono | CEO	2	[{"changed": {"fields": ["Is show"]}}]	9	2
2	2021-01-17 08:14:00.273001+07	2	Arga Ghulam Ahmad | CTO	2	[]	9	2
3	2021-01-17 08:14:06.458896+07	3	Hansel Muhammad Falah | CFO	2	[{"changed": {"fields": ["Is show"]}}]	9	2
4	2021-01-17 08:14:22.884369+07	4	Nethania Dinari Ramadhani | CMO	2	[{"changed": {"fields": ["Is show"]}}]	9	2
5	2021-01-17 08:14:31.30274+07	5	Kharissa Amelia | Graphic Designer	2	[{"changed": {"fields": ["Is show"]}}]	9	2
6	2021-01-17 08:14:38.083307+07	6	Hanifa Shafira | Graphic Designer	2	[{"changed": {"fields": ["Is show"]}}]	9	2
7	2021-01-17 08:14:46.799231+07	7	Tiar Adhi Bagaskara | Creative	2	[{"changed": {"fields": ["Is show"]}}]	9	2
8	2021-01-17 08:14:55.064768+07	8	Syahla Yulfiantie Hartono | Sales Executive	2	[{"changed": {"fields": ["Is show"]}}]	9	2
9	2021-01-17 08:15:30.230387+07	9	Merry Ayu Gultom | Sales Executive	2	[{"changed": {"fields": ["Is show"]}}]	9	2
10	2021-01-17 08:15:37.436863+07	10	Khoirunnisa Mazaya | Social Media Strategist	2	[{"changed": {"fields": ["Is show"]}}]	9	2
11	2021-01-17 08:15:43.343229+07	11	Pandu Aji Wijaya | Social Media Strategist	2	[{"changed": {"fields": ["Is show"]}}]	9	2
12	2021-01-17 11:39:00.568537+07	2	Arga Ghulam Ahmad | CTO	2	[{"changed": {"fields": ["Is show"]}}]	9	2
13	2021-01-17 11:45:54.750187+07	2	Arga Ghulam Ahmad - Founder at ARGA.	1	[{"added": {}}]	8	2
14	2021-01-17 11:57:29.406075+07	2	Arga Ghulam Ahmad - Founder at ARGA.	3		8	2
15	2021-01-17 11:58:01.783537+07	5	Arga Ghulam Ahmad - Founder at ARGA.	1	[{"added": {}}]	8	2
16	2021-01-17 12:22:43.644819+07	5	Arga Ghulam Ahmad - Founder at ARGA.	2	[{"changed": {"fields": ["Is active"]}}]	8	2
17	2021-01-17 13:16:43.624981+07	2	Arga Ghulam Ahmad | CTO	2	[{"changed": {"fields": ["Is show"]}}]	9	2
18	2021-01-17 13:16:58.990988+07	9	Shofia Anugraha Hajaraswati - Former People Acquisition at Gojek Indonesia	2	[{"changed": {"fields": ["Is active", "Experience"]}}]	8	2
19	2021-01-17 13:17:26.51512+07	20	Merina Anindita - Rachel Vonny - 01/17/2021, 18:00:00	2	[{"changed": {"fields": ["Show testimony"]}}]	10	2
20	2021-01-17 13:38:30.627397+07	19	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 18:00:00	2	[{"changed": {"fields": ["Testimony proof"]}}]	10	1
21	2021-01-17 14:13:12.857767+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45	1	[{"added": {}}]	11	1
22	2021-01-17 14:48:29.193578+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45	2	[{"changed": {"fields": ["Testimony proof", "Rating"]}}]	11	2
23	2021-01-17 15:05:07.776108+07	16	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45	2	[{"changed": {"fields": ["Rating"]}}]	11	2
24	2021-01-17 15:05:12.782028+07	20	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45	2	[{"changed": {"fields": ["Rating"]}}]	11	2
25	2021-01-17 15:05:26.762203+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45	2	[{"changed": {"fields": ["Rating"]}}]	11	2
26	2021-01-17 15:05:38.500493+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45	2	[{"changed": {"fields": ["Rating"]}}]	11	2
27	2021-01-18 14:45:51.458981+07	21	Teguh Priyantono - Rachel Vonny - 01/18/2021, 14:44:55	1	[{"added": {}}]	11	2
28	2021-01-18 14:55:16.025061+07	1	Consultant	1	[{"added": {}}]	3	2
29	2021-01-18 14:55:21.807267+07	1	Consultant	3		3	2
30	2021-01-18 15:05:18.353206+07	1	teguh	2	[{"changed": {"fields": ["Superuser status", "Groups"]}}]	4	2
31	2021-01-18 15:05:25.310548+07	1	teguh	2	[]	4	2
32	2021-01-18 19:47:45.270804+07	3	Pandu Aji Wijaya - Fresh Graduate	2	[{"changed": {"fields": ["Cv url"]}}]	7	2
33	2021-01-19 06:43:42.270869+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 01/19/2021, 06:43:33 - 111	1	[{"added": {}}]	12	2
34	2021-01-19 07:34:00.64596+07	2	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 01/19/2021, 07:33:56 - 105000	1	[{"added": {}}]	12	2
35	2021-01-19 07:39:35.951863+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 7272727.2 - 4848484.8 - True	1	[{"added": {}}]	13	2
36	2021-01-19 07:39:59.243263+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 120000.0 - 80000.0 - True	2	[{"changed": {"fields": ["Price"]}}]	13	2
37	2021-01-19 07:42:38.643421+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 120000.0 - 80000.0 - True	2	[]	13	2
38	2021-01-19 07:49:06.263651+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 120000.0 - 80000.0 - True	2	[]	13	2
39	2021-01-19 07:57:14.151642+07	2	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 60000.0 - 40000.0 - False	1	[{"added": {}}]	13	2
40	2021-01-19 07:57:25.496993+07	2	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 60000.0 - 40000.0 - False	2	[]	13	2
41	2021-01-19 07:57:33.632174+07	3	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 60000.0 - 40000.0 - False	1	[{"added": {}}]	13	2
42	2021-01-19 08:03:52.94673+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 120000.0 - 80000.0 - False	2	[]	13	2
43	2021-01-19 08:04:02.479714+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 120000.0 - 80000.0 - True	2	[{"changed": {"fields": ["Consultant paid proof"]}}]	13	2
44	2021-01-19 08:04:09.894881+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 120000.0 - 80000.0 - False	2	[{"changed": {"fields": ["Consultant paid proof"]}}]	13	2
45	2021-01-19 08:04:31.415609+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 120000.0 - 80000.0 - True	2	[{"changed": {"fields": ["Consultant paid proof"]}}]	13	2
46	2021-01-19 08:05:09.565436+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 01/19/2021, 06:43:33 - 550000	2	[{"changed": {"fields": ["Price", "Admin cost", "Note"]}}]	12	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	core	client
8	core	consultant
9	core	teammember
10	core	interview
11	core	meet
13	core	meetpayroll
12	core	meetpayment
14	office	teammember
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-01-16 19:58:05.596855+07
2	auth	0001_initial	2021-01-16 19:58:05.714928+07
3	admin	0001_initial	2021-01-16 19:58:05.861888+07
4	admin	0002_logentry_remove_auto_add	2021-01-16 19:58:05.903452+07
5	admin	0003_logentry_add_action_flag_choices	2021-01-16 19:58:05.928498+07
6	contenttypes	0002_remove_content_type_name	2021-01-16 19:58:05.971281+07
7	auth	0002_alter_permission_name_max_length	2021-01-16 19:58:06.001273+07
8	auth	0003_alter_user_email_max_length	2021-01-16 19:58:06.03884+07
9	auth	0004_alter_user_username_opts	2021-01-16 19:58:06.065498+07
10	auth	0005_alter_user_last_login_null	2021-01-16 19:58:06.092478+07
11	auth	0006_require_contenttypes_0002	2021-01-16 19:58:06.102672+07
12	auth	0007_alter_validators_add_error_messages	2021-01-16 19:58:06.120042+07
13	auth	0008_alter_user_username_max_length	2021-01-16 19:58:06.146955+07
14	auth	0009_alter_user_last_name_max_length	2021-01-16 19:58:06.167803+07
15	auth	0010_alter_group_name_max_length	2021-01-16 19:58:06.193214+07
16	auth	0011_update_proxy_permissions	2021-01-16 19:58:06.214097+07
17	auth	0012_alter_user_first_name_max_length	2021-01-16 19:58:06.235026+07
18	core	0001_initial	2021-01-16 19:58:06.300953+07
19	sessions	0001_initial	2021-01-16 19:58:06.34262+07
20	core	0002_auto_20210117_0020	2021-01-17 07:22:28.371532+07
21	core	0003_remove_teammember_order	2021-01-17 08:16:55.370523+07
22	core	0004_auto_20210117_0227	2021-01-17 09:31:35.280528+07
23	core	0005_interview_is_complete	2021-01-17 10:15:52.913706+07
24	core	0006_auto_20210117_0234	2021-01-17 10:15:52.938572+07
25	core	0007_interview_show_testimony	2021-01-17 10:15:52.957251+07
26	core	0008_auto_20210117_0308	2021-01-17 10:15:53.025225+07
27	core	0009_interview_testimony_proof	2021-01-17 10:51:44.442849+07
28	core	0010_auto_20210117_0452	2021-01-17 11:57:08.653606+07
29	core	0011_auto_20210117_0643	2021-01-17 14:04:32.367626+07
30	core	0012_auto_20210117_0720	2021-01-17 15:00:26.245603+07
31	core	0013_auto_20210118_0703	2021-01-18 14:05:07.954854+07
32	core	0014_auto_20210118_1920	2021-01-18 19:20:55.170057+07
33	core	0015_auto_20210118_1946	2021-01-18 19:46:43.646977+07
34	core	0016_payment	2021-01-19 06:27:15.147749+07
35	core	0017_auto_20210119_0636	2021-01-19 06:37:07.179657+07
36	core	0018_auto_20210119_0637	2021-01-19 06:37:43.436467+07
37	core	0019_auto_20210119_0728	2021-01-19 07:28:54.904818+07
38	core	0020_meetpayroll_note	2021-01-19 07:39:33.987609+07
39	core	0021_meetpayroll_consultant_paid_proof	2021-01-19 07:42:02.481657+07
40	core	0022_auto_20210119_0748	2021-01-19 07:48:43.476923+07
41	core	0023_auto_20210119_0759	2021-01-19 07:59:21.181683+07
42	core	0024_delete_teammember	2021-01-19 08:16:48.072313+07
43	office	0001_initial	2021-01-19 08:16:48.084764+07
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
nxfqmr19kdfrt73uflzes82wj6h3z60n	.eJxVjMsOwiAQRf-FtSHlMQFcuvcbyDAMUjWQlHZl_Hdt0oVu7znnvkTEba1xG7zEOYuz0OL0uyWkB7cd5Du2W5fU27rMSe6KPOiQ1575eTncv4OKo35rAPKaNCuFiB5twgA6IJoQjHfagSqFCtsJDAdInMhxyYXA4mQLOPH-APEPOJk:1l0vsZ:u2S9R3oMF39n2VkPur11rUBt2-ISxxgOxEbQYvSDjG4	2021-01-31 07:25:15.556766+07
ad2totvx8tkqcuzqpgklioc2z8bzef55	.eJxVjEsOwiAUAO_C2pA-_rh03zMQeLxK1dCktCvj3S1JF7qdmcybhbhvJeyN1jBndmXALr8sRXxS7SI_Yr0vHJe6rXPiPeGnbXxcMr1uZ_s3KLGVvhXaKGGRnHNgpwlJgvQiuwGT9NYcXAovnFZeW5F8MgiKAJTNejgc-3wBslw2Rg:1l11SB:Jyv76F7N22moKyEBEdeiLHDTz2QTiIgEIOJcxshrL_I	2021-01-31 13:22:23.566741+07
shjz7qx86fxvk2tdass0te73d3dvmvv3	.eJxVjMsOwiAQRf-FtSHlMQFcuvcbyDAMUjWQlHZl_Hdt0oVu7znnvkTEba1xG7zEOYuz0OL0uyWkB7cd5Du2W5fU27rMSe6KPOiQ1575eTncv4OKo35rAPKaNCuFiB5twgA6IJoQjHfagSqFCtsJDAdInMhxyYXA4mQLOPH-APEPOJk:1l133R:eBbeDpu6uQXdcnRY-bie3I-rFFtrY4gaj3et9Mo9Ncs	2021-01-31 15:04:57.381692+07
d951jo63tidnz3r1bhkskisk2jgectvv	.eJxVjMsOwiAQRf-FtSHlMQFcuvcbyDAMUjWQlHZl_Hdt0oVu7znnvkTEba1xG7zEOYuz0OL0uyWkB7cd5Du2W5fU27rMSe6KPOiQ1575eTncv4OKo35rAPKaNCuFiB5twgA6IJoQjHfagSqFCtsJDAdInMhxyYXA4mQLOPH-APEPOJk:1l1Tw8:ZFuwdtdAYt7nrQOanDEIMajDBGXwIXcAYAiWCQxpr8U	2021-02-01 19:47:12.560088+07
hd8ctc2jr111esx25bvylnzkk9yqsk3t	.eJxVjMsOwiAQRf-FtSHlMQFcuvcbyDAMUjWQlHZl_Hdt0oVu7znnvkTEba1xG7zEOYuz0OL0uyWkB7cd5Du2W5fU27rMSe6KPOiQ1575eTncv4OKo35rAPKaNCuFiB5twgA6IJoQjHfagSqFCtsJDAdInMhxyYXA4mQLOPH-APEPOJk:1l1e6v:mBmavW_6n19TAvAHbycqEXzjQb53O3ifM-uhTZKibCk	2021-02-02 06:39:01.764935+07
\.


--
-- Data for Name: office_team_member; Type: TABLE DATA; Schema: public; Owner: arga
--

COPY public.office_team_member (id, created, modified, profile_image, full_name, "position", is_show, linkedin_profile, instagram_profile) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 5, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 149, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: core_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_client_id_seq', 1, false);


--
-- Name: core_consultant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_consultant_id_seq', 5, true);


--
-- Name: core_meet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_meet_id_seq', 21, true);


--
-- Name: core_meet_payroll_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arga
--

SELECT pg_catalog.setval('public.core_meet_payroll_id_seq', 3, true);


--
-- Name: core_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arga
--

SELECT pg_catalog.setval('public.core_payment_id_seq', 2, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 46, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 43, true);


--
-- Name: office_team_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arga
--

SELECT pg_catalog.setval('public.office_team_member_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: core_client core_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_client
    ADD CONSTRAINT core_client_pkey PRIMARY KEY (id);


--
-- Name: core_consultant core_consultant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_consultant
    ADD CONSTRAINT core_consultant_pkey PRIMARY KEY (id);


--
-- Name: core_meet_payroll core_meet_payroll_pkey; Type: CONSTRAINT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.core_meet_payroll
    ADD CONSTRAINT core_meet_payroll_pkey PRIMARY KEY (id);


--
-- Name: core_meet core_meet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_meet
    ADD CONSTRAINT core_meet_pkey PRIMARY KEY (id);


--
-- Name: core_meet_payment core_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.core_meet_payment
    ADD CONSTRAINT core_payment_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: office_team_member office_team_member_pkey; Type: CONSTRAINT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.office_team_member
    ADD CONSTRAINT office_team_member_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: core_meet_client_id_db84d09c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_meet_client_id_db84d09c ON public.core_meet USING btree (client_id);


--
-- Name: core_meet_consultant_id_a79184ec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_meet_consultant_id_a79184ec ON public.core_meet USING btree (consultant_id);


--
-- Name: core_meet_payroll_consultant_id_c02886a5; Type: INDEX; Schema: public; Owner: arga
--

CREATE INDEX core_meet_payroll_consultant_id_c02886a5 ON public.core_meet_payroll USING btree (consultant_id);


--
-- Name: core_meet_payroll_payment_id_53fe520e; Type: INDEX; Schema: public; Owner: arga
--

CREATE INDEX core_meet_payroll_payment_id_53fe520e ON public.core_meet_payroll USING btree (meet_id);


--
-- Name: core_payment_meet_id_9b415297; Type: INDEX; Schema: public; Owner: arga
--

CREATE INDEX core_payment_meet_id_9b415297 ON public.core_meet_payment USING btree (meet_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_meet core_meet_client_id_db84d09c_fk_core_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_meet
    ADD CONSTRAINT core_meet_client_id_db84d09c_fk_core_client_id FOREIGN KEY (client_id) REFERENCES public.core_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_meet core_meet_consultant_id_a79184ec_fk_core_consultant_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_meet
    ADD CONSTRAINT core_meet_consultant_id_a79184ec_fk_core_consultant_id FOREIGN KEY (consultant_id) REFERENCES public.core_consultant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_meet_payroll core_meet_payroll_consultant_id_c02886a5_fk_core_consultant_id; Type: FK CONSTRAINT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.core_meet_payroll
    ADD CONSTRAINT core_meet_payroll_consultant_id_c02886a5_fk_core_consultant_id FOREIGN KEY (consultant_id) REFERENCES public.core_consultant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_meet_payroll core_meet_payroll_meet_id_a5998a68_fk_core_meet_id; Type: FK CONSTRAINT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.core_meet_payroll
    ADD CONSTRAINT core_meet_payroll_meet_id_a5998a68_fk_core_meet_id FOREIGN KEY (meet_id) REFERENCES public.core_meet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_meet_payment core_payment_meet_id_9b415297_fk_core_meet_id; Type: FK CONSTRAINT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.core_meet_payment
    ADD CONSTRAINT core_payment_meet_id_9b415297_fk_core_meet_id FOREIGN KEY (meet_id) REFERENCES public.core_meet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: core_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_client (
    id integer NOT NULL,
    full_name character varying(254) NOT NULL,
    profile_image character varying(254),
    cv_url character varying(254),
    email character varying(254) NOT NULL,
    phone_number character varying(254) NOT NULL,
    linkedin_profile character varying(254),
    instagram_profile character varying(254),
    title character varying(254) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.core_client OWNER TO postgres;

--
-- Name: core_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_client_id_seq OWNER TO postgres;

--
-- Name: core_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_client_id_seq OWNED BY public.core_client.id;


--
-- Name: core_consultant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_consultant (
    id integer NOT NULL,
    profile_image character varying(254) NOT NULL,
    full_name character varying(254),
    role character varying(254),
    company character varying(254),
    email character varying(254),
    linkedin_profile character varying(254),
    phone_number character varying(254),
    is_active boolean,
    cv_price numeric(100,2),
    experience text,
    note text,
    interview_price numeric(100,2),
    is_cv boolean,
    is_interview boolean,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.core_consultant OWNER TO postgres;

--
-- Name: core_consultant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_consultant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_consultant_id_seq OWNER TO postgres;

--
-- Name: core_consultant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_consultant_id_seq OWNED BY public.core_consultant.id;


--
-- Name: core_meet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_meet (
    id integer NOT NULL,
    type character varying(254) NOT NULL,
    datetime timestamp with time zone NOT NULL,
    is_complete boolean NOT NULL,
    meet_url character varying(254),
    testimony text,
    testimony_proof character varying(254),
    show_testimony boolean NOT NULL,
    rating integer NOT NULL,
    show_rating boolean NOT NULL,
    price numeric(100,2),
    note text,
    client_id integer NOT NULL,
    consultant_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    is_paid boolean NOT NULL,
    paid_proof character varying(254)
);


ALTER TABLE public.core_meet OWNER TO postgres;

--
-- Name: core_meet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_meet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_meet_id_seq OWNER TO postgres;

--
-- Name: core_meet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_meet_id_seq OWNED BY public.core_meet.id;


--
-- Name: core_meet_payment; Type: TABLE; Schema: public; Owner: arga
--

CREATE TABLE public.core_meet_payment (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    due_datetime timestamp with time zone NOT NULL,
    method character varying(254),
    price numeric(100,2),
    admin_cost numeric(100,2),
    total numeric(100,2),
    note text,
    meet_id integer NOT NULL
);


ALTER TABLE public.core_meet_payment OWNER TO arga;

--
-- Name: core_meet_payroll; Type: TABLE; Schema: public; Owner: arga
--

CREATE TABLE public.core_meet_payroll (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    price numeric(100,2),
    for_consultant numeric(100,2),
    for_company numeric(100,2),
    is_consultant_paid boolean NOT NULL,
    meet_id integer NOT NULL,
    note text,
    consultant_paid_proof character varying(254),
    consultant_id integer NOT NULL
);


ALTER TABLE public.core_meet_payroll OWNER TO arga;

--
-- Name: core_meet_payroll_id_seq; Type: SEQUENCE; Schema: public; Owner: arga
--

CREATE SEQUENCE public.core_meet_payroll_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_meet_payroll_id_seq OWNER TO arga;

--
-- Name: core_meet_payroll_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arga
--

ALTER SEQUENCE public.core_meet_payroll_id_seq OWNED BY public.core_meet_payroll.id;


--
-- Name: core_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: arga
--

CREATE SEQUENCE public.core_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_payment_id_seq OWNER TO arga;

--
-- Name: core_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arga
--

ALTER SEQUENCE public.core_payment_id_seq OWNED BY public.core_meet_payment.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: office_employee; Type: TABLE; Schema: public; Owner: arga
--

CREATE TABLE public.office_employee (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    profile_image character varying(254) NOT NULL,
    full_name character varying(254) NOT NULL,
    "position" character varying(254) NOT NULL,
    type character varying(254) NOT NULL,
    linkedin_profile character varying(254),
    instagram_profile character varying(254),
    is_show boolean,
    salary numeric(100,2)
);


ALTER TABLE public.office_employee OWNER TO arga;

--
-- Name: office_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: arga
--

CREATE SEQUENCE public.office_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.office_employee_id_seq OWNER TO arga;

--
-- Name: office_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arga
--

ALTER SEQUENCE public.office_employee_id_seq OWNED BY public.office_employee.id;


--
-- Name: office_employee_payroll; Type: TABLE; Schema: public; Owner: arga
--

CREATE TABLE public.office_employee_payroll (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    total numeric(100,2),
    employee_paid_proof character varying(254),
    is_employee_paid boolean NOT NULL,
    note text,
    employee_id integer NOT NULL,
    date date NOT NULL
);


ALTER TABLE public.office_employee_payroll OWNER TO arga;

--
-- Name: office_employee_payroll_id_seq; Type: SEQUENCE; Schema: public; Owner: arga
--

CREATE SEQUENCE public.office_employee_payroll_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.office_employee_payroll_id_seq OWNER TO arga;

--
-- Name: office_employee_payroll_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arga
--

ALTER SEQUENCE public.office_employee_payroll_id_seq OWNED BY public.office_employee_payroll.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: core_client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_client ALTER COLUMN id SET DEFAULT nextval('public.core_client_id_seq'::regclass);


--
-- Name: core_consultant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_consultant ALTER COLUMN id SET DEFAULT nextval('public.core_consultant_id_seq'::regclass);


--
-- Name: core_meet id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_meet ALTER COLUMN id SET DEFAULT nextval('public.core_meet_id_seq'::regclass);


--
-- Name: core_meet_payment id; Type: DEFAULT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.core_meet_payment ALTER COLUMN id SET DEFAULT nextval('public.core_payment_id_seq'::regclass);


--
-- Name: core_meet_payroll id; Type: DEFAULT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.core_meet_payroll ALTER COLUMN id SET DEFAULT nextval('public.core_meet_payroll_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: office_employee id; Type: DEFAULT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.office_employee ALTER COLUMN id SET DEFAULT nextval('public.office_employee_id_seq'::regclass);


--
-- Name: office_employee_payroll id; Type: DEFAULT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.office_employee_payroll ALTER COLUMN id SET DEFAULT nextval('public.office_employee_payroll_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
2	Chief
3	Sales
4	Consultant
5	Client
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	2	44
2	3	44
3	4	44
4	5	44
6	2	28
7	2	32
8	2	36
10	3	28
11	3	32
12	3	36
14	4	28
15	4	32
16	4	36
18	5	28
19	5	32
20	5	36
21	2	41
22	2	42
23	2	43
25	2	25
26	2	26
27	2	27
29	2	29
30	2	30
31	2	31
33	3	41
34	3	42
36	3	25
37	3	26
39	3	29
40	3	30
54	2	33
55	2	34
60	3	43
64	3	27
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
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
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add client	7	add_client
26	Can change client	7	change_client
27	Can delete client	7	delete_client
28	Can view client	7	view_client
29	Can add consultant	8	add_consultant
30	Can change consultant	8	change_consultant
31	Can delete consultant	8	delete_consultant
32	Can view consultant	8	view_consultant
33	Can add team member	9	add_teammember
34	Can change team member	9	change_teammember
35	Can delete team member	9	delete_teammember
36	Can view team member	9	view_teammember
37	Can add interview	10	add_interview
38	Can change interview	10	change_interview
39	Can delete interview	10	delete_interview
40	Can view interview	10	view_interview
41	Can add meet	11	add_meet
42	Can change meet	11	change_meet
43	Can delete meet	11	delete_meet
44	Can view meet	11	view_meet
45	Can add payment	12	add_payment
46	Can change payment	12	change_payment
47	Can delete payment	12	delete_payment
48	Can view payment	12	view_payment
49	Can add meet payroll	13	add_meetpayroll
50	Can change meet payroll	13	change_meetpayroll
51	Can delete meet payroll	13	delete_meetpayroll
52	Can view meet payroll	13	view_meetpayroll
53	Can add meet payment	12	add_meetpayment
54	Can change meet payment	12	change_meetpayment
55	Can delete meet payment	12	delete_meetpayment
56	Can view meet payment	12	view_meetpayment
57	Can add team member	14	add_teammember
58	Can change team member	14	change_teammember
59	Can delete team member	14	delete_teammember
60	Can view team member	14	view_teammember
61	Can add employee	15	add_employee
62	Can change employee	15	change_employee
63	Can delete employee	15	delete_employee
64	Can view employee	15	view_employee
65	Can add employee payroll	16	add_employeepayroll
66	Can change employee payroll	16	change_employeepayroll
67	Can delete employee payroll	16	delete_employeepayroll
68	Can view employee payroll	16	view_employeepayroll
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$216000$r4bkjC3sY0yT$hUsfVt5qEni8+mPcupCB1LLwPpKWxHH2yGgHBbUy3LE=	2021-01-17 13:22:23+07	f	teguh			teguh@evaluatte.com	t	t	2021-01-16 15:52:01+07
2	pbkdf2_sha256$216000$NYieCPJoPC4y$mfPRi6/o9HsIeWFfO8SmECmf59A2ZtNEhw8Ill2HGvg=	2021-01-19 06:39:01.643138+07	t	arga			arga@evaluatte.com	t	t	2021-01-16 15:53:41.825922+07
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	1	2
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: core_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_client (id, full_name, profile_image, cv_url, email, phone_number, linkedin_profile, instagram_profile, title, created, modified) FROM stdin;
4	Rachel Vonny	https://media-exp1.licdn.com/dms/image/C5603AQFkzRMXwICwVw/profile-displayphoto-shrink_200_200/0/1610555932124?e=1616025600&v=beta&t=eDr4VWC3JkZH1KKHdtyKWBAmg3MjW4Wcr6zjUukvLxU	\N	rachel@gmail.com	0866666666	\N	\N	Fresh Graduate	2021-01-18 14:05:07.883341+07	2021-01-18 14:05:07.890306+07
3	Pandu Aji Wijaya	https://media-exp1.licdn.com/dms/image/C5603AQFkzRMXwICwVw/profile-displayphoto-shrink_200_200/0/1610555932124?e=1616025600&v=beta&t=eDr4VWC3JkZH1KKHdtyKWBAmg3MjW4Wcr6zjUukvLxU	https://media-exp1.licdn.com/dms/image/C5603AQFkzRMXwICwVw/profile-displayphoto-shrink_200_200/0/1610555932124?e=1616025600&v=beta&t=eDr4VWC3JkZH1KKHdtyKWBAmg3MjW4Wcr6zjUukvLxU	pandu@gmail.com	087777777777	\N	\N	Fresh Graduate	2021-01-18 14:05:07.883341+07	2021-01-18 19:47:45.249618+07
\.


--
-- Data for Name: core_consultant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_consultant (id, profile_image, full_name, role, company, email, linkedin_profile, phone_number, is_active, cv_price, experience, note, interview_price, is_cv, is_interview, created, modified) FROM stdin;
1	https://media-exp1.licdn.com/dms/image/C5603AQG0HG4HCiF-aw/profile-displayphoto-shrink_200_200/0/1608091934393?e=1616025600&v=beta&t=Xt0ty1CekbjkE7hqyef4lRmvsT6YYPgmCqiBQh8RFJI	Teguh Priyantono	Talent Sourcer	IDN Media	teguh@evaluatte.com	https://www.linkedin.com/in/teguh-priyantono/	085591202747	t	75000.00	- Memposting lowongan pekerjaan dari IDN Media ke berbagai portal website (Kalibrr, LinkedIn, & TIA)\n- Melakukan Screening dan Shortlisting CV Kandidat baik dengan ATS & Manual (Biasanya, Teguh melakukan Screening CV Kandidat sebanyak 300 – 500 CV dan Menshortlist < 10 CV setiap harinya\n- Melakukan Approaching terhadap “The Best Talent” dari berbagai sumber seperti LinkedIn & Kalibrr\n- Menjadwalkan Interview baik dengan HR maupun User\n- Melakukan Interview tahap awal dengan kandidat\n- Membuat dan Mengupdate result interview		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
4	https://media-exp1.licdn.com/dms/image/C5635AQH782dgk5sg1w/profile-framedphoto-shrink_200_200/0/1608219479646?e=1610881200&v=beta&t=btXG7DM2XWWoxartQ-60Lanhoi8RE4oNWWbGfoGF8Ik	Merina Anindita	Senior Talent Acquisition	IDN Media	merinaanindita@gmail.com	https://www.linkedin.com/in/merina-anindita-2a106b62/	081289219413	t	100000.00	- Bertanggungjawab atas kebutuhan IDN Media Surabaya, Jakarta dan Kepanduan Regional\n- Menentukan kriteria seleksi dengan user\n- Melakukan sourcing potensial kandidat melalui saluran online (misalnya Email, kalibrr, Tech in Asia, Linkedin.)\n- Merencanakan dan melakukan proses perekrutan dan seleksi (wawancara, phone screening, background check, dll.)\n- Merancang poster pekerjaan dan handbook karyawan.\n- Mengembangkan strategi perekrutan dan orientasi\n- Employer branding\n- Melakukan boarding untuk karyawan baru"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
3	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
2	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
6	https://media-exp1.licdn.com/dms/image/C5635AQH782dgk5sg1w/profile-framedphoto-shrink_200_200/0/1608219479646?e=1610881200&v=beta&t=btXG7DM2XWWoxartQ-60Lanhoi8RE4oNWWbGfoGF8Ik	Merina Anindita	Senior Talent Acquisition	IDN Media	merinaanindita@gmail.com	https://www.linkedin.com/in/merina-anindita-2a106b62/	081289219413	t	100000.00	- Bertanggungjawab atas kebutuhan IDN Media Surabaya, Jakarta dan Kepanduan Regional\n- Menentukan kriteria seleksi dengan user\n- Melakukan sourcing potensial kandidat melalui saluran online (misalnya Email, kalibrr, Tech in Asia, Linkedin.)\n- Merencanakan dan melakukan proses perekrutan dan seleksi (wawancara, phone screening, background check, dll.)\n- Merancang poster pekerjaan dan handbook karyawan.\n- Mengembangkan strategi perekrutan dan orientasi\n- Employer branding\n- Melakukan boarding untuk karyawan baru"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
7	https://media-exp1.licdn.com/dms/image/C5635AQH782dgk5sg1w/profile-framedphoto-shrink_200_200/0/1608219479646?e=1610881200&v=beta&t=btXG7DM2XWWoxartQ-60Lanhoi8RE4oNWWbGfoGF8Ik	Merina Anindita	Senior Talent Acquisition	IDN Media	merinaanindita@gmail.com	https://www.linkedin.com/in/merina-anindita-2a106b62/	081289219413	t	100000.00	- Bertanggungjawab atas kebutuhan IDN Media Surabaya, Jakarta dan Kepanduan Regional\n- Menentukan kriteria seleksi dengan user\n- Melakukan sourcing potensial kandidat melalui saluran online (misalnya Email, kalibrr, Tech in Asia, Linkedin.)\n- Merencanakan dan melakukan proses perekrutan dan seleksi (wawancara, phone screening, background check, dll.)\n- Merancang poster pekerjaan dan handbook karyawan.\n- Mengembangkan strategi perekrutan dan orientasi\n- Employer branding\n- Melakukan boarding untuk karyawan baru"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
8	https://media-exp1.licdn.com/dms/image/C5635AQH782dgk5sg1w/profile-framedphoto-shrink_200_200/0/1608219479646?e=1610881200&v=beta&t=btXG7DM2XWWoxartQ-60Lanhoi8RE4oNWWbGfoGF8Ik	Merina Anindita	Senior Talent Acquisition	IDN Media	merinaanindita@gmail.com	https://www.linkedin.com/in/merina-anindita-2a106b62/	081289219413	t	100000.00	- Bertanggungjawab atas kebutuhan IDN Media Surabaya, Jakarta dan Kepanduan Regional\n- Menentukan kriteria seleksi dengan user\n- Melakukan sourcing potensial kandidat melalui saluran online (misalnya Email, kalibrr, Tech in Asia, Linkedin.)\n- Merencanakan dan melakukan proses perekrutan dan seleksi (wawancara, phone screening, background check, dll.)\n- Merancang poster pekerjaan dan handbook karyawan.\n- Mengembangkan strategi perekrutan dan orientasi\n- Employer branding\n- Melakukan boarding untuk karyawan baru"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
10	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
11	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
12	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
13	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
14	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
15	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
16	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
17	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
18	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
19	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
20	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	t	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
5	https://media-exp1.licdn.com/dms/image/C5603AQEEB4kj7Hs5aw/profile-displayphoto-shrink_200_200/0/1599613888361?e=1616025600&v=beta&t=szQMH8MRgPeoGWJZhpT2UFZyuP_W1oAs7GU1PoCBSJc	Arga Ghulam Ahmad	Founder	ARGA.	\N	\N	\N	f	\N			\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
9	https://media-exp1.licdn.com/dms/image/C5635AQGaIlhmysFHYg/profile-framedphoto-shrink_200_200/0/1610548041338?e=1610881200&v=beta&t=4KMbUHVyyLj3j7lR6z-sn0RbC7GNQTk5-cQr9HSVIr8	Shofia Anugraha Hajaraswati	Former People Acquisition	Gojek Indonesia	shofia.anugraha@gmail.com	https://www.linkedin.com/in/shofia21/	081380186421	f	100000.00	- Mendapatkan dan merekrut kandidat dengan menggunakan ATS (Kalibrr, Glassdoor, Jobstreet, Linkedin) dan offline (Refferal, Internal) \r\n- Melakukan wawancara telepon dan wawancara tatap muka (dari Pejabat hingga Manajer Senior / Kepala Divisi). \r\n- Membuat dan Memperbarui hasil wawancara, iklan pekerjaan, dan pelacak perekrutan dengan recruiterbox dan lembar google \r\n-  Membantu Tim People Acquistion dengan memproses sekitar 150-200 kandidat/bulannya \r\n- Melakukan candidate background check"		\N	\N	\N	2021-01-18 14:05:07.898717+07	2021-01-18 14:05:07.905687+07
\.


--
-- Data for Name: core_meet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_meet (id, type, datetime, is_complete, meet_url, testimony, testimony_proof, show_testimony, rating, show_rating, price, note, client_id, consultant_id, created, modified, is_paid, paid_proof) FROM stdin;
2	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
3	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
4	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
5	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
6	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
7	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
8	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
9	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
10	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
11	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
12	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
13	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
14	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
15	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
17	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
18	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
19	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	5	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
16	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	3	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
20	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	3	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
1	CV	2021-01-17 14:11:45+07	f	https://meet.google.com/ktg-cxhf-wwa	Setelah saya konsultasi dengan Teguh tentang CV, saya jadi paham akan kualifikasi CV saya dan saya jadi lebih bisa mempersiapkan CV saya kedepan agar bisa diterima perusahaan impian saya!	https://i.ibb.co/56Rw4Js/test.jpg	t	1	t	75000.00		3	1	2021-01-18 14:05:07.914383+07	2021-01-18 14:05:07.925848+07	f	\N
21	INTERVIEW	2021-01-18 14:44:55+07	f	\N		\N	f	3	f	\N		4	1	2021-01-18 14:45:51.455949+07	2021-01-18 14:45:51.455961+07	f	\N
\.


--
-- Data for Name: core_meet_payment; Type: TABLE DATA; Schema: public; Owner: arga
--

COPY public.core_meet_payment (id, created, modified, due_datetime, method, price, admin_cost, total, note, meet_id) FROM stdin;
2	2021-01-19 07:34:00.611617+07	2021-01-19 07:34:00.611631+07	2021-01-19 07:33:56+07	BCA	100000.00	5000.00	105000.00		1
1	2021-01-19 06:43:42.232778+07	2021-01-19 08:05:09.526365+07	2021-01-19 06:43:33+07	BCA	500000.00	50000.00	550000.00	sudah dibayar menggunakan mobile banking bca	1
\.


--
-- Data for Name: core_meet_payroll; Type: TABLE DATA; Schema: public; Owner: arga
--

COPY public.core_meet_payroll (id, created, modified, price, for_consultant, for_company, is_consultant_paid, meet_id, note, consultant_paid_proof, consultant_id) FROM stdin;
2	2021-01-19 07:57:14.129437+07	2021-01-19 07:57:25.461023+07	100000.00	60000.00	40000.00	f	1		\N	1
3	2021-01-19 07:57:33.614092+07	2021-01-19 07:57:33.614102+07	100000.00	60000.00	40000.00	f	6		\N	1
1	2021-01-19 07:39:35.925542+07	2021-01-19 08:04:31.392206+07	200000.00	120000.00	80000.00	t	1		https://stackoverflow.com/questions/11754877/troubleshooting-related-field-has-invalid-lookup-icontains	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-01-17 08:13:52.584591+07	1	Teguh Priyantono | CEO	2	[{"changed": {"fields": ["Is show"]}}]	9	2
2	2021-01-17 08:14:00.273001+07	2	Arga Ghulam Ahmad | CTO	2	[]	9	2
3	2021-01-17 08:14:06.458896+07	3	Hansel Muhammad Falah | CFO	2	[{"changed": {"fields": ["Is show"]}}]	9	2
4	2021-01-17 08:14:22.884369+07	4	Nethania Dinari Ramadhani | CMO	2	[{"changed": {"fields": ["Is show"]}}]	9	2
5	2021-01-17 08:14:31.30274+07	5	Kharissa Amelia | Graphic Designer	2	[{"changed": {"fields": ["Is show"]}}]	9	2
6	2021-01-17 08:14:38.083307+07	6	Hanifa Shafira | Graphic Designer	2	[{"changed": {"fields": ["Is show"]}}]	9	2
7	2021-01-17 08:14:46.799231+07	7	Tiar Adhi Bagaskara | Creative	2	[{"changed": {"fields": ["Is show"]}}]	9	2
8	2021-01-17 08:14:55.064768+07	8	Syahla Yulfiantie Hartono | Sales Executive	2	[{"changed": {"fields": ["Is show"]}}]	9	2
9	2021-01-17 08:15:30.230387+07	9	Merry Ayu Gultom | Sales Executive	2	[{"changed": {"fields": ["Is show"]}}]	9	2
10	2021-01-17 08:15:37.436863+07	10	Khoirunnisa Mazaya | Social Media Strategist	2	[{"changed": {"fields": ["Is show"]}}]	9	2
11	2021-01-17 08:15:43.343229+07	11	Pandu Aji Wijaya | Social Media Strategist	2	[{"changed": {"fields": ["Is show"]}}]	9	2
12	2021-01-17 11:39:00.568537+07	2	Arga Ghulam Ahmad | CTO	2	[{"changed": {"fields": ["Is show"]}}]	9	2
13	2021-01-17 11:45:54.750187+07	2	Arga Ghulam Ahmad - Founder at ARGA.	1	[{"added": {}}]	8	2
14	2021-01-17 11:57:29.406075+07	2	Arga Ghulam Ahmad - Founder at ARGA.	3		8	2
15	2021-01-17 11:58:01.783537+07	5	Arga Ghulam Ahmad - Founder at ARGA.	1	[{"added": {}}]	8	2
16	2021-01-17 12:22:43.644819+07	5	Arga Ghulam Ahmad - Founder at ARGA.	2	[{"changed": {"fields": ["Is active"]}}]	8	2
17	2021-01-17 13:16:43.624981+07	2	Arga Ghulam Ahmad | CTO	2	[{"changed": {"fields": ["Is show"]}}]	9	2
18	2021-01-17 13:16:58.990988+07	9	Shofia Anugraha Hajaraswati - Former People Acquisition at Gojek Indonesia	2	[{"changed": {"fields": ["Is active", "Experience"]}}]	8	2
19	2021-01-17 13:17:26.51512+07	20	Merina Anindita - Rachel Vonny - 01/17/2021, 18:00:00	2	[{"changed": {"fields": ["Show testimony"]}}]	10	2
20	2021-01-17 13:38:30.627397+07	19	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 18:00:00	2	[{"changed": {"fields": ["Testimony proof"]}}]	10	1
21	2021-01-17 14:13:12.857767+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45	1	[{"added": {}}]	11	1
22	2021-01-17 14:48:29.193578+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45	2	[{"changed": {"fields": ["Testimony proof", "Rating"]}}]	11	2
23	2021-01-17 15:05:07.776108+07	16	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45	2	[{"changed": {"fields": ["Rating"]}}]	11	2
24	2021-01-17 15:05:12.782028+07	20	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45	2	[{"changed": {"fields": ["Rating"]}}]	11	2
25	2021-01-17 15:05:26.762203+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45	2	[{"changed": {"fields": ["Rating"]}}]	11	2
26	2021-01-17 15:05:38.500493+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45	2	[{"changed": {"fields": ["Rating"]}}]	11	2
27	2021-01-18 14:45:51.458981+07	21	Teguh Priyantono - Rachel Vonny - 01/18/2021, 14:44:55	1	[{"added": {}}]	11	2
28	2021-01-18 14:55:16.025061+07	1	Consultant	1	[{"added": {}}]	3	2
29	2021-01-18 14:55:21.807267+07	1	Consultant	3		3	2
30	2021-01-18 15:05:18.353206+07	1	teguh	2	[{"changed": {"fields": ["Superuser status", "Groups"]}}]	4	2
31	2021-01-18 15:05:25.310548+07	1	teguh	2	[]	4	2
32	2021-01-18 19:47:45.270804+07	3	Pandu Aji Wijaya - Fresh Graduate	2	[{"changed": {"fields": ["Cv url"]}}]	7	2
33	2021-01-19 06:43:42.270869+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 01/19/2021, 06:43:33 - 111	1	[{"added": {}}]	12	2
34	2021-01-19 07:34:00.64596+07	2	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 01/19/2021, 07:33:56 - 105000	1	[{"added": {}}]	12	2
35	2021-01-19 07:39:35.951863+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 7272727.2 - 4848484.8 - True	1	[{"added": {}}]	13	2
36	2021-01-19 07:39:59.243263+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 120000.0 - 80000.0 - True	2	[{"changed": {"fields": ["Price"]}}]	13	2
37	2021-01-19 07:42:38.643421+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 120000.0 - 80000.0 - True	2	[]	13	2
38	2021-01-19 07:49:06.263651+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 120000.0 - 80000.0 - True	2	[]	13	2
39	2021-01-19 07:57:14.151642+07	2	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 60000.0 - 40000.0 - False	1	[{"added": {}}]	13	2
40	2021-01-19 07:57:25.496993+07	2	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 60000.0 - 40000.0 - False	2	[]	13	2
41	2021-01-19 07:57:33.632174+07	3	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 60000.0 - 40000.0 - False	1	[{"added": {}}]	13	2
42	2021-01-19 08:03:52.94673+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 120000.0 - 80000.0 - False	2	[]	13	2
43	2021-01-19 08:04:02.479714+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 120000.0 - 80000.0 - True	2	[{"changed": {"fields": ["Consultant paid proof"]}}]	13	2
44	2021-01-19 08:04:09.894881+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 120000.0 - 80000.0 - False	2	[{"changed": {"fields": ["Consultant paid proof"]}}]	13	2
45	2021-01-19 08:04:31.415609+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 120000.0 - 80000.0 - True	2	[{"changed": {"fields": ["Consultant paid proof"]}}]	13	2
46	2021-01-19 08:05:09.565436+07	1	Teguh Priyantono - Pandu Aji Wijaya - 01/17/2021, 07:11:45 - 01/19/2021, 06:43:33 - 550000	2	[{"changed": {"fields": ["Price", "Admin cost", "Note"]}}]	12	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	core	client
8	core	consultant
9	core	teammember
10	core	interview
11	core	meet
13	core	meetpayroll
12	core	meetpayment
14	office	teammember
15	office	employee
16	office	employeepayroll
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-01-16 19:58:05.596855+07
2	auth	0001_initial	2021-01-16 19:58:05.714928+07
3	admin	0001_initial	2021-01-16 19:58:05.861888+07
4	admin	0002_logentry_remove_auto_add	2021-01-16 19:58:05.903452+07
5	admin	0003_logentry_add_action_flag_choices	2021-01-16 19:58:05.928498+07
6	contenttypes	0002_remove_content_type_name	2021-01-16 19:58:05.971281+07
7	auth	0002_alter_permission_name_max_length	2021-01-16 19:58:06.001273+07
8	auth	0003_alter_user_email_max_length	2021-01-16 19:58:06.03884+07
9	auth	0004_alter_user_username_opts	2021-01-16 19:58:06.065498+07
10	auth	0005_alter_user_last_login_null	2021-01-16 19:58:06.092478+07
11	auth	0006_require_contenttypes_0002	2021-01-16 19:58:06.102672+07
12	auth	0007_alter_validators_add_error_messages	2021-01-16 19:58:06.120042+07
13	auth	0008_alter_user_username_max_length	2021-01-16 19:58:06.146955+07
14	auth	0009_alter_user_last_name_max_length	2021-01-16 19:58:06.167803+07
15	auth	0010_alter_group_name_max_length	2021-01-16 19:58:06.193214+07
16	auth	0011_update_proxy_permissions	2021-01-16 19:58:06.214097+07
17	auth	0012_alter_user_first_name_max_length	2021-01-16 19:58:06.235026+07
18	core	0001_initial	2021-01-16 19:58:06.300953+07
19	sessions	0001_initial	2021-01-16 19:58:06.34262+07
20	core	0002_auto_20210117_0020	2021-01-17 07:22:28.371532+07
21	core	0003_remove_teammember_order	2021-01-17 08:16:55.370523+07
22	core	0004_auto_20210117_0227	2021-01-17 09:31:35.280528+07
23	core	0005_interview_is_complete	2021-01-17 10:15:52.913706+07
24	core	0006_auto_20210117_0234	2021-01-17 10:15:52.938572+07
25	core	0007_interview_show_testimony	2021-01-17 10:15:52.957251+07
26	core	0008_auto_20210117_0308	2021-01-17 10:15:53.025225+07
27	core	0009_interview_testimony_proof	2021-01-17 10:51:44.442849+07
28	core	0010_auto_20210117_0452	2021-01-17 11:57:08.653606+07
29	core	0011_auto_20210117_0643	2021-01-17 14:04:32.367626+07
30	core	0012_auto_20210117_0720	2021-01-17 15:00:26.245603+07
31	core	0013_auto_20210118_0703	2021-01-18 14:05:07.954854+07
32	core	0014_auto_20210118_1920	2021-01-18 19:20:55.170057+07
33	core	0015_auto_20210118_1946	2021-01-18 19:46:43.646977+07
34	core	0016_payment	2021-01-19 06:27:15.147749+07
35	core	0017_auto_20210119_0636	2021-01-19 06:37:07.179657+07
36	core	0018_auto_20210119_0637	2021-01-19 06:37:43.436467+07
37	core	0019_auto_20210119_0728	2021-01-19 07:28:54.904818+07
38	core	0020_meetpayroll_note	2021-01-19 07:39:33.987609+07
39	core	0021_meetpayroll_consultant_paid_proof	2021-01-19 07:42:02.481657+07
40	core	0022_auto_20210119_0748	2021-01-19 07:48:43.476923+07
41	core	0023_auto_20210119_0759	2021-01-19 07:59:21.181683+07
42	core	0024_delete_teammember	2021-01-19 08:16:48.072313+07
43	office	0001_initial	2021-01-19 08:16:48.084764+07
44	office	0002_auto_20210119_0935	2021-01-19 09:35:28.086175+07
45	office	0003_auto_20210119_0935	2021-01-19 09:36:00.683229+07
46	core	0025_auto_20210119_0939	2021-01-19 09:40:54.22017+07
47	office	0004_auto_20210119_0940	2021-01-19 09:40:54.234389+07
48	office	0005_auto_20210119_0949	2021-01-19 09:49:17.134653+07
49	office	0006_employeepayroll_date	2021-01-19 09:57:26.173924+07
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
nxfqmr19kdfrt73uflzes82wj6h3z60n	.eJxVjMsOwiAQRf-FtSHlMQFcuvcbyDAMUjWQlHZl_Hdt0oVu7znnvkTEba1xG7zEOYuz0OL0uyWkB7cd5Du2W5fU27rMSe6KPOiQ1575eTncv4OKo35rAPKaNCuFiB5twgA6IJoQjHfagSqFCtsJDAdInMhxyYXA4mQLOPH-APEPOJk:1l0vsZ:u2S9R3oMF39n2VkPur11rUBt2-ISxxgOxEbQYvSDjG4	2021-01-31 07:25:15.556766+07
ad2totvx8tkqcuzqpgklioc2z8bzef55	.eJxVjEsOwiAUAO_C2pA-_rh03zMQeLxK1dCktCvj3S1JF7qdmcybhbhvJeyN1jBndmXALr8sRXxS7SI_Yr0vHJe6rXPiPeGnbXxcMr1uZ_s3KLGVvhXaKGGRnHNgpwlJgvQiuwGT9NYcXAovnFZeW5F8MgiKAJTNejgc-3wBslw2Rg:1l11SB:Jyv76F7N22moKyEBEdeiLHDTz2QTiIgEIOJcxshrL_I	2021-01-31 13:22:23.566741+07
shjz7qx86fxvk2tdass0te73d3dvmvv3	.eJxVjMsOwiAQRf-FtSHlMQFcuvcbyDAMUjWQlHZl_Hdt0oVu7znnvkTEba1xG7zEOYuz0OL0uyWkB7cd5Du2W5fU27rMSe6KPOiQ1575eTncv4OKo35rAPKaNCuFiB5twgA6IJoQjHfagSqFCtsJDAdInMhxyYXA4mQLOPH-APEPOJk:1l133R:eBbeDpu6uQXdcnRY-bie3I-rFFtrY4gaj3et9Mo9Ncs	2021-01-31 15:04:57.381692+07
d951jo63tidnz3r1bhkskisk2jgectvv	.eJxVjMsOwiAQRf-FtSHlMQFcuvcbyDAMUjWQlHZl_Hdt0oVu7znnvkTEba1xG7zEOYuz0OL0uyWkB7cd5Du2W5fU27rMSe6KPOiQ1575eTncv4OKo35rAPKaNCuFiB5twgA6IJoQjHfagSqFCtsJDAdInMhxyYXA4mQLOPH-APEPOJk:1l1Tw8:ZFuwdtdAYt7nrQOanDEIMajDBGXwIXcAYAiWCQxpr8U	2021-02-01 19:47:12.560088+07
hd8ctc2jr111esx25bvylnzkk9yqsk3t	.eJxVjMsOwiAQRf-FtSHlMQFcuvcbyDAMUjWQlHZl_Hdt0oVu7znnvkTEba1xG7zEOYuz0OL0uyWkB7cd5Du2W5fU27rMSe6KPOiQ1575eTncv4OKo35rAPKaNCuFiB5twgA6IJoQjHfagSqFCtsJDAdInMhxyYXA4mQLOPH-APEPOJk:1l1e6v:mBmavW_6n19TAvAHbycqEXzjQb53O3ifM-uhTZKibCk	2021-02-02 06:39:01.764935+07
\.


--
-- Data for Name: office_employee; Type: TABLE DATA; Schema: public; Owner: arga
--

COPY public.office_employee (id, created, modified, profile_image, full_name, "position", type, linkedin_profile, instagram_profile, is_show, salary) FROM stdin;
\.


--
-- Data for Name: office_employee_payroll; Type: TABLE DATA; Schema: public; Owner: arga
--

COPY public.office_employee_payroll (id, created, modified, total, employee_paid_proof, is_employee_paid, note, employee_id, date) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 5, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 149, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: core_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_client_id_seq', 1, false);


--
-- Name: core_consultant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_consultant_id_seq', 5, true);


--
-- Name: core_meet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_meet_id_seq', 21, true);


--
-- Name: core_meet_payroll_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arga
--

SELECT pg_catalog.setval('public.core_meet_payroll_id_seq', 3, true);


--
-- Name: core_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arga
--

SELECT pg_catalog.setval('public.core_payment_id_seq', 2, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 46, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 49, true);


--
-- Name: office_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arga
--

SELECT pg_catalog.setval('public.office_employee_id_seq', 1, false);


--
-- Name: office_employee_payroll_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arga
--

SELECT pg_catalog.setval('public.office_employee_payroll_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: core_client core_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_client
    ADD CONSTRAINT core_client_pkey PRIMARY KEY (id);


--
-- Name: core_consultant core_consultant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_consultant
    ADD CONSTRAINT core_consultant_pkey PRIMARY KEY (id);


--
-- Name: core_meet_payroll core_meet_payroll_pkey; Type: CONSTRAINT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.core_meet_payroll
    ADD CONSTRAINT core_meet_payroll_pkey PRIMARY KEY (id);


--
-- Name: core_meet core_meet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_meet
    ADD CONSTRAINT core_meet_pkey PRIMARY KEY (id);


--
-- Name: core_meet_payment core_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.core_meet_payment
    ADD CONSTRAINT core_payment_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: office_employee_payroll office_employee_payroll_pkey; Type: CONSTRAINT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.office_employee_payroll
    ADD CONSTRAINT office_employee_payroll_pkey PRIMARY KEY (id);


--
-- Name: office_employee office_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.office_employee
    ADD CONSTRAINT office_employee_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: core_meet_client_id_db84d09c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_meet_client_id_db84d09c ON public.core_meet USING btree (client_id);


--
-- Name: core_meet_consultant_id_a79184ec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_meet_consultant_id_a79184ec ON public.core_meet USING btree (consultant_id);


--
-- Name: core_meet_payroll_consultant_id_c02886a5; Type: INDEX; Schema: public; Owner: arga
--

CREATE INDEX core_meet_payroll_consultant_id_c02886a5 ON public.core_meet_payroll USING btree (consultant_id);


--
-- Name: core_meet_payroll_payment_id_53fe520e; Type: INDEX; Schema: public; Owner: arga
--

CREATE INDEX core_meet_payroll_payment_id_53fe520e ON public.core_meet_payroll USING btree (meet_id);


--
-- Name: core_payment_meet_id_9b415297; Type: INDEX; Schema: public; Owner: arga
--

CREATE INDEX core_payment_meet_id_9b415297 ON public.core_meet_payment USING btree (meet_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: office_employee_payroll_employee_id_62db09d7; Type: INDEX; Schema: public; Owner: arga
--

CREATE INDEX office_employee_payroll_employee_id_62db09d7 ON public.office_employee_payroll USING btree (employee_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_meet core_meet_client_id_db84d09c_fk_core_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_meet
    ADD CONSTRAINT core_meet_client_id_db84d09c_fk_core_client_id FOREIGN KEY (client_id) REFERENCES public.core_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_meet core_meet_consultant_id_a79184ec_fk_core_consultant_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_meet
    ADD CONSTRAINT core_meet_consultant_id_a79184ec_fk_core_consultant_id FOREIGN KEY (consultant_id) REFERENCES public.core_consultant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_meet_payroll core_meet_payroll_consultant_id_c02886a5_fk_core_consultant_id; Type: FK CONSTRAINT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.core_meet_payroll
    ADD CONSTRAINT core_meet_payroll_consultant_id_c02886a5_fk_core_consultant_id FOREIGN KEY (consultant_id) REFERENCES public.core_consultant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_meet_payroll core_meet_payroll_meet_id_a5998a68_fk_core_meet_id; Type: FK CONSTRAINT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.core_meet_payroll
    ADD CONSTRAINT core_meet_payroll_meet_id_a5998a68_fk_core_meet_id FOREIGN KEY (meet_id) REFERENCES public.core_meet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_meet_payment core_payment_meet_id_9b415297_fk_core_meet_id; Type: FK CONSTRAINT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.core_meet_payment
    ADD CONSTRAINT core_payment_meet_id_9b415297_fk_core_meet_id FOREIGN KEY (meet_id) REFERENCES public.core_meet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: office_employee_payroll office_employee_payr_employee_id_62db09d7_fk_office_em; Type: FK CONSTRAINT; Schema: public; Owner: arga
--

ALTER TABLE ONLY public.office_employee_payroll
    ADD CONSTRAINT office_employee_payr_employee_id_62db09d7_fk_office_em FOREIGN KEY (employee_id) REFERENCES public.office_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

