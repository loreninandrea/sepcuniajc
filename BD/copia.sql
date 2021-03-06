toc.dat                                                                                             0000600 0004000 0002000 00000071021 12746362763 0014460 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                           t         	   programas    9.5.2    9.5.3 w    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         �           1262    16393 	   programas    DATABASE     {   CREATE DATABASE programas WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_CO.UTF-8' LC_CTYPE = 'es_CO.UTF-8';
    DROP DATABASE programas;
             postgres    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false         �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6         �           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                     3079    12363    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false         �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1         �            1259    16394    comentarios    TABLE     �   CREATE TABLE comentarios (
    id integer NOT NULL,
    autor integer,
    materia_ejecucion_id integer,
    descripcion character(500),
    usuario_id integer,
    created timestamp without time zone,
    tipo integer NOT NULL
);
    DROP TABLE public.comentarios;
       public         postgres    false    6         �           0    0    COLUMN comentarios.id    COMMENT     B   COMMENT ON COLUMN comentarios.id IS 'LLave primeria de la tabla';
            public       postgres    false    181         �           0    0    COLUMN comentarios.autor    COMMENT     u   COMMENT ON COLUMN comentarios.autor IS 'Representa el autor del comentario 1 docente 2 estudiante o representante.';
            public       postgres    false    181         �           0    0 '   COLUMN comentarios.materia_ejecucion_id    COMMENT     Z   COMMENT ON COLUMN comentarios.materia_ejecucion_id IS 'LLave primaria del  tema dictado';
            public       postgres    false    181         �           0    0    COLUMN comentarios.descripcion    COMMENT     X   COMMENT ON COLUMN comentarios.descripcion IS 'Descripción del comentario del docente';
            public       postgres    false    181         �           0    0    COLUMN comentarios.usuario_id    COMMENT     Q   COMMENT ON COLUMN comentarios.usuario_id IS 'Usuario que realiza el comentario';
            public       postgres    false    181         �           0    0    COLUMN comentarios.created    COMMENT     P   COMMENT ON COLUMN comentarios.created IS 'Fecha en la que se crea el registro';
            public       postgres    false    181         �           0    0    COLUMN comentarios.tipo    COMMENT     K   COMMENT ON COLUMN comentarios.tipo IS 'Representa el tipo de comentario ';
            public       postgres    false    181         �            1259    16400    comentarios_id_seq    SEQUENCE     t   CREATE SEQUENCE comentarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.comentarios_id_seq;
       public       postgres    false    181    6         �           0    0    comentarios_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE comentarios_id_seq OWNED BY comentarios.id;
            public       postgres    false    182         �            1259    16402    cursos    TABLE     L   CREATE TABLE cursos (
    id integer NOT NULL,
    nombre character(250)
);
    DROP TABLE public.cursos;
       public         postgres    false    6         �           0    0    TABLE cursos    COMMENT     8   COMMENT ON TABLE cursos IS 'Los cursos de una carrera';
            public       postgres    false    183         �           0    0    COLUMN cursos.id    COMMENT     =   COMMENT ON COLUMN cursos.id IS 'LLave primaria del curso
';
            public       postgres    false    183         �           0    0    COLUMN cursos.nombre    COMMENT     H   COMMENT ON COLUMN cursos.nombre IS 'Nombre descriptivo de  la materia';
            public       postgres    false    183         �            1259    16405    cursos_id_seq    SEQUENCE     o   CREATE SEQUENCE cursos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.cursos_id_seq;
       public       postgres    false    6    183         �           0    0    cursos_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE cursos_id_seq OWNED BY cursos.id;
            public       postgres    false    184         �            1259    16407    cursos_materias    TABLE     O   CREATE TABLE cursos_materias (
    curso_id integer,
    materia_id integer
);
 #   DROP TABLE public.cursos_materias;
       public         postgres    false    6         �           0    0    TABLE cursos_materias    COMMENT     Z   COMMENT ON TABLE cursos_materias IS 'Representa la relacion de cursos con las materias ';
            public       postgres    false    185         �           0    0    COLUMN cursos_materias.curso_id    COMMENT     J   COMMENT ON COLUMN cursos_materias.curso_id IS 'LLave primaria del curso';
            public       postgres    false    185         �           0    0 !   COLUMN cursos_materias.materia_id    COMMENT     R   COMMENT ON COLUMN cursos_materias.materia_id IS 'Representa la materia asignada';
            public       postgres    false    185         �            1259    16410    cursos_usuarios    TABLE     a   CREATE TABLE cursos_usuarios (
    usuario_id integer,
    curso_id integer,
    tipo integer
);
 #   DROP TABLE public.cursos_usuarios;
       public         postgres    false    6         �           0    0    TABLE cursos_usuarios    COMMENT     Q   COMMENT ON TABLE cursos_usuarios IS 'Representa el curso asignado a un usuario';
            public       postgres    false    186         �           0    0 !   COLUMN cursos_usuarios.usuario_id    COMMENT     X   COMMENT ON COLUMN cursos_usuarios.usuario_id IS 'Usuario que  interactua con el curso';
            public       postgres    false    186         �           0    0    COLUMN cursos_usuarios.curso_id    COMMENT     O   COMMENT ON COLUMN cursos_usuarios.curso_id IS 'Curso referenciado al usuario';
            public       postgres    false    186         �           0    0    COLUMN cursos_usuarios.tipo    COMMENT     v   COMMENT ON COLUMN cursos_usuarios.tipo IS 'Representa el tipo de relación con el curso 1 docente, 2 estudiante....';
            public       postgres    false    186         �            1259    16413    materias    TABLE     N   CREATE TABLE materias (
    id integer NOT NULL,
    nombre character(250)
);
    DROP TABLE public.materias;
       public         postgres    false    6         �           0    0    TABLE materias    COMMENT     V   COMMENT ON TABLE materias IS 'Representa las materias que se asignaran a los cursos';
            public       postgres    false    187         �           0    0    COLUMN materias.nombre    COMMENT     I   COMMENT ON COLUMN materias.nombre IS 'Nombre descriptivo de la materia';
            public       postgres    false    187         �            1259    16416    materias_docente    TABLE     �   CREATE TABLE materias_docente (
    materia_id integer NOT NULL,
    docente_id integer NOT NULL,
    created timestamp without time zone NOT NULL
);
 $   DROP TABLE public.materias_docente;
       public         postgres    false    6         �            1259    16419    materias_ejecucion    TABLE       CREATE TABLE materias_ejecucion (
    materia_plan_id integer,
    docente_id integer,
    representante_id integer,
    confirmado "char",
    created timestamp without time zone,
    update timestamp without time zone,
    tema_id integer,
    id integer NOT NULL
);
 &   DROP TABLE public.materias_ejecucion;
       public         postgres    false    6         �           0    0 $   COLUMN materias_ejecucion.confirmado    COMMENT     ~   COMMENT ON COLUMN materias_ejecucion.confirmado IS 'Representa el estado del registro [ N=> no confirmado, S=>  confirmado]';
            public       postgres    false    189         �           0    0 !   COLUMN materias_ejecucion.created    COMMENT     F   COMMENT ON COLUMN materias_ejecucion.created IS 'Fecha del registro';
            public       postgres    false    189         �           0    0     COLUMN materias_ejecucion.update    COMMENT     d   COMMENT ON COLUMN materias_ejecucion.update IS 'Fecha en la que se hace un cambios en el registro';
            public       postgres    false    189         �           0    0 !   COLUMN materias_ejecucion.tema_id    COMMENT     [   COMMENT ON COLUMN materias_ejecucion.tema_id IS 'Representa el tema que dicta el docente';
            public       postgres    false    189         �           0    0    COLUMN materias_ejecucion.id    COMMENT     I   COMMENT ON COLUMN materias_ejecucion.id IS 'LLave primaria de la tabla';
            public       postgres    false    189         �            1259    16503    materias_ejecucion_id_seq    SEQUENCE     {   CREATE SEQUENCE materias_ejecucion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.materias_ejecucion_id_seq;
       public       postgres    false    189    6         �           0    0    materias_ejecucion_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE materias_ejecucion_id_seq OWNED BY materias_ejecucion.id;
            public       postgres    false    200         �            1259    16422    materias_id_seq    SEQUENCE     q   CREATE SEQUENCE materias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.materias_id_seq;
       public       postgres    false    187    6         �           0    0    materias_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE materias_id_seq OWNED BY materias.id;
            public       postgres    false    190         �            1259    16424    materias_plan    TABLE       CREATE TABLE materias_plan (
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
 !   DROP TABLE public.materias_plan;
       public         postgres    false    6         �           0    0    TABLE materias_plan    COMMENT     n   COMMENT ON TABLE materias_plan IS 'Representa el plan de estudios para la materias de un curso determinado.';
            public       postgres    false    191         �           0    0    COLUMN materias_plan.id    COMMENT     D   COMMENT ON COLUMN materias_plan.id IS 'LLave primaria de la tabla';
            public       postgres    false    191         �           0    0    COLUMN materias_plan.curso_id    COMMENT     5   COMMENT ON COLUMN materias_plan.curso_id IS 'Curso';
            public       postgres    false    191         �           0    0    COLUMN materias_plan.horas    COMMENT     M   COMMENT ON COLUMN materias_plan.horas IS 'Numero de horas que dura el tema';
            public       postgres    false    191         �           0    0    COLUMN materias_plan.fecha    COMMENT     X   COMMENT ON COLUMN materias_plan.fecha IS 'Fecha en la que se lleva a cabo la tematica';
            public       postgres    false    191         �           0    0    COLUMN materias_plan.created    COMMENT     N   COMMENT ON COLUMN materias_plan.created IS 'Fecha de creación del registro';
            public       postgres    false    191         �           0    0    COLUMN materias_plan.semana    COMMENT     e   COMMENT ON COLUMN materias_plan.semana IS 'Numero de la semana en la que se debe presentar el tema';
            public       postgres    false    191         �           0    0    COLUMN materias_plan.tema_id    COMMENT     h   COMMENT ON COLUMN materias_plan.tema_id IS 'Representa el tema sugerido que debe presentar el docente';
            public       postgres    false    191         �            1259    16427    materias_plan_id_seq    SEQUENCE     v   CREATE SEQUENCE materias_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.materias_plan_id_seq;
       public       postgres    false    191    6         �           0    0    materias_plan_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE materias_plan_id_seq OWNED BY materias_plan.id;
            public       postgres    false    192         �            1259    16457    materias_plan_temas    TABLE     z   CREATE TABLE materias_plan_temas (
    id integer NOT NULL,
    titulo character(500),
    materia_id integer NOT NULL
);
 '   DROP TABLE public.materias_plan_temas;
       public         postgres    false    6         �           0    0    COLUMN materias_plan_temas.id    COMMENT     J   COMMENT ON COLUMN materias_plan_temas.id IS 'Llave primeria de la tabla';
            public       postgres    false    199         �           0    0 !   COLUMN materias_plan_temas.titulo    COMMENT     O   COMMENT ON COLUMN materias_plan_temas.titulo IS 'Nombre descriptivo del tema';
            public       postgres    false    199         �           0    0 %   COLUMN materias_plan_temas.materia_id    COMMENT     Z   COMMENT ON COLUMN materias_plan_temas.materia_id IS 'Materia a la que pertenece el tema';
            public       postgres    false    199         �            1259    16455    materias_plan_temas_id_seq    SEQUENCE     |   CREATE SEQUENCE materias_plan_temas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.materias_plan_temas_id_seq;
       public       postgres    false    6    199         �           0    0    materias_plan_temas_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE materias_plan_temas_id_seq OWNED BY materias_plan_temas.id;
            public       postgres    false    198         �            1259    16429    perfiles    TABLE     `   CREATE TABLE perfiles (
    id integer NOT NULL,
    nombre character(100),
    created date
);
    DROP TABLE public.perfiles;
       public         postgres    false    6         �           0    0    TABLE perfiles    COMMENT     H   COMMENT ON TABLE perfiles IS 'Representa los perfiles de los usuarios';
            public       postgres    false    193         �           0    0    COLUMN perfiles.id    COMMENT     M   COMMENT ON COLUMN perfiles.id IS 'Representa la llave primaria de la tabla';
            public       postgres    false    193         �           0    0    COLUMN perfiles.nombre    COMMENT     R   COMMENT ON COLUMN perfiles.nombre IS 'Nombre descriptivo del perfil de usuarios';
            public       postgres    false    193         �           0    0    COLUMN perfiles.created    COMMENT     F   COMMENT ON COLUMN perfiles.created IS 'Fecha de registro del perfil';
            public       postgres    false    193         �            1259    16432    perfiles_id_seq    SEQUENCE     q   CREATE SEQUENCE perfiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.perfiles_id_seq;
       public       postgres    false    6    193         �           0    0    perfiles_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE perfiles_id_seq OWNED BY perfiles.id;
            public       postgres    false    194         �            1259    16434    perfiles_usuarios    TABLE     R   CREATE TABLE perfiles_usuarios (
    usuario_id integer,
    perfil_id integer
);
 %   DROP TABLE public.perfiles_usuarios;
       public         postgres    false    6         �           0    0    TABLE perfiles_usuarios    COMMENT     ^   COMMENT ON TABLE perfiles_usuarios IS 'Representa los perfiles de cada usuarios del sistema';
            public       postgres    false    195         �           0    0 #   COLUMN perfiles_usuarios.usuario_id    COMMENT     R   COMMENT ON COLUMN perfiles_usuarios.usuario_id IS 'llave primaria del usuario
';
            public       postgres    false    195         �           0    0 "   COLUMN perfiles_usuarios.perfil_id    COMMENT     ]   COMMENT ON COLUMN perfiles_usuarios.perfil_id IS 'representa el perfil asignado al usuario';
            public       postgres    false    195         �            1259    16437    usuarios    TABLE     �   CREATE TABLE usuarios (
    id integer NOT NULL,
    email character(300),
    password character(100),
    created timestamp without time zone,
    updated timestamp without time zone,
    nombre character(250)
);
    DROP TABLE public.usuarios;
       public         postgres    false    6         �           0    0    COLUMN usuarios.id    COMMENT     L   COMMENT ON COLUMN usuarios.id IS 'LLave primaria de la tabla de  usuarios';
            public       postgres    false    196         �           0    0    COLUMN usuarios.email    COMMENT     9   COMMENT ON COLUMN usuarios.email IS 'email del usuario';
            public       postgres    false    196         �           0    0    COLUMN usuarios.password    COMMENT     ?   COMMENT ON COLUMN usuarios.password IS 'Password del usuario';
            public       postgres    false    196         �           0    0    COLUMN usuarios.created    COMMENT     I   COMMENT ON COLUMN usuarios.created IS 'Fecha de creación del registro';
            public       postgres    false    196         �           0    0    COLUMN usuarios.updated    COMMENT     N   COMMENT ON COLUMN usuarios.updated IS 'Fecha de actualización del registro';
            public       postgres    false    196         �           0    0    COLUMN usuarios.nombre    COMMENT     D   COMMENT ON COLUMN usuarios.nombre IS 'Nombre completo del usuario';
            public       postgres    false    196         �            1259    16443    usuarios_id_seq    SEQUENCE     q   CREATE SEQUENCE usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public       postgres    false    6    196         �           0    0    usuarios_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE usuarios_id_seq OWNED BY usuarios.id;
            public       postgres    false    197                     2604    16445    id    DEFAULT     b   ALTER TABLE ONLY comentarios ALTER COLUMN id SET DEFAULT nextval('comentarios_id_seq'::regclass);
 =   ALTER TABLE public.comentarios ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    182    181                    2604    16446    id    DEFAULT     X   ALTER TABLE ONLY cursos ALTER COLUMN id SET DEFAULT nextval('cursos_id_seq'::regclass);
 8   ALTER TABLE public.cursos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    184    183                    2604    16447    id    DEFAULT     \   ALTER TABLE ONLY materias ALTER COLUMN id SET DEFAULT nextval('materias_id_seq'::regclass);
 :   ALTER TABLE public.materias ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    190    187                    2604    16505    id    DEFAULT     p   ALTER TABLE ONLY materias_ejecucion ALTER COLUMN id SET DEFAULT nextval('materias_ejecucion_id_seq'::regclass);
 D   ALTER TABLE public.materias_ejecucion ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    189                    2604    16448    id    DEFAULT     f   ALTER TABLE ONLY materias_plan ALTER COLUMN id SET DEFAULT nextval('materias_plan_id_seq'::regclass);
 ?   ALTER TABLE public.materias_plan ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    192    191                    2604    16460    id    DEFAULT     r   ALTER TABLE ONLY materias_plan_temas ALTER COLUMN id SET DEFAULT nextval('materias_plan_temas_id_seq'::regclass);
 E   ALTER TABLE public.materias_plan_temas ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    199    199                    2604    16449    id    DEFAULT     \   ALTER TABLE ONLY perfiles ALTER COLUMN id SET DEFAULT nextval('perfiles_id_seq'::regclass);
 :   ALTER TABLE public.perfiles ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    194    193                    2604    16450    id    DEFAULT     \   ALTER TABLE ONLY usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196         �          0    16394    comentarios 
   TABLE DATA               g   COPY comentarios (id, autor, materia_ejecucion_id, descripcion, usuario_id, created, tipo) FROM stdin;
    public       postgres    false    181       2180.dat �           0    0    comentarios_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('comentarios_id_seq', 1, true);
            public       postgres    false    182         �          0    16402    cursos 
   TABLE DATA               %   COPY cursos (id, nombre) FROM stdin;
    public       postgres    false    183       2182.dat �           0    0    cursos_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('cursos_id_seq', 5, true);
            public       postgres    false    184         �          0    16407    cursos_materias 
   TABLE DATA               8   COPY cursos_materias (curso_id, materia_id) FROM stdin;
    public       postgres    false    185       2184.dat �          0    16410    cursos_usuarios 
   TABLE DATA               >   COPY cursos_usuarios (usuario_id, curso_id, tipo) FROM stdin;
    public       postgres    false    186       2185.dat �          0    16413    materias 
   TABLE DATA               '   COPY materias (id, nombre) FROM stdin;
    public       postgres    false    187       2186.dat �          0    16416    materias_docente 
   TABLE DATA               D   COPY materias_docente (materia_id, docente_id, created) FROM stdin;
    public       postgres    false    188       2187.dat �          0    16419    materias_ejecucion 
   TABLE DATA               ~   COPY materias_ejecucion (materia_plan_id, docente_id, representante_id, confirmado, created, update, tema_id, id) FROM stdin;
    public       postgres    false    189       2188.dat �           0    0    materias_ejecucion_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('materias_ejecucion_id_seq', 1, true);
            public       postgres    false    200         �           0    0    materias_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('materias_id_seq', 5, true);
            public       postgres    false    190         �          0    16424    materias_plan 
   TABLE DATA               j   COPY materias_plan (id, curso_id, materia_id, horas, fecha, created, semana, update, tema_id) FROM stdin;
    public       postgres    false    191       2190.dat �           0    0    materias_plan_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('materias_plan_id_seq', 13, true);
            public       postgres    false    192         �          0    16457    materias_plan_temas 
   TABLE DATA               >   COPY materias_plan_temas (id, titulo, materia_id) FROM stdin;
    public       postgres    false    199       2198.dat �           0    0    materias_plan_temas_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('materias_plan_temas_id_seq', 12, true);
            public       postgres    false    198         �          0    16429    perfiles 
   TABLE DATA               0   COPY perfiles (id, nombre, created) FROM stdin;
    public       postgres    false    193       2192.dat �           0    0    perfiles_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('perfiles_id_seq', 1, true);
            public       postgres    false    194         �          0    16434    perfiles_usuarios 
   TABLE DATA               ;   COPY perfiles_usuarios (usuario_id, perfil_id) FROM stdin;
    public       postgres    false    195       2194.dat �          0    16437    usuarios 
   TABLE DATA               J   COPY usuarios (id, email, password, created, updated, nombre) FROM stdin;
    public       postgres    false    196       2195.dat �           0    0    usuarios_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('usuarios_id_seq', 1, false);
            public       postgres    false    197         	           2606    16452    materias_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY materias
    ADD CONSTRAINT materias_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.materias DROP CONSTRAINT materias_pkey;
       public         postgres    false    187    187                    2606    16472    materias_plan_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY materias_plan
    ADD CONSTRAINT materias_plan_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.materias_plan DROP CONSTRAINT materias_plan_pkey;
       public         postgres    false    191    191                    2606    16462    materias_plan_temas_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY materias_plan_temas
    ADD CONSTRAINT materias_plan_temas_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.materias_plan_temas DROP CONSTRAINT materias_plan_temas_pkey;
       public         postgres    false    199    199                    2606    16478 
   fkey_temas    FK CONSTRAINT     |   ALTER TABLE ONLY materias_ejecucion
    ADD CONSTRAINT fkey_temas FOREIGN KEY (tema_id) REFERENCES materias_plan_temas(id);
 G   ALTER TABLE ONLY public.materias_ejecucion DROP CONSTRAINT fkey_temas;
       public       postgres    false    189    199    2061                    2606    16498 '   materias_ejecucion_materia_plan_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY materias_ejecucion
    ADD CONSTRAINT materias_ejecucion_materia_plan_id_fkey FOREIGN KEY (materia_plan_id) REFERENCES materias_plan(id);
 d   ALTER TABLE ONLY public.materias_ejecucion DROP CONSTRAINT materias_ejecucion_materia_plan_id_fkey;
       public       postgres    false    191    189    2059                    2606    16473    materias_plan_tema_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY materias_plan
    ADD CONSTRAINT materias_plan_tema_id_fkey FOREIGN KEY (tema_id) REFERENCES materias_plan_temas(id);
 R   ALTER TABLE ONLY public.materias_plan DROP CONSTRAINT materias_plan_tema_id_fkey;
       public       postgres    false    191    2061    199                    2606    16466 #   materias_plan_temas_materia_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY materias_plan_temas
    ADD CONSTRAINT materias_plan_temas_materia_id_fkey FOREIGN KEY (materia_id) REFERENCES materias(id);
 a   ALTER TABLE ONLY public.materias_plan_temas DROP CONSTRAINT materias_plan_temas_materia_id_fkey;
       public       postgres    false    187    2057    199                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       2180.dat                                                                                            0000600 0004000 0002000 00000001041 12746362763 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2	1	Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta)                                                                                                                                                                                                                                                                       	1	2016-07-27 19:32:36.271282	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               2182.dat                                                                                            0000600 0004000 0002000 00000001376 12746362763 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3	Ingeniería Industrial                                                                                                                                                                                                                                     
4	Ingeniería Sistemas                                                                                                                                                                                                                                       
5	Administrador                                                                                                                                                                                                                                             
\.


                                                                                                                                                                                                                                                                  2184.dat                                                                                            0000600 0004000 0002000 00000000021 12746362763 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	1
4	2
4	3
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               2185.dat                                                                                            0000600 0004000 0002000 00000000021 12746362763 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	4	2
2	4	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               2186.dat                                                                                            0000600 0004000 0002000 00000002372 12746362763 0014276 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Ingles                                                                                                                                                                                                                                                    
1	Fundamentos de Matemáticas                                                                                                                                                                                                                                
3	Lógica Matemática                                                                                                                                                                                                                                         
4	Fundamentos de Programación                                                                                                                                                                                                                               
5	Habilidades Comunicativas                                                                                                                                                                                                                                 
\.


                                                                                                                                                                                                                                                                      2187.dat                                                                                            0000600 0004000 0002000 00000000140 12746362763 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2	2016-07-26 20:21:09.026646
2	2	2016-07-26 20:21:16.74738
3	2	2016-07-26 20:21:23.87231
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                2188.dat                                                                                            0000600 0004000 0002000 00000000110 12746362763 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2	\N	n	2016-07-27 19:31:40.112009	2016-07-27 19:31:40.112009	1	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                        2190.dat                                                                                            0000600 0004000 0002000 00000001764 12746362763 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	4	1	8	2016-07-26	2016-07-26 20:22:20.741295	1	2016-07-26 20:22:20.741295	1
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


            2198.dat                                                                                            0000600 0004000 0002000 00000013673 12746362763 0014307 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Aritmética y algebra                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                	1
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


                                                                     2192.dat                                                                                            0000600 0004000 0002000 00000000715 12746362763 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Docente                                                                                             	2016-07-26
1	Administrador                                                                                       	2016-07-26
3	Representante                                                                                       	2016-07-26
1	Estudiante                                                                                          	2016-07-27
\.


                                                   2194.dat                                                                                            0000600 0004000 0002000 00000000021 12746362763 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	3
1	4
2	2
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               2195.dat                                                                                            0000600 0004000 0002000 00000002617 12746362763 0014300 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	estudiante@proyecto.com                                                                                                                                                                                                                                                                                     	e10adc3949ba59abbe56e057f20f883e                                                                    	2016-07-26 19:45:56.647488	2016-07-26 19:45:56.647488	Pepito Perez                                                                                                                                                                                                                                              
2	docente@proyecto.com                                                                                                                                                                                                                                                                                        	e10adc3949ba59abbe56e057f20f883e                                                                    	2016-07-26 19:50:44.587815	2016-07-26 19:50:44.587815	Un docente                                                                                                                                                                                                                                                
\.


                                                                                                                 restore.sql                                                                                         0000600 0004000 0002000 00000061043 12746362763 0015410 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.materias_plan_temas DROP CONSTRAINT materias_plan_temas_materia_id_fkey;
ALTER TABLE ONLY public.materias_plan DROP CONSTRAINT materias_plan_tema_id_fkey;
ALTER TABLE ONLY public.materias_ejecucion DROP CONSTRAINT materias_ejecucion_materia_plan_id_fkey;
ALTER TABLE ONLY public.materias_ejecucion DROP CONSTRAINT fkey_temas;
ALTER TABLE ONLY public.materias_plan_temas DROP CONSTRAINT materias_plan_temas_pkey;
ALTER TABLE ONLY public.materias_plan DROP CONSTRAINT materias_plan_pkey;
ALTER TABLE ONLY public.materias DROP CONSTRAINT materias_pkey;
ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.perfiles ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.materias_plan_temas ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.materias_plan ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.materias_ejecucion ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.materias ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cursos ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.comentarios ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.usuarios_id_seq;
DROP TABLE public.usuarios;
DROP TABLE public.perfiles_usuarios;
DROP SEQUENCE public.perfiles_id_seq;
DROP TABLE public.perfiles;
DROP SEQUENCE public.materias_plan_temas_id_seq;
DROP TABLE public.materias_plan_temas;
DROP SEQUENCE public.materias_plan_id_seq;
DROP TABLE public.materias_plan;
DROP SEQUENCE public.materias_id_seq;
DROP SEQUENCE public.materias_ejecucion_id_seq;
DROP TABLE public.materias_ejecucion;
DROP TABLE public.materias_docente;
DROP TABLE public.materias;
DROP TABLE public.cursos_usuarios;
DROP TABLE public.cursos_materias;
DROP SEQUENCE public.cursos_id_seq;
DROP TABLE public.cursos;
DROP SEQUENCE public.comentarios_id_seq;
DROP TABLE public.comentarios;
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
-- Name: comentarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comentarios (
    id integer NOT NULL,
    autor integer,
    materia_ejecucion_id integer,
    descripcion character(500),
    usuario_id integer,
    created timestamp without time zone,
    tipo integer NOT NULL
);


ALTER TABLE comentarios OWNER TO postgres;

--
-- Name: COLUMN comentarios.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comentarios.id IS 'LLave primeria de la tabla';


--
-- Name: COLUMN comentarios.autor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comentarios.autor IS 'Representa el autor del comentario 1 docente 2 estudiante o representante.';


--
-- Name: COLUMN comentarios.materia_ejecucion_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comentarios.materia_ejecucion_id IS 'LLave primaria del  tema dictado';


--
-- Name: COLUMN comentarios.descripcion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comentarios.descripcion IS 'Descripción del comentario del docente';


--
-- Name: COLUMN comentarios.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comentarios.usuario_id IS 'Usuario que realiza el comentario';


--
-- Name: COLUMN comentarios.created; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comentarios.created IS 'Fecha en la que se crea el registro';


--
-- Name: COLUMN comentarios.tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comentarios.tipo IS 'Representa el tipo de comentario ';


--
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
-- Name: comentarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comentarios_id_seq OWNED BY comentarios.id;


--
-- Name: cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cursos (
    id integer NOT NULL,
    nombre character(250)
);


ALTER TABLE cursos OWNER TO postgres;

--
-- Name: TABLE cursos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE cursos IS 'Los cursos de una carrera';


--
-- Name: COLUMN cursos.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cursos.id IS 'LLave primaria del curso
';


--
-- Name: COLUMN cursos.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cursos.nombre IS 'Nombre descriptivo de  la materia';


--
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
-- Name: cursos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cursos_id_seq OWNED BY cursos.id;


--
-- Name: cursos_materias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cursos_materias (
    curso_id integer,
    materia_id integer
);


ALTER TABLE cursos_materias OWNER TO postgres;

--
-- Name: TABLE cursos_materias; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE cursos_materias IS 'Representa la relacion de cursos con las materias ';


--
-- Name: COLUMN cursos_materias.curso_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cursos_materias.curso_id IS 'LLave primaria del curso';


--
-- Name: COLUMN cursos_materias.materia_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cursos_materias.materia_id IS 'Representa la materia asignada';


--
-- Name: cursos_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cursos_usuarios (
    usuario_id integer,
    curso_id integer,
    tipo integer
);


ALTER TABLE cursos_usuarios OWNER TO postgres;

--
-- Name: TABLE cursos_usuarios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE cursos_usuarios IS 'Representa el curso asignado a un usuario';


--
-- Name: COLUMN cursos_usuarios.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cursos_usuarios.usuario_id IS 'Usuario que  interactua con el curso';


--
-- Name: COLUMN cursos_usuarios.curso_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cursos_usuarios.curso_id IS 'Curso referenciado al usuario';


--
-- Name: COLUMN cursos_usuarios.tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cursos_usuarios.tipo IS 'Representa el tipo de relación con el curso 1 docente, 2 estudiante....';


--
-- Name: materias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE materias (
    id integer NOT NULL,
    nombre character(250)
);


ALTER TABLE materias OWNER TO postgres;

--
-- Name: TABLE materias; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE materias IS 'Representa las materias que se asignaran a los cursos';


--
-- Name: COLUMN materias.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias.nombre IS 'Nombre descriptivo de la materia';


--
-- Name: materias_docente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE materias_docente (
    materia_id integer NOT NULL,
    docente_id integer NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE materias_docente OWNER TO postgres;

--
-- Name: materias_ejecucion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE materias_ejecucion (
    materia_plan_id integer,
    docente_id integer,
    representante_id integer,
    confirmado "char",
    created timestamp without time zone,
    update timestamp without time zone,
    tema_id integer,
    id integer NOT NULL
);


ALTER TABLE materias_ejecucion OWNER TO postgres;

--
-- Name: COLUMN materias_ejecucion.confirmado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_ejecucion.confirmado IS 'Representa el estado del registro [ N=> no confirmado, S=>  confirmado]';


--
-- Name: COLUMN materias_ejecucion.created; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_ejecucion.created IS 'Fecha del registro';


--
-- Name: COLUMN materias_ejecucion.update; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_ejecucion.update IS 'Fecha en la que se hace un cambios en el registro';


--
-- Name: COLUMN materias_ejecucion.tema_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_ejecucion.tema_id IS 'Representa el tema que dicta el docente';


--
-- Name: COLUMN materias_ejecucion.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_ejecucion.id IS 'LLave primaria de la tabla';


--
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
-- Name: materias_ejecucion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE materias_ejecucion_id_seq OWNED BY materias_ejecucion.id;


--
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
-- Name: materias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE materias_id_seq OWNED BY materias.id;


--
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
-- Name: TABLE materias_plan; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE materias_plan IS 'Representa el plan de estudios para la materias de un curso determinado.';


--
-- Name: COLUMN materias_plan.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_plan.id IS 'LLave primaria de la tabla';


--
-- Name: COLUMN materias_plan.curso_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_plan.curso_id IS 'Curso';


--
-- Name: COLUMN materias_plan.horas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_plan.horas IS 'Numero de horas que dura el tema';


--
-- Name: COLUMN materias_plan.fecha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_plan.fecha IS 'Fecha en la que se lleva a cabo la tematica';


--
-- Name: COLUMN materias_plan.created; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_plan.created IS 'Fecha de creación del registro';


--
-- Name: COLUMN materias_plan.semana; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_plan.semana IS 'Numero de la semana en la que se debe presentar el tema';


--
-- Name: COLUMN materias_plan.tema_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_plan.tema_id IS 'Representa el tema sugerido que debe presentar el docente';


--
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
-- Name: materias_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE materias_plan_id_seq OWNED BY materias_plan.id;


--
-- Name: materias_plan_temas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE materias_plan_temas (
    id integer NOT NULL,
    titulo character(500),
    materia_id integer NOT NULL
);


ALTER TABLE materias_plan_temas OWNER TO postgres;

--
-- Name: COLUMN materias_plan_temas.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_plan_temas.id IS 'Llave primeria de la tabla';


--
-- Name: COLUMN materias_plan_temas.titulo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_plan_temas.titulo IS 'Nombre descriptivo del tema';


--
-- Name: COLUMN materias_plan_temas.materia_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN materias_plan_temas.materia_id IS 'Materia a la que pertenece el tema';


--
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
-- Name: materias_plan_temas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE materias_plan_temas_id_seq OWNED BY materias_plan_temas.id;


--
-- Name: perfiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE perfiles (
    id integer NOT NULL,
    nombre character(100),
    created date
);


ALTER TABLE perfiles OWNER TO postgres;

--
-- Name: TABLE perfiles; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE perfiles IS 'Representa los perfiles de los usuarios';


--
-- Name: COLUMN perfiles.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN perfiles.id IS 'Representa la llave primaria de la tabla';


--
-- Name: COLUMN perfiles.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN perfiles.nombre IS 'Nombre descriptivo del perfil de usuarios';


--
-- Name: COLUMN perfiles.created; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN perfiles.created IS 'Fecha de registro del perfil';


--
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
-- Name: perfiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE perfiles_id_seq OWNED BY perfiles.id;


--
-- Name: perfiles_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE perfiles_usuarios (
    usuario_id integer,
    perfil_id integer
);


ALTER TABLE perfiles_usuarios OWNER TO postgres;

--
-- Name: TABLE perfiles_usuarios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE perfiles_usuarios IS 'Representa los perfiles de cada usuarios del sistema';


--
-- Name: COLUMN perfiles_usuarios.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN perfiles_usuarios.usuario_id IS 'llave primaria del usuario
';


--
-- Name: COLUMN perfiles_usuarios.perfil_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN perfiles_usuarios.perfil_id IS 'representa el perfil asignado al usuario';


--
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
-- Name: COLUMN usuarios.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.id IS 'LLave primaria de la tabla de  usuarios';


--
-- Name: COLUMN usuarios.email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.email IS 'email del usuario';


--
-- Name: COLUMN usuarios.password; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.password IS 'Password del usuario';


--
-- Name: COLUMN usuarios.created; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.created IS 'Fecha de creación del registro';


--
-- Name: COLUMN usuarios.updated; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.updated IS 'Fecha de actualización del registro';


--
-- Name: COLUMN usuarios.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.nombre IS 'Nombre completo del usuario';


--
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
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuarios_id_seq OWNED BY usuarios.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentarios ALTER COLUMN id SET DEFAULT nextval('comentarios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cursos ALTER COLUMN id SET DEFAULT nextval('cursos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias ALTER COLUMN id SET DEFAULT nextval('materias_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_ejecucion ALTER COLUMN id SET DEFAULT nextval('materias_ejecucion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_plan ALTER COLUMN id SET DEFAULT nextval('materias_plan_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_plan_temas ALTER COLUMN id SET DEFAULT nextval('materias_plan_temas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfiles ALTER COLUMN id SET DEFAULT nextval('perfiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);


--
-- Data for Name: comentarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comentarios (id, autor, materia_ejecucion_id, descripcion, usuario_id, created, tipo) FROM stdin;
\.
COPY comentarios (id, autor, materia_ejecucion_id, descripcion, usuario_id, created, tipo) FROM '$$PATH$$/2180.dat';

--
-- Name: comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comentarios_id_seq', 1, true);


--
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cursos (id, nombre) FROM stdin;
\.
COPY cursos (id, nombre) FROM '$$PATH$$/2182.dat';

--
-- Name: cursos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cursos_id_seq', 5, true);


--
-- Data for Name: cursos_materias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cursos_materias (curso_id, materia_id) FROM stdin;
\.
COPY cursos_materias (curso_id, materia_id) FROM '$$PATH$$/2184.dat';

--
-- Data for Name: cursos_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cursos_usuarios (usuario_id, curso_id, tipo) FROM stdin;
\.
COPY cursos_usuarios (usuario_id, curso_id, tipo) FROM '$$PATH$$/2185.dat';

--
-- Data for Name: materias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY materias (id, nombre) FROM stdin;
\.
COPY materias (id, nombre) FROM '$$PATH$$/2186.dat';

--
-- Data for Name: materias_docente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY materias_docente (materia_id, docente_id, created) FROM stdin;
\.
COPY materias_docente (materia_id, docente_id, created) FROM '$$PATH$$/2187.dat';

--
-- Data for Name: materias_ejecucion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY materias_ejecucion (materia_plan_id, docente_id, representante_id, confirmado, created, update, tema_id, id) FROM stdin;
\.
COPY materias_ejecucion (materia_plan_id, docente_id, representante_id, confirmado, created, update, tema_id, id) FROM '$$PATH$$/2188.dat';

--
-- Name: materias_ejecucion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('materias_ejecucion_id_seq', 1, true);


--
-- Name: materias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('materias_id_seq', 5, true);


--
-- Data for Name: materias_plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY materias_plan (id, curso_id, materia_id, horas, fecha, created, semana, update, tema_id) FROM stdin;
\.
COPY materias_plan (id, curso_id, materia_id, horas, fecha, created, semana, update, tema_id) FROM '$$PATH$$/2190.dat';

--
-- Name: materias_plan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('materias_plan_id_seq', 13, true);


--
-- Data for Name: materias_plan_temas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY materias_plan_temas (id, titulo, materia_id) FROM stdin;
\.
COPY materias_plan_temas (id, titulo, materia_id) FROM '$$PATH$$/2198.dat';

--
-- Name: materias_plan_temas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('materias_plan_temas_id_seq', 12, true);


--
-- Data for Name: perfiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY perfiles (id, nombre, created) FROM stdin;
\.
COPY perfiles (id, nombre, created) FROM '$$PATH$$/2192.dat';

--
-- Name: perfiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('perfiles_id_seq', 1, true);


--
-- Data for Name: perfiles_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY perfiles_usuarios (usuario_id, perfil_id) FROM stdin;
\.
COPY perfiles_usuarios (usuario_id, perfil_id) FROM '$$PATH$$/2194.dat';

--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuarios (id, email, password, created, updated, nombre) FROM stdin;
\.
COPY usuarios (id, email, password, created, updated, nombre) FROM '$$PATH$$/2195.dat';

--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_id_seq', 1, false);


--
-- Name: materias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias
    ADD CONSTRAINT materias_pkey PRIMARY KEY (id);


--
-- Name: materias_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_plan
    ADD CONSTRAINT materias_plan_pkey PRIMARY KEY (id);


--
-- Name: materias_plan_temas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_plan_temas
    ADD CONSTRAINT materias_plan_temas_pkey PRIMARY KEY (id);


--
-- Name: fkey_temas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_ejecucion
    ADD CONSTRAINT fkey_temas FOREIGN KEY (tema_id) REFERENCES materias_plan_temas(id);


--
-- Name: materias_ejecucion_materia_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_ejecucion
    ADD CONSTRAINT materias_ejecucion_materia_plan_id_fkey FOREIGN KEY (materia_plan_id) REFERENCES materias_plan(id);


--
-- Name: materias_plan_tema_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_plan
    ADD CONSTRAINT materias_plan_tema_id_fkey FOREIGN KEY (tema_id) REFERENCES materias_plan_temas(id);


--
-- Name: materias_plan_temas_materia_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias_plan_temas
    ADD CONSTRAINT materias_plan_temas_materia_id_fkey FOREIGN KEY (materia_id) REFERENCES materias(id);


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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             