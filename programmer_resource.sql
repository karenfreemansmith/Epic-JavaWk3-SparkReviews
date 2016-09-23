--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: resources; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE resources (
    id integer NOT NULL,
    title character varying,
    url character varying,
    description character varying,
    techid integer,
    avgrating integer,
    reviewcount integer
);


ALTER TABLE resources OWNER TO "Guest";

--
-- Name: resources_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resources_id_seq OWNER TO "Guest";

--
-- Name: resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE resources_id_seq OWNED BY resources.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE reviews (
    id integer NOT NULL,
    title character varying,
    review text,
    rating integer,
    reviewer character varying,
    email character varying,
    resourceid integer,
    date timestamp without time zone DEFAULT now()
);


ALTER TABLE reviews OWNER TO "Guest";

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reviews_id_seq OWNER TO "Guest";

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE reviews_id_seq OWNED BY reviews.id;


--
-- Name: technologies; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE technologies (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE technologies OWNER TO "Guest";

--
-- Name: technologies_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE technologies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE technologies_id_seq OWNER TO "Guest";

--
-- Name: technologies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE technologies_id_seq OWNED BY technologies.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY resources ALTER COLUMN id SET DEFAULT nextval('resources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY reviews ALTER COLUMN id SET DEFAULT nextval('reviews_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY technologies ALTER COLUMN id SET DEFAULT nextval('technologies_id_seq'::regclass);


--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY resources (id, title, url, description, techid, avgrating, reviewcount) FROM stdin;
14	Official Spark Website	http://sparkjava.com/	The official Spark website for everything there is to know about Spark	13	1	1
20	Code Academy: PHP	https://www.codecademy.com/learn/php	Learn PHP with Code Academy	10	1	1
1	Oracle Documentation	https://docs.oracle.com/javase/7/docs/api/	Everything you ever wanted to know about Java	9	3	9
9	Java Tutorials by Oracle	https://docs.oracle.com/javase/tutorial/	Java tutorials from The Source	9	2	1
11	TutorialPoint Java Tutorial	http://www.tutorialspoint.com/java/	More tutorials, easier to read, easier to understand, better tutorials!!!	9	4	4
10	Udemy Free Tutorial for Beginners	https://www.udemy.com/java-tutorial/	FREE tutorials from GOOGLE!	9	2	2
12	Learn Core Java	http://javabeginnerstutorial.com/core-java/	Beginner tutorial	9	3	3
2	Official jQuery Documentation	http://api.jquery.com/	The jQuery API for all your jQuery questions	18	\N	\N
8	TutorialPoint jQuery Tutorials	http://www.tutorialspoint.com/jquery/	Some easy to follow jQuery tutorials	18	\N	\N
17	Angular JS by Google	https://angularjs.org/	Learn Angular in your web browser for free!	20	\N	\N
18	W3 Schools Angular Tutorial	http://www.w3schools.com/angular/angular_intro.asp	W3 Schools Tutorial for Angular JS	20	\N	\N
19	Ember Documentation	http://emberjs.com/	Official documentation for Ember	21	\N	\N
16	Why Spark is so Amazing	https://zeroturnaround.com/rebellabs/sparkjava-is-an-amazing-java-web-framework-do-you-really-need-it/	A blog post by Oleg Šelajev who is an engineer, author, speaker, lecturer and advocate at ZeroTurnaround	13	\N	\N
15	Spark Documentation	http://sparkjava.com/documentation.html	Official documentation for Spark	13	\N	\N
4	W3 Schools	http://www.w3schools.com/tags/	The world's largest web developer site	17	\N	\N
25	PHP: The Right Way	http://www.phptherightway.com/	An easy-to-read, quick reference for PHP popular coding standards, links to authoritative tutorials around the Web and what the contributors consider to be best practices at the present time.	10	0	0
21	C++	http://www.cplusplus.com	learn c plus plus	22	3	1
22	Wikipedia	https://en.wikipedia.org/wiki/C_Sharp_(programming_language)	background info about C#	14	0	0
5	MDN (Mozilla Developer Network)	https://developer.mozilla.org/en-US/docs/Web/CSS	The ultimate source of information	19	\N	\N
26	Wikipedia	https://en.wikipedia.org/wiki/R_(programming_language)	The R language is widely used among statisticians and data miners	16	0	0
6	W3Org Documenation	https://www.w3.org/Style/CSS/Overview.en.html	More documentation	19	\N	\N
7	Bootstrap Documentation	http://getbootstrap.com/css/	Popular CSS framework	19	\N	\N
27	Download Ruby	https://www.ruby-lang.org/en/downloads/	Download the latest version of Ruby - Programmer's Best Friend	11	0	0
3	MDN (Mozilla Developer Network)	https://developer.mozilla.org/en-US/docs/Web/HTML	The ultimate source of information on HTML	17	\N	\N
28	Ruby on Rails	http://rubyonrails.org/	Imagine what you could build if you learned Ruby on Rails…	11	0	0
23	Hazards of Python	http://timesofindia.indiatimes.com/city/ahmedabad/Python-dies-after-swallowing-nilgai/articleshow/54456206.cms	You gotta see it to believe it!	15	5	1
29	DOM Practice	http://www.w3schools.com/js/js_htmldom.asp	Will help with javascript usage	23	0	0
24	Python Website	https://www.python.org/	The official python website	15	1	2
30	Pro AngularJS	https://www.amazon.com/Pro-AngularJS-Experts-Voice-Development/dp/1430264489/ref=sr_1_1?ie=UTF8&qid=1474586507&sr=8-1&keywords=angular+js	AngularJS is the leading framework for building dynamic JavaScript applications that take advantage of the capabilities of modern browsers and devices. AngularJS, which is maintained by Google, brings the power of the Model-View-Controller (MVC) pattern to the client, providing the foundation for complex and rich web apps. It allows you to build applications that are smaller, faster, and with a lighter resource footprint than ever before. Best-selling author Adam Freeman explains how to get the most from AngularJS.	20	3	1
\.


--
-- Name: resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('resources_id_seq', 33, true);


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY reviews (id, title, review, rating, reviewer, email, resourceid, date) FROM stdin;
2	It sucks!	I can't find anything	1	noneofyourbusiness	nyb@sample.com	1	2016-09-21 15:37:04.133124
3	The Best	This is the best site ever, it taught me everything I know	5	know-it-all	kia@sample.com	1	2016-09-21 15:44:08.506528
4	OFFICIAL SOURCE	You can't beat the official source, the answers may be hard to find, but they are always right!	4	Sun O'Riley	sun@oracle.com	1	2016-09-21 15:54:56.063985
5	Hard to read	They really need to increase their font size.	2	nearsighted	tester@39dollarglasses.com	1	2016-09-21 16:14:05.246871
7	I like it	Easy to find things. Good examples. A++ would look up again	17	me	nope	2	2016-09-21 16:30:48.061353
8	Too Hard to Read	Hard to find stuff, hard to read. There are better resources out there...try stack overflow.	3	a$$h---	ass@stackoverflow.com	1	2016-09-22 08:46:10.195065
9	Too Hard to Read	Hard to find stuff, hard to read. There are better resources out there...try stack overflow.	3	a$$h---	ass@stackoverflow.com	1	2016-09-22 08:49:21.891705
10	w3 skools suck	I hate w3 skools, its so stoopid	1	imsmart	kia@sample.com	18	2016-09-22 09:11:57.439596
11	Best thing since whiteboards	This is so awesome. It's by Google. And it's free. Try it, really.	1	Freddie	fred@udemy.com	10	2016-09-22 11:10:00.209354
12	Great	Love this site	4	fan	fan@sample.com	11	2016-09-22 11:36:00.368594
13	The Best	Best Java tutorials online	5	Joe	joe@tutorialpoint.com	11	2016-09-22 11:38:18.322453
14	The Best	Best Java tutorials online	5	Joe	joe@tutorialpoint.com	11	2016-09-22 11:43:36.370146
15	Awesome	I love Oracle and everything they do!	5	fan	fan@sample.com	1	2016-09-22 11:44:34.190219
16	Yet Another Review	It was okay	3	bleh	bleh@idontcare.com	1	2016-09-22 11:48:17.041486
18	Really Easy	This was almost too easy, but I suppose I did learn a few things. It's worthwhile if you are just starting out, but don't waste your time if you are already familiar with Java.	3	Sam	sam@stackoverflow.com	12	2016-09-22 13:43:03.121997
19	Not that EAsy!	I don't know what that last reviewer was thihking, dis is are really hard stuffs to learn.	2	Joe	joe@etsy.com	12	2016-09-22 13:55:26.818935
20	This is really the best Java Tutorial	Tutorial point has the best instructors putting their tutorials together. They are the clearest and most fun projects on the web. Never trust someone who can't spell ;)	5	Sue	sue@turotialpoint.com	12	2016-09-22 13:56:40.515477
21	Loads Slow	After waiting like, half an hour for the site to even LOAD it was OK...	3	Sue	sue@turotialpoint.com	21	2016-09-22 14:49:01.039916
22	Wow!!!	That is so cool!	5	Joe	kia@sample.com	23	2016-09-22 14:56:24.156485
23	So BORING!	This is so boring. Totally useless.	1	noneofyourbusiness	nyb@sample.com	24	2016-09-22 14:58:09.271155
24	OK	Not too bad, for tutorials by an official source - but tutorial point is better!	2	Sue	sue@turotialpoint.com	9	2016-09-22 15:00:43.184855
25	Really Good	These are my favorite tutorials online. So good...	5	Sue	sue@turotialpoint.com	11	2016-09-22 15:02:18.622809
26	Hard to beat FREE	oh, they are all free!	4	knowitall	kia@sample.com	10	2016-09-22 15:03:14.364211
27	waste of time	this website really adds no value to my knowledge base. i could have spent my time better doing ANYTHING else than reading this trash!	1	jeremy :)	fryd22@gmail.com	24	2016-09-22 15:17:33.857236
28	Hmm	A thinker	3	Me	me@me.com	30	2016-09-22 16:22:40.645708
29	Spark Review	I hate spark	1	Tony	tf	14	2016-09-22 16:32:44.925696
30	Skeptical	They want you to sign up and give them too much information. No credit card required as far as I can tell, but I'm not giving my email to anyone just to look at their lessons.	1	Sue	sue@turotialpoint.com	20	2016-09-22 17:57:38.987329
\.


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('reviews_id_seq', 31, true);


--
-- Data for Name: technologies; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY technologies (id, name) FROM stdin;
9	Java
10	PHP
11	Ruby
13	Spark
14	C#
15	Python
16	R
17	HTML
18	jQuery
19	CSS
20	Angular.js
21	Ember.js
22	C++
23	Javascript
\.


--
-- Name: technologies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('technologies_id_seq', 24, true);


--
-- Name: resources_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- Name: reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: technologies_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY technologies
    ADD CONSTRAINT technologies_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: epicodus
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM epicodus;
GRANT ALL ON SCHEMA public TO epicodus;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

