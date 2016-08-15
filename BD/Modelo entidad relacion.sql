--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.3

-- Started on 2016-08-03 05:21:39 COT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12363)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 16394)
-- Name: comentarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comentarios (
    id integer NOT NULL,
    autor integer,
    materia_ejecucion_id integer,
    descripcion character(500),
    usuario_id integer,
    tipo integer NOT NULL,
    created timestamp without time zone DEFAULT now()
);


ALTER TABLE comentarios OWNER TO postgres;

--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN comentarios.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comentarios.id IS 'LLave primeria de la tabla';


--
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN comentarios.autor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comentarios.autor IS 'Representa el autor del comentario 1 docente 2 estudiante o representante.';


--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN comentarios.materia_ejecucion_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comentarios.materia_ejecucion_id IS 'LLave primaria del  tema dictado';


--
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN comentarios.descripcion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comentarios.descripcion IS 'Descripción del comentario del docente';


--
-- TOC entry 2257 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN comentarios.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comentarios.usuario_id IS 'Usuario que realiza el comentario';


--
-- TOC entry 2258 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN comentarios.tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comentarios.tipo IS 'Representa el tipo de comentario ';


--
-- TOC entry 182 (class 1259 OID 16400)
-- Name: comentarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comentarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comentarios_id_seq OWNER TO postgres;

--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 182
-- Name: comentarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comentarios_id_seq OWNED BY comentarios.id;


--
-- TOC entry 183 (class 1259 OID 16402)
-- Name: cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cursos (
    id integer NOT NULL,
    nombre character(250)
);


ALTER TABLE cursos OWNER TO postgres;

--
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 183
-- Name: TABLE cursos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE cursos IS 'Los cursos de una carrera';


--
-- TOC entry 2261 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN cursos.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cursos.id IS 'LLave primaria del curso
';


--
-- TOC entry 2262 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN cursos.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cursos.nombre IS 'Nombre descriptivo de  la materia';


--
-- TOC entry 184 (class 1259 OID 16405)
-- Name: cursos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cursos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cursos_id_seq OWNER TO postgres;

--
-- TOC entry 2263 (class 0 OID 0)
-- Dependencies: 184
-- Name: cursos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cursos_id_seq OWNED BY cursos.id;


--
-- TOC entry 185 (class 1259 OID 16407)
-- Name: cursos_materias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cursos_materias (
    curso_id integer,
    materia_id integer,
    id integer NOT NULL
);


ALTER TABLE cursos_materias OWNER TO postgres;

--
-- TOC entry 2264 (class 0 OID 0)
-- Dependencies: 185
-- Name: TABLE cursos_materias; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE cursos_materias IS 'Representa la relacion de cursos con las materias ';


--
-- TOC entry 2265 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN cursos_materias.curso_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cursos_materias.curso_id IS 'LLave primaria del curso';


--
-- TOC entry 2266 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN cursos_materias.materia_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cursos_materias.materia_id IS 'Representa la materia asignada';


--
-- TOC entry 203 (class 1259 OID 24694)
-- Name: cursos_materias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cursos_materias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cursos_materias_id_seq OWNER TO postgres;

--
-- TOC entry 2267 (class 0 OID 0)
-- Dependencies: 203
-- Name: cursos_materias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cursos_materias_id_seq OWNED BY cursos_materias.id;


--
-- TOC entry 186 (class 1259 OID 16410)
-- Name: cursos_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cursos_usuarios (
    usuario_id integer,
    curso_id integer,
    tipo integer,
    id integer NOT NULL
);


ALTER TABLE cursos_usuarios OWNER TO postgres;

--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 186
-- Name: TABLE cursos_usuarios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE cursos_usuarios IS 'Representa el curso asignado a un usuario';


--
-- TOC entry 2269 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN cursos_usuarios.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cursos_usuarios.usuario_id IS 'Usuario que  interactua con el curso';


--
-- TOC entry 2270 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN cursos_usuarios.curso_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cursos_usuarios.curso_id IS 'Curso referenciado al usuario';


--
-- TOC entry 2271 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN cursos_usuarios.tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cursos_usuarios.tipo IS 'Representa el tipo de relación con el curso 1 docente, 2 estudiante....';


--
-- TOC entry 204 (class 1259 OID 24702)
-- Name: cursos_usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cursos_usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cursos_usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 2272 (class 0 OID 0)
-- Dependencies: 204
-- Name: cursos_usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cursos_usuarios_id_seq OWNED BY cursos_usuarios.id;


--
-- TOC entry 187 (class 1259 OID 16413)
-- Name: materias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE materias (
    id integer NOT NULL,
    nombre character(250)
);


ALTER TABLE materias OWNER TO postgres;

--
-- TOC entry 2273 (class 0 OID 0)
-- Dependencies: 187
-- Name: TABLE materias; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE materias IS 'Representa las materias que se asignaran a los cursos';


--
-- TOC entry 2274 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN materias.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias.nombre IS 'Nombre descriptivo de la materia';


--
-- TOC entry 188 (class 1259 OID 16416)
-- Name: materias_docente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE materias_docente (
    materia_id integer NOT NULL,
    docente_id integer NOT NULL,
    created timestamp without time zone NOT NULL,
    id integer NOT NULL
);


ALTER TABLE materias_docente OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 24654)
-- Name: materias_docente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE materias_docente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE materias_docente_id_seq OWNER TO postgres;

--
-- TOC entry 2275 (class 0 OID 0)
-- Dependencies: 201
-- Name: materias_docente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE materias_docente_id_seq OWNED BY materias_docente.id;


--
-- TOC entry 189 (class 1259 OID 16419)
-- Name: materias_ejecucion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE materias_ejecucion (
    materia_plan_id integer,
    docente_id integer,
    representante_id integer,
    confirmado "char",
    created timestamp without time zone DEFAULT now(),
    update timestamp without time zone DEFAULT now(),
    tema_id integer,
    id integer NOT NULL,
    horas integer
);


ALTER TABLE materias_ejecucion OWNER TO postgres;

--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN materias_ejecucion.confirmado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_ejecucion.confirmado IS 'Representa el estado del registro [ N=> no confirmado, S=>  confirmado]';


--
-- TOC entry 2277 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN materias_ejecucion.created; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_ejecucion.created IS 'Fecha del registro';


--
-- TOC entry 2278 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN materias_ejecucion.update; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_ejecucion.update IS 'Fecha en la que se hace un cambios en el registro';


--
-- TOC entry 2279 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN materias_ejecucion.tema_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_ejecucion.tema_id IS 'Representa el tema que dicta el docente';


--
-- TOC entry 2280 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN materias_ejecucion.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_ejecucion.id IS 'LLave primaria de la tabla';


--
-- TOC entry 2281 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN materias_ejecucion.horas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_ejecucion.horas IS 'Numero de horas trabajadas por el docente';


--
-- TOC entry 200 (class 1259 OID 16503)
-- Name: materias_ejecucion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE materias_ejecucion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE materias_ejecucion_id_seq OWNER TO postgres;

--
-- TOC entry 2282 (class 0 OID 0)
-- Dependencies: 200
-- Name: materias_ejecucion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE materias_ejecucion_id_seq OWNED BY materias_ejecucion.id;


--
-- TOC entry 190 (class 1259 OID 16422)
-- Name: materias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE materias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE materias_id_seq OWNER TO postgres;

--
-- TOC entry 2283 (class 0 OID 0)
-- Dependencies: 190
-- Name: materias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE materias_id_seq OWNED BY materias.id;


--
-- TOC entry 191 (class 1259 OID 16424)
-- Name: materias_plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE materias_plan (
    id integer NOT NULL,
    curso_id integer,
    materia_id integer,
    horas integer,
    fecha date,
    created timestamp without time zone,
    semana integer,
    update timestamp without time zone,
    tema_id integer
);


ALTER TABLE materias_plan OWNER TO postgres;

--
-- TOC entry 2284 (class 0 OID 0)
-- Dependencies: 191
-- Name: TABLE materias_plan; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE materias_plan IS 'Representa el plan de estudios para la materias de un curso determinado.';


--
-- TOC entry 2285 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN materias_plan.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_plan.id IS 'LLave primaria de la tabla';


--
-- TOC entry 2286 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN materias_plan.curso_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_plan.curso_id IS 'Curso';


--
-- TOC entry 2287 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN materias_plan.horas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_plan.horas IS 'Numero de horas que dura el tema';


--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN materias_plan.fecha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_plan.fecha IS 'Fecha en la que se lleva a cabo la tematica';


--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN materias_plan.created; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_plan.created IS 'Fecha de creación del registro';


--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN materias_plan.semana; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_plan.semana IS 'Numero de la semana en la que se debe presentar el tema';


--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN materias_plan.tema_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_plan.tema_id IS 'Representa el tema sugerido que debe presentar el docente';


--
-- TOC entry 192 (class 1259 OID 16427)
-- Name: materias_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE materias_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE materias_plan_id_seq OWNER TO postgres;

--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 192
-- Name: materias_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE materias_plan_id_seq OWNED BY materias_plan.id;


--
-- TOC entry 199 (class 1259 OID 16457)
-- Name: materias_plan_temas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE materias_plan_temas (
    id integer NOT NULL,
    titulo character(500),
    materia_id integer NOT NULL
);


ALTER TABLE materias_plan_temas OWNER TO postgres;

--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN materias_plan_temas.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_plan_temas.id IS 'Llave primeria de la tabla';


--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN materias_plan_temas.titulo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_plan_temas.titulo IS 'Nombre descriptivo del tema';


--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN materias_plan_temas.materia_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_plan_temas.materia_id IS 'Materia a la que pertenece el tema';


--
-- TOC entry 198 (class 1259 OID 16455)
-- Name: materias_plan_temas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE materias_plan_temas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE materias_plan_temas_id_seq OWNER TO postgres;

--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 198
-- Name: materias_plan_temas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE materias_plan_temas_id_seq OWNED BY materias_plan_temas.id;


--
-- TOC entry 193 (class 1259 OID 16429)
-- Name: perfiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE perfiles (
    id integer NOT NULL,
    nombre character(100),
    created date
);


ALTER TABLE perfiles OWNER TO postgres;

--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 193
-- Name: TABLE perfiles; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE perfiles IS 'Representa los perfiles de los usuarios';


--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN perfiles.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN perfiles.id IS 'Representa la llave primaria de la tabla';


--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN perfiles.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN perfiles.nombre IS 'Nombre descriptivo del perfil de usuarios';


--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN perfiles.created; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN perfiles.created IS 'Fecha de registro del perfil';


--
-- TOC entry 194 (class 1259 OID 16432)
-- Name: perfiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE perfiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE perfiles_id_seq OWNER TO postgres;

--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 194
-- Name: perfiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE perfiles_id_seq OWNED BY perfiles.id;


--
-- TOC entry 195 (class 1259 OID 16434)
-- Name: perfiles_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE perfiles_usuarios (
    usuario_id integer,
    perfil_id integer,
    id integer NOT NULL
);


ALTER TABLE perfiles_usuarios OWNER TO postgres;

--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 195
-- Name: TABLE perfiles_usuarios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE perfiles_usuarios IS 'Representa los perfiles de cada usuarios del sistema';


--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN perfiles_usuarios.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN perfiles_usuarios.usuario_id IS 'llave primaria del usuario
';


--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN perfiles_usuarios.perfil_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN perfiles_usuarios.perfil_id IS 'representa el perfil asignado al usuario';


--
-- TOC entry 202 (class 1259 OID 24686)
-- Name: perfiles_usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE perfiles_usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE perfiles_usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 202
-- Name: perfiles_usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE perfiles_usuarios_id_seq OWNED BY perfiles_usuarios.id;


--
-- TOC entry 196 (class 1259 OID 16437)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuarios (
    id integer NOT NULL,
    email character(300),
    password character(100),
    created timestamp without time zone,
    updated timestamp without time zone,
    nombre character(250)
);


ALTER TABLE usuarios OWNER TO postgres;

--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN usuarios.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.id IS 'LLave primaria de la tabla de  usuarios';


--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN usuarios.email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.email IS 'email del usuario';


--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN usuarios.password; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.password IS 'Password del usuario';


--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN usuarios.created; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.created IS 'Fecha de creación del registro';


--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN usuarios.updated; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.updated IS 'Fecha de actualización del registro';


--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN usuarios.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.nombre IS 'Nombre completo del usuario';


--
-- TOC entry 197 (class 1259 OID 16443)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 197
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuarios_id_seq OWNED BY usuarios.id;


--
-- TOC entry 2056 (class 2604 OID 16445)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentarios ALTER COLUMN id SET DEFAULT nextval('comentarios_id_seq'::regclass);


--
-- TOC entry 2058 (class 2604 OID 16446)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cursos ALTER COLUMN id SET DEFAULT nextval('cursos_id_seq'::regclass);


--
-- TOC entry 2059 (class 2604 OID 24696)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cursos_materias ALTER COLUMN id SET DEFAULT nextval('cursos_materias_id_seq'::regclass);


--
-- TOC entry 2060 (class 2604 OID 24704)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cursos_usuarios ALTER COLUMN id SET DEFAULT nextval('cursos_usuarios_id_seq'::regclass);


--
-- TOC entry 2061 (class 2604 OID 16447)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias ALTER COLUMN id SET DEFAULT nextval('materias_id_seq'::regclass);


--
-- TOC entry 2062 (class 2604 OID 24656)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_docente ALTER COLUMN id SET DEFAULT nextval('materias_docente_id_seq'::regclass);


--
-- TOC entry 2063 (class 2604 OID 16505)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_ejecucion ALTER COLUMN id SET DEFAULT nextval('materias_ejecucion_id_seq'::regclass);


--
-- TOC entry 2066 (class 2604 OID 16448)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_plan ALTER COLUMN id SET DEFAULT nextval('materias_plan_id_seq'::regclass);


--
-- TOC entry 2070 (class 2604 OID 16460)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_plan_temas ALTER COLUMN id SET DEFAULT nextval('materias_plan_temas_id_seq'::regclass);


--
-- TOC entry 2067 (class 2604 OID 16449)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfiles ALTER COLUMN id SET DEFAULT nextval('perfiles_id_seq'::regclass);


--
-- TOC entry 2068 (class 2604 OID 24688)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfiles_usuarios ALTER COLUMN id SET DEFAULT nextval('perfiles_usuarios_id_seq'::regclass);


--
-- TOC entry 2069 (class 2604 OID 16450)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);


--
-- TOC entry 2221 (class 0 OID 16394)
-- Dependencies: 181
-- Data for Name: comentarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comentarios (id, autor, materia_ejecucion_id, descripcion, usuario_id, tipo, created) FROM stdin;
1	2	1	Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta)                                                                                                                                                                                                                                                                       	1	1	2016-07-30 11:11:42.400256
2	1	1	Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen.                                                                                                                                                        	1	1	2016-07-30 11:11:42.400256
3	1	1	Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen.                                                                                                                                                        	1	1	2016-07-30 11:11:42.400256
4	1	1	Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen.                                                                                                                                                        	1	1	2016-07-30 11:11:42.400256
5	1	1	Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen.                                                                                                                                                        	1	1	2016-07-30 11:11:42.400256
6	2	1	dsadadasda                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          	2	1	2016-07-30 11:11:42.400256
7	2	1	comentario                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          	2	1	2016-07-30 11:41:27.752426
8	2	1	comentario                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          	2	1	2016-07-30 11:42:20.164303
9	2	1	111                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 	2	1	2016-07-30 11:42:47.123599
10	2	1	nuevo comentario                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    	2	1	2016-07-30 11:44:15.05887
\.


--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 182
-- Name: comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comentarios_id_seq', 10, true);


--
-- TOC entry 2223 (class 0 OID 16402)
-- Dependencies: 183
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cursos (id, nombre) FROM stdin;
3	Ingeniería Industrial                                                                                                                                                                                                                                     
4	Ingeniería Sistemas                                                                                                                                                                                                                                       
5	Administrador                                                                                                                                                                                                                                             
\.


--
-- TOC entry 2314 (class 0 OID 0)
-- Dependencies: 184
-- Name: cursos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cursos_id_seq', 5, true);


--
-- TOC entry 2225 (class 0 OID 16407)
-- Dependencies: 185
-- Data for Name: cursos_materias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cursos_materias (curso_id, materia_id, id) FROM stdin;
4	1	1
4	2	2
4	3	3
\.


--
-- TOC entry 2315 (class 0 OID 0)
-- Dependencies: 203
-- Name: cursos_materias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cursos_materias_id_seq', 3, true);


--
-- TOC entry 2226 (class 0 OID 16410)
-- Dependencies: 186
-- Data for Name: cursos_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cursos_usuarios (usuario_id, curso_id, tipo, id) FROM stdin;
1	4	2	1
2	4	1	2
\.


--
-- TOC entry 2316 (class 0 OID 0)
-- Dependencies: 204
-- Name: cursos_usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cursos_usuarios_id_seq', 2, true);


--
-- TOC entry 2227 (class 0 OID 16413)
-- Dependencies: 187
-- Data for Name: materias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY materias (id, nombre) FROM stdin;
2	Ingles                                                                                                                                                                                                                                                    
1	Fundamentos de Matemáticas                                                                                                                                                                                                                                
3	Lógica Matemática                                                                                                                                                                                                                                         
4	Fundamentos de Programación                                                                                                                                                                                                                               
5	Habilidades Comunicativas                                                                                                                                                                                                                                 
\.


--
-- TOC entry 2228 (class 0 OID 16416)
-- Dependencies: 188
-- Data for Name: materias_docente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY materias_docente (materia_id, docente_id, created, id) FROM stdin;
1	2	2016-07-26 20:21:09.026646	1
2	2	2016-07-26 20:21:16.74738	2
3	2	2016-07-26 20:21:23.87231	3
\.


--
-- TOC entry 2317 (class 0 OID 0)
-- Dependencies: 201
-- Name: materias_docente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('materias_docente_id_seq', 3, true);


--
-- TOC entry 2229 (class 0 OID 16419)
-- Dependencies: 189
-- Data for Name: materias_ejecucion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY materias_ejecucion (materia_plan_id, docente_id, representante_id, confirmado, created, update, tema_id, id, horas) FROM stdin;
3	2	\N	s	2016-07-30 11:57:36.035461	2016-07-30 11:57:36.035461	3	7	8
11	2	\N	s	2016-07-28 21:30:32.698265	2016-07-28 21:30:32.698265	1	4	5
2	2	\N	s	2016-07-28 21:31:21.620876	2016-07-28 21:31:21.620876	3	5	0
1	2	\N	s	2016-07-27 19:31:40.112009	2016-07-27 19:31:40.112009	4	1	12
\.


--
-- TOC entry 2318 (class 0 OID 0)
-- Dependencies: 200
-- Name: materias_ejecucion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('materias_ejecucion_id_seq', 7, true);


--
-- TOC entry 2319 (class 0 OID 0)
-- Dependencies: 190
-- Name: materias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('materias_id_seq', 5, true);


--
-- TOC entry 2231 (class 0 OID 16424)
-- Dependencies: 191
-- Data for Name: materias_plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY materias_plan (id, curso_id, materia_id, horas, fecha, created, semana, update, tema_id) FROM stdin;
1	4	1	8	2016-07-26	2016-07-26 20:22:20.741295	1	2016-07-26 20:22:20.741295	1
2	4	1	8	2016-07-26	2016-07-26 20:22:56.686074	2	2016-07-26 20:22:56.686074	2
3	4	1	8	2016-07-26	2016-07-26 20:23:30.008343	2	2016-07-26 20:23:30.008343	3
4	4	1	4	2016-07-26	2016-07-26 20:50:49.283603	4	2016-07-26 20:50:49.283603	4
5	4	1	4	2016-07-26	2016-07-26 20:51:29.113602	5	2016-07-26 20:51:29.113602	5
6	4	1	4	2016-07-26	2016-07-26 20:51:46.901812	6	2016-07-26 20:51:46.901812	6
7	4	1	4	2016-07-26	2016-07-26 20:51:58.988894	7	2016-07-26 20:51:58.988894	7
8	4	1	4	2016-07-26	2016-07-26 20:52:12.007417	8	2016-07-26 20:52:12.007417	8
9	4	1	4	2016-07-26	2016-07-26 20:52:22.71296	9	2016-07-26 20:52:22.71296	9
10	4	1	4	2016-07-26	2016-07-26 20:52:32.281276	10	2016-07-26 20:52:32.281276	1
11	4	1	4	2016-07-26	2016-07-26 20:53:20.803326	11	2016-07-26 20:53:20.803326	1
12	4	1	4	2016-07-26	2016-07-26 20:53:34.608086	12	2016-07-26 20:53:34.608086	1
13	4	1	4	2016-07-26	2016-07-26 20:54:00.452699	12	2016-07-26 20:54:00.452699	1
\.


--
-- TOC entry 2320 (class 0 OID 0)
-- Dependencies: 192
-- Name: materias_plan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('materias_plan_id_seq', 13, true);


--
-- TOC entry 2239 (class 0 OID 16457)
-- Dependencies: 199
-- Data for Name: materias_plan_temas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY materias_plan_temas (id, titulo, materia_id) FROM stdin;
1	Aritmética y algebra                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                	1
2	Analisis Matematico                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 	1
3	Estadistica y probabilidad                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          	1
4	Polinomios. Operaciones con polinomios. Descomposición factorial. Regla de Ruffini.                                                                                                                                                                                                                                                                                                                                                                                                                                 	1
5	Ecuación de segundo grado                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           	1
6	Factorización de polinomios                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         	1
7	Raíz de un polinomio                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                	1
8	Resolución de problemas mediante planteamiento algebraico                                                                                                                                                                                                                                                                                                                                                                                                                                                           	1
9	Ecuaciones irracionales sencillas, exponenciales y logarítmicas                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1
10	Logaritmo: utilidad y manejo de sus propiedades y aplicaciones                                                                                                                                                                                                                                                                                                                                                                                                                                                      	1
11	Sistema de ecuaciones lineales. Sistemas equivalentes                                                                                                                                                                                                                                                                                                                                                                                                                                                               	1
12	Sistemas compatibles e incompatibles                                                                                                                                                                                                                                                                                                                                                                                                                                                                                	1
\.


--
-- TOC entry 2321 (class 0 OID 0)
-- Dependencies: 198
-- Name: materias_plan_temas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('materias_plan_temas_id_seq', 12, true);


--
-- TOC entry 2233 (class 0 OID 16429)
-- Dependencies: 193
-- Data for Name: perfiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY perfiles (id, nombre, created) FROM stdin;
2	Docente                                                                                             	2016-07-26
1	Administrador                                                                                       	2016-07-26
3	Representante                                                                                       	2016-07-26
4	Estudiante                                                                                          	2016-07-27
\.


--
-- TOC entry 2322 (class 0 OID 0)
-- Dependencies: 194
-- Name: perfiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('perfiles_id_seq', 1, true);


--
-- TOC entry 2235 (class 0 OID 16434)
-- Dependencies: 195
-- Data for Name: perfiles_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY perfiles_usuarios (usuario_id, perfil_id, id) FROM stdin;
1	3	1
1	4	2
2	2	3
\.


--
-- TOC entry 2323 (class 0 OID 0)
-- Dependencies: 202
-- Name: perfiles_usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('perfiles_usuarios_id_seq', 3, true);


--
-- TOC entry 2236 (class 0 OID 16437)
-- Dependencies: 196
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuarios (id, email, password, created, updated, nombre) FROM stdin;
1	estudiante@proyecto.com                                                                                                                                                                                                                                                                                     	e10adc3949ba59abbe56e057f20f883e                                                                    	2016-07-26 19:45:56.647488	2016-07-26 19:45:56.647488	Pepito Perez                                                                                                                                                                                                                                              
2	docente@proyecto.com                                                                                                                                                                                                                                                                                        	e10adc3949ba59abbe56e057f20f883e                                                                    	2016-07-26 19:50:44.587815	2016-07-26 19:50:44.587815	Un docente                                                                                                                                                                                                                                                
\.


--
-- TOC entry 2324 (class 0 OID 0)
-- Dependencies: 197
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_id_seq', 1, false);


--
-- TOC entry 2072 (class 2606 OID 24601)
-- Name: comentarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentarios
    ADD CONSTRAINT comentarios_pkey PRIMARY KEY (id);


--
-- TOC entry 2076 (class 2606 OID 24701)
-- Name: cursos_materias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cursos_materias
    ADD CONSTRAINT cursos_materias_pkey PRIMARY KEY (id);


--
-- TOC entry 2074 (class 2606 OID 24608)
-- Name: cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (id);


--
-- TOC entry 2078 (class 2606 OID 24709)
-- Name: cursos_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cursos_usuarios
    ADD CONSTRAINT cursos_usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 2082 (class 2606 OID 24661)
-- Name: materias_docente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_docente
    ADD CONSTRAINT materias_docente_pkey PRIMARY KEY (id);


--
-- TOC entry 2084 (class 2606 OID 24712)
-- Name: materias_ejecucion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_ejecucion
    ADD CONSTRAINT materias_ejecucion_pkey PRIMARY KEY (id);


--
-- TOC entry 2080 (class 2606 OID 16452)
-- Name: materias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias
    ADD CONSTRAINT materias_pkey PRIMARY KEY (id);


--
-- TOC entry 2086 (class 2606 OID 16472)
-- Name: materias_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_plan
    ADD CONSTRAINT materias_plan_pkey PRIMARY KEY (id);


--
-- TOC entry 2094 (class 2606 OID 16462)
-- Name: materias_plan_temas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_plan_temas
    ADD CONSTRAINT materias_plan_temas_pkey PRIMARY KEY (id);


--
-- TOC entry 2088 (class 2606 OID 24673)
-- Name: perfiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfiles
    ADD CONSTRAINT perfiles_pkey PRIMARY KEY (id);


--
-- TOC entry 2090 (class 2606 OID 24693)
-- Name: perfiles_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfiles_usuarios
    ADD CONSTRAINT perfiles_usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 2092 (class 2606 OID 24680)
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 2095 (class 2606 OID 24602)
-- Name: comentarios_materia_ejecucion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentarios
    ADD CONSTRAINT comentarios_materia_ejecucion_id_fkey FOREIGN KEY (materia_ejecucion_id) REFERENCES materias_plan(id);


--
-- TOC entry 2096 (class 2606 OID 24609)
-- Name: cursos_materias_curso_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cursos_materias
    ADD CONSTRAINT cursos_materias_curso_id_fkey FOREIGN KEY (curso_id) REFERENCES cursos(id);


--
-- TOC entry 2097 (class 2606 OID 24614)
-- Name: cursos_materias_materia_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cursos_materias
    ADD CONSTRAINT cursos_materias_materia_id_fkey FOREIGN KEY (materia_id) REFERENCES materias(id);


--
-- TOC entry 2099 (class 2606 OID 24718)
-- Name: cursos_usuarios_curso_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cursos_usuarios
    ADD CONSTRAINT cursos_usuarios_curso_id_fkey FOREIGN KEY (curso_id) REFERENCES cursos(id);


--
-- TOC entry 2098 (class 2606 OID 24713)
-- Name: cursos_usuarios_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cursos_usuarios
    ADD CONSTRAINT cursos_usuarios_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuarios(id);


--
-- TOC entry 2101 (class 2606 OID 16478)
-- Name: fkey_temas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_ejecucion
    ADD CONSTRAINT fkey_temas FOREIGN KEY (tema_id) REFERENCES materias_plan_temas(id);


--
-- TOC entry 2100 (class 2606 OID 24649)
-- Name: materias_docente_materia_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_docente
    ADD CONSTRAINT materias_docente_materia_id_fkey FOREIGN KEY (materia_id) REFERENCES materias(id);


--
-- TOC entry 2102 (class 2606 OID 16498)
-- Name: materias_ejecucion_materia_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_ejecucion
    ADD CONSTRAINT materias_ejecucion_materia_plan_id_fkey FOREIGN KEY (materia_plan_id) REFERENCES materias_plan(id);


--
-- TOC entry 2103 (class 2606 OID 16473)
-- Name: materias_plan_tema_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_plan
    ADD CONSTRAINT materias_plan_tema_id_fkey FOREIGN KEY (tema_id) REFERENCES materias_plan_temas(id);


--
-- TOC entry 2106 (class 2606 OID 16466)
-- Name: materias_plan_temas_materia_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_plan_temas
    ADD CONSTRAINT materias_plan_temas_materia_id_fkey FOREIGN KEY (materia_id) REFERENCES materias(id);


--
-- TOC entry 2104 (class 2606 OID 24674)
-- Name: perfiles_usuarios_perfil_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfiles_usuarios
    ADD CONSTRAINT perfiles_usuarios_perfil_id_fkey FOREIGN KEY (perfil_id) REFERENCES perfiles(id);


--
-- TOC entry 2105 (class 2606 OID 24681)
-- Name: perfiles_usuarios_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfiles_usuarios
    ADD CONSTRAINT perfiles_usuarios_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuarios(id);


--
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-08-03 05:21:39 COT

--
-- PostgreSQL database dump complete
--

