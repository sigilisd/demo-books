--
-- PostgreSQL database dump
--

\restrict yLA9IFjuQ3OaucqwbafkyBCVM73ZvTVod6Ecw1lQeQBVcC88BToLp688WRfhRhl

-- Dumped from database version 18.2
-- Dumped by pg_dump version 18.1

-- Started on 2026-06-10 17:06:02

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 232 (class 1259 OID 36186)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 36185)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 36179)
-- Name: manufacturers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manufacturers (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.manufacturers OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 36178)
-- Name: manufacturers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.manufacturers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.manufacturers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 36299)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    order_date date,
    order_delivery date,
    pickup_point_id integer,
    user_id integer,
    code integer,
    order_status_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 36222)
-- Name: orders_article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_article (
    id integer NOT NULL,
    order_id integer,
    product_id integer,
    amount integer
);


ALTER TABLE public.orders_article OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 36221)
-- Name: orders_article_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders_article ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.orders_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 239 (class 1259 OID 36298)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 36231)
-- Name: orders_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_status (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.orders_status OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 36230)
-- Name: orders_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders_status ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.orders_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 36135)
-- Name: pickup_points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pickup_points (
    id integer NOT NULL,
    index integer,
    city character varying(255),
    street character varying(255),
    building integer
);


ALTER TABLE public.pickup_points OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 36134)
-- Name: pickup_points_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pickup_points ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pickup_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 36193)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    article character varying(255),
    name character varying(255),
    unit_id integer,
    price integer,
    provider_id integer,
    manufacturer_id integer,
    category_id integer,
    discount integer,
    amount integer,
    description text,
    photo character varying(255)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 36192)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.products ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 36172)
-- Name: providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.providers (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.providers OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 36171)
-- Name: providers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.providers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 36144)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 36143)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 36165)
-- Name: units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.units (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.units OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 36164)
-- Name: units_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.units ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 36151)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    role_id integer,
    first_name character varying(255),
    last_name character varying(255),
    patronymic character varying(255),
    email character varying(255),
    password character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 36150)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4997 (class 0 OID 36186)
-- Dependencies: 232
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (1, 'Художественная литература');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (2, 'Учебник для вузов');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (3, 'Хрестоматия');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (4, 'Учебное пособие');


--
-- TOC entry 4995 (class 0 OID 36179)
-- Dependencies: 230
-- Data for Name: manufacturers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.manufacturers OVERRIDING SYSTEM VALUE VALUES (1, 'Яуза');
INSERT INTO public.manufacturers OVERRIDING SYSTEM VALUE VALUES (2, 'Т8 Издательские технологии');
INSERT INTO public.manufacturers OVERRIDING SYSTEM VALUE VALUES (3, 'Прогресс книга');
INSERT INTO public.manufacturers OVERRIDING SYSTEM VALUE VALUES (4, 'Время');
INSERT INTO public.manufacturers OVERRIDING SYSTEM VALUE VALUES (5, '
Лениздат');
INSERT INTO public.manufacturers OVERRIDING SYSTEM VALUE VALUES (6, 'Неолит');
INSERT INTO public.manufacturers OVERRIDING SYSTEM VALUE VALUES (7, 'Амрита-Русь');
INSERT INTO public.manufacturers OVERRIDING SYSTEM VALUE VALUES (8, 'Златоуст');
INSERT INTO public.manufacturers OVERRIDING SYSTEM VALUE VALUES (9, 'Аспект Пресс');
INSERT INTO public.manufacturers OVERRIDING SYSTEM VALUE VALUES (10, 'ВКН');


--
-- TOC entry 5005 (class 0 OID 36299)
-- Dependencies: 240
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (1, '2024-02-27', '2024-04-20', 1, 10, 901, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (2, '2023-09-28', '2024-04-21', 11, 1, 902, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (3, '2024-03-21', '2024-04-22', 2, 8, 903, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (4, '2024-02-20', '2024-04-23', 11, 9, 904, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (5, '2024-03-17', '2024-04-24', 2, 10, 905, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (6, '2024-03-01', '2024-04-25', 15, 1, 906, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (7, '2024-02-26', '2024-04-26', 3, 8, 907, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (8, '2024-03-31', '2024-04-27', 19, 9, 908, 2);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (9, '2024-04-02', '2024-04-28', 5, 10, 909, 2);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (10, '2024-04-03', '2024-04-29', 19, 10, 910, 2);


--
-- TOC entry 5001 (class 0 OID 36222)
-- Dependencies: 236
-- Data for Name: orders_article; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders_article OVERRIDING SYSTEM VALUE VALUES (41, 1, 1, 2);
INSERT INTO public.orders_article OVERRIDING SYSTEM VALUE VALUES (42, 2, 2, 1);
INSERT INTO public.orders_article OVERRIDING SYSTEM VALUE VALUES (43, 3, 3, 10);
INSERT INTO public.orders_article OVERRIDING SYSTEM VALUE VALUES (44, 4, 5, 5);
INSERT INTO public.orders_article OVERRIDING SYSTEM VALUE VALUES (45, 5, 6, 20);
INSERT INTO public.orders_article OVERRIDING SYSTEM VALUE VALUES (46, 6, 1, 2);
INSERT INTO public.orders_article OVERRIDING SYSTEM VALUE VALUES (47, 7, 8, 3);
INSERT INTO public.orders_article OVERRIDING SYSTEM VALUE VALUES (48, 8, 5, 1);
INSERT INTO public.orders_article OVERRIDING SYSTEM VALUE VALUES (49, 9, 10, 5);
INSERT INTO public.orders_article OVERRIDING SYSTEM VALUE VALUES (50, 10, 9, 5);
INSERT INTO public.orders_article OVERRIDING SYSTEM VALUE VALUES (51, 1, 2, 2);
INSERT INTO public.orders_article OVERRIDING SYSTEM VALUE VALUES (52, 2, 1, 1);
INSERT INTO public.orders_article OVERRIDING SYSTEM VALUE VALUES (53, 3, 4, 10);
INSERT INTO public.orders_article OVERRIDING SYSTEM VALUE VALUES (54, 4, 3, 4);
INSERT INTO public.orders_article OVERRIDING SYSTEM VALUE VALUES (55, 5, 7, 20);
INSERT INTO public.orders_article OVERRIDING SYSTEM VALUE VALUES (56, 6, 2, 2);
INSERT INTO public.orders_article OVERRIDING SYSTEM VALUE VALUES (57, 7, 9, 3);
INSERT INTO public.orders_article OVERRIDING SYSTEM VALUE VALUES (58, 8, 6, 1);
INSERT INTO public.orders_article OVERRIDING SYSTEM VALUE VALUES (59, 9, 9, 1);
INSERT INTO public.orders_article OVERRIDING SYSTEM VALUE VALUES (60, 10, 10, 5);


--
-- TOC entry 5003 (class 0 OID 36231)
-- Dependencies: 238
-- Data for Name: orders_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders_status OVERRIDING SYSTEM VALUE VALUES (1, 'Завершен');
INSERT INTO public.orders_status OVERRIDING SYSTEM VALUE VALUES (2, 'Новый ');


--
-- TOC entry 4985 (class 0 OID 36135)
-- Dependencies: 220
-- Data for Name: pickup_points; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (1, 420151, 'Лесной', 'Вишневая', 32);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (2, 125061, 'Лесной', 'Подгорная', 8);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (3, 630370, 'Лесной', 'Шоссейная', 24);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (4, 400562, 'Лесной', 'Зеленая', 32);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (5, 614510, 'Лесной', 'Маяковского', 47);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (6, 410542, 'Лесной', 'Светлая', 46);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (7, 620839, 'Лесной', 'Цветочная', 8);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (8, 443890, 'Лесной', 'Коммунистическая', 1);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (9, 603379, 'Лесной', 'Спортивная', 46);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (10, 603721, 'Лесной', 'Гоголя', 41);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (11, 410172, 'Лесной', 'Северная', 13);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (12, 614611, 'Лесной', 'Молодежная', 50);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (13, 454311, 'Лесной', 'Новая', 19);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (14, 660007, 'Лесной', 'Октябрьская', 19);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (15, 603036, 'Лесной', 'Садовая', 4);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (16, 394060, 'Лесной', 'Фрунзе', 43);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (17, 410661, 'Лесной', 'Школьная', 50);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (18, 625590, 'Лесной', 'Коммунистическая', 20);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (19, 625683, 'Лесной', '8 Марта', NULL);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (20, 450983, 'Лесной', 'Комсомольская', 26);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (21, 394782, 'Лесной', 'Чехова', 3);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (22, 603002, 'Лесной', 'Дзержинского', 28);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (23, 450558, 'Лесной', 'Набережная', 30);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (24, 344288, 'Лесной', 'Чехова', 1);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (25, 614164, 'Лесной', 'Степная', 30);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (26, 394242, 'Лесной', 'Коммунистическая', 43);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (27, 660540, 'Лесной', 'Солнечная', 25);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (28, 125837, 'Лесной', 'Шоссейная', 40);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (29, 125703, 'Лесной', 'Партизанская', 49);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (30, 625283, 'Лесной', 'Победы', 46);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (31, 614753, 'Лесной', 'Полевая', 35);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (32, 426030, 'Лесной', 'Маяковского', 44);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (33, 450375, 'Лесной', 'Клубная', 44);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (34, 625560, 'Лесной', 'Некрасова', 12);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (35, 630201, 'Лесной', 'Комсомольская', 17);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (36, 190949, 'Лесной', 'Мичурина', 26);


--
-- TOC entry 4999 (class 0 OID 36193)
-- Dependencies: 234
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (1, 'А112Т4', 'Прокляты и убиты', 1, 585, 1, 1, 1, 25, 6, 'Роман-эпопею "Прокляты и убиты" Виктора Астафьева по праву считают одним из самых сильных и пронзительных произведений отечественной военной прозы.', '1.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (2, 'G843H5', 'Тайны и загадки отца БраунаТайны и загадки отца Брауна', 1, 193, 2, 1, 1, 30, 9, 'Гилберт Кит Честертон — признанный классик английской литературы, один из самых ярких писателей первой половины XX века. Классикой стали его романы и многочисленные эссе, однако любовь массового читателя принесли ему рассказы об отце Брауне, тихом, застенчивом священнике, мастерски раскрывающем наиболее запутанные загадки и преступления. ', '2.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (3, 'D325D4', 'Девайс', 1, 1599, 3, 2, 1, 5, 12, 'Молодой фрилансер Захар Скаро устраивается на очередную подработку. Задача, казалось бы, тривиальная: тестирование нового устройства. Вот только вопрос в том, тестированием какой реальности занимается этот новый Девайс?', '3.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (4, 'S432T5', 'Необыкновенное обыкновенное чудо. Школьные истории', 1, 549, 4, 2, 1, 15, 15, NULL, '4.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (5, 'F325D4', 'Чук и Гек', 1, 209, 5, 2, 1, 18, 3, 'В книгу вошли повести и рассказы Аркадия Петровича Гайдара: "Чук и Гек", "Горячий камень" и "Сказка о военной тайне, о Мальчише-Кибальчише и его твердом слове"', '5.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (6, 'G432G6', 'Информационная безопасность. Национальные стандарты Российской Федерации. 3-е издание. Учебное пособие', 1, 3899, 6, 3, 2, 22, 3, 'В учебном пособии рассмотрено более 300 действующих открытых документов национальной системы стандартизации Российской Федерации, включая международные и межгосударственные стандарты в области информационной безопасности по состоянию на начало 2023 года.', '6.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (7, 'H542F5', 'Linux. Командная строка. Лучшие практики', 1, 1799, 7, 3, 2, 4, 5, 'Перейдите на новый уровень работы в Linux! Если вы системный администратор, разработчик программного обеспечения, SRE-инженер или пользователь Linux, книга поможет вам работать быстрее, элегантнее и эффективнее. ', '7.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (8, 'C346F5', 'Квантовые миры и возникновение пространства-времени', 1, 1349, 8, 3, 2, 5, 4, 'Шон Кэрролл — физик-теоретик и один из самых известных в мире популяризаторов науки — заставляет нас по-новому взглянуть на физику. Столкновение с главной загадкой квантовой механики полностью поменяет наши представления о пространстве и времени.', '8.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (9, 'F256G6', 'Вселенная. Происхождение жизни, смысл нашего существования и огромный космос', 1, 1799, 8, 3, 2, 6, 2, 'Знаменитый физик Шон Кэрролл в свойственной ему увлекательной манере объясняет принципы, которые лежат в основах научных революций от Дарвина до Эйнштейна, и показывает как невероятные научные открытия последнего столетия изменили наш мир.', NULL);
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (10, 'J532V5', 'Пушкин. Бродский. Империя и судьба. В 2-х томах (комплект из 2-х книг)', 1, 529, 9, 4, 3, 8, 6, 'Первая книга двухтомника «Пушкин. Бродский. Империя и судьба» пронизана пушкинской темой. Пушкин — «певец империи и свободы» — присутствует даже там, где он впрямую не упоминается, ибо его судьба, как и судьба других героев книги, органично связана с трагедией великой империи.', '10.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (11, 'G643F4', 'Иосиф Бродский. Избранные эссе (комплект из 6-ти книг)', 1, 4925, 10, 5, 3, 2, 24, 'Шесть сборников избранных эссе Иосифа Бродского (1940-1996), великого поэта, драматурга, мыслителя, лауреата Нобелевской премии по литературе (1987): «Будущее или далекое прошлое», «Верь своей боли», «Как читать книгу», «О русской литературе», «О тирании», «Путеводитель по переименованному городу». Все тексты представлены на английском языке и в переводе на русский и открывают автора не только как поэта, но как историка, критика, и глубокого и ироничного мыслителя.', '11.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (12, 'J326V5', 'Тысячелетие императорской керамикиv', 1, 2599, 11, 5, 3, 5, 4, 'Фарфор стал величайшим символом китайской культуры. Это одно из выдающихся изобретений, внесших неоценимый вклад в мировую цивилизацию. ', '12.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (13, 'J632F6', 'Вечные спутники: Портреты из всемирной литературы', 1, 1599, 12, 5, 3, 0, 6, 'Книга "Вечные спутники" - это цикл критических очерков о культуре и великих литераторах, сопровождавших жизнь и творчество русского писателя, поэта, литературного критика и общественного деятеля Дмитрия Мережковского (1865–1941). ', '13.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (14, 'G632H6', 'Формирование литературной репутации Н.Г.Чернышевского в ХIX-XXI веках', 1, 1349, 13, 6, 3, 2, 8, 'Монография Д. А. Щербакова - новаторская. Поэтапно рассмотрены не только многочисленные суждения известных отечественных и зарубежных критиков, литературоведов, философов и политиков, различным образом характеризовавших Н. Г. Чернышевского в связи и вне связи со знаменитым романом "Что делать? ', '14.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (15, 'M642E5', 'Теория искусства. Краткий путеводитель', 1, 879, 14, 6, 3, 3, 2, NULL, '15.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (16, 'G543F5', 'Религиозные верования с древнейших времен до наших дней', 1, 879, 13, 7, 3, 4, 6, 'Настоящее издание представляет собой сборник переводов лекций по истории дохристианских и нехристианских религий, прочитанных в Лондоне в период с 1888 по 1891 гг. авторитетными исследователями данного раздела религиоведения. ', '16.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (17, 'B653G6', 'Русский язык: Первые шаги. Часть 3. Учебное пособие', 1, 2699, 15, 8, 4, 8, 9, 'Пособие является завершающей частью учебного комплекса. Третья часть содержит 10 уроков (21-30, последний-повторительный). Усвоение лексико-грамматического материала рассчитано примерно на 200-240 часов аудиторных занятий. ', '17.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (18, 'J735J7', 'Синтетический образ индивидуального психического мира', 1, 1099, 16, 8, 3, 9, 4, 'Психика подобна определенным объектам, это фиксируют сами люди в языке и искусстве. В данном исследовании рассматриваются в этом плане образы сосуда, воронки, дерева и крепости.', '18.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (19, 'H436H7', 'Английский язык в спорте: Учебное пособие', 1, 1999, 17, 9, 4, 2, 0, 'Учебное пособие подготовлено для слушателей, изу чающих английский язык как язык специальности', '19.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (20, 'H475R5', 'Лексика и грамматика современного китайского языка (к тому II учебника «Новый практический курс китайского языка» под редакцией Лю Сюня): учебное пособие', 1, 608, 18, 10, 4, 25, 12, 'Пособие выступает дополнением ко второму тому учебника «Новый практический курс китайского языка» (под редакцией Лю Сюня). ', '20.jpg');


--
-- TOC entry 4993 (class 0 OID 36172)
-- Dependencies: 228
-- Data for Name: providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.providers OVERRIDING SYSTEM VALUE VALUES (1, 'Виктор Астафьев');
INSERT INTO public.providers OVERRIDING SYSTEM VALUE VALUES (2, 'Гилберт Кит Честертон');
INSERT INTO public.providers OVERRIDING SYSTEM VALUE VALUES (3, 'Кирилл Каланджи');
INSERT INTO public.providers OVERRIDING SYSTEM VALUE VALUES (4, 'Людмила Улицкая');
INSERT INTO public.providers OVERRIDING SYSTEM VALUE VALUES (5, 'Аркадий Гайдар');
INSERT INTO public.providers OVERRIDING SYSTEM VALUE VALUES (6, 'Юрий Родичев');
INSERT INTO public.providers OVERRIDING SYSTEM VALUE VALUES (7, 'Дэниел Джей Барретт');
INSERT INTO public.providers OVERRIDING SYSTEM VALUE VALUES (8, 'Шон Кэрролл');
INSERT INTO public.providers OVERRIDING SYSTEM VALUE VALUES (9, 'Яков Гордин');
INSERT INTO public.providers OVERRIDING SYSTEM VALUE VALUES (10, 'Иосиф Бродский');
INSERT INTO public.providers OVERRIDING SYSTEM VALUE VALUES (11, 'Янь Чуннянь Янь Чуннянь');
INSERT INTO public.providers OVERRIDING SYSTEM VALUE VALUES (12, 'Дмитрий Мережковский');
INSERT INTO public.providers OVERRIDING SYSTEM VALUE VALUES (13, 'Дмитрий Щербаков');
INSERT INTO public.providers OVERRIDING SYSTEM VALUE VALUES (14, 'Роджер Осборн, Дэн Стерджис');
INSERT INTO public.providers OVERRIDING SYSTEM VALUE VALUES (15, 'Любовь Беликова, Инна Ерофеева, Татьяна Шутова');
INSERT INTO public.providers OVERRIDING SYSTEM VALUE VALUES (16, 'Сергей Моргачев');
INSERT INTO public.providers OVERRIDING SYSTEM VALUE VALUES (17, 'Екатерина Габарта, Ирина Игнатьева');
INSERT INTO public.providers OVERRIDING SYSTEM VALUE VALUES (18, 'Татьяна Лопаткина, Софья Маннапова');


--
-- TOC entry 4987 (class 0 OID 36144)
-- Dependencies: 222
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles OVERRIDING SYSTEM VALUE VALUES (1, 'Администратор');
INSERT INTO public.roles OVERRIDING SYSTEM VALUE VALUES (2, 'Менеджер');
INSERT INTO public.roles OVERRIDING SYSTEM VALUE VALUES (3, 'Авторизированный клиент');


--
-- TOC entry 4991 (class 0 OID 36165)
-- Dependencies: 226
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.units OVERRIDING SYSTEM VALUE VALUES (1, 'шт.');


--
-- TOC entry 4989 (class 0 OID 36151)
-- Dependencies: 224
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Никифорова', 'Анна', 'Семеновна', '94d5ous@gmail.com', 'uzWC67');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (2, 1, 'Стелина', 'Евгения', 'Петровна', 'uth4iz@mail.com', '2L6KZG');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (3, 1, 'Михайлюк', 'Анна', 'Вячеславовна', '5d4zbu@tutanota.com', 'rwVDh9');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (4, 2, 'Ситдикова', 'Елена', 'Анатольевна', 'ptec8ym@yahoo.com', 'LdNyos');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (5, 2, 'Ворсин', 'Петр', 'Евгеньевич', '1qz4kw@mail.com', 'gynQMT');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (6, 2, 'Старикова', 'Елена', 'Павловна', '4np6se@mail.com', 'AtnDjr');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (7, 3, 'Никифорова', 'Весения', 'Николаевна', 'yzls62@outlook.com', 'JlFRCZ');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (8, 3, 'Сазонов', 'Руслан', 'Германович', '1diph5e@tutanota.com', '8ntwUp');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (9, 3, 'Одинцов', 'Серафим', 'Артёмович', 'tjde7c@yahoo.com', 'YOyhfR');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (10, 3, 'Степанов', 'Михаил', 'Артёмович', 'wpmrc3do@tutanota.com', 'RSbvHv');


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 231
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 4, true);


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 229
-- Name: manufacturers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.manufacturers_id_seq', 10, true);


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 235
-- Name: orders_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_article_id_seq', 60, true);


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 239
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 10, true);


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 237
-- Name: orders_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_status_id_seq', 2, true);


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 219
-- Name: pickup_points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pickup_points_id_seq', 36, true);


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 233
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 20, true);


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 227
-- Name: providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.providers_id_seq', 18, true);


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 221
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 225
-- Name: units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.units_id_seq', 1, true);


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 223
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- TOC entry 4818 (class 2606 OID 36191)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4816 (class 2606 OID 36184)
-- Name: manufacturers manufacturers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturers_pkey PRIMARY KEY (id);


--
-- TOC entry 4822 (class 2606 OID 36229)
-- Name: orders_article orders_article_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_article
    ADD CONSTRAINT orders_article_pkey PRIMARY KEY (id);


--
-- TOC entry 4826 (class 2606 OID 36304)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4824 (class 2606 OID 36236)
-- Name: orders_status orders_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_status
    ADD CONSTRAINT orders_status_pkey PRIMARY KEY (id);


--
-- TOC entry 4806 (class 2606 OID 36142)
-- Name: pickup_points pickup_points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_points
    ADD CONSTRAINT pickup_points_pkey PRIMARY KEY (id);


--
-- TOC entry 4820 (class 2606 OID 36200)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 4814 (class 2606 OID 36177)
-- Name: providers providers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.providers
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);


--
-- TOC entry 4808 (class 2606 OID 36149)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4812 (class 2606 OID 36170)
-- Name: units units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- TOC entry 4810 (class 2606 OID 36158)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4832 (class 2606 OID 36320)
-- Name: orders_article orders_article_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_article
    ADD CONSTRAINT orders_article_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4833 (class 2606 OID 36264)
-- Name: orders_article orders_article_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_article
    ADD CONSTRAINT orders_article_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4834 (class 2606 OID 36315)
-- Name: orders orders_order_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_order_status_id_fkey FOREIGN KEY (order_status_id) REFERENCES public.orders_status(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4835 (class 2606 OID 36305)
-- Name: orders orders_pickup_point_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pickup_point_id_fkey FOREIGN KEY (pickup_point_id) REFERENCES public.pickup_points(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4836 (class 2606 OID 36310)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4828 (class 2606 OID 36216)
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4829 (class 2606 OID 36211)
-- Name: products products_manufaturer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_manufaturer_id_fkey FOREIGN KEY (manufacturer_id) REFERENCES public.manufacturers(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4830 (class 2606 OID 36206)
-- Name: products products_provider_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_provider_id_fkey FOREIGN KEY (provider_id) REFERENCES public.providers(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4831 (class 2606 OID 36201)
-- Name: products products_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.units(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4827 (class 2606 OID 36159)
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2026-06-10 17:06:02

--
-- PostgreSQL database dump complete
--

\unrestrict yLA9IFjuQ3OaucqwbafkyBCVM73ZvTVod6Ecw1lQeQBVcC88BToLp688WRfhRhl

