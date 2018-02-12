--
-- PostgreSQL database dump
--

-- Dumped from database version 10.2
-- Dumped by pg_dump version 10.2

-- Started on 2018-02-10 01:27:25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2942 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 208 (class 1259 OID 16678)
-- Name: eventcomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE eventcomment (
    eventcommentid bigint NOT NULL,
    usereventid bigint,
    useraccountid bigint,
    createddatetime timestamp without time zone DEFAULT now(),
    comment character varying(1000) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE eventcomment OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16676)
-- Name: eventcomment_eventcommentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE eventcomment_eventcommentid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eventcomment_eventcommentid_seq OWNER TO postgres;

--
-- TOC entry 2943 (class 0 OID 0)
-- Dependencies: 207
-- Name: eventcomment_eventcommentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE eventcomment_eventcommentid_seq OWNED BY eventcomment.eventcommentid;


--
-- TOC entry 210 (class 1259 OID 16701)
-- Name: eventjoin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE eventjoin (
    eventjoinid bigint NOT NULL,
    usereventid bigint,
    useraccountid bigint
);


ALTER TABLE eventjoin OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16699)
-- Name: eventjoin_eventjoinid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE eventjoin_eventjoinid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eventjoin_eventjoinid_seq OWNER TO postgres;

--
-- TOC entry 2944 (class 0 OID 0)
-- Dependencies: 209
-- Name: eventjoin_eventjoinid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE eventjoin_eventjoinid_seq OWNED BY eventjoin.eventjoinid;


--
-- TOC entry 206 (class 1259 OID 16661)
-- Name: eventpicture; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE eventpicture (
    eventpictureid bigint NOT NULL,
    usereventid bigint,
    caption character varying(100) DEFAULT ''::character varying,
    picturepath character varying(500),
    picture bytea
);


ALTER TABLE eventpicture OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16659)
-- Name: eventpicture_eventpictureid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE eventpicture_eventpictureid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eventpicture_eventpictureid_seq OWNER TO postgres;

--
-- TOC entry 2945 (class 0 OID 0)
-- Dependencies: 205
-- Name: eventpicture_eventpictureid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE eventpicture_eventpictureid_seq OWNED BY eventpicture.eventpictureid;


--
-- TOC entry 214 (class 1259 OID 16742)
-- Name: eventpromoted; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE eventpromoted (
    eventpromotedid bigint NOT NULL,
    usereventid bigint,
    startdatetime timestamp without time zone NOT NULL,
    enddatetime timestamp without time zone NOT NULL,
    ispaid boolean DEFAULT false
);


ALTER TABLE eventpromoted OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16740)
-- Name: eventpromoted_eventpromotedid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE eventpromoted_eventpromotedid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eventpromoted_eventpromotedid_seq OWNER TO postgres;

--
-- TOC entry 2946 (class 0 OID 0)
-- Dependencies: 213
-- Name: eventpromoted_eventpromotedid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE eventpromoted_eventpromotedid_seq OWNED BY eventpromoted.eventpromotedid;


--
-- TOC entry 212 (class 1259 OID 16719)
-- Name: eventshared; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE eventshared (
    eventsharedid bigint NOT NULL,
    usereventid bigint,
    userprofileidfrom bigint,
    userprofileidto bigint
);


ALTER TABLE eventshared OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16717)
-- Name: eventshared_eventsharedid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE eventshared_eventsharedid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eventshared_eventsharedid_seq OWNER TO postgres;

--
-- TOC entry 2947 (class 0 OID 0)
-- Dependencies: 211
-- Name: eventshared_eventsharedid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE eventshared_eventsharedid_seq OWNED BY eventshared.eventsharedid;


--
-- TOC entry 197 (class 1259 OID 16585)
-- Name: useraccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE useraccount (
    useraccountid bigint NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
);


ALTER TABLE useraccount OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16583)
-- Name: useraccount_useraccountid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE useraccount_useraccountid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE useraccount_useraccountid_seq OWNER TO postgres;

--
-- TOC entry 2948 (class 0 OID 0)
-- Dependencies: 196
-- Name: useraccount_useraccountid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE useraccount_useraccountid_seq OWNED BY useraccount.useraccountid;


--
-- TOC entry 204 (class 1259 OID 16640)
-- Name: userevent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE userevent (
    usereventid bigint NOT NULL,
    useraccountid bigint,
    eventname character varying(200) NOT NULL,
    createddatetime timestamp without time zone DEFAULT now(),
    startdatetime timestamp without time zone NOT NULL,
    enddatetime timestamp without time zone,
    locationname character varying(200),
    locationaddress character varying(500),
    locationcity character varying(200),
    locationcoordinate character varying(40),
    capacity integer DEFAULT 0,
    rangefeefrom numeric DEFAULT 0,
    rangefeeto numeric DEFAULT 0,
    eventtag character varying(200),
    ispublic boolean DEFAULT false
);


ALTER TABLE userevent OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16638)
-- Name: userevent_usereventid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE userevent_usereventid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE userevent_usereventid_seq OWNER TO postgres;

--
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 203
-- Name: userevent_usereventid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE userevent_usereventid_seq OWNED BY userevent.usereventid;


--
-- TOC entry 202 (class 1259 OID 16622)
-- Name: usernetwork; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usernetwork (
    usernetworkid bigint NOT NULL,
    userprofileid1 bigint,
    userprofileid2 bigint
);


ALTER TABLE usernetwork OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16620)
-- Name: usernetwork_usernetworkid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usernetwork_usernetworkid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usernetwork_usernetworkid_seq OWNER TO postgres;

--
-- TOC entry 2950 (class 0 OID 0)
-- Dependencies: 201
-- Name: usernetwork_usernetworkid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usernetwork_usernetworkid_seq OWNED BY usernetwork.usernetworkid;


--
-- TOC entry 198 (class 1259 OID 16591)
-- Name: userprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE userprofile (
    useraccountid bigint NOT NULL,
    userprofilename character varying(200) NOT NULL,
    email character varying(100) NOT NULL,
    phonenumber character varying(30),
	createddatetime timestamp without time zone DEFAULT now(),
    picturepath character varying(500),	
    picture bytea
);


ALTER TABLE userprofile OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16606)
-- Name: userprofiledetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE userprofiledetail (
    userprofiledetailid bigint NOT NULL,
    useraccountid bigint,
    userprofiletype character varying(100),
    userprofilevalue character varying(500)
);


ALTER TABLE userprofiledetail OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16604)
-- Name: userprofiledetail_userprofiledetailid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE userprofiledetail_userprofiledetailid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE userprofiledetail_userprofiledetailid_seq OWNER TO postgres;

--
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 199
-- Name: userprofiledetail_userprofiledetailid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE userprofiledetail_userprofiledetailid_seq OWNED BY userprofiledetail.userprofiledetailid;


--
-- TOC entry 2738 (class 2604 OID 16681)
-- Name: eventcomment eventcommentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventcomment ALTER COLUMN eventcommentid SET DEFAULT nextval('eventcomment_eventcommentid_seq'::regclass);


--
-- TOC entry 2741 (class 2604 OID 16704)
-- Name: eventjoin eventjoinid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventjoin ALTER COLUMN eventjoinid SET DEFAULT nextval('eventjoin_eventjoinid_seq'::regclass);


--
-- TOC entry 2736 (class 2604 OID 16664)
-- Name: eventpicture eventpictureid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventpicture ALTER COLUMN eventpictureid SET DEFAULT nextval('eventpicture_eventpictureid_seq'::regclass);


--
-- TOC entry 2743 (class 2604 OID 16745)
-- Name: eventpromoted eventpromotedid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventpromoted ALTER COLUMN eventpromotedid SET DEFAULT nextval('eventpromoted_eventpromotedid_seq'::regclass);


--
-- TOC entry 2742 (class 2604 OID 16722)
-- Name: eventshared eventsharedid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventshared ALTER COLUMN eventsharedid SET DEFAULT nextval('eventshared_eventsharedid_seq'::regclass);


--
-- TOC entry 2727 (class 2604 OID 16588)
-- Name: useraccount useraccountid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY useraccount ALTER COLUMN useraccountid SET DEFAULT nextval('useraccount_useraccountid_seq'::regclass);


--
-- TOC entry 2730 (class 2604 OID 16643)
-- Name: userevent usereventid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userevent ALTER COLUMN usereventid SET DEFAULT nextval('userevent_usereventid_seq'::regclass);


--
-- TOC entry 2729 (class 2604 OID 16625)
-- Name: usernetwork usernetworkid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usernetwork ALTER COLUMN usernetworkid SET DEFAULT nextval('usernetwork_usernetworkid_seq'::regclass);


--
-- TOC entry 2728 (class 2604 OID 16609)
-- Name: userprofiledetail userprofiledetailid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userprofiledetail ALTER COLUMN userprofiledetailid SET DEFAULT nextval('userprofiledetail_userprofiledetailid_seq'::regclass);


--
-- TOC entry 2929 (class 0 OID 16678)
-- Dependencies: 208
-- Data for Name: eventcomment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY eventcomment (eventcommentid, usereventid, useraccountid, createddatetime, comment) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 16701)
-- Dependencies: 210
-- Data for Name: eventjoin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY eventjoin (eventjoinid, usereventid, useraccountid) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 16661)
-- Dependencies: 206
-- Data for Name: eventpicture; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY eventpicture (eventpictureid, usereventid, caption, picturepath, picture) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 16742)
-- Dependencies: 214
-- Data for Name: eventpromoted; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY eventpromoted (eventpromotedid, usereventid, startdatetime, enddatetime, ispaid) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 16719)
-- Dependencies: 212
-- Data for Name: eventshared; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY eventshared (eventsharedid, usereventid, userprofileidfrom, userprofileidto) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 16585)
-- Dependencies: 197
-- Data for Name: useraccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY useraccount (useraccountid, username, password) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 16640)
-- Dependencies: 204
-- Data for Name: userevent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY userevent (usereventid, useraccountid, eventname, createddatetime, startdatetime, enddatetime, locationname, locationaddress, locationcity, locationcoordinate, capacity, rangefeefrom, rangefeeto, eventtag, ispublic) FROM stdin;
\.


--
-- TOC entry 2923 (class 0 OID 16622)
-- Dependencies: 202
-- Data for Name: usernetwork; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usernetwork (usernetworkid, userprofileid1, userprofileid2) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 16591)
-- Dependencies: 198
-- Data for Name: userprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY userprofile (useraccountid, userprofilename, email, phonenumber, picturepath, picture) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 16606)
-- Dependencies: 200
-- Data for Name: userprofiledetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY userprofiledetail (userprofiledetailid, useraccountid, userprofiletype, userprofilevalue) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 207
-- Name: eventcomment_eventcommentid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('eventcomment_eventcommentid_seq', 1, false);


--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 209
-- Name: eventjoin_eventjoinid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('eventjoin_eventjoinid_seq', 1, false);


--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 205
-- Name: eventpicture_eventpictureid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('eventpicture_eventpictureid_seq', 1, false);


--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 213
-- Name: eventpromoted_eventpromotedid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('eventpromoted_eventpromotedid_seq', 1, false);


--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 211
-- Name: eventshared_eventsharedid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('eventshared_eventsharedid_seq', 1, false);


--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 196
-- Name: useraccount_useraccountid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('useraccount_useraccountid_seq', 1, false);


--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 203
-- Name: userevent_usereventid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('userevent_usereventid_seq', 1, false);


--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 201
-- Name: usernetwork_usernetworkid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usernetwork_usernetworkid_seq', 1, false);


--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 199
-- Name: userprofiledetail_userprofiledetailid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('userprofiledetail_userprofiledetailid_seq', 1, false);


--
-- TOC entry 2775 (class 2606 OID 16688)
-- Name: eventcomment eventcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventcomment
    ADD CONSTRAINT eventcomment_pkey PRIMARY KEY (eventcommentid);


--
-- TOC entry 2777 (class 2606 OID 16706)
-- Name: eventjoin eventjoin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventjoin
    ADD CONSTRAINT eventjoin_pkey PRIMARY KEY (eventjoinid);


--
-- TOC entry 2771 (class 2606 OID 16670)
-- Name: eventpicture eventpicture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventpicture
    ADD CONSTRAINT eventpicture_pkey PRIMARY KEY (eventpictureid);


--
-- TOC entry 2781 (class 2606 OID 16748)
-- Name: eventpromoted eventpromoted_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventpromoted
    ADD CONSTRAINT eventpromoted_pkey PRIMARY KEY (eventpromotedid);


--
-- TOC entry 2779 (class 2606 OID 16724)
-- Name: eventshared eventshared_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventshared
    ADD CONSTRAINT eventshared_pkey PRIMARY KEY (eventsharedid);


--
-- TOC entry 2747 (class 2606 OID 16590)
-- Name: useraccount useraccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY useraccount
    ADD CONSTRAINT useraccount_pkey PRIMARY KEY (useraccountid);


--
-- TOC entry 2766 (class 2606 OID 16653)
-- Name: userevent userevent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userevent
    ADD CONSTRAINT userevent_pkey PRIMARY KEY (usereventid);


--
-- TOC entry 2758 (class 2606 OID 16627)
-- Name: usernetwork usernetwork_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usernetwork
    ADD CONSTRAINT usernetwork_pkey PRIMARY KEY (usernetworkid);


--
-- TOC entry 2751 (class 2606 OID 16598)
-- Name: userprofile userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userprofile
    ADD CONSTRAINT userprofile_pkey PRIMARY KEY (useraccountid);


--
-- TOC entry 2754 (class 2606 OID 16614)
-- Name: userprofiledetail userprofiledetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userprofiledetail
    ADD CONSTRAINT userprofiledetail_pkey PRIMARY KEY (userprofiledetailid);


--
-- TOC entry 2772 (class 1259 OID 16769)
-- Name: eventcomment_comment_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX eventcomment_comment_idx ON eventcomment USING btree (comment varchar_pattern_ops);


--
-- TOC entry 2773 (class 1259 OID 16770)
-- Name: eventcomment_createddatetime_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX eventcomment_createddatetime_idx ON eventcomment USING btree (createddatetime);


--
-- TOC entry 2745 (class 1259 OID 16768)
-- Name: useraccount_password_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX useraccount_password_idx ON useraccount USING btree (password);


--
-- TOC entry 2748 (class 1259 OID 16767)
-- Name: useraccount_username_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX useraccount_username_idx ON useraccount USING btree (username varchar_pattern_ops);


--
-- TOC entry 2759 (class 1259 OID 16755)
-- Name: userevent_createddatetime_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX userevent_createddatetime_idx ON userevent USING btree (createddatetime);


--
-- TOC entry 2760 (class 1259 OID 16771)
-- Name: userevent_eventname_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX userevent_eventname_idx ON userevent USING btree (eventname);


--
-- TOC entry 2761 (class 1259 OID 16754)
-- Name: userevent_eventtag_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX userevent_eventtag_idx ON userevent USING btree (eventtag varchar_pattern_ops);


--
-- TOC entry 2762 (class 1259 OID 16758)
-- Name: userevent_locationaddress_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX userevent_locationaddress_idx ON userevent USING btree (locationaddress varchar_pattern_ops);


--
-- TOC entry 2763 (class 1259 OID 16759)
-- Name: userevent_locationcity_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX userevent_locationcity_idx ON userevent USING btree (locationcity varchar_pattern_ops);


--
-- TOC entry 2764 (class 1259 OID 16757)
-- Name: userevent_locationcoordinate_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX userevent_locationcoordinate_idx ON userevent USING btree (locationcoordinate varchar_pattern_ops);


--
-- TOC entry 2767 (class 1259 OID 16764)
-- Name: userevent_rangefeefrom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX userevent_rangefeefrom_idx ON userevent USING btree (rangefeefrom);


--
-- TOC entry 2768 (class 1259 OID 16765)
-- Name: userevent_rangefeeto_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX userevent_rangefeeto_idx ON userevent USING btree (rangefeeto);


--
-- TOC entry 2769 (class 1259 OID 16756)
-- Name: userevent_startdatetime_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX userevent_startdatetime_idx ON userevent USING btree (startdatetime);


--
-- TOC entry 2749 (class 1259 OID 16761)
-- Name: userprofile_email_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX userprofile_email_idx ON userprofile USING btree (email);


--
-- TOC entry 2752 (class 1259 OID 16760)
-- Name: userprofile_userprofilename_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX userprofile_userprofilename_idx ON userprofile USING btree (userprofilename varchar_pattern_ops);


--
-- TOC entry 2755 (class 1259 OID 16762)
-- Name: userprofiledetail_userprofiletype_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX userprofiledetail_userprofiletype_idx ON userprofiledetail USING btree (userprofiletype);


--
-- TOC entry 2756 (class 1259 OID 16763)
-- Name: userprofiledetail_userprofilevalue_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX userprofiledetail_userprofilevalue_idx ON userprofiledetail USING btree (userprofilevalue);


--
-- TOC entry 2789 (class 2606 OID 16694)
-- Name: eventcomment eventcomment_useraccountid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventcomment
    ADD CONSTRAINT eventcomment_useraccountid_fkey FOREIGN KEY (useraccountid) REFERENCES useraccount(useraccountid);


--
-- TOC entry 2788 (class 2606 OID 16689)
-- Name: eventcomment eventcomment_usereventid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventcomment
    ADD CONSTRAINT eventcomment_usereventid_fkey FOREIGN KEY (usereventid) REFERENCES userevent(usereventid);


--
-- TOC entry 2791 (class 2606 OID 16712)
-- Name: eventjoin eventjoin_useraccountid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventjoin
    ADD CONSTRAINT eventjoin_useraccountid_fkey FOREIGN KEY (useraccountid) REFERENCES useraccount(useraccountid);


--
-- TOC entry 2790 (class 2606 OID 16707)
-- Name: eventjoin eventjoin_usereventid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventjoin
    ADD CONSTRAINT eventjoin_usereventid_fkey FOREIGN KEY (usereventid) REFERENCES userevent(usereventid);


--
-- TOC entry 2787 (class 2606 OID 16671)
-- Name: eventpicture eventpicture_usereventid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventpicture
    ADD CONSTRAINT eventpicture_usereventid_fkey FOREIGN KEY (usereventid) REFERENCES userevent(usereventid);


--
-- TOC entry 2795 (class 2606 OID 16749)
-- Name: eventpromoted eventpromoted_usereventid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventpromoted
    ADD CONSTRAINT eventpromoted_usereventid_fkey FOREIGN KEY (usereventid) REFERENCES userevent(usereventid);


--
-- TOC entry 2792 (class 2606 OID 16725)
-- Name: eventshared eventshared_usereventid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventshared
    ADD CONSTRAINT eventshared_usereventid_fkey FOREIGN KEY (usereventid) REFERENCES userevent(usereventid);


--
-- TOC entry 2793 (class 2606 OID 16730)
-- Name: eventshared eventshared_userprofileidfrom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventshared
    ADD CONSTRAINT eventshared_userprofileidfrom_fkey FOREIGN KEY (userprofileidfrom) REFERENCES useraccount(useraccountid);


--
-- TOC entry 2794 (class 2606 OID 16735)
-- Name: eventshared eventshared_userprofileidto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventshared
    ADD CONSTRAINT eventshared_userprofileidto_fkey FOREIGN KEY (userprofileidto) REFERENCES useraccount(useraccountid);


--
-- TOC entry 2786 (class 2606 OID 16654)
-- Name: userevent userevent_useraccountid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userevent
    ADD CONSTRAINT userevent_useraccountid_fkey FOREIGN KEY (useraccountid) REFERENCES useraccount(useraccountid);


--
-- TOC entry 2784 (class 2606 OID 16628)
-- Name: usernetwork usernetwork_userprofileid1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usernetwork
    ADD CONSTRAINT usernetwork_userprofileid1_fkey FOREIGN KEY (userprofileid1) REFERENCES useraccount(useraccountid);


--
-- TOC entry 2785 (class 2606 OID 16633)
-- Name: usernetwork usernetwork_userprofileid2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usernetwork
    ADD CONSTRAINT usernetwork_userprofileid2_fkey FOREIGN KEY (userprofileid2) REFERENCES useraccount(useraccountid);


--
-- TOC entry 2782 (class 2606 OID 16599)
-- Name: userprofile userprofile_useraccountid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userprofile
    ADD CONSTRAINT userprofile_useraccountid_fkey FOREIGN KEY (useraccountid) REFERENCES useraccount(useraccountid);


--
-- TOC entry 2783 (class 2606 OID 16615)
-- Name: userprofiledetail userprofiledetail_useraccountid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userprofiledetail
    ADD CONSTRAINT userprofiledetail_useraccountid_fkey FOREIGN KEY (useraccountid) REFERENCES useraccount(useraccountid);


-- Completed on 2018-02-10 01:27:25

--
-- PostgreSQL database dump complete
--

