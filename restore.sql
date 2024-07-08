--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8
-- Dumped by pg_dump version 14.8

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

--
-- Name: StatusCompany; Type: TYPE; Schema: public; Owner: myUser
--

CREATE TYPE public."StatusCompany" AS ENUM (
    'PENDIENTE',
    'APROBADA',
    'RECHAZADA',
    'RETIRADA',
    'ACTIVO'
);


ALTER TYPE public."StatusCompany" OWNER TO "myUser";

--
-- Name: StatusProject; Type: TYPE; Schema: public; Owner: myUser
--

CREATE TYPE public."StatusProject" AS ENUM (
    'PENDIENTE',
    'ACTIVO',
    'INACTIVO'
);


ALTER TYPE public."StatusProject" OWNER TO "myUser";

--
-- Name: StatusStudent; Type: TYPE; Schema: public; Owner: myUser
--

CREATE TYPE public."StatusStudent" AS ENUM (
    'ASIGNADO',
    'APROBADO',
    'RETIRADO',
    'REPROBADO'
);


ALTER TYPE public."StatusStudent" OWNER TO "myUser";

--
-- Name: TypeDNI; Type: TYPE; Schema: public; Owner: myUser
--

CREATE TYPE public."TypeDNI" AS ENUM (
    'CEDULA',
    'RUC',
    'PASAPORTE'
);


ALTER TYPE public."TypeDNI" OWNER TO "myUser";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Agreement; Type: TABLE; Schema: public; Owner: myUser
--

CREATE TABLE public."Agreement" (
    id integer NOT NULL,
    code text NOT NULL,
    "dateStart" timestamp(3) without time zone NOT NULL,
    "dateEnd" timestamp(3) without time zone NOT NULL,
    "itvPath" text NOT NULL,
    "agreementPath" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    state boolean DEFAULT true NOT NULL,
    status public."StatusProject" DEFAULT 'PENDIENTE'::public."StatusProject" NOT NULL,
    "idCompany" integer NOT NULL
);


ALTER TABLE public."Agreement" OWNER TO "myUser";

--
-- Name: Agreement_id_seq; Type: SEQUENCE; Schema: public; Owner: myUser
--

CREATE SEQUENCE public."Agreement_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Agreement_id_seq" OWNER TO "myUser";

--
-- Name: Agreement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myUser
--

ALTER SEQUENCE public."Agreement_id_seq" OWNED BY public."Agreement".id;


--
-- Name: Career; Type: TABLE; Schema: public; Owner: myUser
--

CREATE TABLE public."Career" (
    id integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    "dateStart" timestamp(3) without time zone NOT NULL,
    "dateEnd" timestamp(3) without time zone NOT NULL,
    "timeRenovationAgreement" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    state boolean DEFAULT true NOT NULL,
    "idCoordinator" integer NOT NULL,
    "idViceCoordinator" integer NOT NULL,
    "idRespStepDual" integer NOT NULL
);


ALTER TABLE public."Career" OWNER TO "myUser";

--
-- Name: Career_id_seq; Type: SEQUENCE; Schema: public; Owner: myUser
--

CREATE SEQUENCE public."Career_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Career_id_seq" OWNER TO "myUser";

--
-- Name: Career_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myUser
--

ALTER SEQUENCE public."Career_id_seq" OWNED BY public."Career".id;


--
-- Name: Company; Type: TABLE; Schema: public; Owner: myUser
--

CREATE TABLE public."Company" (
    id integer NOT NULL,
    ruc text NOT NULL,
    name text NOT NULL,
    "dniRepresentLegal" text NOT NULL,
    "nameRepresentLegal" text NOT NULL,
    "lastNameRepresentLegal" text NOT NULL,
    phone text NOT NULL,
    email text NOT NULL,
    address text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    state boolean DEFAULT true NOT NULL,
    status public."StatusCompany" DEFAULT 'PENDIENTE'::public."StatusCompany" NOT NULL,
    "idCareer" integer NOT NULL,
    "idUser" integer NOT NULL
);


ALTER TABLE public."Company" OWNER TO "myUser";

--
-- Name: Company_id_seq; Type: SEQUENCE; Schema: public; Owner: myUser
--

CREATE SEQUENCE public."Company_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Company_id_seq" OWNER TO "myUser";

--
-- Name: Company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myUser
--

ALTER SEQUENCE public."Company_id_seq" OWNED BY public."Company".id;


--
-- Name: Documents; Type: TABLE; Schema: public; Owner: myUser
--

CREATE TABLE public."Documents" (
    id integer NOT NULL,
    process text NOT NULL,
    "docName" text NOT NULL,
    version text DEFAULT '1.0'::text NOT NULL,
    "elaborationDate" text NOT NULL,
    "updateDate" text NOT NULL,
    code text NOT NULL,
    "documentDefinition" text NOT NULL
);


ALTER TABLE public."Documents" OWNER TO "myUser";

--
-- Name: Documents_id_seq; Type: SEQUENCE; Schema: public; Owner: myUser
--

CREATE SEQUENCE public."Documents_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Documents_id_seq" OWNER TO "myUser";

--
-- Name: Documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myUser
--

ALTER SEQUENCE public."Documents_id_seq" OWNED BY public."Documents".id;


--
-- Name: Permission; Type: TABLE; Schema: public; Owner: myUser
--

CREATE TABLE public."Permission" (
    id integer NOT NULL,
    name text NOT NULL,
    endpoint text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    state boolean DEFAULT true NOT NULL
);


ALTER TABLE public."Permission" OWNER TO "myUser";

--
-- Name: Permission_id_seq; Type: SEQUENCE; Schema: public; Owner: myUser
--

CREATE SEQUENCE public."Permission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Permission_id_seq" OWNER TO "myUser";

--
-- Name: Permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myUser
--

ALTER SEQUENCE public."Permission_id_seq" OWNED BY public."Permission".id;


--
-- Name: Project; Type: TABLE; Schema: public; Owner: myUser
--

CREATE TABLE public."Project" (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    state boolean DEFAULT true NOT NULL,
    status public."StatusProject" DEFAULT 'PENDIENTE'::public."StatusProject" NOT NULL,
    "idAcademicTutor" integer,
    "idBusinessTutor" integer NOT NULL,
    "idCompany" integer NOT NULL
);


ALTER TABLE public."Project" OWNER TO "myUser";

--
-- Name: Project_id_seq; Type: SEQUENCE; Schema: public; Owner: myUser
--

CREATE SEQUENCE public."Project_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Project_id_seq" OWNER TO "myUser";

--
-- Name: Project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myUser
--

ALTER SEQUENCE public."Project_id_seq" OWNED BY public."Project".id;


--
-- Name: Rol; Type: TABLE; Schema: public; Owner: myUser
--

CREATE TABLE public."Rol" (
    id integer NOT NULL,
    code text,
    name text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    state boolean DEFAULT true NOT NULL
);


ALTER TABLE public."Rol" OWNER TO "myUser";

--
-- Name: RolHasPermission; Type: TABLE; Schema: public; Owner: myUser
--

CREATE TABLE public."RolHasPermission" (
    "idRol" integer NOT NULL,
    "idPermission" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    state boolean DEFAULT true NOT NULL
);


ALTER TABLE public."RolHasPermission" OWNER TO "myUser";

--
-- Name: Rol_id_seq; Type: SEQUENCE; Schema: public; Owner: myUser
--

CREATE SEQUENCE public."Rol_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Rol_id_seq" OWNER TO "myUser";

--
-- Name: Rol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myUser
--

ALTER SEQUENCE public."Rol_id_seq" OWNED BY public."Rol".id;


--
-- Name: Student; Type: TABLE; Schema: public; Owner: myUser
--

CREATE TABLE public."Student" (
    id integer NOT NULL,
    "typeDni" public."TypeDNI" DEFAULT 'CEDULA'::public."TypeDNI" NOT NULL,
    dni text NOT NULL,
    "firstName" text NOT NULL,
    "secondName" text,
    "lastName" text NOT NULL,
    "secondLastName" text,
    email text NOT NULL,
    "idUser" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    state boolean DEFAULT true NOT NULL,
    status public."StatusStudent" DEFAULT 'APROBADO'::public."StatusStudent" NOT NULL,
    "idCareer" integer NOT NULL
);


ALTER TABLE public."Student" OWNER TO "myUser";

--
-- Name: StudentAssignedToCompany; Type: TABLE; Schema: public; Owner: myUser
--

CREATE TABLE public."StudentAssignedToCompany" (
    id integer NOT NULL,
    "idStudent" integer NOT NULL,
    "idCompany" integer,
    "idProject" integer,
    "electivePeriod" text NOT NULL,
    "academicPeriod" text NOT NULL,
    parallel text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    state boolean DEFAULT true NOT NULL
);


ALTER TABLE public."StudentAssignedToCompany" OWNER TO "myUser";

--
-- Name: StudentAssignedToCompany_id_seq; Type: SEQUENCE; Schema: public; Owner: myUser
--

CREATE SEQUENCE public."StudentAssignedToCompany_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."StudentAssignedToCompany_id_seq" OWNER TO "myUser";

--
-- Name: StudentAssignedToCompany_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myUser
--

ALTER SEQUENCE public."StudentAssignedToCompany_id_seq" OWNED BY public."StudentAssignedToCompany".id;


--
-- Name: Student_id_seq; Type: SEQUENCE; Schema: public; Owner: myUser
--

CREATE SEQUENCE public."Student_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Student_id_seq" OWNER TO "myUser";

--
-- Name: Student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myUser
--

ALTER SEQUENCE public."Student_id_seq" OWNED BY public."Student".id;


--
-- Name: Tutor; Type: TABLE; Schema: public; Owner: myUser
--

CREATE TABLE public."Tutor" (
    id integer NOT NULL,
    dni text NOT NULL,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    email text NOT NULL,
    "isAcademic" boolean DEFAULT true NOT NULL,
    "idUser" integer NOT NULL,
    "idCareer" integer,
    "idCompany" integer,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    state boolean DEFAULT true NOT NULL
);


ALTER TABLE public."Tutor" OWNER TO "myUser";

--
-- Name: Tutor_id_seq; Type: SEQUENCE; Schema: public; Owner: myUser
--

CREATE SEQUENCE public."Tutor_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tutor_id_seq" OWNER TO "myUser";

--
-- Name: Tutor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myUser
--

ALTER SEQUENCE public."Tutor_id_seq" OWNED BY public."Tutor".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: myUser
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    dni text NOT NULL,
    "userName" text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    state boolean DEFAULT true NOT NULL,
    "idRol" integer DEFAULT 1 NOT NULL
);


ALTER TABLE public."User" OWNER TO "myUser";

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: myUser
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_id_seq" OWNER TO "myUser";

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myUser
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: Agreement id; Type: DEFAULT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Agreement" ALTER COLUMN id SET DEFAULT nextval('public."Agreement_id_seq"'::regclass);


--
-- Name: Career id; Type: DEFAULT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Career" ALTER COLUMN id SET DEFAULT nextval('public."Career_id_seq"'::regclass);


--
-- Name: Company id; Type: DEFAULT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Company" ALTER COLUMN id SET DEFAULT nextval('public."Company_id_seq"'::regclass);


--
-- Name: Documents id; Type: DEFAULT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Documents" ALTER COLUMN id SET DEFAULT nextval('public."Documents_id_seq"'::regclass);


--
-- Name: Permission id; Type: DEFAULT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Permission" ALTER COLUMN id SET DEFAULT nextval('public."Permission_id_seq"'::regclass);


--
-- Name: Project id; Type: DEFAULT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Project" ALTER COLUMN id SET DEFAULT nextval('public."Project_id_seq"'::regclass);


--
-- Name: Rol id; Type: DEFAULT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Rol" ALTER COLUMN id SET DEFAULT nextval('public."Rol_id_seq"'::regclass);


--
-- Name: Student id; Type: DEFAULT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Student" ALTER COLUMN id SET DEFAULT nextval('public."Student_id_seq"'::regclass);


--
-- Name: StudentAssignedToCompany id; Type: DEFAULT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."StudentAssignedToCompany" ALTER COLUMN id SET DEFAULT nextval('public."StudentAssignedToCompany_id_seq"'::regclass);


--
-- Name: Tutor id; Type: DEFAULT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Tutor" ALTER COLUMN id SET DEFAULT nextval('public."Tutor_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Data for Name: Agreement; Type: TABLE DATA; Schema: public; Owner: myUser
--

COPY public."Agreement" (id, code, "dateStart", "dateEnd", "itvPath", "agreementPath", "createdAt", "updatedAt", state, status, "idCompany") FROM stdin;
\.


--
-- Data for Name: Career; Type: TABLE DATA; Schema: public; Owner: myUser
--

COPY public."Career" (id, code, name, "dateStart", "dateEnd", "timeRenovationAgreement", "createdAt", "updatedAt", state, "idCoordinator", "idViceCoordinator", "idRespStepDual") FROM stdin;
2	DS	Desarrollo de Software	2024-07-01 05:00:00	2024-07-31 05:00:00	4	2024-07-02 16:53:10.231	2024-07-02 20:03:19.134	t	2	4	3
\.


--
-- Data for Name: Company; Type: TABLE DATA; Schema: public; Owner: myUser
--

COPY public."Company" (id, ruc, name, "dniRepresentLegal", "nameRepresentLegal", "lastNameRepresentLegal", phone, email, address, "createdAt", "updatedAt", state, status, "idCareer", "idUser") FROM stdin;
\.


--
-- Data for Name: Documents; Type: TABLE DATA; Schema: public; Owner: myUser
--

COPY public."Documents" (id, process, "docName", version, "elaborationDate", "updateDate", code, "documentDefinition") FROM stdin;
82	Acta Inducción de Seguridad	Acta Inducción de Seguridad	1.0	10-07-2023	10-07-2023	123123	async function createDocument2({ logoImage, bgImage, instituteName, code, docName, process, updateDate, elaborationDate, version, academicPeriod, career, dni, firstName, secondName, lastName, secondLastName, company }) {\r\n    const documentDefinition = {\r\n        pageSize: 'A4',\r\n        pageMargins: [41, 41, 41, 41],\r\n        content: [\r\n              {\r\n                image: await bgImage,\r\n                width: 595,\r\n                height: 842,\r\n                absolutePosition: { y: 0, x: 0 },\r\n              },\r\n            {\r\n                marginTop: 70,\r\n                table: {\r\n                    widths: ['auto', 300, '*', '*'],\r\n                    body: [\r\n                        [\r\n                              {\r\n                                image: await logoImage,\r\n                                fit: [65, 65],\r\n                                rowSpan: 4,\r\n                                alignment: 'center',\r\n                                margin: [0, 20],\r\n                              },\r\n                            {\r\n                                text: 'INSTITUTO SUPERIOR TECNOLÓGICO DE TURISMO Y PATRIMONIO YAVIRAC',\r\n                                alignment: 'center',\r\n                                margin: [0, 2],\r\n                                fontSize: 8,\r\n                                bold: true,\r\n                            },\r\n                            {\r\n                                text: 'VERSIÓN ',\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                                fontSize: 8,\r\n                            },\r\n                            {\r\n                                text: version,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                                fontSize: 8,\r\n                            },\r\n                        ],\r\n                        [\r\n                            {},\r\n                            {\r\n                                text: 'MACROPROCESO 01 DOCENCIA',\r\n                                bold: true,\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: 'ELABORACIÓN',\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: elaborationDate,\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                        ],\r\n                        [\r\n                            {},\r\n                            {\r\n                                text: process,\r\n                                bold: true,\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                            },\r\n                            {\r\n                                text: 'ACTUALIZACIÓN',\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: updateDate,\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                        ],\r\n                        [\r\n                            {},\r\n                            {\r\n                                text: docName,\r\n                                bold: true,\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: 'CÓDIGO',\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: code,\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                        ],\r\n                    ],\r\n                },\r\n            },\r\n            {\r\n                text: 'ACTA DE RECEPCIÓN DE ORIENTACIONES DE SEGURIDAD, DE RECEPCIÓN DE MEDIOS DE PROTECCIÓN PERSONAL Y DE ACEPTACIÓN DE RIESGOS',\r\n                bold: true,\r\n                margin: [0, 10],\r\n                alignment: 'center',\r\n            },\r\n            {\r\n                text: 'Quito D.M. 02/01/2024',\r\n                margin: [0, 10],\r\n                alignment: 'right',\r\n                fontSize: 10,\r\n            },\r\n            {\r\n                text: [\r\n                    'Yo ',\r\n                    { text: `${[firstName, secondName, lastName, secondLastName].join(' ')} ` },\r\n                    'con cédula No. ',\r\n                    { text: `${dni} ` },\r\n                    'estudiante de ',\r\n                    { text: `${academicPeriod} ` },\r\n                    'nivel del ',\r\n                    { text: `${instituteName}, ` },\r\n                    'de la carrera de ',\r\n                    { text: `${career}, ` },\r\n                    'asignado a la empresa formadora ',\r\n                    { text: `${company}; ` },\r\n                    'declaro que:',\r\n                ],\r\n                fontSize: 10,\r\n                alignment: 'justify',\r\n                lineHeight: 1.5,\r\n                margin: [5, 0, 5, 4],\r\n            },\r\n            {\r\n                fontSize: 10,\r\n                alignment: 'justify',\r\n                lineHeight: 1.5,\r\n                margin: [5, 0, 5, 4],\r\n                ul: [\r\n                    {\r\n                        text: 'Reconozco que toda actividad puede tener riesgos y peligros, por tal razón, he recibido una inducción sobre los potenciales riesgos de la actividad que voy a realiza en la empresa formadora-receptora, sobre la identificación de situaciones potencialmente peligrosas, así como las orientaciones sobre las medidas de prevención y normas de seguridad para prevenir accidentes.',\r\n                    },\r\n                    {\r\n                        text: 'He entendido la orientación sobre los riesgos potenciales de esa actividad y sobre sus normas de seguridad para evitarlos o prevenirlos. Por esto, de manera libre y voluntaria, acepto los mismos y me comprometo a cumplir las exigencias de seguridad, protocolos y uso correcto de equipamientos que logren mitigarlos o evitarlos, durante toda mi permanencia en la empresa formadora-receptora.',\r\n                    },\r\n                    {\r\n                        text: 'Tengo conocimiento sobre la actividad que voy a realizar y he recibido medios de protección a ser usados por mí en las actividades designadas en la empresa formadora-receptora.',\r\n                    },\r\n                    {\r\n                        text: 'En caso que tenga una discapacidad física o mental, temporal o permanente, que pueda influir en mi seguridad personal o de un tercero, reportaré de inmediato a mis superiores o encargados, tanto de la empresa formadora-receptora, como del Instituto.',\r\n                    },\r\n                    {\r\n                        text: 'En caso que identifique una situación que considere como potencialmente peligrosa o un incidente de seguridad, reportaré de inmediato a mis superiores o encargados, tanto de la empresa formadora-receptora, como del Instituto.',\r\n                    },\r\n                    {\r\n                        text: 'No realizaré actividades que no estén detalladas en mis actividades, o que no cuenten con el respectivo análisis de riesgos, medidas de seguridad y procedimientos de emergencia establecidos.',\r\n                    },\r\n                    {\r\n                        text: 'Reportaré de inmediato a mis superiores o encargados, tanto de la empresa formadora-receptora, como del Instituto. sobre la pérdida o daño en el equipamiento de protección personal que haya recibido.',\r\n                    },\r\n                ],\r\n            },\r\n            {\r\n                text: 'Para constancia de lo indicado antes, firmo:',\r\n                fontSize: 10,\r\n                marginTop: 10,\r\n            },\r\n            {\r\n                text: `${'_'.repeat(40)}\\n(Firma del estudiante)`,\r\n                marginTop: 40,\r\n                fontSize: 10,\r\n            },\r\n        ],\r\n    };\r\n      pdfMake.createPdf(documentDefinition).open();\r\n}
84	Esquema del proyecto empresarial	Esquema del proyecto empresarial	1.0	10-07-2023	10-07-2023	123123	async function createDocument4({ docx, fileSaver, logoImage, instituteName, career, elaborationDate, updateDate, code, version, docName, process, company, project, academicTutor, businessTutor }) {\r\n    const doc = new docx.Document({\r\n        sections: [{\r\n                properties: {\r\n                    page: {\r\n                        margin: {\r\n                            top: 700,\r\n                            right: 700,\r\n                            bottom: 700,\r\n                            left: 700\r\n                        }\r\n                    }\r\n                },\r\n                headers: {\r\n                    default: new docx.Header({\r\n                        children: [\r\n                            new docx.Table({\r\n                                rows: [\r\n                                    new docx.TableRow({\r\n                                        children: [\r\n                                            new docx.TableCell({\r\n                                                verticalAlign: 'center',\r\n                                                rowSpan: 4,\r\n                                                width: { size: 10 },\r\n                                                children: [\r\n                                                    new docx.Paragraph({\r\n                                                        children: [\r\n                                                            new docx.ImageRun( {\r\n                                                          data: await logoImage,\r\n                                                          transformation: {\r\n                                                            width: 100,\r\n                                                            height: 80,\r\n                                                          },\r\n                                                            } ),\r\n                                                        ], alignment: 'center'\r\n                                                    }),\r\n                                                ]\r\n                                            }),\r\n                                            new docx.TableCell({\r\n                                                verticalAlign: 'center',\r\n                                                children: [\r\n                                                    new docx.Paragraph({ children: [new docx.TextRun({ text: instituteName, bold: true })], alignment: 'center', })\r\n                                                ],\r\n                                                shading: {\r\n                                                    fill: '3366ff'\r\n                                                }\r\n                                            }),\r\n                                            new docx.TableCell({\r\n                                                verticalAlign: 'center',\r\n                                                children: [new docx.Paragraph({\r\n                                                        children: [new docx.TextRun({\r\n                                                                children: [\r\n                                                                    new docx.TextRun({ text: 'VERSION: ', bold: true }),\r\n                                                                    new docx.TextRun({ text: "\\n", break: 1 }),\r\n                                                                    new docx.TextRun({ text: version, bold: true })\r\n                                                                ],\r\n                                                            })], alignment: 'center'\r\n                                                    })]\r\n                                            }),\r\n                                        ]\r\n                                    }),\r\n                                    new docx.TableRow({\r\n                                        children: [\r\n                                            new docx.TableCell({\r\n                                                verticalAlign: 'center', children: [new docx.Paragraph({\r\n                                                        children: [\r\n                                                            new docx.TextRun({ text: `MACROPROCESO 01 DOCENCIA`, bold: true })\r\n                                                        ], alignment: 'center'\r\n                                                    })]\r\n                                            }),\r\n                                            new docx.TableCell({\r\n                                                children: [new docx.Paragraph({\r\n                                                        children: [\r\n                                                            new docx.TextRun({ text: "ELABORACIÓN: ", bold: true }),\r\n                                                            new docx.TextRun({ text: "\\n", break: 1 }),\r\n                                                            new docx.TextRun({ text: elaborationDate, bold: true })\r\n                                                        ], alignment: 'center'\r\n                                                    })]\r\n                                            }),\r\n                                        ]\r\n                                    }),\r\n                                    new docx.TableRow({\r\n                                        children: [\r\n                                            new docx.TableCell({\r\n                                                children: [\r\n                                                    new docx.Paragraph({\r\n                                                        children: [\r\n                                                            new docx.TextRun({ text: process, bold: true })\r\n                                                        ], alignment: 'center'\r\n                                                    })\r\n                                                ],\r\n                                                shading: {\r\n                                                    fill: 'e6802c'\r\n                                                }\r\n                                            }),\r\n                                            new docx.TableCell({\r\n                                                verticalAlign: 'center',\r\n                                                children: [new docx.Paragraph({\r\n                                                        children: [\r\n                                                            new docx.TextRun({ text: "ACTUALIZACIÓN: ", bold: true }),\r\n                                                            new docx.TextRun({ text: "\\n", break: 1 }),\r\n                                                            new docx.TextRun({ text: updateDate, bold: true })\r\n                                                        ], alignment: 'center'\r\n                                                    })]\r\n                                            }),\r\n                                        ]\r\n                                    }),\r\n                                    new docx.TableRow({\r\n                                        children: [\r\n                                            new docx.TableCell({\r\n                                                verticalAlign: 'center',\r\n                                                children: [\r\n                                                    new docx.Paragraph({\r\n                                                        children: [\r\n                                                            new docx.TextRun({ text: docName, bold: true })\r\n                                                        ], alignment: 'center'\r\n                                                    })\r\n                                                ]\r\n                                            }),\r\n                                            new docx.TableCell({\r\n                                                verticalAlign: 'center',\r\n                                                children: [new docx.Paragraph({\r\n                                                        children: [\r\n                                                            new docx.TextRun({ text: 'Código: ', bold: true }),\r\n                                                            new docx.TextRun({ text: "\\n", break: 1 }),\r\n                                                            new docx.TextRun({ text: code, bold: true })\r\n                                                        ], alignment: 'center'\r\n                                                    })]\r\n                                            }),\r\n                                        ]\r\n                                    }),\r\n                                ]\r\n                            })\r\n                        ]\r\n                    })\r\n                },\r\n                children: [\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: `CARRERA DE TECNÓLOGO SUPERIOR EN ${career}`, bold: true, break: 2, size: 28 }),\r\n                            new docx.TextRun({ text: `${company}`, bold: true, break: 4, size: 24 }),\r\n                            new docx.TextRun({ text: 'Logo de la Empresa', bold: true, break: 4, size: 24, highlight: 'yellow' }),\r\n                            new docx.TextRun({ text: 'Proyecto Empresarial', bold: true, break: 3, size: 24 }),\r\n                            new docx.TextRun({ text: 'MEMORIA DE EJERCITACIÓN PRÁCTICA CON APORTE EMPRESARIAL', bold: true, break: 3, size: 24 }),\r\n                            new docx.TextRun({ text: 'TÍTULO DEL PROYECTO:', bold: true, break: 3, size: 24 }),\r\n                            new docx.TextRun({ text: project, bold: true, break: 3, size: 24 }),\r\n                        ], alignment: 'center'\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: `GRUPO DE PROYECTO: `, bold: true, break: 1, size: 24 }),\r\n                        ], alignment: 'left'\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'NOMBRES Y APELLIDOS', bold: true, break: 1, size: 24, highlight: 'yellow' }),\r\n                            new docx.TextRun({ text: 'NOMBRES Y APELLIDOS', bold: true, break: 2, size: 24 }),\r\n                        ], alignment: 'center'\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: `TUTOR ACADÉMICO: ${academicTutor}`, bold: true, break: 3, size: 24 }),\r\n                            new docx.TextRun({ text: `TUTOR EMPRESARIAL: ${businessTutor}`, bold: true, break: 2, size: 24 }),\r\n                        ], alignment: 'left'\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'ASIGNATURA DE FASE PRÁCTICA:', bold: true, break: 3, size: 24 }),\r\n                            new docx.TextRun({ text: 'NIVEL(ES):', bold: true, break: 2, size: 24 }),\r\n                        ], alignment: 'left'\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: `QUITO, ${new Date().toLocaleString('default', { month: 'long' }).toUpperCase()} ${new Date().getFullYear()}`, bold: true, break: 3, size: 24 }),\r\n                        ], alignment: 'right'\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'ÍNDICE:', bold: true, size: 24 }),\r\n                        ], alignment: 'center', pageBreakBefore: true\r\n                    }),\r\n                    new docx.TableOfContents('ÍNDICE', {\r\n                        hyperlink: true,\r\n                        headingStyleRange: '1-3',\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        heading: docx.HeadingLevel.HEADING_1,\r\n                        children: [\r\n                            new docx.TextRun({ text: '1. Título del proyecto:', bold: true, size: 24 }),\r\n                        ], alignment: 'left', spacing: { line: 2 * 240, after: 300, before: 300, }, pageBreakBefore: true\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        heading: docx.HeadingLevel.HEADING_2,\r\n                        children: [\r\n                            new docx.TextRun({ text: `Título del proyecto empresarial`, bold: true, size: 24, }),\r\n                        ], alignment: 'center', spacing: { line: 2 * 240, after: 300 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'El título del proyecto empresarial, se debe desarrollar en función del programa de tutorías de la fase  práctica. Definir cronograma de tutorías con los estudiantes y tutores (Borrar lo resaltado con color amarillo).', size: 24, highlight: 'yellow' })\r\n                        ], spacing: { line: 2 * 240, after: 300, }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        heading: docx.HeadingLevel.HEADING_1,\r\n                        children: [\r\n                            new docx.TextRun({ text: '2. Objetivos:', bold: true, size: 24 }),\r\n                        ], alignment: 'left', spacing: { line: 2 * 240, after: 300 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        heading: docx.HeadingLevel.HEADING_2,\r\n                        children: [\r\n                            new docx.TextRun({ text: '2.1 Objetivo General', bold: true, size: 24 }),\r\n                        ], alignment: 'left', spacing: { line: 2 * 240, after: 300 }, indent: { firstLine: 720 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'El objetivo general es una frase que describe que se va a hacer en todo el trabajo. Es una única frase que inicia con un verbo, y normalmente se dice:', size: 24, highlight: 'yellow' }),\r\n                        ], alignment: 'left', spacing: { line: 2 * 240, after: 300 }, indent: { start: 720 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Qué se va a hacer (se indica con el verbo), ejemplo: Aplicar, diagnosticar, comparar, etc.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        bullet: {\r\n                            level: 0\r\n                        },\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'El para qué del propósito (se explica la finalidad del objetivo), ejemplo: con el fin de, para, etc.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        bullet: {\r\n                            level: 0\r\n                        },\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Cómo se logrará el objetivo (se indica con el complemento), ejemplo: mediante, a través de, utilizando, etc.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        bullet: {\r\n                            level: 0\r\n                        },\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Adicionalmente algunos trabajos necesitan indicar algunas acotaciones como: lugar, tiempo, etc.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 720 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Dónde se va hacer (ciudad, país, región, etc.).', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        bullet: {\r\n                            level: 0\r\n                        },\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'En qué tiempo (periodo de tiempo, año, mes, etc.)', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        bullet: {\r\n                            level: 0\r\n                        },\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Todos estos anteriores elementos se deben integrar en una frase para redactar el objetivo general. ', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 720 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Ejemplo:', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 720 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Desarrollar un sistema de notificaciones para la protección de datos del usuario, con la finalidad que no existan irregularidades en los datos del cliente,  a través del lenguaje de programación “Visual Basic, base de datos “Microsoft SQL Server Management Studio” y el framework “Telerik”.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        heading: docx.HeadingLevel.HEADING_2,\r\n                        children: [\r\n                            new docx.TextRun({ text: '2.2 Objetivo Especificos', bold: true, size: 24 }),\r\n                        ], alignment: 'left', spacing: { line: 2 * 240, after: 300 }, indent: { firstLine: 720 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({\r\n                                text: `Giménez (2008) en el Proceso de Investigación dice “el objetivo general es un enunciado macro, el propósito general del investigador en cuanto a los aspectos que desea integrar y conocer. Para el logro del objetivo general será necesario la formulación de los objetivos específicos” pág. 31\r\n                    En cuanto a los objetivos específicos nos dice “son las metas parciales, es decir, las actividades a realizar en cada una de las etapas de la investigación para lograr el objetivo general” pág. 33`, size: 24, highlight: 'yellow'\r\n                            }),\r\n                        ],\r\n                        indent: { start: 720 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({\r\n                                text: `Con relación a sus características los objetivos deben ser claros, precisos y concisos. Inician con un verbo en infinitivo y la escogencia de esta palabra para su redacción es fundamental acerca de lo que se desea perseguir.`, size: 24, highlight: 'yellow'\r\n                            }),\r\n                        ],\r\n                        indent: { start: 720 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({\r\n                                text: `Por su parte, Naghi (2005) en el texto Metodología de la Investigación dice que para los objetivos se deben tener en cuenta factores como: ¿Qué tipo de información se necesita?, ¿A quién se debe informar de los resultados finales de la investigación?, ¿Quién utilizará los resultados para la toma de decisiones? Además, agrega el autor se debe dar respuesta con plena claridad a las siguientes preguntas: ¿Qué información se busca? y ¿Qué tanta información se necesita? pág. 65`, size: 24, highlight: 'yellow'\r\n                            }),\r\n                        ],\r\n                        indent: { start: 720 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({\r\n                                text: `Ejemplo de objetivos específicos en función del Objetivo General dado anteriormente:`, size: 24, highlight: 'yellow'\r\n                            }),\r\n                        ],\r\n                        indent: { start: 720 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Confirmar la relación entre las encuentras realizadas y los cambios efectuados como respuesta en los restaurantes que las iniciaron.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        bullet: {\r\n                            level: 0\r\n                        },\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Comparar los grados de satisfacción antes y después de los cambios realizados.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        bullet: {\r\n                            level: 0\r\n                        },\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Definir la relación real entre encuestas y satisfacción del cliente.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        bullet: {\r\n                            level: 0\r\n                        },\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Ejemplo:', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Controlar la protección de datos mediante avisos o notificaciones para la consistencia de la información del cliente.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        bullet: {\r\n                            level: 0\r\n                        },\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Objetivo específico 2', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        bullet: {\r\n                            level: 0\r\n                        },\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        heading: docx.HeadingLevel.HEADING_1,\r\n                        children: [\r\n                            new docx.TextRun({ text: '3 Introduccion', bold: true, size: 24 }),\r\n                        ], alignment: 'left', spacing: { line: 2 * 240, after: 300 }, indent: { firstLine: 720 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        heading: docx.HeadingLevel.HEADING_2,\r\n                        children: [\r\n                            new docx.TextRun({ text: '3.1 Planteamiento del problema', bold: true, size: 24 }),\r\n                        ], alignment: 'left', spacing: { line: 2 * 240, after: 300 }, indent: { firstLine: 1440 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'El problema debe ser planteado en términos claros y precisos, sin comentarios que den referencia de una posible solución. Es decir, identificación del problema central o global del proyecto. El problema debe referenciar la terminología técnico científica que direccione hacia las variables que lo sustentan. Se puede plantear como afirmación o interrogante.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'El problema se plantea de modo tal que destaque una contradicción en la práctica social. En un párrafo se plantean las características de la Empresa hasta el momento, describen los aspectos generalmente beneficiosos o positivos con respecto a la Empresa.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'En el segundo párrafo, que representa la otra parte de la contradicción de la Empresa, se comienza destacando: sin embargo, no obstante, independientemente de lo anteriormente planteado… Se trata de presentar la otra parte de la contradicción, donde ponemos en evidencia las insuficiencias que aún se presentan en la Empresa, sin decir: falta esto y esto otro.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        heading: docx.HeadingLevel.HEADING_2,\r\n                        children: [\r\n                            new docx.TextRun({ text: '3.2 Justificacion', bold: true, size: 24 }),\r\n                        ], alignment: 'left', spacing: { line: 2 * 240, after: 300 }, indent: { firstLine: 1440 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'En esta parte, se debe exponer las razones por las cuales es importante el trabajo, cómo este proyecto genera innovación, permite el desarrollo de oportunidades o resuelve problemas de la empresa, considerando las diferentes aportaciones de los miembros del equipo de una concepción personal y social que aporte al buen vivir y que se refleje en el proyecto empresarial. ', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Además, es importante indicar quienes se beneficiarían con la realización de este estudio.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Es imprescindible que para su justificación realicen una investigación exploratoria bibliográfica.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        heading: docx.HeadingLevel.HEADING_2,\r\n                        children: [\r\n                            new docx.TextRun({ text: '3.3 Alcance del proyecto', bold: true, size: 24 }),\r\n                        ], alignment: 'left', spacing: { line: 2 * 240, after: 300 }, indent: { firstLine: 1440 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'En este punto, se debe delimitar el tamaño y  profundidad del Proyecto, considerando el nivel de aprendizaje y el tiempo disponible para su realización. El alcance debe tener relación con el objetivo general.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Breve reseña histórica, social o cultural del destino, identificación de los atractivos turísticos en el destino, hacer un inventario de los mismos, establecer características medioambientales, identificar otras áreas productivas aparte del turismo, realizar un análisis FODA.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        heading: docx.HeadingLevel.HEADING_1,\r\n                        children: [\r\n                            new docx.TextRun({ text: '4. Metodología de desarrollo de software (si aplica)', bold: true, size: 24 }),\r\n                        ], alignment: 'left', spacing: { line: 2 * 240, after: 300 }, indent: { firstLine: 720 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: '¿Qué tipo de proyecto desarrollaremos? Para ello debemos seleccionar la metodología adecuada a nuestro tipo de proyecto, es decir, replicar los pasos de un proceso metodológico ya probado acorde con los objetivos específicos de nuestro estudio, puede ser una metodología para cada objetivo o una que abarque a todos ellos.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 720 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'La metodología proporciona las herramientas y las técnicas mediante las cuales intentaremos transformar la realidad con el fin de mejorarla, y constituye el eje central de un proyecto. Es conveniente evaluarla en función de los objetivos y de los beneficiarios del proyecto.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 720 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        heading: docx.HeadingLevel.HEADING_1,\r\n                        children: [\r\n                            new docx.TextRun({ text: '5. Resultados Alcanzados', bold: true, size: 24 }),\r\n                        ], alignment: 'left', spacing: { line: 2 * 240, after: 300 }, indent: { firstLine: 720 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Esta es la parte principal, debe iniciarse con un esquema o gráfico que dé la idea integral de la estructura de la propuesta (resultados alcanzados), después desarrollar la misma en el orden planteado. Su extensión debe ser de al menos el 60% de todo el proyecto, hay que hacer una coherente y consistente descripción, en detalle, fundamentando, aportando los criterios que se tuvieron en cuenta, cuáles son los modelos de trabajo que se han obtenido, cómo se aplican, en qué consiste el aporte que permitirá mejorar los resultados del trabajo, teniendo muy en cuenta que se deben validar los resultados alcanzados al concluir este apartado.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 720 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'En el caso de que se hayan levantado requerimientos (historias de usuario) ', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        bullet: {\r\n                            level: 0\r\n                        },\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Gráficas de diseño ', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        bullet: {\r\n                            level: 0\r\n                        },\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Prototipos de pantallas ', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        bullet: {\r\n                            level: 0\r\n                        },\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Pruebas funcionales y técnicas ', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        bullet: {\r\n                            level: 0\r\n                        },\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Deben aparecer en la parte de Anexos.  ', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 720 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        heading: docx.HeadingLevel.HEADING_1,\r\n                        children: [\r\n                            new docx.TextRun({ text: '6. Conclusiones y recomendaciones', bold: true, size: 24 }),\r\n                        ], alignment: 'left', spacing: { line: 2 * 240, after: 300 }, indent: { firstLine: 720 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        heading: docx.HeadingLevel.HEADING_2,\r\n                        children: [\r\n                            new docx.TextRun({ text: '6.1 Conclusiones', bold: true, size: 24 }),\r\n                        ], alignment: 'left', spacing: { line: 2 * 240, after: 300 }, indent: { firstLine: 1440 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Es la valoración general del trabajo presentado, se debe destacar el aporte y las generalizaciones que pueden hacerse de todo el proceso empresarial. Es importante ajustarse en las conclusiones a los resultados obtenidos de cada uno de los objetivos específicos planteados y no hacer referencias a aspectos que necesitan continuarse estudiando.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        heading: docx.HeadingLevel.HEADING_2,\r\n                        children: [\r\n                            new docx.TextRun({ text: '6.2 Recomendaciones', bold: true, size: 24 }),\r\n                        ], alignment: 'left', spacing: { line: 2 * 240, after: 300 }, indent: { firstLine: 1440 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Deben ser aquellas que no están al alcance del Autor(es) en el momento de la culminación del trabajo, pero que pueden obtenerse en un periodo de posterior en el entorno empresarial, o que pueden ser resueltas en otras instancias por su factibilidad y beneficio para la misma. También deben estar en correspondencia con el desarrollo de la propuesta. Un error muy frecuente es incluir en las conclusiones aspectos que se refieren a recomendaciones. El número de recomendaciones no debe exceder el de las conclusiones.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 1440 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        heading: docx.HeadingLevel.HEADING_1,\r\n                        children: [\r\n                            new docx.TextRun({ text: '7. Referencias', bold: true, size: 24 }),\r\n                        ], alignment: 'left', spacing: { line: 2 * 240, after: 300 }, indent: { firstLine: 720 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Deberá indicarse en orden alfabético, comenzando por el autor, título, editorial, ciudad y año (aplicar Normas APA).  La bibliografía y fuentes de información tienen que ser actualizadas, de los últimos 10 años preferentemente.', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 720 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        heading: docx.HeadingLevel.HEADING_1,\r\n                        children: [\r\n                            new docx.TextRun({ text: '8. Anexos', bold: true, size: 24 }),\r\n                        ], alignment: 'left', spacing: { line: 2 * 240, after: 300 }, indent: { firstLine: 720 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'En este punto, deben estar mencionados en el desarrollo del documento los anexos (ejemplo: ver anexo 1, 2, etc.). Se anexarán ilustraciones, tablas y demás elementos que consideren pertinentes él o los autores con el criterio de los tutores guías. Como requisito primordial, se anexará al final, la presentación del proyecto que realizó o realizaron él o los estudiantes para la defensa y el documento final en formato WORD y PDF (proyecto empresarial).', size: 24, highlight: 'yellow' }),\r\n                        ],\r\n                        indent: { start: 720 }, spacing: { line: 2 * 240, after: 300 },\r\n                    }),\r\n                ],\r\n            }],\r\n    });\r\n      const blob = await docx.Packer.toBlob( doc );\r\n      fileSaver.saveAs( blob, 'document genereted' )\r\n}
85	Certificado empresarial	Certificado empresarial	1.0	10-07-2023	10-07-2023	123123	async function createDocument5({ docx, fileSaver, dni, instituteName, firstName, secondName, lastName, secondLastName, career, academicPeriod, company, parallel, electivePeriod, businessTutor }) {\r\n    const doc = new docx.Document({\r\n        sections: [{\r\n                properties: {\r\n                    page: {\r\n                        margin: {\r\n                            top: 1400,\r\n                            right: 1400,\r\n                            bottom: 1400,\r\n                            left: 1400\r\n                        }\r\n                    }\r\n                },\r\n                children: [\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Logo de la Emrpesa', size: 24, highlight: 'yellow' })\r\n                        ], spacing: { line: 1.5 * 240, after: 600 }, alignment: 'left'\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: `Quito, 00 de ${new Date().toLocaleString('default', { month: 'long' })} de ${new Date().getFullYear()}`, size: 24, highlight: 'yellow' })\r\n                        ], spacing: { line: 1.5 * 240, after: 300 }, alignment: 'right'\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'CERTIFICADO DE PRÁCTICAS EMPRESARIALES', size: 24, bold: true })\r\n                        ], spacing: { line: 1.5 * 240, after: 300 }, alignment: 'center'\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Este certificado es otorgado a:', size: 24, bold: true })\r\n                        ], spacing: { line: 1.5 * 240, after: 300 }, alignment: 'left'\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: [firstName, secondName, lastName, secondLastName].join(' '), size: 24, bold: true })\r\n                        ], alignment: 'left'\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: dni, size: 24 })\r\n                        ], alignment: 'left'\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Nivel: ', size: 24, bold: true }),\r\n                            new docx.TextRun({ text: `${academicPeriod} `, size: 24 }),\r\n                            new docx.TextRun({ text: 'Paralelo: ', size: 24, bold: true }),\r\n                            new docx.TextRun({ text: `${parallel.charAt(0)} `, size: 24, }),\r\n                            new docx.TextRun({ text: 'Jornada: ', size: 24, bold: true }),\r\n                            new docx.TextRun({ text: `${'"Jornada"'} `, size: 24, highlight: 'yellow' }),\r\n                        ], alignment: 'left'\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: instituteName, size: 24 })\r\n                        ], alignment: 'left'\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: `Tecnología en ${career}`, size: 24 })\r\n                        ], alignment: 'left', spacing: { line: 1.5 * 240, after: 300 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Por la presente, la empresa ', size: 24 }),\r\n                            new docx.TextRun({ text: `${company} `, size: 24, bold: true }),\r\n                            new docx.TextRun({ text: `se complace en certificar que el estudiante antes mencionado completó exitosamente sus prácticas profesionales en nuestras instalaciones durante el período comprendido entre `, size: 24 }),\r\n                            new docx.TextRun({ text: `02/01/2024 y 23/02/2024, `, size: 24, highlight: 'yellow' }),\r\n                            new docx.TextRun({ text: `totalizando un tiempo de 280 horas, más 10 horas autónomas. Estas fechas son correspondientes al periodo lectivo `, size: 24 }),\r\n                            new docx.TextRun({ text: `${electivePeriod}`, size: 24 }),\r\n                        ], alignment: 'left', spacing: { line: 1.5 * 240, after: 300 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Durante su estadía con nosotros, el estudiante demostró un alto nivel de compromiso, entusiasmo y dedicación hacia sus responsabilidades asignadas. Participó activamente en diversas actividades relacionadas con ', size: 24 }),\r\n                            new docx.TextRun({ text: `${career}, `, size: 24, bold: true }),\r\n                            new docx.TextRun({ text: 'lo que contribuyó significativamente a su propio crecimiento y al logro de nuestros objetivos corporativos.', size: 24 }),\r\n                        ], alignment: 'left', spacing: { line: 1.5 * 240, after: 300 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: 'Atentamente:', size: 24 }),\r\n                        ], alignment: 'left', spacing: { line: 1.5 * 240, after: 300 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: '_'.repeat(15), size: 24 }),\r\n                        ], alignment: 'left', spacing: { line: 1.5 * 240, after: 300 }\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: `${businessTutor}`, size: 24 }),\r\n                        ], alignment: 'left'\r\n                    }),\r\n                    new docx.Paragraph({\r\n                        children: [\r\n                            new docx.TextRun({ text: company, size: 24 }),\r\n                        ], alignment: 'left'\r\n                    }),\r\n                ]\r\n            }]\r\n    });\r\n      const blob = await docx.Packer.toBlob( doc );\r\n      fileSaver.saveAs( blob, 'document genereted' )\r\n}
86	Reporte de aprendizaje	Reporte de aprendizaje	1.0	10-07-2023	10-07-2023	123123	async function createDocument6({ exceljs, fileSaver, logoImage, instituteName, company, process, docName, version, elaborationDate, updateDate, code, firstName, secondName, lastName, secondLastName, dni, academicTutor, businessTutor, electivePeriod, academicPeriod, career }) {\r\n    const workBook = new exceljs.Workbook();\r\n    const workSheet = workBook.addWorksheet('Informe de Aprendizaje');\r\n    workSheet.pageSetup = {\r\n        paperSize: 9,\r\n        fitToPage: true,\r\n        fitToWidth: 1,\r\n        fitToHeight: 1,\r\n        orientation: 'landscape'\r\n    };\r\n      const logo = workBook.addImage({\r\n      base64: await logoImage,\r\n      extension: 'png'\r\n      })\r\n    workSheet.mergeCells('A1:B4');\r\n      workSheet.addImage( logo, 'A1:B4')\r\n    workSheet.mergeCells('C1:Q1');\r\n    workSheet.getCell('C1').value = instituteName;\r\n    workSheet.getCell('C1').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: '3366ff' } };\r\n    workSheet.mergeCells('C2:Q2');\r\n    workSheet.getCell('C2').value = 'MACROPROCESO 01 DOCENCIA';\r\n    workSheet.mergeCells('C3:Q3');\r\n    workSheet.getCell('C3').value = process;\r\n    workSheet.getCell('C3').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'e6802c' } };\r\n    workSheet.mergeCells('C4:Q4');\r\n    workSheet.getCell('C4').value = docName;\r\n    workSheet.getColumn('R').width = 15;\r\n    workSheet.getColumn('S').width = 15;\r\n    workSheet.getCell('R1').value = 'VERSIÓN';\r\n    workSheet.getCell('S1').value = version;\r\n    workSheet.getCell('R2').value = 'ELABORACIÓN';\r\n    workSheet.getCell('S2').value = elaborationDate;\r\n    workSheet.getCell('R3').value = 'ACTUALIZACIÓN';\r\n    workSheet.getCell('S3').value = updateDate;\r\n    workSheet.getCell('R4').value = 'CÓDIGO';\r\n    workSheet.getCell('S4').value = code;\r\n    const usedCells = workSheet.getSheetValues();\r\n    const applyBorder = (cell) => {\r\n        cell.border = {\r\n            top: { style: 'thin', color: { argb: 'FF000000' } },\r\n            left: { style: 'thin', color: { argb: 'FF000000' } },\r\n            bottom: { style: 'thin', color: { argb: 'FF000000' } },\r\n            right: { style: 'thin', color: { argb: 'FF000000' } }\r\n        };\r\n    };\r\n    for (let row = 1; row <= 4; row++) {\r\n        for (let col = 1; col <= 19; col++) {\r\n            applyBorder(workSheet.getCell(row, col));\r\n            const cell = workSheet.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', horizontal: 'center' };\r\n        }\r\n    }\r\n    workSheet.getRow(5).height = 10;\r\n    workSheet.mergeCells('A6:C6');\r\n    workSheet.getCell('A6').value = 'EMPRESA FORMADORA:';\r\n    workSheet.getCell('A6').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet.mergeCells('D6:H6');\r\n    workSheet.mergeCells('I6:K6');\r\n    workSheet.getCell('I6').value = 'NIVEL:';\r\n    workSheet.getCell('I6').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet.mergeCells('L6:S6');\r\n    workSheet.mergeCells('A7:C7');\r\n    workSheet.getCell('A7').value = 'ESTUDIANTE:';\r\n    workSheet.getCell('A7').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet.mergeCells('D7:H7');\r\n    workSheet.mergeCells('I7:K7');\r\n    workSheet.getCell('I7').value = 'CICLO ACADÉMICO:';\r\n    workSheet.getCell('I7').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet.mergeCells('L7:S7');\r\n    workSheet.mergeCells('A8:C8');\r\n    workSheet.getCell('A8').value = 'CÉDULA:';\r\n    workSheet.getCell('A8').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet.mergeCells('D8:H8');\r\n    workSheet.mergeCells('I8:K8');\r\n    workSheet.getCell('I8').value = 'F. INICIO FASE PRÁCTICA';\r\n    workSheet.getCell('I8').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet.mergeCells('L8:N8');\r\n    workSheet.getCell('L8').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFF000' } };\r\n    workSheet.mergeCells('O8:Q8');\r\n    workSheet.getCell('O8').value = 'F. FIN FASE PRÁCTICA';\r\n    workSheet.getCell('O8').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet.mergeCells('R8:S8');\r\n    workSheet.getCell('R8').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFF000' } };\r\n    workSheet.mergeCells('A9:C9');\r\n    workSheet.getCell('A9').value = 'TUTOR(A) ACADÉMICO:';\r\n    workSheet.getCell('A9').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet.mergeCells('D9:H9');\r\n    workSheet.mergeCells('I9:K9');\r\n    workSheet.getCell('I9').value = 'NÚCLEO ESTRUCTURANTE:';\r\n    workSheet.getCell('I9').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet.mergeCells('L9:S9');\r\n    workSheet.mergeCells('A10:C10');\r\n    workSheet.getCell('A10').value = 'TUTOR(A) EMPRESARIAL:';\r\n    workSheet.getCell('A10').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet.mergeCells('D10:H10');\r\n    workSheet.mergeCells('I10:K10');\r\n    workSheet.getCell('I10').value = 'CARRERA:';\r\n    workSheet.getCell('I10').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet.mergeCells('L10:S10');\r\n    for (let row = 6; row <= 10; row++) {\r\n        for (let col = 1; col <= 19; col++) {\r\n            applyBorder(workSheet.getCell(row, col));\r\n            const cell = workSheet.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', horizontal: 'left' };\r\n        }\r\n    }\r\n    workSheet.getCell('D6').value = company;\r\n    workSheet.getCell('D7').value = [firstName, secondName, lastName, secondLastName].join(' ');\r\n    workSheet.getCell('D8').value = dni;\r\n    workSheet.getCell('D6').value = academicTutor;\r\n    workSheet.getCell('D6').value = businessTutor;\r\n    workSheet.getCell('L6').value = academicPeriod;\r\n    workSheet.getCell('L7').value = electivePeriod;\r\n    workSheet.getCell('L10').value = career;\r\n    workSheet.getCell('D6').alignment = { horizontal: 'center', vertical: 'middle' };\r\n    workSheet.getCell('D7').alignment = { horizontal: 'center', vertical: 'middle' };\r\n    workSheet.getCell('D8').alignment = { horizontal: 'center', vertical: 'middle' };\r\n    workSheet.getCell('D6').alignment = { horizontal: 'center', vertical: 'middle' };\r\n    workSheet.getCell('D6').alignment = { horizontal: 'center', vertical: 'middle' };\r\n    workSheet.getCell('L6').alignment = { horizontal: 'center', vertical: 'middle' };\r\n    workSheet.getCell('L7').alignment = { horizontal: 'center', vertical: 'middle' };\r\n    workSheet.getCell('L10').alignment = { horizontal: 'center', vertical: 'middle' };\r\n    workSheet.getRow(11).height = 10;\r\n    workSheet.mergeCells('A12:S12');\r\n    workSheet.getCell('A12').value = 'OBJETIVO DEL NÚCLEO ESTRUCTURANTE PARA LA FASE PRÁCTICA';\r\n    workSheet.getCell('A12').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet.mergeCells('A13:S13');\r\n    workSheet.getCell('A13').value = 'Objetivo';\r\n    workSheet.getCell('A13').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFF000' } };\r\n    workSheet.getRow(13).height = 40;\r\n    for (let row = 12; row <= 13; row++) {\r\n        for (let col = 1; col <= 19; col++) {\r\n            applyBorder(workSheet.getCell(row, col));\r\n            const cell = workSheet.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', horizontal: 'center' };\r\n        }\r\n    }\r\n    workSheet.getRow(14).height = 10;\r\n    workSheet.mergeCells('A15:S15');\r\n    workSheet.getCell('A15').value = 'INFORME DE APRENDIZAJE DE LA FASE PRÁCTICA';\r\n    workSheet.getCell('A15').alignment = { vertical: 'middle', horizontal: 'center' };\r\n    workSheet.getCell('A15').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet.getCell('A16').value = 'SEMANA';\r\n    workSheet.getCell('A16').alignment = { vertical: 'middle', horizontal: 'center' };\r\n    workSheet.mergeCells('B16:D16');\r\n    workSheet.getCell('B16').value = 'FECHA';\r\n    workSheet.getCell('B16').alignment = { vertical: 'middle', horizontal: 'center' };\r\n    workSheet.mergeCells('E16:G16');\r\n    workSheet.getCell('E16').value = 'PUESTO DE APRENDIZAJE';\r\n    workSheet.getCell('E16').alignment = { vertical: 'middle', horizontal: 'center' };\r\n    workSheet.mergeCells('H16:M16');\r\n    workSheet.getCell('H16').value = 'ACTIVIDADES REALIZADAS';\r\n    workSheet.getCell('H16').alignment = { vertical: 'middle', horizontal: 'center' };\r\n    workSheet.mergeCells('N16:S16');\r\n    workSheet.getCell('N16').value = 'ACTIVIDADES AUTÓNOMAS';\r\n    workSheet.getCell('N16').alignment = { vertical: 'middle', horizontal: 'center' };\r\n    for (let row = 15; row <= 28; row++) {\r\n        for (let col = 1; col <= 19; col++) {\r\n            applyBorder(workSheet.getCell(row, col));\r\n            const cell = workSheet.getCell(15, col);\r\n            cell.font = { bold: true };\r\n        }\r\n    }\r\n    for (let row = 17, i = 1; row <= 24; row++) {\r\n        workSheet.getCell(`A${row}`).value = i++;\r\n        workSheet.getCell(`A${row}`).alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n        workSheet.mergeCells(`B${row}:D${row}`);\r\n        workSheet.getCell(`B${row}`).alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n        workSheet.getCell(`B${row}`).value = '02/01/2024 – 06/01/2024';\r\n        workSheet.mergeCells(`E${row}:G${row}`);\r\n        workSheet.getCell(`E${row}`).alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n        workSheet.getCell(`E${row}`).value = 'Teletrabajo';\r\n        workSheet.mergeCells(`H${row}:M${row}`);\r\n        workSheet.getCell(`H${row}`).alignment = { vertical: 'middle', horizontal: 'left', wrapText: true };\r\n        workSheet.getCell(`H${row}`).value = 'Creación del documento técnico para bajar el proyecto, así mismo como para realizar cambios';\r\n        workSheet.mergeCells(`N${row}:S${row}`);\r\n        workSheet.getCell(`N${row}`).alignment = { vertical: 'middle', horizontal: 'left', wrapText: true };\r\n        workSheet.getCell(`N${row}`).value = 'Revisión a profundidad del proyecto para solucionar errores, además de cierta investigación sobre JWT en NestJs para implementar sus mejoras dentro del sistema';\r\n        workSheet.getRow(row).height = 60;\r\n    }\r\n    workSheet.mergeCells('A25:D28');\r\n    workSheet.getCell('A25').value = 'Reflexión sobre el aprendizaje alcanzado de las actividades realizadas en la empresa formadora.';\r\n    workSheet.getCell('A25').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet.getCell('A25').font = { bold: true };\r\n    workSheet.getCell('A25').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet.mergeCells('E25:K28');\r\n    workSheet.getCell('E25').value = 'Reflexión';\r\n    workSheet.getCell('E25').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFF000' } };\r\n    workSheet.getCell('E25').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet.mergeCells('L25:O28');\r\n    workSheet.getCell('L25').value = 'Observaciones de la empresa formadora sobre el desempeño del estudiante:';\r\n    workSheet.getCell('L25').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet.getCell('L25').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet.getCell('L25').font = { bold: true };\r\n    workSheet.mergeCells('P25:S28');\r\n    workBook.xlsx.writeBuffer()\r\n        .then((buffer) => {\r\n        const blob = new Blob([buffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });\r\n        fileSaver.saveAs(blob, 'InformeApredizaje.xlsx');\r\n    })\r\n        .catch((error) => {\r\n        console.error('Error al guardar el archivo:', error);\r\n    });\r\n}
87	Evaluación institucional y empresarial	Evaluación institucional y empresarial	1.0	10-07-2023	10-07-2023	123123	async function createDocument7({ fileSaver, exceljs, process, version, elaborationDate, updateDate, code, instituteName, docName, logoImage, company, dni, firstName, secondName, lastName, secondLastName, academicTutor, businessTutor, email, career, academicPeriod, electivePeriod }) {\r\n    const workBook = new exceljs.Workbook();\r\n    const workSheet1 = workBook.addWorksheet('Evaluacion-Empresarial');\r\n    workSheet1.pageSetup = {\r\n        paperSize: 9,\r\n        fitToPage: true,\r\n        fitToWidth: 1,\r\n        fitToHeight: 1,\r\n        orientation: 'landscape'\r\n    };\r\n      const logo1 = workBook.addImage({\r\n      base64: await logoImage,\r\n      extension: 'png'\r\n      })\r\n    workSheet1.mergeCells('A1:B4');\r\n      workSheet1.addImage( logo1, 'A1:B4')\r\n    workSheet1.mergeCells('C1:Q1');\r\n    workSheet1.getCell('C1').value = instituteName;\r\n    workSheet1.getCell('C1').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: '3366ff' } };\r\n    workSheet1.mergeCells('C2:Q2');\r\n    workSheet1.getCell('C2').value = 'MACROPROCESO 01 DOCENCIA';\r\n    workSheet1.mergeCells('C3:Q3');\r\n    workSheet1.getCell('C3').value = process;\r\n    workSheet1.getCell('C3').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'e6802c' } };\r\n    workSheet1.mergeCells('C4:Q4');\r\n    workSheet1.getCell('C4').value = docName;\r\n    workSheet1.getColumn('R').width = 15;\r\n    workSheet1.getColumn('S').width = 15;\r\n    workSheet1.getCell('R1').value = 'VERSIÓN';\r\n    workSheet1.getCell('S1').value = version;\r\n    workSheet1.getCell('R2').value = 'ELABORACIÓN';\r\n    workSheet1.getCell('S2').value = elaborationDate;\r\n    workSheet1.getCell('R3').value = 'ACTUALIZACIÓN';\r\n    workSheet1.getCell('S3').value = updateDate;\r\n    workSheet1.getCell('R4').value = 'CÓDIGO';\r\n    workSheet1.getCell('S4').value = code;\r\n    const usedCells = workSheet1.getSheetValues();\r\n    const applyBorder = (cell) => {\r\n        cell.border = {\r\n            top: { style: 'thin', color: { argb: 'FF000000' } },\r\n            left: { style: 'thin', color: { argb: 'FF000000' } },\r\n            bottom: { style: 'thin', color: { argb: 'FF000000' } },\r\n            right: { style: 'thin', color: { argb: 'FF000000' } }\r\n        };\r\n    };\r\n    for (let row = 1; row <= 4; row++) {\r\n        for (let col = 1; col <= 19; col++) {\r\n            applyBorder(workSheet1.getCell(row, col));\r\n            const cell = workSheet1.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', horizontal: 'center' };\r\n        }\r\n    }\r\n    workSheet1.getRow(5).height = 10;\r\n    workSheet1.mergeCells('A6:C6');\r\n    workSheet1.getCell('A6').value = 'EMPRESA FORMADORA:';\r\n    workSheet1.getCell('A6').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet1.mergeCells('D6:H6');\r\n    workSheet1.mergeCells('I6:K6');\r\n    workSheet1.getCell('I6').value = 'NIVEL:';\r\n    workSheet1.getCell('I6').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet1.mergeCells('L6:S6');\r\n    workSheet1.getCell('D6').value = company;\r\n    workSheet1.getCell('D7').value = [firstName, secondName, lastName, secondLastName].join(' ');\r\n    workSheet1.getCell('D8').value = dni;\r\n    workSheet1.getCell('D9').value = academicTutor;\r\n    workSheet1.getCell('D10').value = businessTutor;\r\n    workSheet1.mergeCells('A7:C7');\r\n    workSheet1.getCell('A7').value = 'ESTUDIANTE:';\r\n    workSheet1.getCell('A7').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet1.mergeCells('D7:H7');\r\n    workSheet1.mergeCells('I7:K7');\r\n    workSheet1.getCell('I7').value = 'CICLO ACADÉMICO:';\r\n    workSheet1.getCell('I7').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet1.mergeCells('L7:S7');\r\n    workSheet1.getCell('L6').value = academicPeriod;\r\n    workSheet1.getCell('L7').value = electivePeriod;\r\n    workSheet1.getCell('L10').value = career;\r\n    workSheet1.mergeCells('A8:C8');\r\n    workSheet1.getCell('A8').value = 'CÉDULA:';\r\n    workSheet1.getCell('A8').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet1.mergeCells('D8:H8');\r\n    workSheet1.mergeCells('I8:K8');\r\n    workSheet1.getCell('I8').value = 'F. INICIO FASE PRÁCTICA';\r\n    workSheet1.getCell('I8').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet1.mergeCells('L8:N8');\r\n    workSheet1.getCell('L8').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFF000' } };\r\n    workSheet1.mergeCells('O8:Q8');\r\n    workSheet1.getCell('O8').value = 'F. FIN FASE PRÁCTICA';\r\n    workSheet1.getCell('O8').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet1.mergeCells('R8:S8');\r\n    workSheet1.getCell('R8').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFF000' } };\r\n    workSheet1.mergeCells('A9:C9');\r\n    workSheet1.getCell('A9').value = 'TUTOR(A) ACADÉMICO:';\r\n    workSheet1.getCell('A9').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet1.mergeCells('D9:H9');\r\n    workSheet1.mergeCells('I9:K9');\r\n    workSheet1.getCell('I9').value = 'NÚCLEO ESTRUCTURANTE:';\r\n    workSheet1.getCell('I9').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet1.mergeCells('L9:S9');\r\n    workSheet1.mergeCells('A10:C10');\r\n    workSheet1.getCell('A10').value = 'TUTOR(A) EMPRESARIAL:';\r\n    workSheet1.getCell('A10').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet1.mergeCells('D10:H10');\r\n    workSheet1.mergeCells('I10:K10');\r\n    workSheet1.getCell('I10').value = 'CARRERA:';\r\n    workSheet1.getCell('I10').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet1.mergeCells('L10:S10');\r\n    for (let row = 6; row <= 10; row++) {\r\n        for (let col = 1; col <= 19; col++) {\r\n            applyBorder(workSheet1.getCell(row, col));\r\n            const cell = workSheet1.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', horizontal: 'left' };\r\n        }\r\n    }\r\n    workSheet1.getCell('D6').alignment = { horizontal: 'center', vertical: 'middle', wrapText: true };\r\n    workSheet1.getCell('D7').alignment = { horizontal: 'center', vertical: 'middle', wrapText: true };\r\n    workSheet1.getCell('D8').alignment = { horizontal: 'center', vertical: 'middle', wrapText: true };\r\n    workSheet1.getCell('D9').alignment = { horizontal: 'center', vertical: 'middle', wrapText: true };\r\n    workSheet1.getCell('D10').alignment = { horizontal: 'center', vertical: 'middle', wrapText: true };\r\n    workSheet1.getCell('L6').alignment = { horizontal: 'center', vertical: 'middle', wrapText: true };\r\n    workSheet1.getCell('L7').alignment = { horizontal: 'center', vertical: 'middle', wrapText: true };\r\n    workSheet1.getCell('L10').alignment = { horizontal: 'center', vertical: 'middle', wrapText: true };\r\n    workSheet1.getRow(11).height = 10;\r\n    workSheet1.mergeCells('A12:S12');\r\n    workSheet1.getCell('A12').value = 'OBJETIVO DEL NÚCLEO ESTRUCTURANTE PARA LA FASE PRÁCTICA';\r\n    workSheet1.getCell('A12').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet1.mergeCells('A13:S13');\r\n    workSheet1.getCell('A13').value = 'Objetivo';\r\n    workSheet1.getCell('A13').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFF000' } };\r\n    workSheet1.getRow(13).height = 40;\r\n    for (let row = 12; row <= 13; row++) {\r\n        for (let col = 1; col <= 19; col++) {\r\n            applyBorder(workSheet1.getCell(row, col));\r\n            const cell = workSheet1.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', horizontal: 'center' };\r\n        }\r\n    }\r\n    workSheet1.getRow(14).height = 10;\r\n    for (let row = 15; row <= 29; row++) {\r\n        for (let col = 2; col <= 7; col++) {\r\n            applyBorder(workSheet1.getCell(row, col));\r\n            const cell = workSheet1.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', horizontal: 'center' };\r\n        }\r\n    }\r\n    for (let row = 15; row <= 29; row++) {\r\n        workSheet1.mergeCells(`B${row}:E${row}`);\r\n        workSheet1.mergeCells(`F${row}:G${row}`);\r\n        workSheet1.getRow(row).height = 40;\r\n    }\r\n    workSheet1.getCell('B15').alignment = { vertical: 'middle', horizontal: 'left', wrapText: true };\r\n    workSheet1.getCell('B15').font = { bold: true };\r\n    workSheet1.getCell('B15').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'DEEAF6' } };\r\n    workSheet1.getCell('B15').value = 'EVALUACION DE DESEMPEÑO';\r\n    workSheet1.getCell('B16').alignment = { vertical: 'middle', horizontal: 'left', wrapText: true };\r\n    workSheet1.getCell('B16').value = 'Logro de Objetivos de Aprendizaje';\r\n    workSheet1.getCell('B17').alignment = { vertical: 'middle', horizontal: 'left', wrapText: true };\r\n    workSheet1.getCell('B17').value = 'Desempeño en los puestos de trabajo y actividades asignadas (Plan de rotación)';\r\n    workSheet1.getCell('B18').alignment = { vertical: 'middle', horizontal: 'left', wrapText: true };\r\n    workSheet1.getCell('B18').value = 'Capacidad de aplicar los conocimientos en la práctica.';\r\n    workSheet1.getCell('B19').alignment = { vertical: 'middle', horizontal: 'left', wrapText: true };\r\n    workSheet1.getCell('B19').value = 'Capacidad de comunicación oral y escrita.';\r\n    workSheet1.getCell('B20').alignment = { vertical: 'middle', horizontal: 'left', wrapText: true };\r\n    workSheet1.getCell('B20').value = 'Capacidad de investigación, aprender y actualizarse permanentemente';\r\n    workSheet1.getCell('B21').alignment = { vertical: 'middle', horizontal: 'left', wrapText: true };\r\n    workSheet1.getCell('B21').value = 'Capacidad creativa.';\r\n    workSheet1.getCell('B22').alignment = { vertical: 'middle', horizontal: 'left', wrapText: true };\r\n    workSheet1.getCell('B22').value = 'Capacidad para identificar, plantear y resolver problemas.';\r\n    workSheet1.getCell('B23').alignment = { vertical: 'middle', horizontal: 'left', wrapText: true };\r\n    workSheet1.getCell('B23').value = 'Capacidad de trabajo en equipo y capacidades interpersonales';\r\n    workSheet1.getCell('B24').alignment = { vertical: 'middle', horizontal: 'left', wrapText: true };\r\n    workSheet1.getCell('B24').value = 'Valoración y respecto por la diversidad y multiculturalidad.';\r\n    workSheet1.getCell('B25').alignment = { vertical: 'middle', horizontal: 'left', wrapText: true };\r\n    workSheet1.getCell('B25').value = 'Habilidad para trabajar en forma autónoma.';\r\n    workSheet1.getCell('B26').alignment = { vertical: 'middle', horizontal: 'left', wrapText: true };\r\n    workSheet1.getCell('B26').value = 'Habilidad para trabajar en forma grupal.';\r\n    workSheet1.getCell('B28').alignment = { vertical: 'middle', horizontal: 'left', wrapText: true };\r\n    workSheet1.getCell('B28').font = { bold: true };\r\n    workSheet1.getCell('B28').value = 'Promedio';\r\n    workSheet1.getCell('B29').alignment = { vertical: 'middle', horizontal: 'left', wrapText: true };\r\n    workSheet1.getCell('B29').font = { bold: true };\r\n    workSheet1.getCell('B29').value = 'Nota ponderada sobre 7 puntos';\r\n    workSheet1.getCell('F15').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('F15').font = { bold: true };\r\n    workSheet1.getCell('F15').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'DEEAF6' } };\r\n    workSheet1.getCell('F15').value = 'NOTA \\n (10 puntos)';\r\n    workSheet1.getCell('F16').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('F16').value = 10;\r\n    workSheet1.getCell('F17').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('F17').value = 10;\r\n    workSheet1.getCell('F18').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('F18').value = 10;\r\n    workSheet1.getCell('F19').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('F19').value = 10;\r\n    workSheet1.getCell('F20').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('F20').value = 10;\r\n    workSheet1.getCell('F21').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('F21').value = 10;\r\n    workSheet1.getCell('F22').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('F22').value = 10;\r\n    workSheet1.getCell('F23').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('F23').value = 10;\r\n    workSheet1.getCell('F24').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('F24').value = 10;\r\n    workSheet1.getCell('F25').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('F25').value = 10;\r\n    workSheet1.getCell('F26').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('F26').value = 10;\r\n    workSheet1.getRow(27).height = 15;\r\n    workSheet1.getCell('F28').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('F28').font = { bold: true };\r\n    workSheet1.getCell('F28').numFmt = '0.00';\r\n    workSheet1.getCell('F28').value = { formula: 'AVERAGE(F16:F26)' };\r\n    workSheet1.getCell('F29').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('F29').numFmt = '0.00';\r\n    workSheet1.getCell('F29').font = { bold: true };\r\n    workSheet1.getCell('F29').value = { formula: 'F28 * 0.7' };\r\n    for (let row = 15; row <= 25; row++) {\r\n        for (let col = 11; col <= 18; col++) {\r\n            applyBorder(workSheet1.getCell(row, col));\r\n            const cell = workSheet1.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', horizontal: 'center' };\r\n        }\r\n    }\r\n    workSheet1.mergeCells('K15:M16');\r\n    workSheet1.getCell('K15').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'DEEAF6' } };\r\n    workSheet1.getCell('K15').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('K15').font = { bold: true };\r\n    workSheet1.getCell('K15').value = 'DEFENSA PROYECTO TUTOR EMPRESARIAL';\r\n    workSheet1.mergeCells('K17:M17');\r\n    workSheet1.getCell('K17').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'DEEAF6' } };\r\n    workSheet1.getCell('K17').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('K17').font = { bold: true };\r\n    workSheet1.getCell('K17').value = 'CREITERIOS';\r\n    workSheet1.mergeCells('K18:M18');\r\n    workSheet1.getRow(18).height = 60;\r\n    workSheet1.getCell('K18').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('K18').value = 'Presentación en tiempo y forma (formato, normas APA, cronograma)';\r\n    workSheet1.mergeCells('K19:M19');\r\n    workSheet1.getRow(19).height = 60;\r\n    workSheet1.getCell('K19').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('K19').value = 'Calidad de la presentación (uso ayudas técnicas y audiovisuales,etc.)';\r\n    workSheet1.mergeCells('K20:M20');\r\n    workSheet1.getCell('K20').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('K20').value = 'Dominio del contenido';\r\n    workSheet1.mergeCells('K21:M21');\r\n    workSheet1.getCell('K21').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('K21').value = 'Claridad y precisión en la exposición';\r\n    workSheet1.mergeCells('K22:M22');\r\n    workSheet1.getCell('K22').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('K22').value = 'Satisfacción de la Empresa Formadora';\r\n    workSheet1.mergeCells('K23:Q23');\r\n    workSheet1.getCell('K23').alignment = { vertical: 'middle', horizontal: 'right', wrapText: true };\r\n    workSheet1.getCell('K23').font = { bold: true };\r\n    workSheet1.getCell('K23').value = 'Nota Parcial de la Defensa del Proyecto:';\r\n    workSheet1.mergeCells('K24:Q24');\r\n    workSheet1.getCell('K24').alignment = { vertical: 'middle', horizontal: 'right', wrapText: true };\r\n    workSheet1.getCell('K24').font = { bold: true };\r\n    workSheet1.getCell('K24').value = 'Nota Final de la Defensa del Proyecto:';\r\n    workSheet1.mergeCells('K25:Q25');\r\n    workSheet1.getCell('K25').alignment = { vertical: 'middle', horizontal: 'right', wrapText: true };\r\n    workSheet1.getCell('K25').font = { bold: true };\r\n    workSheet1.getCell('K25').value = 'Nota ponderada sobre 3 puntos:';\r\n    workSheet1.mergeCells('N15:N16');\r\n    workSheet1.getCell('N15').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'DEEAF6' } };\r\n    workSheet1.getCell('N15').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true, textRotation: 90 };\r\n    workSheet1.getCell('N15').font = { bold: true };\r\n    workSheet1.getCell('N15').value = 'Excelente';\r\n    workSheet1.getCell('N17').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('N17').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'DEEAF6' } };\r\n    workSheet1.getCell('N17').value = 4;\r\n    workSheet1.getCell('N18').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('N18').value = 4;\r\n    workSheet1.getCell('N19').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('N19').value = 4;\r\n    workSheet1.getCell('N20').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('N20').value = 4;\r\n    workSheet1.getCell('N21').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('N21').value = 4;\r\n    workSheet1.getCell('N22').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('N22').value = 4;\r\n    workSheet1.mergeCells('O15:O16');\r\n    workSheet1.getCell('O15').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'DEEAF6' } };\r\n    workSheet1.getCell('O15').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true, textRotation: 90 };\r\n    workSheet1.getCell('O15').font = { bold: true };\r\n    workSheet1.getCell('O15').value = 'Bueno';\r\n    workSheet1.getCell('O17').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('O17').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'DEEAF6' } };\r\n    workSheet1.getCell('O17').value = 3;\r\n    workSheet1.getCell('O18').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('O19').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('O20').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('O21').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('O22').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.mergeCells('P15:P16');\r\n    workSheet1.getCell('P15').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'DEEAF6' } };\r\n    workSheet1.getCell('P15').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true, textRotation: 90 };\r\n    workSheet1.getCell('P15').font = { bold: true };\r\n    workSheet1.getCell('P15').value = 'Regular';\r\n    workSheet1.getCell('P17').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('P17').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'DEEAF6' } };\r\n    workSheet1.getCell('P17').value = 2;\r\n    workSheet1.getCell('P18').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('P19').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('P20').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('P21').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('P22').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.mergeCells('Q15:Q16');\r\n    workSheet1.getCell('Q15').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'DEEAF6' } };\r\n    workSheet1.getCell('Q15').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true, textRotation: 90 };\r\n    workSheet1.getCell('Q15').font = { bold: true };\r\n    workSheet1.getCell('Q15').value = 'Deficiente';\r\n    workSheet1.getCell('Q17').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('Q17').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'DEEAF6' } };\r\n    workSheet1.getCell('Q17').value = 1;\r\n    workSheet1.getCell('Q18').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('Q19').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('Q20').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('Q21').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('Q22').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.mergeCells('R15:R17');\r\n    workSheet1.getCell('R15').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('R15').value = 'NOTA PARCIAL';\r\n    workSheet1.getCell('R18').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('R18').value = { formula: 'SUM(N18:Q18)' };\r\n    workSheet1.getCell('R19').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('R19').value = { formula: 'SUM(N19:Q19)' };\r\n    workSheet1.getCell('R20').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('R20').value = { formula: 'SUM(N20:Q20)' };\r\n    workSheet1.getCell('R21').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('R21').value = { formula: 'SUM(N21:Q21)' };\r\n    workSheet1.getCell('R22').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('R22').value = { formula: 'SUM(N22:Q22)' };\r\n    workSheet1.getCell('R23').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('R23').value = { formula: 'SUM(R18:R22)' };\r\n    workSheet1.getCell('R24').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('R24').numFmt = '0.00';\r\n    workSheet1.getCell('R24').value = { formula: 'R23 * 10 / 20' };\r\n    workSheet1.getCell('R25').alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n    workSheet1.getCell('R25').numFmt = '0.00';\r\n    workSheet1.getCell('R25').value = { formula: 'R24 * 0.3' };\r\n    for (let row = 28; row <= 29; row++) {\r\n        for (let col = 11; col <= 15; col++) {\r\n            applyBorder(workSheet1.getCell(row, col));\r\n            const cell = workSheet1.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', horizontal: 'center' };\r\n        }\r\n    }\r\n    workSheet1.mergeCells('K28:M29');\r\n    workSheet1.getCell('K28').font = { bold: true };\r\n    workSheet1.getCell('K28').value = 'NOTA FINAL EMPRESA';\r\n    workSheet1.mergeCells('N28:O29');\r\n    workSheet1.getCell('N28').font = { bold: true };\r\n    workSheet1.getCell('N28').numFmt = '0.00';\r\n    workSheet1.getCell('N28').value = { formula: 'F29 + R25' };\r\n    for (let row = 31; row <= 31; row++) {\r\n        for (let col = 2; col <= 5; col++) {\r\n            applyBorder(workSheet1.getCell(row, col));\r\n            const cell = workSheet1.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', horizontal: 'center' };\r\n        }\r\n    }\r\n    workSheet1.mergeCells('B31:E31');\r\n    workSheet1.getCell('B31').value = 'COMENTARIOS/OBSERVACIONES';\r\n    for (let row = 32; row <= 35; row++) {\r\n        workSheet1.mergeCells(`B${row}:O${row}`);\r\n        for (let col = 2; col <= 15; col++) {\r\n            applyBorder(workSheet1.getCell(row, col));\r\n            const cell = workSheet1.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', horizontal: 'center' };\r\n        }\r\n    }\r\n    const workSheet2 = workBook.addWorksheet('Evaluacion Instituto');\r\n    workSheet2.pageSetup = {\r\n        paperSize: 9,\r\n        fitToPage: true,\r\n        fitToWidth: 1,\r\n        fitToHeight: 1,\r\n        orientation: 'landscape'\r\n    };\r\n      const logo2= workBook.addImage({\r\n      base64: await logoImage,\r\n      extension: 'png'\r\n      })\r\n    workSheet2.mergeCells('A1:B4');\r\n      workSheet2.addImage( logo2, 'A1:B4')\r\n    workSheet2.mergeCells('C1:Q1');\r\n    workSheet2.getCell('C1').value = instituteName;\r\n    workSheet2.getCell('C1').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: '3366ff' } };\r\n    workSheet2.mergeCells('C2:Q2');\r\n    workSheet2.getCell('C2').value = 'MACROPROCESO 01 DOCENCIA';\r\n    workSheet2.mergeCells('C3:Q3');\r\n    workSheet2.getCell('C3').value = process;\r\n    workSheet2.getCell('C3').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'e6802c' } };\r\n    workSheet2.mergeCells('C4:Q4');\r\n    workSheet2.getCell('C4').value = docName;\r\n    workSheet2.getColumn('R').width = 15;\r\n    workSheet2.getColumn('S').width = 15;\r\n    workSheet2.getCell('R1').value = 'VERSIÓN';\r\n    workSheet2.getCell('S1').value = version;\r\n    workSheet2.getCell('R2').value = 'ELABORACIÓN';\r\n    workSheet2.getCell('S2').value = elaborationDate;\r\n    workSheet2.getCell('R3').value = 'ACTUALIZACIÓN';\r\n    workSheet2.getCell('S3').value = updateDate;\r\n    workSheet2.getCell('R4').value = 'CÓDIGO';\r\n    workSheet2.getCell('S4').value = code;\r\n    workSheet2.getCell('D6').value = company;\r\n    workSheet2.getCell('D7').value = [firstName, secondName, lastName, secondLastName].join(' ');\r\n    workSheet2.getCell('D8').value = dni;\r\n    workSheet2.getCell('D9').value = academicTutor;\r\n    workSheet2.getCell('D10').value = businessTutor;\r\n    workSheet2.getCell('L6').value = academicPeriod;\r\n    workSheet2.getCell('L7').value = electivePeriod;\r\n    workSheet2.getCell('L10').value = career;\r\n    for (let row = 1; row <= 4; row++) {\r\n        for (let col = 1; col <= 19; col++) {\r\n            applyBorder(workSheet2.getCell(row, col));\r\n            const cell = workSheet2.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n        }\r\n    }\r\n    workSheet2.getRow(5).height = 10;\r\n    workSheet2.mergeCells('A6:C6');\r\n    workSheet2.getCell('A6').value = 'EMPRESA FORMADORA:';\r\n    workSheet2.getCell('A6').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet2.mergeCells('D6:H6');\r\n    workSheet2.mergeCells('I6:K6');\r\n    workSheet2.getCell('I6').value = 'NIVEL:';\r\n    workSheet2.getCell('I6').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet2.mergeCells('L6:S6');\r\n    workSheet2.mergeCells('A7:C7');\r\n    workSheet2.getCell('A7').value = 'ESTUDIANTE:';\r\n    workSheet2.getCell('A7').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet2.mergeCells('D7:H7');\r\n    workSheet2.mergeCells('I7:K7');\r\n    workSheet2.getCell('I7').value = 'CICLO ACADÉMICO:';\r\n    workSheet2.getCell('I7').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet2.mergeCells('L7:S7');\r\n    workSheet2.mergeCells('A8:C8');\r\n    workSheet2.getCell('A8').value = 'CÉDULA:';\r\n    workSheet2.getCell('A8').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet2.mergeCells('D8:H8');\r\n    workSheet2.mergeCells('I8:K8');\r\n    workSheet2.getCell('I8').value = 'F. INICIO FASE PRÁCTICA';\r\n    workSheet2.getCell('I8').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet2.mergeCells('L8:N8');\r\n    workSheet2.getCell('L8').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFF000' } };\r\n    workSheet2.mergeCells('O8:Q8');\r\n    workSheet2.getCell('O8').value = 'F. FIN FASE PRÁCTICA';\r\n    workSheet2.getCell('O8').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet2.mergeCells('R8:S8');\r\n    workSheet2.getCell('R8').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFF000' } };\r\n    workSheet2.mergeCells('A9:C9');\r\n    workSheet2.getCell('A9').value = 'TUTOR(A) ACADÉMICO:';\r\n    workSheet2.getCell('A9').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet2.mergeCells('D9:H9');\r\n    workSheet2.mergeCells('I9:K9');\r\n    workSheet2.getCell('I9').value = 'NÚCLEO ESTRUCTURANTE:';\r\n    workSheet2.getCell('I9').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet2.mergeCells('L9:S9');\r\n    workSheet2.mergeCells('A10:C10');\r\n    workSheet2.getCell('A10').value = 'TUTOR(A) EMPRESARIAL:';\r\n    workSheet2.getCell('A10').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet2.mergeCells('D10:H10');\r\n    workSheet2.mergeCells('I10:K10');\r\n    workSheet2.getCell('I10').value = 'CARRERA:';\r\n    workSheet2.getCell('I10').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet2.mergeCells('L10:S10');\r\n    for (let row = 6; row <= 10; row++) {\r\n        for (let col = 1; col <= 19; col++) {\r\n            applyBorder(workSheet2.getCell(row, col));\r\n            const cell = workSheet2.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', horizontal: 'left', wrapText: true };\r\n        }\r\n    }\r\n    workSheet2.getCell('D6').alignment = { horizontal: 'center', vertical: 'middle', wrapText: true };\r\n    workSheet2.getCell('D7').alignment = { horizontal: 'center', vertical: 'middle', wrapText: true };\r\n    workSheet2.getCell('D8').alignment = { horizontal: 'center', vertical: 'middle', wrapText: true };\r\n    workSheet2.getCell('D9').alignment = { horizontal: 'center', vertical: 'middle', wrapText: true };\r\n    workSheet2.getCell('D10').alignment = { horizontal: 'center', vertical: 'middle', wrapText: true };\r\n    workSheet2.getCell('L6').alignment = { horizontal: 'center', vertical: 'middle', wrapText: true };\r\n    workSheet2.getCell('L7').alignment = { horizontal: 'center', vertical: 'middle', wrapText: true };\r\n    workSheet2.getCell('L10').alignment = { horizontal: 'center', vertical: 'middle', wrapText: true };\r\n    workSheet2.getRow(11).height = 10;\r\n    workSheet2.mergeCells('A12:S12');\r\n    workSheet2.getCell('A12').value = 'OBJETIVO DEL NÚCLEO ESTRUCTURANTE PARA LA FASE PRÁCTICA';\r\n    workSheet2.getCell('A12').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n    workSheet2.mergeCells('A13:S13');\r\n    workSheet2.getCell('A13').value = 'Objetivo';\r\n    workSheet2.getCell('A13').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFF000' } };\r\n    workSheet2.getRow(13).height = 40;\r\n    for (let row = 12; row <= 13; row++) {\r\n        for (let col = 1; col <= 19; col++) {\r\n            applyBorder(workSheet2.getCell(row, col));\r\n            const cell = workSheet2.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n        }\r\n    }\r\n    workSheet2.getRow(14).height = 10;\r\n    for (let row = 15; row <= 32; row++) {\r\n        for (let col = 1; col <= 7; col++) {\r\n            applyBorder(workSheet2.getCell(row, col));\r\n            const cell = workSheet2.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n        }\r\n    }\r\n    workSheet2.mergeCells('A15:B18');\r\n    workSheet2.getCell('A15').font = { bold: true };\r\n    workSheet2.getCell('A15').value = 'DEFENSA PROYECTO TUTOR ACADÉMICO';\r\n    workSheet2.mergeCells('A19:B19');\r\n    workSheet2.getCell('A19').value = 'CRITERIOS';\r\n    workSheet2.mergeCells('A20:B21');\r\n    workSheet2.getCell('A20').value = 'Presentación en tiempo y forma';\r\n    workSheet2.mergeCells('A22:B23');\r\n    workSheet2.getCell('A22').value = 'Calidad de la presentación ';\r\n    workSheet2.mergeCells('A24:B25');\r\n    workSheet2.getCell('A24').value = 'Dominio del contenido';\r\n    workSheet2.mergeCells('A26:B27');\r\n    workSheet2.getCell('A26').value = 'Claridad y precisión en la exposición';\r\n    workSheet2.mergeCells('A28:B29');\r\n    workSheet2.getCell('A28').value = 'Satisfacción de la Empresa Formadora';\r\n    workSheet2.mergeCells('A30:F30');\r\n    workSheet2.getCell('A30').alignment = { horizontal: 'right' };\r\n    workSheet2.getCell('A30').font = { bold: true };\r\n    workSheet2.getCell('A30').value = 'Nota Parcial de la Defensa del Proyecto:';\r\n    workSheet2.mergeCells('A31:F31');\r\n    workSheet2.getCell('A31').alignment = { horizontal: 'right', };\r\n    workSheet2.getCell('A31').font = { bold: true };\r\n    workSheet2.getCell('A31').value = 'Nota Final de la Defensa del Proyecto:';\r\n    workSheet2.mergeCells('A32:F32');\r\n    workSheet2.getCell('A32').alignment = { horizontal: 'right' };\r\n    workSheet2.getCell('A32').font = { bold: true };\r\n    workSheet2.getCell('A32').value = 'Nota ponderada sobre 3 puntos';\r\n    workSheet2.mergeCells('C15:C18');\r\n    workSheet2.getCell('C15').alignment = { textRotation: 90 };\r\n    workSheet2.getCell('C15').value = 'Excelente';\r\n    workSheet2.getCell('C19').value = 4;\r\n    workSheet2.mergeCells('C20:C21');\r\n    workSheet2.getCell('C20').value = 4;\r\n    workSheet2.mergeCells('C22:C23');\r\n    workSheet2.getCell('C22').value = 4;\r\n    workSheet2.mergeCells('C24:C25');\r\n    workSheet2.getCell('C24').value = 4;\r\n    workSheet2.mergeCells('C26:C27');\r\n    workSheet2.getCell('C26').value = 4;\r\n    workSheet2.mergeCells('C28:C29');\r\n    workSheet2.getCell('C28').value = 4;\r\n    workSheet2.mergeCells('D15:D18');\r\n    workSheet2.getCell('D15').alignment = { textRotation: 90 };\r\n    workSheet2.getCell('D15').value = 'Bueno';\r\n    workSheet2.getCell('D19').value = 3;\r\n    workSheet2.mergeCells('D20:D21');\r\n    workSheet2.mergeCells('D22:D23');\r\n    workSheet2.mergeCells('D24:D25');\r\n    workSheet2.mergeCells('D26:D27');\r\n    workSheet2.mergeCells('D28:D29');\r\n    workSheet2.mergeCells('E15:E18');\r\n    workSheet2.getCell('E15').alignment = { textRotation: 90 };\r\n    workSheet2.getCell('E15').value = 'Regular';\r\n    workSheet2.getCell('E19').value = 2;\r\n    workSheet2.mergeCells('E20:E21');\r\n    workSheet2.mergeCells('E22:E23');\r\n    workSheet2.mergeCells('E24:E25');\r\n    workSheet2.mergeCells('E26:E27');\r\n    workSheet2.mergeCells('E28:E29');\r\n    workSheet2.mergeCells('F15:F18');\r\n    workSheet2.getCell('F15').alignment = { textRotation: 90 };\r\n    workSheet2.getCell('F15').value = 'Deficiente';\r\n    workSheet2.getCell('F19').value = 1;\r\n    workSheet2.mergeCells('F20:F21');\r\n    workSheet2.mergeCells('F22:F23');\r\n    workSheet2.mergeCells('F24:F25');\r\n    workSheet2.mergeCells('F26:F27');\r\n    workSheet2.mergeCells('F28:F29');\r\n    workSheet2.mergeCells('G15:G19');\r\n    workSheet2.getCell('G15').font = { bold: true };\r\n    workSheet2.getCell('G15').value = 'NOTA PARCIAL';\r\n    workSheet2.mergeCells('G20:G21');\r\n    workSheet2.getCell('G20').value = { formula: 'Sum(C20:F21)' };\r\n    workSheet2.mergeCells('G22:G23');\r\n    workSheet2.getCell('G22').value = { formula: 'Sum(C22:F23)' };\r\n    workSheet2.mergeCells('G24:G25');\r\n    workSheet2.getCell('G24').value = { formula: 'Sum(C24:F25)' };\r\n    workSheet2.mergeCells('G26:G27');\r\n    workSheet2.getCell('G26').value = { formula: 'Sum(C26:F27)' };\r\n    workSheet2.mergeCells('G28:G29');\r\n    workSheet2.getCell('G28').value = { formula: 'Sum(C28:F29)' };\r\n    workSheet2.getCell('G30').value = { formula: 'Sum(G20:G29)' };\r\n    workSheet2.getCell('G31').value = { formula: 'G30 * 10 / 20' };\r\n    workSheet2.getCell('G31').numFmt = '0.00';\r\n    workSheet2.getCell('G32').value = { formula: 'G31 * 0.3' };\r\n    workSheet2.getCell('G32').numFmt = '0.00';\r\n    for (let row = 15; row <= 34; row++) {\r\n        for (let col = 9; col <= 18; col++) {\r\n            applyBorder(workSheet2.getCell(row, col));\r\n            const cell = workSheet2.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n        }\r\n    }\r\n    workSheet2.mergeCells('I15:K16');\r\n    workSheet2.getCell('I15').value = 'TEMA';\r\n    workSheet2.mergeCells('I17:K34');\r\n    workSheet2.getCell('I17').value = 'Sistema de Inventarios';\r\n    workSheet2.mergeCells('L15:Q16');\r\n    workSheet2.getCell('L15').value = 'PARÁMETROS PROYECTO EMPRESARIAL';\r\n    workSheet2.mergeCells('L17:Q18');\r\n    workSheet2.getCell('L17').value = '1.Proactividad, independencia y compromiso demostrado en la elaboración del proyecto.';\r\n    workSheet2.getCell('L17').alignment = { horizontal: 'left', wrapText: true, vertical: 'middle' };\r\n    workSheet2.mergeCells('L19:Q20');\r\n    workSheet2.getCell('L19').value = '2. Plazo y calidad en la entrega de documentos.';\r\n    workSheet2.getCell('L19').alignment = { horizontal: 'left', wrapText: true, vertical: 'middle' };\r\n    workSheet2.mergeCells('L21:Q22');\r\n    workSheet2.getCell('L21').value = '3. Cumplimiento de parametros en el  proyecto empresarial escrito.';\r\n    workSheet2.getCell('L21').alignment = { horizontal: 'left', wrapText: true, vertical: 'middle' };\r\n    workSheet2.mergeCells('L23:Q24');\r\n    workSheet2.getCell('L23').value = '4. Desarrollo del proyecto en profundidad y aporte a la solución del problema.';\r\n    workSheet2.getCell('L23').alignment = { horizontal: 'left', wrapText: true, vertical: 'middle' };\r\n    workSheet2.mergeCells('L25:Q26');\r\n    workSheet2.getCell('L25').value = '5. Cumplimiento de requerimientos / objetivos planteados al inicio del proyecto.';\r\n    workSheet2.getCell('L25').alignment = { horizontal: 'left', wrapText: true, vertical: 'middle' };\r\n    workSheet2.mergeCells('L27:Q28');\r\n    workSheet2.getCell('L27').value = '6. Uso de metodología científica y aplicación de normas bibliográficas.';\r\n    workSheet2.getCell('L27').alignment = { horizontal: 'left', wrapText: true, vertical: 'middle' };\r\n    workSheet2.mergeCells('L29:Q30');\r\n    workSheet2.getCell('L30').value = '7. Aporte al proyecto acorde al nivel académico.';\r\n    workSheet2.getCell('L30').alignment = { horizontal: 'left', wrapText: true, vertical: 'middle' };\r\n    workSheet2.mergeCells('L31:Q32');\r\n    workSheet2.getCell('L31').value = 'Promedio Parcial del Proyecto Empresarial:';\r\n    workSheet2.getCell('L31').alignment = { horizontal: 'right' };\r\n    workSheet2.mergeCells('L33:Q34');\r\n    workSheet2.getCell('L33').value = 'Nota ponderada sobre 7 puntos:';\r\n    workSheet2.getCell('L33').alignment = { horizontal: 'right' };\r\n    workSheet2.mergeCells('R15:R16');\r\n    workSheet2.getCell('R15').value = 'NOTA';\r\n    workSheet2.mergeCells('R17:R18');\r\n    workSheet2.getCell('R17').value = 10;\r\n    workSheet2.mergeCells('R19:R20');\r\n    workSheet2.getCell('R19').value = 10;\r\n    workSheet2.mergeCells('R21:R22');\r\n    workSheet2.getCell('R21').value = 10;\r\n    workSheet2.mergeCells('R23:R24');\r\n    workSheet2.getCell('R23').value = 10;\r\n    workSheet2.mergeCells('R25:R26');\r\n    workSheet2.getCell('R25').value = 10;\r\n    workSheet2.mergeCells('R27:R28');\r\n    workSheet2.getCell('R27').value = 10;\r\n    workSheet2.mergeCells('R29:R30');\r\n    workSheet2.getCell('R30').value = 10;\r\n    workSheet2.mergeCells('R31:R32');\r\n    workSheet2.getCell('R31').numFmt = '0.00';\r\n    workSheet2.getCell('R31').value = { formula: 'AVERAGE(R17:R30)' };\r\n    workSheet2.mergeCells('R33:R34');\r\n    workSheet2.getCell('R33').numFmt = '0.00';\r\n    workSheet2.getCell('R33').value = { formula: 'R31 * 0.7' };\r\n    for (let row = 37; row <= 42; row++) {\r\n        for (let col = 1; col <= 8; col++) {\r\n            applyBorder(workSheet2.getCell(row, col));\r\n            const cell = workSheet2.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n        }\r\n    }\r\n    workSheet2.mergeCells('A37:H37');\r\n    workSheet2.getCell('A37').value = 'EVALUACIÓN FINAL CONSOLIDADO EMPRESA - INSTITUTO';\r\n    workSheet2.getCell('A37').font = { bold: true };\r\n    workSheet2.mergeCells('A38:D38');\r\n    workSheet2.getCell('A38').value = 'EVALUACIÓN EMPRESA';\r\n    workSheet2.getCell('A38').font = { bold: true };\r\n    workSheet2.mergeCells('A39:D40');\r\n    workSheet2.getCell('A39').value = { formula: "'Evaluacion-Empresarial'!N28" };\r\n    workSheet2.getCell('A39').numFmt = '0.00';\r\n    workSheet2.mergeCells('A41:D42');\r\n    workSheet2.getCell('A41').value = 'PROMEDIO FINAL FASE PRÁCTICA:';\r\n    workSheet2.getCell('A41').font = { bold: true };\r\n    workSheet2.mergeCells('E38:H38');\r\n    workSheet2.getCell('E38').value = 'EVALUACIÓN INSTITUTO';\r\n    workSheet2.getCell('E38').numFmt = '0.00';\r\n    workSheet2.getCell('E38').font = { bold: true };\r\n    workSheet2.mergeCells('E39:H40');\r\n    workSheet2.getCell('E39').value = { formula: 'Sum(G32:R33)' };\r\n    workSheet2.mergeCells('E41:H42');\r\n    workSheet2.getCell('E41').numFmt = '0.00';\r\n    workSheet2.getCell('E41').value = { formula: '(A39*0.5) +(E39*0.5) ' };\r\n    for (let row = 37; row <= 37; row++) {\r\n        for (let col = 10; col <= 13; col++) {\r\n            applyBorder(workSheet2.getCell(row, col));\r\n            const cell = workSheet2.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n        }\r\n    }\r\n    workSheet2.mergeCells('J37:M37');\r\n    workSheet2.getCell('J37').value = 'COMENTARIOS / OBSERVACIONES:';\r\n    workSheet2.getCell('J37').font = { bold: true };\r\n    for (let row = 38; row <= 42; row++) {\r\n        workSheet2.mergeCells(`J${row}:R${row}`);\r\n        for (let col = 10; col <= 18; col++) {\r\n            applyBorder(workSheet2.getCell(row, col));\r\n            const cell = workSheet2.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n        }\r\n    }\r\n    workBook.xlsx.writeBuffer()\r\n        .then((buffer) => {\r\n        const blob = new Blob([buffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });\r\n        fileSaver.saveAs(blob, 'InformeApredizaje.xlsx');\r\n    })\r\n        .catch((error) => {\r\n        console.error('Error al guardar el archivo:', error);\r\n    });\r\n}
88	Registro de asistencia	Registro de asistencia	1.0	10-07-2023	10-07-2023	123123	async function createDocument8({ fileSaver, exceljs, version, elaborationDate, code, process, updateDate, docName, instituteName, logoImage, company, dni, firstName, secondName, lastName, secondLastName, academicTutor, businessTutor, email, career, academicPeriod, electivePeriod }) {\r\n    const workBook = new exceljs.Workbook();\r\n    const workSheet = workBook.addWorksheet('Informe de Aprendizaje');\r\n    workSheet.pageSetup = {\r\n        paperSize: 9,\r\n        fitToPage: true,\r\n        fitToWidth: 1,\r\n        fitToHeight: 1,\r\n        orientation: 'portrait'\r\n    };\r\n    const applyBorder = (cell) => {\r\n        cell.border = {\r\n            top: { style: 'thin', color: { argb: 'FF000000' } },\r\n            left: { style: 'thin', color: { argb: 'FF000000' } },\r\n            bottom: { style: 'thin', color: { argb: 'FF000000' } },\r\n            right: { style: 'thin', color: { argb: 'FF000000' } }\r\n        };\r\n    };\r\n      const logo = workBook.addImage({\r\n      base64: await logoImage,\r\n      extension: 'png'\r\n      })\r\n    workSheet.mergeCells('A1:C4');\r\n      workSheet.addImage( logo, 'A1:C4')\r\n    workSheet.getColumn('A').width = 5;\r\n    workSheet.mergeCells('D1:J1');\r\n    workSheet.getCell('D1').value = instituteName;\r\n    workSheet.getRow(1).height = 40;\r\n    workSheet.getCell('D1').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: '3366ff' } };\r\n    workSheet.mergeCells('D2:J2');\r\n    workSheet.getCell('D2').value = 'MACROPROCESO 01 DOCENCIA';\r\n    workSheet.mergeCells('D3:J3');\r\n    workSheet.getCell('D3').value = process;\r\n    workSheet.getCell('D3').fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'e6802c' } };\r\n    workSheet.getRow(3).height = 40;\r\n    workSheet.mergeCells('D4:J4');\r\n    workSheet.getCell('D4').value = docName;\r\n    workSheet.getColumn('K').width = 15;\r\n    workSheet.getColumn('L').width = 15;\r\n    workSheet.getCell('K1').value = 'VERSIÓN';\r\n    workSheet.getCell('L1').value = version;\r\n    workSheet.getCell('K2').value = 'ELABORACIÓN';\r\n    workSheet.getCell('L2').value = elaborationDate;\r\n    workSheet.getCell('K3').value = 'ACTUALIZACIÓN';\r\n    workSheet.getCell('L3').value = updateDate;\r\n    workSheet.getCell('K4').value = 'CÓDIGO';\r\n    workSheet.getCell('L4').value = code;\r\n    const usedCells = workSheet.getSheetValues();\r\n    for (let row = 1; row <= 4; row++) {\r\n        for (let col = 1; col <= 12; col++) {\r\n            applyBorder(workSheet.getCell(row, col));\r\n            const cell = workSheet.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };\r\n        }\r\n    }\r\n    workSheet.getRow(5).height = 10;\r\n    for (let row = 6; row <= 12; row++) {\r\n        workSheet.mergeCells(`A${row}:C${row}`);\r\n        workSheet.getCell(`A${row}`).fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n        workSheet.getCell(`A${row}`).font = { bold: true };\r\n        workSheet.mergeCells(`D${row}:F${row}`);\r\n        workSheet.getCell(`D${row}`).alignment = { horizontal: 'center' };\r\n        workSheet.mergeCells(`G${row}:I${row}`);\r\n        workSheet.getCell(`G${row}`).fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'bfbfbf' } };\r\n        workSheet.getCell(`G${row}`).font = { bold: true };\r\n        workSheet.mergeCells(`J${row}:L${row}`);\r\n        workSheet.getCell(`J${row}`).alignment = { horizontal: 'center' };\r\n        for (let col = 1; col <= 12; col++) {\r\n            applyBorder(workSheet.getCell(row, col));\r\n            const cell = workSheet.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', wrapText: true };\r\n        }\r\n    }\r\n    workSheet.getCell('A6').value = 'EMPRESA FORMADORA:';\r\n    workSheet.getCell('A7').value = 'TUTOR(A) ACADÉMICO:';\r\n    workSheet.getCell('A8').value = 'TUTOR(A) EMPRESARIAL:';\r\n    workSheet.getCell('A9').value = 'NOMBRE DEL ESTUDIANTE:';\r\n    workSheet.getRow(9).height = 40;\r\n    workSheet.getCell('A10').value = 'E-MAIL INSTITUCIONAL:';\r\n    workSheet.getCell('A11').value = 'TELÉFONO / MÓVIL:';\r\n    workSheet.getCell('A12').value = 'CÉDULA:';\r\n    workSheet.getCell('D6').value = company;\r\n    workSheet.getCell('D7').value = academicTutor;\r\n    workSheet.getCell('D8').value = businessTutor;\r\n    workSheet.getCell('D9').value = [firstName, secondName, lastName, secondLastName].join(' ');\r\n    workSheet.getCell('D10').value = email;\r\n    workSheet.getCell('D11').value = 'TELÉFONO / MÓVIL:';\r\n    workSheet.getCell('D12').value = dni;\r\n    workSheet.getCell('G6').value = 'CARRERA:';\r\n    workSheet.getCell('G7').value = 'PERÍODO ACADÉMICO:';\r\n    workSheet.getCell('G8').value = 'NIVEL:';\r\n    workSheet.getCell('G9').value = 'NÚCLEO ESTRUCTURANTE:';\r\n    workSheet.getCell('G10').value = 'TELÉFONO DE EMERGENCIA:';\r\n    workSheet.getCell('G11').value = 'CONTACTO DE EMERGENCIA:';\r\n    workSheet.getCell('G12').value = 'TIPO DE SANGRE:';\r\n    workSheet.getCell('J6').value = career;\r\n    workSheet.getCell('J7').value = academicPeriod;\r\n    workSheet.getCell('J8').value = electivePeriod;\r\n    workSheet.getCell('J9').value = 'NÚCLEO ESTRUCTURANTE:';\r\n    workSheet.getCell('J10').value = 'TELÉFONO DE EMERGENCIA:';\r\n    workSheet.getCell('J11').value = 'CONTACTO DE EMERGENCIA:';\r\n    workSheet.getCell('J12').value = 'TIPO DE SANGRE:';\r\n    workSheet.getRow(13).height = 10;\r\n    workSheet.getCell('A14').value = 'N°';\r\n    workSheet.getCell('B14').value = 'Fecha';\r\n    workSheet.getCell('D14').value = 'Hola ingreso';\r\n    workSheet.getCell('E14').value = 'Almuerzo';\r\n    workSheet.getCell('F14').value = 'Hora salida';\r\n    workSheet.getCell('G14').value = 'Horas al día';\r\n    workSheet.getCell('H14').value = 'Firma estudiante';\r\n    workSheet.getCell('K14').value = 'Observaciones';\r\n    for (let row = 14; row <= 50; row++) {\r\n        workSheet.mergeCells(`B${row}:C${row}`);\r\n        workSheet.mergeCells(`H${row}:J${row}`);\r\n        workSheet.mergeCells(`K${row}:L${row}`);\r\n        for (let col = 1; col <= 12; col++) {\r\n            applyBorder(workSheet.getCell(row, col));\r\n            const cell = workSheet.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', wrapText: true, horizontal: 'center' };\r\n        }\r\n    }\r\n    for (let row = 15, i = 1; row <= 50; row++) {\r\n        workSheet.getCell(`A${row}`).value = i++;\r\n        workSheet.getCell(`B${row}`).value = '02/01/2024';\r\n        workSheet.getCell(`B${row}`).fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFF000' } };\r\n        workSheet.getCell(`D${row}`).value = '8:00';\r\n        workSheet.getCell(`E${row}`).value = '13:00';\r\n        workSheet.getCell(`F${row}`).value = '17:00';\r\n        workSheet.getCell(`G${row}`).value = 8;\r\n        workSheet.getRow(row).height = 30;\r\n        for (let col = 1; col <= 12; col++) {\r\n            applyBorder(workSheet.getCell(row, col));\r\n            const cell = workSheet.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', wrapText: true, horizontal: 'center' };\r\n        }\r\n    }\r\n    workSheet.getCell('B50').value = '12/02/2024 – 23/02/2024';\r\n    workSheet.getCell(`D50`).value = '8:00';\r\n    workSheet.getCell(`E50`).value = '13:00';\r\n    workSheet.getCell(`F50`).value = '17:00';\r\n    workSheet.getCell(`G50`).value = 10;\r\n    workSheet.getCell(`K50`).value = 'HORAS AUTONOMAS';\r\n    for (let row = 51; row <= 52; row++) {\r\n        for (let col = 4; col <= 7; col++) {\r\n            applyBorder(workSheet.getCell(row, col));\r\n            const cell = workSheet.getCell(row, col);\r\n            cell.alignment = { vertical: 'middle', wrapText: true, horizontal: 'center' };\r\n        }\r\n    }\r\n    workSheet.getRow(50).height = 40;\r\n    workSheet.mergeCells('D51:F52');\r\n    workSheet.getCell('D51').value = 'SUBTOTAL HORAS FASE PRÁCTICA:';\r\n    workSheet.getCell('D51').font = { bold: true };\r\n    workSheet.mergeCells('G51:G52');\r\n    workSheet.getCell('G51').value = { formula: 'Sum(G15:G50)' };\r\n    workBook.xlsx.writeBuffer()\r\n        .then((buffer) => {\r\n        const blob = new Blob([buffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });\r\n        fileSaver.saveAs(blob, 'InformeApredizaje.xlsx');\r\n    })\r\n        .catch((error) => {\r\n        console.error('Error al guardar el archivo:', error);\r\n    });\r\n}
81	Carta	Carta	Carta	10-07-2023	10-07-2023	Carta	async function createDocument1({ version, logoImage, bgImage, instituteName, elaborationDate, docName, updateDate, code, academicPeriod, career, dni, firstName, secondName, lastName, secondLastName, company, }) {\r\n    const documentDefinition = {\r\n        pageSize: 'A4',\r\n        pageMargins: [41, 41, 41, 41],\r\n        content: [\r\n              {\r\n                image: await bgImage,\r\n                width: 595,\r\n                height: 842,\r\n                absolutePosition: { y: 0, x: 0 },\r\n              },\r\n            {\r\n                marginTop: 70,\r\n                table: {\r\n                    widths: ['auto', 300, '*', '*'],\r\n                    body: [\r\n                        [\r\n                              {\r\n                                image: await logoImage,\r\n                                fit: [65, 65],\r\n                                rowSpan: 4,\r\n                                alignment: 'center',\r\n                                margin: [0, 20],\r\n                              },\r\n                            {\r\n                                text: 'INSTITUTO SUPERIOR TECNOLÓGICO DE TURISMO Y PATRIMONIO YAVIRAC',\r\n                                alignment: 'center',\r\n                                margin: [0, 2],\r\n                                fontSize: 8,\r\n                                bold: true,\r\n                            },\r\n                            {\r\n                                text: 'VERSIÓN ',\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                                fontSize: 8,\r\n                            },\r\n                            {\r\n                                text: version,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                                fontSize: 8,\r\n                            },\r\n                        ],\r\n                        [\r\n                            {},\r\n                            {\r\n                                text: 'MACROPROCESO 01 DOCENCIA',\r\n                                bold: true,\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: 'ELABORACIÓN',\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: elaborationDate,\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                        ],\r\n                        [\r\n                            {},\r\n                            {\r\n                                text: docName,\r\n                                bold: true,\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                            },\r\n                            {\r\n                                text: 'ACTUALIZACIÓN',\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: updateDate,\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                        ],\r\n                        [\r\n                            {},\r\n                            {\r\n                                text: docName,\r\n                                bold: true,\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: 'CÓDIGO',\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: code,\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                        ],\r\n                    ],\r\n                },\r\n            },\r\n            {\r\n                text: 'D.M. Quito  martes, enero 02, 2024',\r\n                margin: [0, 10],\r\n                alignment: 'left',\r\n                bold: false,\r\n                fontSize: 9,\r\n            },\r\n            {\r\n                text: [\r\n                    'Yo ',\r\n                    { text: `${[firstName, secondName, lastName, secondLastName].join(' ')} `, bold: true },\r\n                    'con C.C. ',\r\n                    { text: `${dni} `, bold: true },\r\n                    'estudiante de ',\r\n                    { text: `${academicPeriod} `, bold: true },\r\n                    'de la carrera de ',\r\n                    { text: `${career} `, bold: true },\r\n                    { text: `en modalidad dual `, bold: true },\r\n                    'del ',\r\n                    { text: `${instituteName}, `, bold: true },\r\n                    'asignado/a a su Entidad Receptora Formadora ',\r\n                    { text: `${company}.`, bold: true },\r\n                ],\r\n                fontSize: 9,\r\n                alignment: 'justify',\r\n                lineHeight: 1.5,\r\n                margin: [0, 0, 0, 4],\r\n            },\r\n            {\r\n                text: `De acuerdo con el proyecto de carrera aprobado y vigente, en cumplimiento del currículo de la carrera, y en el marco del convenio firmado, me presento y, expreso mi interés y predisposición de realizar prácticas de formación dual, con el fin de cumplir con la planificación, ejecución, control y evaluación del proceso de desarrollo de las competencias laborales como estudiante de la carrera.\\n`,\r\n                fontSize: 9,\r\n                alignment: 'justify',\r\n                lineHeight: 1.5,\r\n                margin: [0, 0, 0, 4],\r\n            },\r\n            {\r\n                text: 'Soy una persona que cumple con el perfil de ingreso de la carrera, y busco aprender y desarrollar los conocimientos, habilidades-destrezas y actitudes del perfil de egreso, y lograr las competencias como profesional de mi carrera.\\n',\r\n                fontSize: 9,\r\n                alignment: 'justify',\r\n                lineHeight: 1.5,\r\n                margin: [0, 0, 0, 4],\r\n            },\r\n            {\r\n                text: 'Por lo cual, solicito su aceptación para realizar mi proceso de formación práctica en el entorno laboral real en modalidad dual.',\r\n                fontSize: 9,\r\n                alignment: 'justify',\r\n                lineHeight: 1.5,\r\n                margin: [0, 0, 0, 4],\r\n            },\r\n            {\r\n                text: [\r\n                    `A la vez que, me comprometo con acatar la normativa general vigente con las obligaciones establecidas en el Artículo 16 (Obligaciones generales del estudiante en modalidad dual) del Reglamento para Carreras y Programas en Modalidad de Formación Dual vigente, así como también, la normativa interna de la entidad formadora y, la normativa del Instituto.\\n`,\r\n                ],\r\n                fontSize: 9,\r\n                alignment: 'justify',\r\n                lineHeight: 1.5,\r\n                margin: [0, 0, 0, 4],\r\n            },\r\n            {\r\n                text: [\r\n                    {\r\n                        text: 'Reconociendo y aceptando entre otras prohibiciones expresas durante la Fase Práctica, las que se determinan a continuación:',\r\n                        bold: true,\r\n                    },\r\n                ],\r\n                fontSize: 9,\r\n                alignment: 'justify',\r\n                lineHeight: 1.5,\r\n                margin: [0, 0, 0, 4],\r\n            },\r\n            {\r\n                ul: [\r\n                    {\r\n                        text: 'Prohibición de consumo de alcohol.',\r\n                    },\r\n                    {\r\n                        text: 'Prohibición de consumo de sustancias estupefacientes, psicotrópicos y estimulantes.',\r\n                    },\r\n                    {\r\n                        text: 'Prohibición de tratos groseros e irrespetuosos a compañeros y del entorno (compañeros y demás personas involucradas).',\r\n                    },\r\n                    {\r\n                        text: 'Prohibición de desacatar las directrices de tutores empresariales y también de tutores académicos del instituto.',\r\n                    },\r\n                ],\r\n                fontSize: 9,\r\n                alignment: 'justify',\r\n                lineHeight: 1.5,\r\n                bold: true,\r\n                margin: [0, 0, 0, 4],\r\n            },\r\n            {\r\n                text: 'También me comprometo en:',\r\n                fontSize: 9,\r\n                alignment: 'justify',\r\n                lineHeight: 1.5,\r\n                bold: true,\r\n                margin: [0, 0, 0, 4],\r\n            },\r\n            {\r\n                ul: [\r\n                    {\r\n                        text: 'Garantizar la confidencialidad, reserva y protección de los datos e información proporcionados por la entidad receptora formadora, durante y después de mi fase práctica.',\r\n                    },\r\n                    {\r\n                        text: 'Y, promover un entorno social armónico, precautelar y salvaguardar la propiedad ajena y los bienes que pertenecen al sitio.',\r\n                    },\r\n                ],\r\n                margin: [0, 0, 0, 4],\r\n                fontSize: 9,\r\n                alignment: 'justify',\r\n                lineHeight: 1.5,\r\n                bold: true,\r\n            },\r\n            {\r\n                text: 'Y así mismo, me comprometo en elaborar y presentar todos los documentos necesarios para validar el proceso de formación en modalidad dual, de acuerdo con lo establecido por la entidad receptora formadora y/o el Instituto, los cuáles deberán estar correctamente llenados y firmados.',\r\n                fontSize: 9,\r\n                alignment: 'justify',\r\n                lineHeight: 1.5,\r\n                bold: true,\r\n                margin: [0, 0, 0, 4],\r\n            },\r\n            {\r\n                text: 'El incumplimiento a lo comprometido con la entidad receptora formadora y/o del Instituto, será causal para la toma de medidas disciplinarias conforme a las responsabilidades del proceso de formación en modalidad dual .',\r\n                fontSize: 9,\r\n                alignment: 'justify',\r\n                lineHeight: 1.5,\r\n                bold: true,\r\n                margin: [0, 0, 0, 4],\r\n            },\r\n            {\r\n                text: 'De no dar cumplimiento con lo antes citado, puede conllevar bajo el debido proceso a la pérdida de la fase práctica. ',\r\n                fontSize: 9,\r\n                alignment: 'justify',\r\n                lineHeight: 1.5,\r\n                bold: true,\r\n                margin: [0, 0, 0, 4],\r\n            },\r\n            {\r\n                margin: [10, 3, 0, 0],\r\n                table: {\r\n                    widths: [200, 200],\r\n                    heights: [10, 15, 15],\r\n                    body: [\r\n                        [\r\n                            {\r\n                                text: 'Estudiante',\r\n                                fontSize: 9,\r\n                                alignment: 'center',\r\n                                bold: true,\r\n                            },\r\n                            {\r\n                                text: 'Firma',\r\n                                fontSize: 9,\r\n                                alignment: 'center',\r\n                                bold: true,\r\n                            },\r\n                        ],\r\n                        [\r\n                            {\r\n                                text: `${[firstName, secondName, lastName, secondLastName].join(' ')}`,\r\n                                rowSpan: 2,\r\n                                fontSize: 9,\r\n                                alignment: 'center',\r\n                                bold: true,\r\n                                margin: [0, 15, 0, 0],\r\n                            },\r\n                            {\r\n                                text: '',\r\n                                rowSpan: 2,\r\n                            },\r\n                        ],\r\n                        [{}, {}],\r\n                    ],\r\n                },\r\n            },\r\n        ],\r\n    };\r\n      pdfMake.createPdf(documentDefinition).open();\r\n}
83	Acta real	Acta real	10.0	07-10-2023	07-10-2023	Acta real	async function createDocument3({ logoImage, bgImage, code, docName, updateDate, process, elaborationDate, version, electivePeriod, career, company }) {\r\n    const documentDefinition = {\r\n        pageSize: 'A4',\r\n        pageMargins: [41, 41, 41, 41],\r\n        content: [\r\n              {\r\n                image: await bgImage,\r\n                width: 595,\r\n                height: 842,\r\n                absolutePosition: { y: 0, x: 0 },\r\n              },\r\n            {\r\n                marginTop: 70,\r\n                table: {\r\n                    widths: ['auto', 300, '*', '*'],\r\n                    body: [\r\n                        [\r\n                              {\r\n                                image:await logoImage,\r\n                                fit: [65, 65],\r\n                                rowSpan: 4,\r\n                                alignment: 'center',\r\n                                margin: [0, 20],\r\n                              },\r\n                            {\r\n                                text: 'INSTITUTO SUPERIOR TECNOLÓGICO DE TURISMO Y PATRIMONIO YAVIRAC',\r\n                                alignment: 'center',\r\n                                margin: [0, 2],\r\n                                fontSize: 8,\r\n                                bold: true,\r\n                            },\r\n                            {\r\n                                text: 'VERSIÓN',\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                                fontSize: 8,\r\n                            },\r\n                            {\r\n                                text: version,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                                fontSize: 8,\r\n                            },\r\n                        ],\r\n                        [\r\n                            {},\r\n                            {\r\n                                text: 'MACROPROCESO 01 DOCENCIA',\r\n                                bold: true,\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: 'ELABORACIÓN',\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: elaborationDate,\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                        ],\r\n                        [\r\n                            {},\r\n                            {\r\n                                text: process,\r\n                                bold: true,\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                            },\r\n                            {\r\n                                text: 'ACTUALIZACIÓN',\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: updateDate,\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                        ],\r\n                        [\r\n                            {},\r\n                            {\r\n                                text: docName,\r\n                                bold: true,\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: 'CÓDIGO',\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: code,\r\n                                fontSize: 8,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                        ],\r\n                    ],\r\n                },\r\n            },\r\n            {\r\n                text: 'ACTA DE FORMACIÓN PRÁCTICA EN EL ENTORNO LABORAL REAL',\r\n                alignment: 'center',\r\n                margin: [0, 10],\r\n                bold: true,\r\n            },\r\n            {\r\n                margin: [50, 0],\r\n                table: {\r\n                    heights: [20, 20],\r\n                    body: [\r\n                        [\r\n                            {\r\n                                text: 'Fecha:',\r\n                                bold: true,\r\n                                fontSize: 10,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: '2/01/2024',\r\n                                fontSize: 10,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: 'Carrera:',\r\n                                bold: true,\r\n                                fontSize: 10,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: career,\r\n                                fontSize: 10,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                        ],\r\n                        [\r\n                            {\r\n                                text: 'Periodo academico:',\r\n                                bold: true,\r\n                                fontSize: 10,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: electivePeriod,\r\n                                fontSize: 10,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: 'Entidad receptora formadora:',\r\n                                bold: true,\r\n                                fontSize: 10,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                            {\r\n                                text: company,\r\n                                fontSize: 10,\r\n                                alignment: 'center',\r\n                                margin: [0, 5],\r\n                            },\r\n                        ],\r\n                    ],\r\n                },\r\n            },\r\n            {\r\n                text: 'La planificación de la formación práctica en el entorno laboral real tiene como objetivo: desarrollar en los estudiantes nuevas habilidades de pensamiento, destrezas sensoriales y motoras, hábitos y actitudes requeridos para el trabajo profesional y consolidar las capacidades prácticas adquiridas en el entorno académico en integración con los factores tecnológicos y socio laborales propios del entorno laboral real, cuyos escenarios concretos son las entidades formadoras seleccionadas de forma pertinente, con las que el instituto mantiene compromisos mutuos.',\r\n                fontSize: 10,\r\n                alignment: 'justify',\r\n                marginTop: 15,\r\n                lineHeight: 1.2,\r\n            },\r\n            {\r\n                text: `La presente acta valida el desarrollo del aprendizaje en el entorno laboral real de los estudiantes de la carrera de ${career} con Nivel Equivalente a Tecnología Superior del Instituto Superior Tecnológico de Turismo y Patrimonio Yavirac, los mismos que han ejecutado sus prácticas preprofesionales acorde a lo estipulado en el Reglamento de Régimen Académico, en el Reglamento para las Carreras y Programas en Modalidad de Formación Dual y con el convenio de prácticas preprofesionales suscrito y vigente entre el instituto y la respectiva entidad receptora formadora. `,\r\n                fontSize: 10,\r\n                alignment: 'justify',\r\n                marginTop: 7,\r\n                lineHeight: 1.2,\r\n            },\r\n            {\r\n                text: 'Además, al acta se anexan siete documentos que permiten garantizar la formación práctica en el entorno laboral real de los estudiantes, a través del seguimiento, control y evaluación de las actividades desarrolladas. Estos documentos son:  ',\r\n                fontSize: 10,\r\n                alignment: 'justify',\r\n                marginTop: 7,\r\n                lineHeight: 1.2,\r\n            },\r\n            {\r\n                ol: [\r\n                    {\r\n                        text: 'Listado de Estudiantes',\r\n                        marginTop: 3,\r\n                    },\r\n                    {\r\n                        text: 'Plan marco de formación ',\r\n                        marginTop: 3,\r\n                    },\r\n                    {\r\n                        text: 'Plan de rotación del estudiante ',\r\n                        marginTop: 3,\r\n                    },\r\n                    {\r\n                        text: 'Registro de asistencia',\r\n                        marginTop: 3,\r\n                    },\r\n                    {\r\n                        text: 'Informe de aprendizaje de fase práctica (Bitácora) ',\r\n                        marginTop: 3,\r\n                    },\r\n                    {\r\n                        text: 'Ficha de Evaluación por parte del instituto ',\r\n                        marginTop: 3,\r\n                    },\r\n                    {\r\n                        text: 'Ficha de evaluación por parte de la empresa',\r\n                        marginTop: 3,\r\n                    },\r\n                ],\r\n                marginLeft: 20,\r\n                fontSize: 10\r\n            },\r\n            {\r\n                text: 'Los estudiantes han demostrado, durante el desarrollo de la fase práctica, responsabilidad académica, aplicando conocimientos técnicos y experiencia comprobada en cada actividad acorde a la planificación del aprendizaje laboral real. Por tanto, suscriben, el presente documento, el tutor académico, el tutor de la entidad receptora formadora y el coordinador / vicecoordinador de carrera respectivo, y el estudiante aceptando su nota.',\r\n                fontSize: 10,\r\n                alignment: 'justify',\r\n                marginTop: 7,\r\n                lineHeight: 1.2,\r\n            },\r\n        ],\r\n    };\r\n      pdfMake.createPdf(documentDefinition).open();\r\n}
\.


--
-- Data for Name: Permission; Type: TABLE DATA; Schema: public; Owner: myUser
--

COPY public."Permission" (id, name, endpoint, "createdAt", "updatedAt", state) FROM stdin;
1	Iniciar sesión	POST /api/auth/login	2024-06-17 16:30:01.837	2024-06-17 16:26:49.087	t
2	Olvidar contraseña	POST /api/auth/forget-password	2024-06-17 16:30:01.837	2024-06-17 16:29:03.189	t
3	Restablecer contraseña	POST /api/auth/reset-password	2024-06-17 16:30:01.837	2024-06-17 16:29:36.254	t
4	Cambiar contraseña	POST /api/auth/change-password	2024-06-17 16:30:01.837	2024-06-17 16:29:49.855	t
5	 Crear usuario	POST /api/user	2024-06-17 16:37:29.232	2024-06-17 16:30:04.073	t
6	Encontrar todos los usuarios	POST /api/user/all	2024-06-17 16:37:29.232	2024-06-17 16:30:26.581	t
7	Encontrar todos los usuarios activos	POST /api/user/active	2024-06-17 16:37:29.232	2024-06-17 16:30:38.154	t
8	Encontrar todos los usuarios por rol	GET /api/user/byRole/:id	2024-06-17 16:37:29.232	2024-06-17 16:30:55.214	t
9	Encontrar usuario por su ID	GET /api/user/:id	2024-06-17 16:37:29.232	2024-06-17 16:31:11.94	t
10	Actualizar un usuario por su ID	PATCH /api/user/:id	2024-06-17 16:37:29.232	2024-06-17 16:31:28.709	t
11	Eliminar usuario por su ID	DELETE /api/user/:id	2024-06-17 16:37:29.232	2024-06-17 16:31:47.727	t
12	Crear estudiante	POST /api/students	2024-06-17 16:37:29.232	2024-06-17 16:31:57.065	t
13	Subir excel de los estudiantes	POST /api/students/upload	2024-06-17 16:37:29.232	2024-06-17 16:32:19.112	t
14	Actualizar el status de un estudiante por su ID	PUT /api/students/status/:id	2024-06-17 16:37:29.232	2024-06-17 16:32:27.064	t
15	Encontrar todos los estudiantes	POST /api/students/all	2024-06-17 16:37:29.232	2024-06-17 16:32:43.385	t
16	Encontrar todos los estudiantes activos por carrera	POST /api/students/active/:idCareer	2024-06-17 16:37:29.232	2024-06-17 16:32:59.262	t
17	Encontrar todos los estudiantes activos por empresa	POST /api/students/byCompany/:idCompany	2024-06-17 16:37:29.232	2024-06-17 16:33:26.641	t
18	Encontrar todos los estudiantes a asignar	GET /api/students/toAssign/:idCareer	2024-06-17 16:37:29.232	2024-06-17 16:33:44.434	t
19	Encontrar todos los estudiantes sin proyecto asignado por compañía	GET /api/students/withNullProject/:idCompany	2024-06-17 16:37:29.232	2024-06-17 16:33:54.526	t
20	Encontrar un estudiante por su Id	GET /api/students/:id	2024-06-17 16:37:29.232	2024-06-17 16:34:41.506	t
21	Actualizar un estudiante por su ID	PUT /api/students/:id	2024-06-17 16:37:29.232	2024-06-17 16:34:57.586	t
22	Eliminar estudiante por su ID	DELETE /api/students/:id	2024-06-17 16:37:29.232	2024-06-17 16:35:12.798	t
23	Asignar un estudiante a un proyecto	PUT /api/students/assign-to-project	2024-06-17 16:37:29.232	2024-06-17 16:35:26.341	t
24	Desasignar un estudiante a un proyecto	PUT /api/students/unassign-to-project/:id	2024-06-17 16:37:29.232	2024-06-17 16:35:37.988	t
25	Asignar un estudiante a una empresa	PUT /api/students/assign-to-company	2024-06-17 16:37:29.232	2024-06-17 16:35:52.851	t
26	 Asignar estudiantes a una empresa	PUT /api/students/assign-students-to-company	2024-06-17 16:37:29.232	2024-06-17 16:36:06.091	t
27	Asignar estudiantes a un proyecto	PUT /api/students/assign-students-to-project	2024-06-17 16:37:29.232	2024-06-17 16:36:18.803	t
28	 Desasignar un estudiante a una empresa	PUT /api/students/unassign-to-company/:id	2024-06-17 16:37:29.232	2024-06-17 16:36:37.882	t
29	Crear rol	POST /api/role	2024-06-17 16:37:29.232	2024-06-17 16:37:00.956	t
30	Encontrar todos los roles	POST /api/role/all	2024-06-17 16:37:29.232	2024-06-17 16:37:16.231	t
31	Encontrar todos los roles activos	POST /api/role/active	2024-06-17 16:40:13.58	2024-06-17 16:37:31.813	t
32	Encontrar un rol por su ID	GET /api/role/:id	2024-06-17 16:40:13.58	2024-06-17 16:37:46.13	t
33	Actualizar un rol por su ID	PUT /api/role/:id	2024-06-17 16:40:13.58	2024-06-17 16:38:01.546	t
34	 Eliminar un rol por su ID	DELETE /api/role/:id	2024-06-17 16:40:13.58	2024-06-17 16:38:16.533	t
35	 Crear carrera	POST /api/career	2024-06-17 16:40:13.58	2024-06-17 16:38:42.126	t
36	Listar carreras	POST /api/career/all	2024-06-17 16:40:13.58	2024-06-17 16:38:56.748	t
37	 Listar carreras activas	POST /api/career/active	2024-06-17 16:40:13.58	2024-06-17 16:39:03.236	t
38	Buscar carrera por id	GET /api/career/:id	2024-06-17 16:40:13.58	2024-06-17 16:39:20.559	t
39	 Actualizar carrera	PUT /api/career/:id	2024-06-17 16:40:13.58	2024-06-17 16:39:33.583	t
40	 Eliminar carrera	DELETE /api/career/:id	2024-06-17 16:40:13.58	2024-06-17 16:40:00.876	t
41	Crear un tutor Generico	POST /api/tutor	2024-06-17 16:42:10.829	2024-06-17 16:40:22.068	t
42	Obtener todos los tutores	GET /api/tutor	2024-06-17 16:42:10.829	2024-06-17 16:40:29.359	t
43	Crear un tutor Academico	POST /api/tutor/academic	2024-06-17 16:42:10.829	2024-06-17 16:40:39.448	t
44	Crear un tutor Empresarial	POST /api/tutor/business	2024-06-17 16:42:10.829	2024-06-17 16:40:50.894	t
45	Obtener todos los tutores Academicos	POST /api/tutor/academic/:idCareer	2024-06-17 16:42:10.829	2024-06-17 16:41:02.331	t
46	 Obtener todos los tutores Academicos activos	POST /api/tutor/academic/active/:idCareer	2024-06-17 16:42:10.829	2024-06-17 16:41:20.474	t
47	Obtener todos los tutores Empresariales	POST /api/tutor/business/:idCompany	2024-06-17 16:42:10.829	2024-06-17 16:41:40.972	t
48	 Obtener todos los tutores Empresariales activos	POST /api/tutor/business/active/:idCompany	2024-06-17 16:42:10.829	2024-06-17 16:41:57.856	t
49	Obtener un tutor por su id	GET /api/tutor/:id	2024-06-17 16:43:41.571	2024-06-17 16:42:52.263	t
50	Actualizar un tutor	PUT /api/tutor/:id	2024-06-17 16:43:41.571	2024-06-17 16:43:06.881	t
51	 Eliminar un tutor	DELETE /api/tutor/:id	2024-06-17 16:43:41.571	2024-06-17 16:43:24.404	t
52	 Crear permiso	POST /api/permissions	2024-06-17 16:45:01.75	2024-06-17 16:43:47.861	t
53	Obtener todos los permisos	GET /api/permissions	2024-06-17 16:45:01.75	2024-06-17 16:43:57.491	t
54	Obtener permiso por su ID	GET /api/permissions/:id	2024-06-17 16:45:01.75	2024-06-17 16:44:14.665	t
55	 Actualizar permiso por su ID	PUT /api/permissions/:id	2024-06-17 16:45:01.75	2024-06-17 16:44:29.791	t
56	 Eliminar permiso por su ID	DELETE /api/permissions/:id	2024-06-17 16:45:01.75	2024-06-17 16:44:47.974	t
57	 Crear empresa	POST /api/company	2024-06-17 16:49:53.75	2024-06-17 16:45:12.324	t
58	Encontrar todas las empresas	POST /api/company/:idCareer	2024-06-17 16:49:53.75	2024-06-17 16:47:09.687	t
59	Encontrar todas las empresas activas	POST /api/company/active/:idCareer	2024-06-17 16:49:53.75	2024-06-17 16:47:31.169	t
60	 Encontrar una empresa por su ID	GET /api/company/:id	2024-06-17 16:49:53.75	2024-06-17 16:47:53.488	t
61	Actualizar una empresa por su ID	PUT /api/company/:id	2024-06-17 16:49:53.75	2024-06-17 16:48:10.094	t
62	Eliminar empresa por su ID	DELETE /api/company/:id	2024-06-17 16:49:53.75	2024-06-17 16:48:27.416	t
63	Obtener información de una empresa	GET /api/company/getCompanyInfo/:id	2024-06-17 16:49:53.75	2024-06-17 16:49:27.558	t
64	Actualizar el status de una empresa por su ID	PUT /api/company/status/:id	2024-06-17 16:49:53.75	2024-06-17 16:49:42.743	t
65	 Crear convenios	POST /api/agreement	2024-06-17 16:52:58.009	2024-06-17 16:49:56.935	t
66	 Listar carreras con convenios	GET /api/agreement/listCareersWithAgreements	2024-06-17 16:52:58.009	2024-06-17 16:50:15.167	t
67	Notificar convenio	GET /api/agreement/notificate/:id	2024-06-17 16:52:58.009	2024-06-17 16:50:38.234	t
68	 Encontrar todos los convenios	POST /api/agreement/:idCareer	2024-06-17 16:52:58.009	2024-06-17 16:50:56.423	t
69	 Encontrar todos los convenios activos	POST /api/agreement/active/:idCareer	2024-06-17 16:52:58.009	2024-06-17 16:51:09.765	t
70	 Encontrar un convenio por su ID	GET /api/agreement/:id	2024-06-17 16:52:58.009	2024-06-17 16:51:27.704	t
71	Actualizar un convenio por su ID	PATCH /api/agreement/:id	2024-06-17 16:52:58.009	2024-06-17 16:51:48.981	t
72	Eliminar convenio por su ID	DELETE /api/agreement/:id	2024-06-17 16:52:58.009	2024-06-17 16:52:05.335	t
73	Subir archivos pdf	POST /api/upload-files	2024-06-17 16:52:58.009	2024-06-17 16:52:22.197	t
74	 Eliminar archivos pdf	POST /api/upload-files/remove	2024-06-17 16:52:58.009	2024-06-17 16:52:30.411	t
75	Descargar archivos pdf	POST /api/upload-files/download	2024-06-17 16:52:58.009	2024-06-17 16:52:45.744	t
76	 Crear proyecto	POST /api/project	2024-06-17 16:56:48.579	2024-06-17 16:52:59.441	t
77	Encontrar todos los proyectos	POST /api/project/:idCompany	2024-06-17 16:56:48.579	2024-06-17 16:53:13.21	t
78	 Encontrar todos los proyectos activos	POST /api/project/active/:idCompany	2024-06-17 16:56:48.579	2024-06-17 16:53:30.748	t
79	Encontrar todos los proyectos activos por carrera	POST /api/project/active/career/:idCareer	2024-06-17 16:56:48.579	2024-06-17 16:53:57.9	t
80	 Asignar tutor academico a un proyecto	PUT /api/project/assign-academic-tutor	2024-06-17 16:56:48.579	2024-06-17 16:54:14.657	t
81	Encontrar información del proyecto por su ID	GET /api/project/:id	2024-06-17 16:56:48.579	2024-06-17 16:55:39.839	t
82	Actualizar un proyecto por su ID	PUT /api/project/:id	2024-06-17 16:56:48.579	2024-06-17 16:55:55.472	t
83	Eliminar proyecto por su ID	DELETE /api/project/:id	2024-06-17 16:56:48.579	2024-06-17 16:56:10.656	t
84	Asignar tutor empresarial a un proyecto	PUT /api/project/assign-business-tutor	2024-06-17 16:56:48.579	2024-06-17 16:56:24.824	t
85	Asignar estudiante a un proyecto	PUT /api/project/assign-student	2024-06-17 16:56:48.579	2024-06-17 16:56:34.469	t
86	Generar reporte por tutor académico	GET /api/report/byAcademicTutor/:idAcademicTutor	2024-06-17 16:57:09.747	2024-06-17 17:00:49.749	t
87	 Generar reporte por empresa	GET /api/report/byCompany/:idCompany	2024-06-17 17:02:42.328	2024-06-17 17:01:16.135	t
\.


--
-- Data for Name: Project; Type: TABLE DATA; Schema: public; Owner: myUser
--

COPY public."Project" (id, name, description, "createdAt", "updatedAt", state, status, "idAcademicTutor", "idBusinessTutor", "idCompany") FROM stdin;
\.


--
-- Data for Name: Rol; Type: TABLE DATA; Schema: public; Owner: myUser
--

COPY public."Rol" (id, code, name, "createdAt", "updatedAt", state) FROM stdin;
1	ADMIN	ADMIN	2024-06-17 16:10:14.629	2024-06-17 17:12:09.639	t
3	CE	Coordinador Empresarial	2024-06-17 16:10:14.629	2024-06-17 17:22:34.669	t
4	EST	Estudiante	2024-06-17 17:27:17.506	2024-06-17 17:27:04.065	t
5	TA	Tutor Académico	2024-06-17 17:27:36.918	2024-06-17 17:27:24.998	t
6	TE	Tutor Empresarial	2024-06-17 17:27:53.754	2024-06-17 17:27:38.287	t
2	CA	Coordinador Académico	2024-06-17 16:10:14.629	2024-06-17 18:38:02.27	t
\.


--
-- Data for Name: RolHasPermission; Type: TABLE DATA; Schema: public; Owner: myUser
--

COPY public."RolHasPermission" ("idRol", "idPermission", "createdAt", "updatedAt", state) FROM stdin;
1	1	2024-06-17 17:07:27.081	2024-06-17 17:06:45.179	t
1	2	2024-06-17 17:07:27.081	2024-06-17 17:06:49.53	t
1	3	2024-06-17 17:07:27.081	2024-06-17 17:06:52.718	t
1	4	2024-06-17 17:07:27.081	2024-06-17 17:06:55.446	t
1	5	2024-06-17 17:07:27.081	2024-06-17 17:06:55.589	t
1	6	2024-06-17 17:07:27.081	2024-06-17 17:07:01.974	t
1	7	2024-06-17 17:07:27.081	2024-06-17 17:07:02.139	t
1	8	2024-06-17 17:07:27.081	2024-06-17 17:07:02.289	t
1	9	2024-06-17 17:07:27.081	2024-06-17 17:07:02.431	t
1	10	2024-06-17 17:07:27.081	2024-06-17 17:07:17.517	t
1	11	2024-06-17 17:07:27.081	2024-06-17 17:07:17.69	t
1	29	2024-06-17 17:10:20.47	2024-06-17 17:09:55.265	t
1	30	2024-06-17 17:10:20.47	2024-06-17 17:09:55.479	t
1	31	2024-06-17 17:10:20.47	2024-06-17 17:09:55.662	t
1	32	2024-06-17 17:10:20.47	2024-06-17 17:09:55.826	t
1	33	2024-06-17 17:10:20.47	2024-06-17 17:09:56.146	t
1	34	2024-06-17 17:10:20.47	2024-06-17 17:09:56.587	t
1	52	2024-06-17 17:11:31.62	2024-06-17 17:11:15.31	t
1	53	2024-06-17 17:11:31.62	2024-06-17 17:11:15.576	t
1	54	2024-06-17 17:11:31.62	2024-06-17 17:11:15.771	t
1	55	2024-06-17 17:11:31.62	2024-06-17 17:11:15.937	t
1	56	2024-06-17 17:11:31.62	2024-06-17 17:11:16.096	t
1	87	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	86	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	84	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	83	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	82	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	81	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	80	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	79	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	78	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	76	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	77	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	85	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	66	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	75	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	74	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	73	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	72	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	71	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	70	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	69	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	68	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	67	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	65	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	58	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	64	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	63	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	62	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	61	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	60	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	59	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	57	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	50	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	51	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	49	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	44	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	41	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	42	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	43	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	45	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	46	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	47	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	48	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	39	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	38	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	37	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	36	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	35	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	40	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	22	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	21	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	20	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	19	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	18	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	17	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	16	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	15	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	14	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	13	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	12	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	28	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	27	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	26	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	25	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	24	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
1	23	2024-06-17 17:12:03.488	2024-06-17 17:12:03.488	t
4	1	2024-06-17 18:05:11.104	2024-06-17 18:04:24.815	t
4	2	2024-06-17 18:05:11.104	2024-06-17 18:04:25.176	t
4	5	2024-06-17 18:05:11.104	2024-06-17 18:04:25.445	t
4	4	2024-06-17 18:05:11.104	2024-06-17 18:04:25.687	t
4	3	2024-06-17 18:05:11.104	2024-06-17 18:04:25.934	t
4	6	2024-06-17 18:05:11.104	2024-06-17 18:04:26.145	t
4	7	2024-06-17 18:05:11.104	2024-06-17 18:04:26.386	t
4	10	2024-06-17 18:05:11.104	2024-06-17 18:04:26.67	t
4	9	2024-06-17 18:05:11.104	2024-06-17 18:04:26.891	t
4	8	2024-06-17 18:05:11.104	2024-06-17 18:04:27.238	t
4	11	2024-06-17 18:05:11.104	2024-06-17 18:04:27.601	t
2	1	2024-06-17 18:33:14.713	2024-06-17 18:32:44.383	t
2	2	2024-06-17 18:33:14.713	2024-06-17 18:32:44.638	t
2	3	2024-06-17 18:33:14.713	2024-06-17 18:32:44.871	t
2	4	2024-06-17 18:33:14.713	2024-06-17 18:32:45.083	t
2	5	2024-06-17 18:33:14.713	2024-06-17 18:32:45.324	t
2	6	2024-06-17 18:33:14.713	2024-06-17 18:32:45.55	t
2	7	2024-06-17 18:33:14.713	2024-06-17 18:32:45.78	t
2	8	2024-06-17 18:33:14.713	2024-06-17 18:32:45.979	t
2	9	2024-06-17 18:33:14.713	2024-06-17 18:32:46.183	t
2	10	2024-06-17 18:33:14.713	2024-06-17 18:32:46.472	t
2	11	2024-06-17 18:33:14.713	2024-06-17 18:32:46.749	t
2	87	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	86	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	84	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	83	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	82	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	81	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	80	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	79	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	78	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	76	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	77	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	85	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	66	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	75	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	74	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	73	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	72	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	71	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	70	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	69	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	68	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	67	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	65	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	58	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	64	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	63	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	62	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	61	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	60	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	59	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	57	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	53	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	56	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	55	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	54	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	52	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	50	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	51	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	49	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	44	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	41	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	42	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	43	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	45	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	46	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	47	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	48	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	33	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	32	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	31	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	39	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	38	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	37	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	36	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	35	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	34	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	40	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	22	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	21	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	20	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	19	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	18	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	17	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	16	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	15	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	14	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	13	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	12	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	30	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	29	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	28	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	27	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	26	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	25	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	24	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
2	23	2024-06-17 18:38:02.419	2024-06-17 18:38:02.419	t
\.


--
-- Data for Name: Student; Type: TABLE DATA; Schema: public; Owner: myUser
--

COPY public."Student" (id, "typeDni", dni, "firstName", "secondName", "lastName", "secondLastName", email, "idUser", "createdAt", "updatedAt", state, status, "idCareer") FROM stdin;
157	CEDULA	0602760118	DANIEL	NA	GUALLI	CHANGO	dnc.gualli@yavirac.edu.ec	163	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
158	CEDULA	0603796434	LEONEL	OMAR	SANGOLQUIZA	AMANCHA	loa.sangolquiza@yavirac.edu.ec	164	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
159	CEDULA	1105073538	RAUL	JESUS	HIDALGO	JARAMILLO	rjj.hidalgo@yavirac.edu.ec	165	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
160	CEDULA	1718377896	TAMARA	YESSENIA	MAYA	DELGADO	tyd.maya@yavirac.edu.ec	166	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
161	CEDULA	1719898221	DOMINIC	PEDRO	LASSO	ANALUIZA	dpa.lasso@yavirac.edu.ec	167	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
162	CEDULA	1719901801	RICHARD	ALEXANDER	AVALOS	ALBAN	raa.avalos@yavirac.edu.ec	168	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
163	CEDULA	1720446846	JONATHAN	JOSUE	NUÑEZ	RODRIGUEZ	jjr.nuñez@yavirac.edu.ec	169	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
164	CEDULA	1720588126	DENNIS	ADRIAN	MUÑOZ	SIERRA	das.muñoz@yavirac.edu.ec	170	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
165	CEDULA	1720813847	CAROLINA	GISSELA	BONILLA	PILATASIG	cgp.bonilla@yavirac.edu.ec	171	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
166	CEDULA	1720985751	WILIAM	MANUEL	MORALES	AIMACAÑA	wma.morales@yavirac.edu.ec	172	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
167	CEDULA	1721068565	LENIN	FERNANDO	MONTOYA	QUILO	lfq.montoya@yavirac.edu.ec	173	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
168	CEDULA	1721080008	JONATHAN	DAVID	ANDRANGO	UCHUPANTA	jdu.andrango@yavirac.edu.ec	174	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
169	CEDULA	1721439758	CHRISTIAN	KEVIN	AGUIRRE	DIAZ	ckd.aguirre@yavirac.edu.ec	175	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
170	CEDULA	1721512828	ISAAC	ROBERTO	MERCHAN	ALVAREZ	ira.merchan@yavirac.edu.ec	176	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
171	CEDULA	1721626487	MELANIE	NATASHA	CRUZ	GUAMAN	mng.cruz@yavirac.edu.ec	177	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	APROBADO	2
172	CEDULA	1721848743	JONATHAN	JOSE	PEÑA	ACOSTA	jja.peña@yavirac.edu.ec	178	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
173	CEDULA	1722334735	ARMANDO	XAVIER	BENITES	YANCHAGUANO	axy.benites@yavirac.edu.ec	179	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
174	CEDULA	1722345053	ALYZON	DAYANA	EGAS	MORENO	adm.egas@yavirac.edu.ec	180	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
175	CEDULA	1722385232	EDISON	BENJAMIN	GUALPA	QUEVEDO	ebq.gualpa@yavirac.edu.ec	181	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
176	CEDULA	1722525944	BRYAN	ALEJANDRO	YUMBO	GUALLICHICO	bag.yumbo@yavirac.edu.ec	182	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
177	CEDULA	1722549183	KEVIN	ANDRES	RODRIGUEZ	ALVERCA	kaa.rodriguez@yavirac.edu.ec	183	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
178	CEDULA	1722680335	BILLY	JOEL	SALMERON	PAZ	bjp.salmeron@yavirac.edu.ec	184	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
179	CEDULA	1722695614	ROGER	FERNANDO	PINEDA	PAZ	rfp.pineda@yavirac.edu.ec	185	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
180	CEDULA	1722702774	MELANI	ESTEFANIA	TOAPANTA	CAYAMBE	mec.toapanta@yavirac.edu.ec	186	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	APROBADO	2
181	CEDULA	1722712062	ANTHONY	JOEL	MOLINA	CASTRO	ajc.molina@yavirac.edu.ec	187	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
182	CEDULA	1722732698	JOSE	GERMAN	ARAUJO	CUESTAS	jgc.araujo@yavirac.edu.ec	188	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
183	CEDULA	1723468417	BRYAN	VLADIMIR	CAICEDO	MOLINA	bvm.caicedo@yavirac.edu.ec	189	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
184	CEDULA	1723505218	ANDREÉ	ALESSANDRO	CISNEROS	VELASQUEZ	aav.cisneros@yavirac.edu.ec	190	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
185	CEDULA	1723920011	GABRIEL	FELIPE	PANTOJA	GOYES	gfg.pantoja@yavirac.edu.ec	191	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
186	CEDULA	1724233513	BRYAN	DAVID	GALLEGOS	FARINANGO	bdf.gallegos@yavirac.edu.ec	192	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
187	CEDULA	1724364524	SANTIAGO	MARCELO	VENEGAS	GALARZA	smg.venegas@yavirac.edu.ec	193	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
188	CEDULA	1724839129	MELANY	DARLIN	ALLAUCA	SIMBAÑA	mds.allauca@yavirac.edu.ec	194	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
189	CEDULA	1725070310	JOHAN	ALEXANDER	PAVON	SANDOVAL	jas.pavon@yavirac.edu.ec	195	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
190	CEDULA	1725146326	JONATHAN	ALEXANDER	MORA	ERAZO	jae.mora@yavirac.edu.ec	196	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
191	CEDULA	1725166712	JESSICA	GABRIELA	AYALA	MALLITASIG	jgm.ayala@yavirac.edu.ec	197	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
192	CEDULA	1725300519	ADRIAN	JOSUE	CHURUCHUMBI	MORILLO	ajm.churuchumbi@yavirac.edu.ec	198	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	APROBADO	2
193	CEDULA	1725306722	BRYAN	ISRAEL	VALLEJO	COBO	bic.vallejo@yavirac.edu.ec	199	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
194	CEDULA	1725344665	JUSTIN	ARLEY	ALTAMIRANO	MOREIRA	jam.altamirano@yavirac.edu.ec	200	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
195	CEDULA	1725415143	BRANDON	JOSUE	CARANQUI	AGUALONGO	bja.caranqui@yavirac.edu.ec	201	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
196	CEDULA	1725481178	DANNA	MIJAL	GUACHILEMA	GUZMAN	dmg.guachilema@yavirac.edu.ec	202	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
197	CEDULA	1725521833	ROBERTO	ARNULFO	HUILCO	GONZALES	rag.huilco@yavirac.edu.ec	203	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
198	CEDULA	1725581506	LEONARDO	DAVID	LOGAÑA	LOGAÑA	ldl.logaña@yavirac.edu.ec	204	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
199	CEDULA	1725608184	MARIA	CRISTINA	ORTIZ	FARINANGO	mcf.ortiz@yavirac.edu.ec	205	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
200	CEDULA	1725665473	DANY	DAMIAN	VEGA	BARSOLA	ddb.vega@yavirac.edu.ec	206	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
201	CEDULA	1725796898	MAYERLY	MARIBEL	MUÑOZ	LOOR	mml.muñoz@yavirac.edu.ec	207	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
202	CEDULA	1725805509	HELTON	JOHN	QUEZADA	CARRION	hjc.quezada@yavirac.edu.ec	208	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
203	CEDULA	1726166810	DAVID	ANDRES	MOLINA	CAIZATOA	dac.molina@yavirac.edu.ec	209	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
204	CEDULA	1726210790	ELIAS	DAVID	SAQUINGA	CHUTO	edc.saquinga@yavirac.edu.ec	210	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
205	CEDULA	1726344912	JHONNY	ISMAEL	ANDRADE	CASTILLO	jic.andrade@yavirac.edu.ec	211	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
206	CEDULA	1726375767	BRYAN	STEVEN	LATACUMBA	MUÑOZ	bsm.latacumba@yavirac.edu.ec	212	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
207	CEDULA	1726378159	JEAN	MICKY	VERA	CHACON	jmc.vera@yavirac.edu.ec	213	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
208	CEDULA	1726385261	DOMENICA	ESTEFANIA	MANOTOA	VILLA	dev.manotoa@yavirac.edu.ec	214	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
209	CEDULA	1726391384	DILAN	ISRAEL	URQUIZO	PATIÑO	dip.urquizo@yavirac.edu.ec	215	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
210	CEDULA	1726418674	IVONNE	LILLIAN	CUÑAS	AQUIETA	ila.cuñas@yavirac.edu.ec	216	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
211	CEDULA	1726678087	LUIS	DAVID	SUQUILLO	USHIÑA	ldu.suquillo@yavirac.edu.ec	217	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
212	CEDULA	1726725631	ROMMEL	ESTEBAN	SANDOVAL	QUILACHAMIN	req.sandoval@yavirac.edu.ec	218	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
213	CEDULA	1726791237	KEVIN	EDUARDO	PINSAG	TIPANLUISA	ket.pinsag@yavirac.edu.ec	219	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
214	CEDULA	1726864968	MAX	DARIO	CELI	CORNEJO	mdc.celi@yavirac.edu.ec	220	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
215	CEDULA	1726902438	ANDRES	MAURICIO	BARRIGA	MONTOYA	amm.barriga@yavirac.edu.ec	221	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
216	CEDULA	1727065409	ERICK	DENILSON	REINOSO	SALAZAR	eds.reinoso@yavirac.edu.ec	222	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
217	CEDULA	1727160648	NIURKA	ANAHI	CONDOR	ROJAS	nar.condor@yavirac.edu.ec	223	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
218	CEDULA	1727311399	EVER	JULIAN	ARBOLEDA	ARDILA	eja.arboleda@yavirac.edu.ec	224	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
219	CEDULA	1727489286	STEEVEN	DAVID	CAGUANA	GUAÑA	sdg.caguana@yavirac.edu.ec	225	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
220	CEDULA	1727514877	JIMMY	FERNANDO	VINUEZA	QUEREMBAS	jfq.vinueza@yavirac.edu.ec	226	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
221	CEDULA	1727737924	ESTEFANY	PATRICIA	SUNTAXI	CONDE	epc.suntaxi@yavirac.edu.ec	227	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
222	CEDULA	1728166800	ALISON	VALERIA	CUMBAJIN	CUMBAJIN	avc.cumbajin@yavirac.edu.ec	228	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	APROBADO	2
223	CEDULA	1728184837	DANIELA	PAOLA	TARAPUES	ROSERO	dpr.tarapues@yavirac.edu.ec	229	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
224	CEDULA	1728534270	DAYANA	LIZETH	PEREZ	CORDOVA	dlc.perez@yavirac.edu.ec	230	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
225	CEDULA	1728548544	MATEO	DAVID	CASTRO	VERA	mdv.castro@yavirac.edu.ec	231	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
226	CEDULA	1728730886	JOSSELYN	FERNANDA	BALAREZO	JAMI	jfj.balarezo@yavirac.edu.ec	232	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
227	CEDULA	1728732973	JOSELYN	MARIA	DICAO	RAMIREZ	jmr.dicao@yavirac.edu.ec	233	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
228	CEDULA	1728733070	JONATHAN	ALEXANDER	ERAZO	CARVAJAL	jac.erazo@yavirac.edu.ec	234	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
229	CEDULA	1728774116	ALEJANDRO	XAVIER	LLUMIQUINGA	CHUQUIN	axc.llumiquinga@yavirac.edu.ec	235	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
230	CEDULA	1728851997	ARIEL	OMAR	GAVILANES	ORTIZ	aoo.gavilanes@yavirac.edu.ec	236	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
231	CEDULA	1728858836	MELANIE	ALEJANDRA	TANDALLA	GUALOTUÑA	mag.tandalla@yavirac.edu.ec	237	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
232	CEDULA	1728872530	FRANCISCO	XAVIER	UQUILLAS	MORENO	fxm.uquillas@yavirac.edu.ec	238	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
233	CEDULA	1728969872	DANNY	SEBASTIAN	CASIS	ESTRADA	dse.casis@yavirac.edu.ec	239	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
234	CEDULA	1729088425	ESTEBAN	ALEJANDRO	GUALINGA	TIRIRA	eat.gualinga@yavirac.edu.ec	240	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
235	CEDULA	1729155414	ANDERSON	JOSUE	IZA	CONTERON	ajc.iza@yavirac.edu.ec	241	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
236	CEDULA	1729198679	JUAN	CARLOS	TOASO	CATOTA	jcc.toaso@yavirac.edu.ec	242	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
237	CEDULA	1729242980	SANTIAGO	RUBEN	CASTILLO	LAGOS	srl.castillo@yavirac.edu.ec	243	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
238	CEDULA	1729371862	ISMAEL	WILLIAN	VARGAS	ZAMBRANO	iwz.vargas@yavirac.edu.ec	244	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
239	CEDULA	1750106054	JOSE	DAVID	TORRES	MORENO	jdm.torres@yavirac.edu.ec	245	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
240	CEDULA	1750136796	FREDERICK	DAMIAN	TORRES	CANDO	fdc.torres@yavirac.edu.ec	246	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
241	CEDULA	1750244087	ISRAEL	SEBASTIAN	MIÑO	SAGAL	iss.miño@yavirac.edu.ec	247	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
242	CEDULA	1750321901	ANGELO	STIVEN	LOPEZ	RODRIGUEZ	asr.lopez@yavirac.edu.ec	248	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
243	CEDULA	1750766519	PABLO	ALEXIS	ERAZO	NUÑEZ	pan.erazo@yavirac.edu.ec	249	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
244	CEDULA	1750948950	DAVID	ALEXANDER	JIRON	BENITEZ	dab.jiron@yavirac.edu.ec	250	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
245	CEDULA	1751050004	ALEXANDER	SEBASTIAN	ORTIZ	MARTINEZ	asm.ortiz@yavirac.edu.ec	251	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
246	CEDULA	1751051176	EDISON	ESTEVEN	ALLAICO	CUMBE	eec.allaico@yavirac.edu.ec	252	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
247	CEDULA	1751141613	DIANA	MISHELLE	ABENDAÑO	GUTIERREZ	dmg.abendaño@yavirac.edu.ec	253	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
248	CEDULA	1751395219	MATEO	SEBASTIAN	NAVAS	PEREZ	msp.navas@yavirac.edu.ec	254	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
249	CEDULA	1751440759	JOEL	MAGDIEL	RIVERA	ARCE	jma.rivera@yavirac.edu.ec	255	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
250	CEDULA	1751519727	ANGELO	JOEL	TORRES	INGA	aji.torres@yavirac.edu.ec	256	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
251	CEDULA	1751695097	JINSON	ALEJANDRO	MEDINA	FREIRE	jaf.medina@yavirac.edu.ec	257	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
252	CEDULA	1751722594	SEBASTIAN	RAFAEL	DONOSO	REALPE	srr.donoso@yavirac.edu.ec	258	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
253	CEDULA	1751735992	HENRY	ALEXANDER	CACHUMBA	GUALLIMBA	hag.cachumba@yavirac.edu.ec	259	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
254	CEDULA	1751821198	ADILEM	YOEL	MONROY	CENTENO	ayc.monroy@yavirac.edu.ec	260	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
255	CEDULA	1751876523	MAURICIO	REMIGIO	GARCIA	ABAD	mra.garcia@yavirac.edu.ec	261	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
256	CEDULA	1752121614	ALEX	RENATO	YUGCHA	TENICOTA	art.yugcha@yavirac.edu.ec	262	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
257	CEDULA	1752290906	ANGELES	NAGELY	QUINATOA	SANCHEZ	ans.quinatoa@yavirac.edu.ec	263	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
258	CEDULA	1752378099	ERICK	ALEXANDER	GUEVARA	DAVILA	ead.guevara@yavirac.edu.ec	264	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
259	CEDULA	1752409720	ANGELO	JOEL	VERA	BRAVO	ajb.vera@yavirac.edu.ec	265	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
260	CEDULA	1752584662	JOHANN	ALEXANDER	GARCIA	VIZUETE	jav.garcia@yavirac.edu.ec	266	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
261	CEDULA	1752587400	JONATHAN	GABRIEL	CAJAS	CABRERA	jgc.cajas@yavirac.edu.ec	267	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
262	CEDULA	1752786721	HENRY	DAVID	TITO	JAMI	hdj.tito@yavirac.edu.ec	268	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
263	CEDULA	1752790467	ENRIQUE	SEBASTIAN	MERA	YELA	esy.mera@yavirac.edu.ec	269	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
264	CEDULA	1752794063	ISAK	OSEAS	GOMEZ	TERAN	iot.gomez@yavirac.edu.ec	270	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
265	CEDULA	1752950418	JAIR	ABEL	DELGADO	REA	jar.delgado@yavirac.edu.ec	271	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
266	CEDULA	1752990109	STEFANY	MARIA	SALAZAR	LALANGUI	sml.salazar@yavirac.edu.ec	272	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
267	CEDULA	1753018983	BLADIMIR	ALEXANDER	CHICAIZA	GUANOQUIZA	bag.chicaiza@yavirac.edu.ec	273	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
268	CEDULA	1753039187	LENIN	JAHIR	MONTALVO	CORDOVA	ljc.montalvo@yavirac.edu.ec	274	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
269	CEDULA	1753059458	STIVEN	JOSUE	MANTUANO	ZAMBRANO	sjz.mantuano@yavirac.edu.ec	275	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
270	CEDULA	1753377587	ALEX	FERNANDO	BENAVIDES	ALTAMIRANO	afa.benavides@yavirac.edu.ec	276	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
271	CEDULA	1753491214	DILAN	BRANDON	HARO	BUSTAMANTE	dbb.haro@yavirac.edu.ec	277	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
272	CEDULA	1753650686	DYLAN	ANDRES	CRUZ	GUILLEN	dag.cruz@yavirac.edu.ec	278	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
273	CEDULA	1753687779	RANDY	LEONEL	ROMERO	ZEAS	rlz.romero@yavirac.edu.ec	279	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
274	CEDULA	1753707023	BRITANY	MISHEL	GUAMAN	CUMANICHO	bmc.guaman@yavirac.edu.ec	280	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
275	CEDULA	1753711199	DYLAN	JAEL	CRUZ	MASAPANTA	djm.cruz@yavirac.edu.ec	281	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	APROBADO	2
276	CEDULA	1753714821	KEVIN	RICHARD	CARVAJAL	GARCIA	krg.carvajal@yavirac.edu.ec	282	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
277	CEDULA	1753725074	DOUGLAS	KENTH	TACO	QUILUMBA	dkq.taco@yavirac.edu.ec	283	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
278	CEDULA	1753731965	JONATHAN	ALEXANDER	CAÑAR	PAZ	jap.cañar@yavirac.edu.ec	284	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
279	CEDULA	1753742822	GENESIS	CHIQUINQUIRA	CHAMBA	UMATAMBO	gcu.chamba@yavirac.edu.ec	285	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
280	CEDULA	1753746039	LEONARDO	JAVIER	CORONEL	TAPIA	ljt.coronel@yavirac.edu.ec	286	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
281	CEDULA	1753762929	PABLO	DANIEL	RUANO	ROSERO	pdr.ruano@yavirac.edu.ec	287	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
282	CEDULA	1753788593	DAVID	SEBASTIAN	QUIROGA	AYALA	dsa.quiroga@yavirac.edu.ec	288	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
283	CEDULA	1753938255	KEVIN	EDUARDO	PEREZ	FARINANGO	kef.perez@yavirac.edu.ec	289	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
284	CEDULA	1754098299	MIGUEL	SANTIAGO	CALERO	PAZMIÑO	msp.calero@yavirac.edu.ec	290	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
285	CEDULA	1754105912	ANTONIO	ALEXANDER	VERDUGO	BERMEO	aab.verdugo@yavirac.edu.ec	291	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
286	CEDULA	1754175220	LEONARDO	GUSTAVO	BOCON	MOLINA	lgm.bocon@yavirac.edu.ec	292	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
287	CEDULA	1754219994	JENNIFER	KATHERINE	CHALACAN	GALLO	jkg.chalacan@yavirac.edu.ec	293	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
288	CEDULA	1754245486	DIEGO	DAVID	PUCUJI	TIPAN	ddt.pucuji@yavirac.edu.ec	294	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
289	CEDULA	1754253142	MICHAEL	SEBASTIAN	ORTIZ	JARRIN	msj.ortiz@yavirac.edu.ec	295	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
290	CEDULA	1754392023	MARCELO	JAVIER	ONTANEDA	BAEZ	mjb.ontaneda@yavirac.edu.ec	296	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
291	CEDULA	1754451829	BRANDON	ALDAIR	REAL	TASIGUANO	bat.real@yavirac.edu.ec	297	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
292	CEDULA	1754587036	GIOVANNY	SEBASTIAN	VACA	ALMEIDA	gsa.vaca@yavirac.edu.ec	298	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
293	CEDULA	1754668901	JIMMY	FERNANDO	LORENTE	MERCHAN	jfm.lorente@yavirac.edu.ec	299	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	APROBADO	2
294	CEDULA	1754708293	ERIKA	LISETH	ACHOTE	PILLIZA	elp.achote@yavirac.edu.ec	300	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
295	CEDULA	1755009089	KAROLAINE	ELIZABETH	ORTIZ	CARRILLO	kec.ortiz@yavirac.edu.ec	301	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
296	CEDULA	1755013800	MIGUEL	ALEJANDRO	ORTIZ	ALVARADO	maa.ortiz@yavirac.edu.ec	302	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
297	CEDULA	1755368089	FERNANDA	ESTEFANIA	ANDRADE	CAÑAR	fec.andrade@yavirac.edu.ec	303	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
298	CEDULA	1755429857	JOSELYN	LISBETH	ALAJO	PUNINA	jlp.alajo@yavirac.edu.ec	304	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
299	CEDULA	1755449004	ELVIS	VLADIMIR	GOMEZ	ORTIZ	evo.gomez@yavirac.edu.ec	305	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
300	CEDULA	1755453659	ALEJANDRO	SEBASTIAN	PROAÑO	VALENCIA	asv.proaño@yavirac.edu.ec	306	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
301	CEDULA	1755536099	MIGUEL	ANGEL	CHIMBORAZO	FRAIRE	maf.chimborazo@yavirac.edu.ec	307	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
302	CEDULA	1755536891	CARLA	ABIGAIL	INSUASTI	PESANTEZ	cap.insuasti@yavirac.edu.ec	308	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
303	CEDULA	1755552658	DILAN	JOEL	AROCA	GUANOTASIG	djg.aroca@yavirac.edu.ec	309	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
304	CEDULA	1755580154	TATIANA	YAMILETH	DEMERA	ZAMBRANO	tyz.demera@yavirac.edu.ec	310	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
305	CEDULA	1755631007	DANIELA	GUADALUPE	MOROCHO	CHILLAGANO	dgc.morocho@yavirac.edu.ec	311	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
306	CEDULA	1755645148	JEREMY	ALEXANDER	PACHO	LOYO	jal.pacho@yavirac.edu.ec	312	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	APROBADO	2
307	CEDULA	1755694096	OSCAR	EDUARDO	NOGALES	RUIZ	oer.nogales@yavirac.edu.ec	313	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
308	CEDULA	1755770466	LUIS	ANGEL	VARGAS	FERNANDEZ	laf.vargas@yavirac.edu.ec	314	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
309	CEDULA	1755952577	CRISTOFER	ALEXANDER	TAMBACO	DELGADO	cad.tambaco@yavirac.edu.ec	315	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
310	CEDULA	1756104764	CARLOS	DANIEL	VERA	REA	cdr.vera@yavirac.edu.ec	316	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
311	CEDULA	1756205405	ANA	GABRIELA	CARCHI	RIVERA	agr.carchi@yavirac.edu.ec	317	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
312	CEDULA	3050593627	ARTEAGA	JUAN	DE	ALMADA	aja.de@yavirac.edu.ec	318	2024-07-02 16:53:30.794	2024-07-02 16:53:30.794	t	REPROBADO	2
\.


--
-- Data for Name: StudentAssignedToCompany; Type: TABLE DATA; Schema: public; Owner: myUser
--

COPY public."StudentAssignedToCompany" (id, "idStudent", "idCompany", "idProject", "electivePeriod", "academicPeriod", parallel, "createdAt", "updatedAt", state) FROM stdin;
157	157	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
158	158	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
159	159	\N	\N	2023-2P	SEGUNDO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
160	160	\N	\N	2023-2P	TERCERO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
161	161	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
162	162	\N	\N	2023-2P	TERCERO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
163	163	\N	\N	2023-2P	TERCERO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
164	164	\N	\N	2023-2P	QUINTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
165	165	\N	\N	2023-2P	QUINTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
166	166	\N	\N	2023-2P	TERCERO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
167	167	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
168	168	\N	\N	2023-2P	TERCERO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
169	169	\N	\N	2023-2P	QUINTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
170	170	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
171	171	\N	\N	2023-2P	SEGUNDO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
172	172	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
173	173	\N	\N	2023-2P	TERCERO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
174	174	\N	\N	2023-2P	TERCERO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
175	175	\N	\N	2023-2P	QUINTO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
176	176	\N	\N	2023-2P	QUINTO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
177	177	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
178	178	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
179	179	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
180	180	\N	\N	2023-2P	SEGUNDO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
181	181	\N	\N	2023-2P	QUINTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
182	182	\N	\N	2023-2P	QUINTO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
183	183	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
184	184	\N	\N	2023-2P	QUINTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
185	185	\N	\N	2023-2P	SEGUNDO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
186	186	\N	\N	2023-2P	TERCERO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
187	187	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
188	188	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
189	189	\N	\N	2023-2P	QUINTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
190	190	\N	\N	2023-2P	TERCERO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
191	191	\N	\N	2023-2P	QUINTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
192	192	\N	\N	2023-2P	TERCERO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
193	193	\N	\N	2023-2P	TERCERO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
194	194	\N	\N	2023-2P	TERCERO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
195	195	\N	\N	2023-2P	QUINTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
196	196	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
197	197	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
198	198	\N	\N	2023-2P	QUINTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
199	199	\N	\N	2023-2P	SEGUNDO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
200	200	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
201	201	\N	\N	2023-2P	TERCERO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
202	202	\N	\N	2023-2P	QUINTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
203	203	\N	\N	2023-2P	TERCERO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
204	204	\N	\N	2023-2P	QUINTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
205	205	\N	\N	2023-2P	QUINTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
206	206	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
207	207	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
208	208	\N	\N	2023-2P	TERCERO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
209	209	\N	\N	2023-2P	TERCERO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
210	210	\N	\N	2023-2P	TERCERO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
211	211	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
212	212	\N	\N	2023-2P	TERCERO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
213	213	\N	\N	2023-2P	TERCERO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
214	214	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
215	215	\N	\N	2023-2P	QUINTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
216	216	\N	\N	2023-2P	TERCERO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
217	217	\N	\N	2023-2P	TERCERO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
218	218	\N	\N	2023-2P	QUINTO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
219	219	\N	\N	2023-2P	TERCERO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
220	220	\N	\N	2023-2P	QUINTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
221	221	\N	\N	2023-2P	QUINTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
222	222	\N	\N	2023-2P	SEGUNDO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
223	223	\N	\N	2023-2P	TERCERO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
224	224	\N	\N	2023-2P	TERCERO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
225	225	\N	\N	2023-2P	QUINTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
226	226	\N	\N	2023-2P	TERCERO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
227	227	\N	\N	2023-2P	SEGUNDO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
228	228	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
229	229	\N	\N	2023-2P	TERCERO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
230	230	\N	\N	2023-2P	SEGUNDO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
231	231	\N	\N	2023-2P	QUINTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
232	232	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
233	233	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
234	234	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
235	235	\N	\N	2023-2P	SEGUNDO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
236	236	\N	\N	2023-2P	SEGUNDO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
237	237	\N	\N	2023-2P	QUINTO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
238	238	\N	\N	2023-2P	TERCERO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
239	239	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
240	240	\N	\N	2023-2P	SEGUNDO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
241	241	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
242	242	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
243	243	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
244	244	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
245	245	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
246	246	\N	\N	2023-2P	SEGUNDO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
247	247	\N	\N	2023-2P	QUINTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
248	248	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
249	249	\N	\N	2023-2P	TERCERO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
250	250	\N	\N	2023-2P	QUINTO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
251	251	\N	\N	2023-2P	QUINTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
252	252	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
253	253	\N	\N	2023-2P	TERCERO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
254	254	\N	\N	2023-2P	TERCERO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
255	255	\N	\N	2023-2P	QUINTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
256	256	\N	\N	2023-2P	TERCERO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
257	257	\N	\N	2023-2P	QUINTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
258	258	\N	\N	2023-2P	QUINTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
259	259	\N	\N	2023-2P	SEGUNDO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
260	260	\N	\N	2023-2P	QUINTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
261	261	\N	\N	2023-2P	SEGUNDO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
262	262	\N	\N	2023-2P	QUINTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
263	263	\N	\N	2023-2P	QUINTO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
264	264	\N	\N	2023-2P	QUINTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
265	265	\N	\N	2023-2P	QUINTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
266	266	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
267	267	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
268	268	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
269	269	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
270	270	\N	\N	2023-2P	TERCERO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
271	271	\N	\N	2023-2P	QUINTO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
272	272	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
273	273	\N	\N	2023-2P	QUINTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
274	274	\N	\N	2023-2P	TERCERO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
275	275	\N	\N	2023-2P	QUINTO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
276	276	\N	\N	2023-2P	TERCERO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
277	277	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
278	278	\N	\N	2023-2P	TERCERO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
279	279	\N	\N	2023-2P	TERCERO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
280	280	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
281	281	\N	\N	2023-2P	TERCERO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
282	282	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
283	283	\N	\N	2023-2P	QUINTO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
284	284	\N	\N	2023-2P	QUINTO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
285	285	\N	\N	2023-2P	TERCERO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
286	286	\N	\N	2023-2P	QUINTO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
287	287	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
288	288	\N	\N	2023-2P	SEGUNDO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
289	289	\N	\N	2023-2P	QUINTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
290	290	\N	\N	2023-2P	QUINTO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
291	291	\N	\N	2023-2P	QUINTO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
292	292	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
293	293	\N	\N	2023-2P	QUINTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
294	294	\N	\N	2023-2P	TERCERO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
295	295	\N	\N	2023-2P	TERCERO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
296	296	\N	\N	2023-2P	TERCERO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
297	297	\N	\N	2023-2P	TERCERO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
298	298	\N	\N	2023-2P	QUINTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
299	299	\N	\N	2023-2P	TERCERO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
300	300	\N	\N	2023-2P	TERCERO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
301	301	\N	\N	2023-2P	TERCERO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
302	302	\N	\N	2023-2P	QUINTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
303	303	\N	\N	2023-2P	TERCERO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
304	304	\N	\N	2023-2P	QUINTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
305	305	\N	\N	2023-2P	TERCERO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
306	306	\N	\N	2023-2P	SEGUNDO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
307	307	\N	\N	2023-2P	CUARTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
308	308	\N	\N	2023-2P	QUINTO	C_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
309	309	\N	\N	2023-2P	CUARTO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
310	310	\N	\N	2023-2P	QUINTO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
311	311	\N	\N	2023-2P	TERCERO	A_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
312	312	\N	\N	2023-2P	TERCERO	B_INTENSIVA	2024-07-02 16:53:30.937	2024-07-02 16:53:30.937	t
\.


--
-- Data for Name: Tutor; Type: TABLE DATA; Schema: public; Owner: myUser
--

COPY public."Tutor" (id, dni, "firstName", "lastName", email, "isAcademic", "idUser", "idCareer", "idCompany", "createdAt", "updatedAt", state) FROM stdin;
4	1111111111	TutorAcadémico	TutorAcadémico	tutora@tutora.com	t	2	2	\N	2024-07-02 16:53:10.468	2024-07-02 16:53:10.468	t
5	3333333333	coordinadorAcadémico	coordinadorAcadémico	corda@corda.com	t	4	2	\N	2024-07-02 16:53:10.488	2024-07-02 16:53:10.488	t
6	2222222222	tutorEmpresarial	tutorEmpresarial	tutore@tutore.com	t	3	2	\N	2024-07-02 16:53:10.519	2024-07-02 16:53:10.519	t
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: myUser
--

COPY public."User" (id, dni, "userName", email, password, "createdAt", "updatedAt", state, "idRol") FROM stdin;
1	0000000000	Admin	admin@admin.com	$2a$10$8vy9aMTWwzWsMX828xWszO44zIqTra9.5ClVJGih71mjjfwZLoRCW	2024-06-17 16:10:43.089	2024-06-17 16:06:36.846	t	1
162	4444444444	coordinadorEmpresarial	corde@corde.com	$2b$10$VOV/5lG08hQsqubYMktj0uoKfLWSjLM8uQ45ZYtKwAnzqJ7qwdyOC	2024-07-02 16:49:04.556	2024-07-02 16:48:09.6	t	3
2	1111111111	TutorAcadémico	tutora@tutora.com	$2b$10$56UMjqYEPlF5.2b7xZ3PZOEgT7j32NxA1v0PMH6lJ90qIeH92OJVi	2024-06-17 17:15:01.514	2024-07-02 20:03:19.284	t	2
4	3333333333	coordinadorAcadémico	corda@corda.com	$2b$10$VOV/5lG08hQsqubYMktj0uoKfLWSjLM8uQ45ZYtKwAnzqJ7qwdyOC	2024-06-17 17:15:54.578	2024-07-02 20:03:19.327	t	2
3	2222222222	tutorEmpresarial	tutore@tutore.com	$2b$10$n6gCAm/brRkGhWmkCFUTkusF9xCzgM0gg.qbhyH.7vMhmJ/D.0PWq	2024-06-17 17:15:27.184	2024-07-02 20:03:19.373	t	2
163	0602760118	dnc.gualli	dnc.gualli@yavirac.edu.ec	$2b$10$1081i3JU347rtmOTaxLLyuyu0JGIvNep6NcTisPXaG/3s9p/RtGk6	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
164	0603796434	loa.sangolquiza	loa.sangolquiza@yavirac.edu.ec	$2b$10$/2pMtFBonMBL155PubazA.NdZXFUP5gyOvFt4cRHy4P8QTVNa4cBi	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
165	1105073538	rjj.hidalgo	rjj.hidalgo@yavirac.edu.ec	$2b$10$X4dMb69.LcTIpWYlEeVQPOuifCy8xv3DctoBvFQm9kO8Jyl/0CdCO	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
166	1718377896	tyd.maya	tyd.maya@yavirac.edu.ec	$2b$10$RNbB1Trxi8wQTYNzKdmNd.thCKmaNaKwyd3Kq5WE2bllkA6u.upkq	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
167	1719898221	dpa.lasso	dpa.lasso@yavirac.edu.ec	$2b$10$5hraZtZKGqmpadrh19ladOcfL7WLTCqttiX1qeb3OFiwzltu8Rmyu	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
168	1719901801	raa.avalos	raa.avalos@yavirac.edu.ec	$2b$10$aXAf6zoQkp.hpyvIRJ/MgOct0TlIJvi1FgTD2fALyZFLOlGZ528oi	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
169	1720446846	jjr.nuñez	jjr.nuñez@yavirac.edu.ec	$2b$10$bJZLlPRvSTp5twKvXB69vOv0D264amdBKEhaiPWsC2e1rgaL8Spx.	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
170	1720588126	das.muñoz	das.muñoz@yavirac.edu.ec	$2b$10$wycOzeseePoVOLxzI1.vZOqqCPnZKz2CAZnD9ypoLf8qLqXaZE7ku	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
171	1720813847	cgp.bonilla	cgp.bonilla@yavirac.edu.ec	$2b$10$u82CEzacyr8WVRFEhPJDJO2gBXb83sQ0STw9zcATFtJNgt2dsBIFu	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
172	1720985751	wma.morales	wma.morales@yavirac.edu.ec	$2b$10$ANpmUbtkPWLKosGHoT6Ff.Z2chtjbC9RmUqCNKs7vnegaoXe7uoZK	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
173	1721068565	lfq.montoya	lfq.montoya@yavirac.edu.ec	$2b$10$7XYx0fpORIwdiDHgyDbACepztScw6Vvi3K3EfwFWb0iup3jmvxE8i	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
174	1721080008	jdu.andrango	jdu.andrango@yavirac.edu.ec	$2b$10$NIqo67eQFiega7.eCILY7OLU.ZHDHDjXe4S6wfjqUDcj2Yv9NQude	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
175	1721439758	ckd.aguirre	ckd.aguirre@yavirac.edu.ec	$2b$10$bwWPOvIxiStG23B2ZwSAhea8jNNat19vrKjMobcoE2DslPFnPX3dG	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
176	1721512828	ira.merchan	ira.merchan@yavirac.edu.ec	$2b$10$pO.tKTVBDNNLBA5O.0huguZBDN1Nbi8OunexbJASsYA2Oj7Fbcly2	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
177	1721626487	mng.cruz	mng.cruz@yavirac.edu.ec	$2b$10$wWd66/ni0W2GcNvPDG6iRu655ahpzblb6p9ijmIfMGN/xMO01aIv.	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
178	1721848743	jja.peña	jja.peña@yavirac.edu.ec	$2b$10$nnLwD90cp626nXP8ut0Ob.WLPdMnWs2OTpHruccKTzvwo6qw1zgzK	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
179	1722334735	axy.benites	axy.benites@yavirac.edu.ec	$2b$10$YM/.RtxJtGUTIywLaXlIn.IzvenLYwBeBtdFr.J6Dy7AGI/va9Lla	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
180	1722345053	adm.egas	adm.egas@yavirac.edu.ec	$2b$10$Qyh.qM7vK0yq9mdCm3/NHuoE1yyg3JkutuzNrhrWh4tCo0CzJr1EG	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
181	1722385232	ebq.gualpa	ebq.gualpa@yavirac.edu.ec	$2b$10$72RGFGKzf2Z6HVA98OZ3.uF72vHFS0UtBItZfDmS7u83sRrPbbfz.	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
182	1722525944	bag.yumbo	bag.yumbo@yavirac.edu.ec	$2b$10$lX3fJRqqle590LQwyZxo6untdaq427/AybjmAYyoz.iA.8HSYnwk2	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
183	1722549183	kaa.rodriguez	kaa.rodriguez@yavirac.edu.ec	$2b$10$X2iiBbXI9eC.7W4hGqjDMuJ/oRFW4ZY6UAU10mHQuOm/cl2EFmjmi	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
184	1722680335	bjp.salmeron	bjp.salmeron@yavirac.edu.ec	$2b$10$g4weT/ho4niFtdHeFpGiRea0kJqEYa/iN8RseYeVCoKALtS/FJLa6	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
185	1722695614	rfp.pineda	rfp.pineda@yavirac.edu.ec	$2b$10$Qv2Aus4Zt0kpDRmkP4SXGuVHoX1mh2jBLyHrKc4psi23AFi5OlP/S	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
186	1722702774	mec.toapanta	mec.toapanta@yavirac.edu.ec	$2b$10$MqumYhLKQnUrN4b2s8iCtu4D63h8KNH7.JP1tS2dqAtgJDT.x6xH.	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
187	1722712062	ajc.molina	ajc.molina@yavirac.edu.ec	$2b$10$HeyaMTrTW142eXE3.aitaO8sehxcyhT9P5o.KvnqB.DFExdU0bf2O	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
188	1722732698	jgc.araujo	jgc.araujo@yavirac.edu.ec	$2b$10$1gAvfwWaSD6AzwkfsRyVX.EcHnykELCWirG/XE6GaxvG1yI1LgWEa	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
189	1723468417	bvm.caicedo	bvm.caicedo@yavirac.edu.ec	$2b$10$DDK4IkKhS5ciy6vH7hske.KMzosvt5dlddLtnsd1dZLpDoDZCoQMG	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
190	1723505218	aav.cisneros	aav.cisneros@yavirac.edu.ec	$2b$10$BYWa/UXHnOqvB/uV4Jjp6.D0ZDc0hmWMhLWTyovE60.Ah/utgXUK2	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
191	1723920011	gfg.pantoja	gfg.pantoja@yavirac.edu.ec	$2b$10$0e6StObx2b9oJnP31iEmlO4DiuoJTK6DRTG3B/GA/MI2DnAICwgDW	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
192	1724233513	bdf.gallegos	bdf.gallegos@yavirac.edu.ec	$2b$10$bbkOEBKyslU5yTK9X9OkVOyUqbjvdAUAFlm8GTPUxDrPu5rCuZtuq	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
193	1724364524	smg.venegas	smg.venegas@yavirac.edu.ec	$2b$10$WIprp.YYK6WHem0/Ve4Pjeh94IDM.8t1tXYWnDveg0nUzBvQdZySa	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
194	1724839129	mds.allauca	mds.allauca@yavirac.edu.ec	$2b$10$sGQa/E1cPycB2TeTMhpKlenjsxG8GJAfoiPbqFt/uUB9WcVH5oKJq	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
195	1725070310	jas.pavon	jas.pavon@yavirac.edu.ec	$2b$10$nfqfWSoETJww/132QI9EKeQcIBSWZumU.iRJZIe2FDxG6xUutpNcK	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
196	1725146326	jae.mora	jae.mora@yavirac.edu.ec	$2b$10$lvZjEmQFHbCNx0PgD915M.BqXhcnqlGLzjkv52gD1qQv8mturygqa	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
197	1725166712	jgm.ayala	jgm.ayala@yavirac.edu.ec	$2b$10$YCnEXqtG653K5ud2xgKiau63WRI/2.snBCeGFAnNmtTdUuBsrfkuO	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
198	1725300519	ajm.churuchumbi	ajm.churuchumbi@yavirac.edu.ec	$2b$10$ltkEZNSccFCFoHK2S/9rkOY4RqkFUST5Lt88SiFi1fxUJNahqli62	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
199	1725306722	bic.vallejo	bic.vallejo@yavirac.edu.ec	$2b$10$mIOPDn4xXREcLNcgy.7I7.VJuND//Nus/1RezE9.8/QLm6k02IVEO	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
200	1725344665	jam.altamirano	jam.altamirano@yavirac.edu.ec	$2b$10$vc0jZnWSJvxnCrB7XZXD3eCz3ulA2540Tl6cz.dxTkWJbUP19rCZK	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
201	1725415143	bja.caranqui	bja.caranqui@yavirac.edu.ec	$2b$10$7ftl9M.t4eA1WoUuRd6xdelvZQGtkmLm2dVm3GvyMze4C4hCAplfi	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
202	1725481178	dmg.guachilema	dmg.guachilema@yavirac.edu.ec	$2b$10$pMqKUx4AsRpPaMbAO1oUKey2CDVzq62RkhXKak7ymuC2Ne1DfzMxW	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
203	1725521833	rag.huilco	rag.huilco@yavirac.edu.ec	$2b$10$.hKhbBrIR7ZWBPuQO01c9.qE/57..8ZdTSVymOw08yKAc8I5sFeWq	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
204	1725581506	ldl.logaña	ldl.logaña@yavirac.edu.ec	$2b$10$hDVEvcSbZ34RNQQgdmydceDkagCO4zItKHkKIkn22Cl55tUc8C8ti	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
205	1725608184	mcf.ortiz	mcf.ortiz@yavirac.edu.ec	$2b$10$GB/3z/m38EftRFG6O0ltqOPm8QYvxK.4tnLtXJaj89XbgvBzXF/gW	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
206	1725665473	ddb.vega	ddb.vega@yavirac.edu.ec	$2b$10$HPojcGHuXCX4YEkXT2ZKUuCcx6znYR7IvYFPAbD6mLePae6X7x6ay	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
207	1725796898	mml.muñoz	mml.muñoz@yavirac.edu.ec	$2b$10$lPfpfUdz0uKGTLogMJ.yUu2XY87NNv/zD/zUz54hOzNovRVgKWupS	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
208	1725805509	hjc.quezada	hjc.quezada@yavirac.edu.ec	$2b$10$/R2O2y82Fa8/sRByHfxKw.Ym4xkO6fUlML6A9U47L50VGbMK/uA/i	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
209	1726166810	dac.molina	dac.molina@yavirac.edu.ec	$2b$10$Ev0EwgWu1tQV02VRssovhuSMflci85ccz.WB41j9tNmSpxtWYESPO	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
210	1726210790	edc.saquinga	edc.saquinga@yavirac.edu.ec	$2b$10$v5sYS.OA9SUabDJCJY4kYeXjq4Hk0o3CW4HTvjT.0gC6yTcmadpeK	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
211	1726344912	jic.andrade	jic.andrade@yavirac.edu.ec	$2b$10$8sROzl95VdEcekdWQtmENOiwZgpaVZXoUSHBxWXQpw2u3d8Z0eRUe	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
212	1726375767	bsm.latacumba	bsm.latacumba@yavirac.edu.ec	$2b$10$aRoiWv3GnZcd3IAXAtqgdun3VVVn.a7QJ45Q7kBy4PJ66/RFdZsBK	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
213	1726378159	jmc.vera	jmc.vera@yavirac.edu.ec	$2b$10$IncPFNWs2p74kS5OJckRmOBRPFno1St6vqpPgzC4uh/XqiQg6Jk/q	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
214	1726385261	dev.manotoa	dev.manotoa@yavirac.edu.ec	$2b$10$gwPWuRyPaeXBId.g7WWytebl3FAQ8xCu7qz.4akcaDoe3XDTVu9fW	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
215	1726391384	dip.urquizo	dip.urquizo@yavirac.edu.ec	$2b$10$OilH3/cH/IWSm2DSylDGGublCdfSJJUcJkt.Ftkq0FGhbRFEoQuXK	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
216	1726418674	ila.cuñas	ila.cuñas@yavirac.edu.ec	$2b$10$bkQbQ8tlE6.HJobagIb/B.z7FcmeaexScgSDZk25Zi3OHRt0.vVeK	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
217	1726678087	ldu.suquillo	ldu.suquillo@yavirac.edu.ec	$2b$10$uSVHvRqXp0c.V2ut86ljBe1jgHrPp8eurqZDqFF2Rq4Qfm41QrJ5W	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
218	1726725631	req.sandoval	req.sandoval@yavirac.edu.ec	$2b$10$BuTS1bV1sGQfkmTQpaQVnuV1RcrZy.t1RmLb3JqsyHhZlteFzN.EW	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
219	1726791237	ket.pinsag	ket.pinsag@yavirac.edu.ec	$2b$10$XMZoeiq/K4eX6G1dmLbygOz7EQ/aYM1qOXixE8FYdvqatZ94MmJcO	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
220	1726864968	mdc.celi	mdc.celi@yavirac.edu.ec	$2b$10$lv2zRIBT1ieSmaVmi.u4OuxVN4VmFc6TRsO39NqqdoqPJUNbE6fE.	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
221	1726902438	amm.barriga	amm.barriga@yavirac.edu.ec	$2b$10$IWeIPMsPZkKLsd73M4sBsOpoxHyjqufbuxvY4v2jUah1w5guWb1OK	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
222	1727065409	eds.reinoso	eds.reinoso@yavirac.edu.ec	$2b$10$a8ZVHLTwqtuoPIYvcjjMC.KWLt0XhoKNxrafP4HeDcz5t0iGZzAnO	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
223	1727160648	nar.condor	nar.condor@yavirac.edu.ec	$2b$10$wwU6t.ylLks0vY2UkZ9YVuZU.lgMNwLNeI373YH87TQsfVkOlZbtW	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
224	1727311399	eja.arboleda	eja.arboleda@yavirac.edu.ec	$2b$10$px0yxwdMfUACdhiaSmKmD.Vi2AjNOBbDaM/kAy4MqlZaIlWkSMfYq	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
225	1727489286	sdg.caguana	sdg.caguana@yavirac.edu.ec	$2b$10$q7ZohjjfPNwm2plLvCnQeu5fMVPRgkrPAkM1vUBDVj6R3HUP1dG1u	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
226	1727514877	jfq.vinueza	jfq.vinueza@yavirac.edu.ec	$2b$10$pewV7wDbyryMiICx2x1XnO7DJ0S/2FHHACwwnvwpqqS9WnHg53Ckm	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
227	1727737924	epc.suntaxi	epc.suntaxi@yavirac.edu.ec	$2b$10$0hme2aZi76LcmZuLTHy6iOmPnV/84ZOV1/HqrgyIzEcSzRh0pP9eW	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
228	1728166800	avc.cumbajin	avc.cumbajin@yavirac.edu.ec	$2b$10$9B65MypUimeMhradP7b18OneJG6QtFcTo8y247Rw55BlqQ0/3XuTu	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
229	1728184837	dpr.tarapues	dpr.tarapues@yavirac.edu.ec	$2b$10$omLZy7OlomiDEPTNnGKi2epsNGEJPtDma73s5PkFnFFu8wJdrA9PS	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
230	1728534270	dlc.perez	dlc.perez@yavirac.edu.ec	$2b$10$wJCzsxJSkgWnKFMaBxi3e.weSQH9GPlPtHIlZh86DoS5SVbj1WtR2	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
231	1728548544	mdv.castro	mdv.castro@yavirac.edu.ec	$2b$10$U1EAheByVEv29QaVbVcpiOo3YuLn7GnPa6d5/iRggWmKMg6xJdYx2	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
232	1728730886	jfj.balarezo	jfj.balarezo@yavirac.edu.ec	$2b$10$Ii6O3bkHA6FAb1RLQIYQ0eoy/i4GOS5qEkgbW6KqPHFR55I0km15i	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
233	1728732973	jmr.dicao	jmr.dicao@yavirac.edu.ec	$2b$10$qxge3aXkVG5zSb2BVfBo0ee02ulZGtB.Ax.oRxjPwjkMS1coP0v7y	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
234	1728733070	jac.erazo	jac.erazo@yavirac.edu.ec	$2b$10$LvRsjUEFgOu0.MrWM4Sr5u9mJk8hZWFJ2Om5GmFERDtbHEjvPH/Pi	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
235	1728774116	axc.llumiquinga	axc.llumiquinga@yavirac.edu.ec	$2b$10$c9CuhKQYU16IqjiJ9msk2urB6no1Zh3e3ETFm/VyRxkj0I70i4BLu	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
236	1728851997	aoo.gavilanes	aoo.gavilanes@yavirac.edu.ec	$2b$10$fJ7B64hCpCBe.0rlEe2/TOAt.YewYBalZE8kq1HZNFY2myYJ2h90e	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
237	1728858836	mag.tandalla	mag.tandalla@yavirac.edu.ec	$2b$10$d9WTB1nJFmu.97d3XlSsN.wnR/sYUkYnpsvQ3ETHVlRUxUloNLStC	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
238	1728872530	fxm.uquillas	fxm.uquillas@yavirac.edu.ec	$2b$10$pfswk9KdNjeLlkBL8G/e.eFxpAE6fPuMfn.yutXNeW70kDM0nnXV2	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
239	1728969872	dse.casis	dse.casis@yavirac.edu.ec	$2b$10$ahDrlkL8VFuP2rvRg25dCOgqy9lCZkhUZaKkbMzhdWkvE25jmiTXC	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
240	1729088425	eat.gualinga	eat.gualinga@yavirac.edu.ec	$2b$10$xeqUYPCqNVHUwK/lZ2DxL.54x9eZXnLd74T3EhXpcLe/bOTcEP9H.	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
241	1729155414	ajc.iza	ajc.iza@yavirac.edu.ec	$2b$10$Znoo7QR3zF0lygx.s7CXn.gSwjNRO3r6FXLvvyKjVOXa8QLfB6ITO	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
242	1729198679	jcc.toaso	jcc.toaso@yavirac.edu.ec	$2b$10$cHIhrBP0xb/k1DyHAtUKPuLj1w8G.JkmSIT0.JRGo.18yKffurOta	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
243	1729242980	srl.castillo	srl.castillo@yavirac.edu.ec	$2b$10$SuJSQ6rMhiKIbWBS4TzPKO.YvzWAeS94yWTddVAVhg/tN123vHMee	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
244	1729371862	iwz.vargas	iwz.vargas@yavirac.edu.ec	$2b$10$eK4rKm1jY9ud0/285L6jAee4OY2fgJ9IPke0bwyggHSWEuqw54HNW	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
245	1750106054	jdm.torres	jdm.torres@yavirac.edu.ec	$2b$10$9y/M/bh7r7yx4ylUH7LideQfAtvwFNQbHu6kqawDM82TOchMFz/vy	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
246	1750136796	fdc.torres	fdc.torres@yavirac.edu.ec	$2b$10$ybrRjHzM3XOqbfl/acJMhOi.ZCCYUqqephVpNo3hjcKfeTzsktPme	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
247	1750244087	iss.miño	iss.miño@yavirac.edu.ec	$2b$10$BuhOfryGRyxtsEzf2YS0bOkROSk6HqO37LhDWAYN4yoNgBHw34y0u	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
248	1750321901	asr.lopez	asr.lopez@yavirac.edu.ec	$2b$10$/Hf5/..r.qkFo6ui16sJsuYFVe.miRcylsIYzqunJ4rxB3MbKdmzS	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
249	1750766519	pan.erazo	pan.erazo@yavirac.edu.ec	$2b$10$jw62y1oBUmlPYUatNgT0P.CQPj9cbF7pC7ml3KTiWmbY1mG5yRxIy	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
250	1750948950	dab.jiron	dab.jiron@yavirac.edu.ec	$2b$10$1WLjFZqFoqQPo7QOokqky.UvIi1rMQ1pd.XUmYLQOCe/cphsfNLKm	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
251	1751050004	asm.ortiz	asm.ortiz@yavirac.edu.ec	$2b$10$4LIxzLgVzj65B/YT.AdlleXkGJl/sp7u3nFjwwfIt4TD5wi3XKXH.	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
252	1751051176	eec.allaico	eec.allaico@yavirac.edu.ec	$2b$10$sKlbGtck4hDWV9jOb5CpBuP5cHlvylKONxc2B7QXGR94KI2a9iRb.	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
253	1751141613	dmg.abendaño	dmg.abendaño@yavirac.edu.ec	$2b$10$/UG4s8T0/Qy8O7BkBonVK.ryDLpEtw.1oQilkvSv0bKXRUK/82b5O	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
254	1751395219	msp.navas	msp.navas@yavirac.edu.ec	$2b$10$es7jb//0Os6FG0c5HisquuQXEZpD70fSovLyL5ueT6yjBmFp0vjsq	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
255	1751440759	jma.rivera	jma.rivera@yavirac.edu.ec	$2b$10$4RBeI0W8y/1mBJEbWlgGxetl3MNNJLGEiXM3hns1OaAvl/vSCTxZy	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
256	1751519727	aji.torres	aji.torres@yavirac.edu.ec	$2b$10$LLK48rAbUNd1wlbFhyz5qOHEw9UQN4fK8xZ7LoduHdD2xXtHPOMBO	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
257	1751695097	jaf.medina	jaf.medina@yavirac.edu.ec	$2b$10$EjlQ26RqwHbi8LdTdcTXGuvXorFsLrdRGWPboarHg1MSswVMREDJW	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
258	1751722594	srr.donoso	srr.donoso@yavirac.edu.ec	$2b$10$1iD/DSSNw8zHZe.kydSvmONtDlNXDVLdcNBhj5PidMQ/KL3hqL1Wm	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
259	1751735992	hag.cachumba	hag.cachumba@yavirac.edu.ec	$2b$10$rTqUSmyjXxXwFOZ9NCUCgekrk/yPv2ILqdDZ4inI3RImjJJB9qKWy	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
260	1751821198	ayc.monroy	ayc.monroy@yavirac.edu.ec	$2b$10$WCW3ge0SgSb0Pg9HnF3ggu8Tj5vfcBcNex5hbP0vZtjtTYSjs3GY6	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
261	1751876523	mra.garcia	mra.garcia@yavirac.edu.ec	$2b$10$bFbntcwHeE1E4tCvhM0xz.D7kNyEtPyOmwRDJ7KlKgx1svZu5wAhu	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
262	1752121614	art.yugcha	art.yugcha@yavirac.edu.ec	$2b$10$9FaM8ivlP70lgokI2M85QOFC6D1ymdkMnPOKxxtgyLFaXNgyvM6Oi	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
263	1752290906	ans.quinatoa	ans.quinatoa@yavirac.edu.ec	$2b$10$d3au8KF6euti3m.Q/f37j.ArSHUre7Ilsd/V903SqUrQQci2E1DzS	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
264	1752378099	ead.guevara	ead.guevara@yavirac.edu.ec	$2b$10$xDWe3klCUoldBP9bFnEEeeNXsbJbIApOyieCKHQsitDest8z/77vy	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
265	1752409720	ajb.vera	ajb.vera@yavirac.edu.ec	$2b$10$2RqmDO853QShP0JJtkc4P.cFVfU3vcwbn2c.pyjkI/SL.pOqkextG	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
266	1752584662	jav.garcia	jav.garcia@yavirac.edu.ec	$2b$10$SxI7Ul.5A5GR9Nh9pKt52OgCBVDsqqALSJ28NJV4jjTM33XQsxp6G	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
267	1752587400	jgc.cajas	jgc.cajas@yavirac.edu.ec	$2b$10$/hrC0yDwK5ESJI5aHAIS3.D88t6Fcp4TQY0AJmLE/HVaE7DuU6CcK	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
268	1752786721	hdj.tito	hdj.tito@yavirac.edu.ec	$2b$10$77MQyzsc8dlxsmj4Z2kWfuJJiga8iEWoDAlnlmk/0vZIABii6Y7Kq	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
269	1752790467	esy.mera	esy.mera@yavirac.edu.ec	$2b$10$8lywoooJqeJuacEhDVbPqe0g.Zjmr1ivU4yi4a3eF7cO3eRQzQ5dW	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
270	1752794063	iot.gomez	iot.gomez@yavirac.edu.ec	$2b$10$H6eDAdV8El7UW.NjyQ/dquj8CkA0MT5mUstO400BATbhbI9bs0lyG	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
271	1752950418	jar.delgado	jar.delgado@yavirac.edu.ec	$2b$10$xm5N/uubWrqmt6bqsyWw0O8jeSlfbqCR2QqHnVza0ZM5RQbIGTy1S	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
272	1752990109	sml.salazar	sml.salazar@yavirac.edu.ec	$2b$10$BB7/lmLjmdcDF17kWHH3TuwDVwMGRM5EXIc4G41vhULHDEtD6O9KK	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
273	1753018983	bag.chicaiza	bag.chicaiza@yavirac.edu.ec	$2b$10$RBwNHQNE0i8ifkvlMYU3JudyALsgEAT7FDXR9BELd6IM8ZSoEzRY6	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
274	1753039187	ljc.montalvo	ljc.montalvo@yavirac.edu.ec	$2b$10$GQzn2ib0ZtOqxMCmoBLwsO.0bQnSXke65uA/Z4/FnrAr2/G6/N05W	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
275	1753059458	sjz.mantuano	sjz.mantuano@yavirac.edu.ec	$2b$10$CEGan5vm4j6ZbPdLGsOJ4.KhbIJS/sMl31ChMvICN9RkGm/n0maUi	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
276	1753377587	afa.benavides	afa.benavides@yavirac.edu.ec	$2b$10$Fk060tjh6yReNljwHxZ5QekFMmX82LxJPi.W33m7/1L2cQK7c7W5.	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
277	1753491214	dbb.haro	dbb.haro@yavirac.edu.ec	$2b$10$kCTTxGHlpHadLey2OyVlTewELvwI20R536t/pXq3JKuQaIUaOy9Oq	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
278	1753650686	dag.cruz	dag.cruz@yavirac.edu.ec	$2b$10$5eJwyS.88sx22z7CURgjxOPYzF8Lzp0sSPSE6r9.yDUqNpdRJbRzK	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
279	1753687779	rlz.romero	rlz.romero@yavirac.edu.ec	$2b$10$YjFvnQQVbLuKiMIiBqs9kujbgjnt8/56tEVW6yHBryYKBvIcXk2G.	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
280	1753707023	bmc.guaman	bmc.guaman@yavirac.edu.ec	$2b$10$7vP7l75lyK/XK1iU9d0qZO3SsiWJIQQDBFuo9YvT3aafaNS7n7R1K	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
281	1753711199	djm.cruz	djm.cruz@yavirac.edu.ec	$2b$10$QKB.t8ovfsPEvDUNog8fl.bAUjrw96AdDX0mtWbCscNljTqJfZlP.	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
282	1753714821	krg.carvajal	krg.carvajal@yavirac.edu.ec	$2b$10$wn0WjHFR5/gAcYkRnQ/dYePagtiu6LufmiymuuiWyIES.MmXWAi3e	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
283	1753725074	dkq.taco	dkq.taco@yavirac.edu.ec	$2b$10$sjOjJHbZ53hM0fIVQh10NeC0FQI.QKXYhDT0hCjawTMafKRF.g0wC	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
284	1753731965	jap.cañar	jap.cañar@yavirac.edu.ec	$2b$10$zE17GICiXQXC34XmSfuQsOWgT5kt6s0t2SIJs/GjvQCwKjSxi5dJu	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
285	1753742822	gcu.chamba	gcu.chamba@yavirac.edu.ec	$2b$10$EWCZSNUL.z4Cw/0WfQaZkux6eieFr74FcXgKXC63WqFry.l4ie70y	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
286	1753746039	ljt.coronel	ljt.coronel@yavirac.edu.ec	$2b$10$bi/oTu3DeRC6MTGbTyUpU.4iaozFaTD61295GxymL0sLSpV2c7WTS	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
287	1753762929	pdr.ruano	pdr.ruano@yavirac.edu.ec	$2b$10$znUtW8GpGPOoQLYWoli/mupQDJ4VYrByZpXEmoe6RmZEfAV8NemDu	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
288	1753788593	dsa.quiroga	dsa.quiroga@yavirac.edu.ec	$2b$10$ZiCHk/ZZk5TLu/iMX8PQ8u5OQlK3S3kRPmYdolaAroTLIwGwd8jSq	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
289	1753938255	kef.perez	kef.perez@yavirac.edu.ec	$2b$10$H5EYJZz3Juh61yZYOtNtB.0iyAUiPnLNnyIMMJB3zkM7h9NjYysnS	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
290	1754098299	msp.calero	msp.calero@yavirac.edu.ec	$2b$10$3jIDNC2J6J0bxkofInMng.zMN8T1XhKep5Gks2WXUFkmZRHa0RQxK	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
291	1754105912	aab.verdugo	aab.verdugo@yavirac.edu.ec	$2b$10$AeT.TRWFuwGVdokRXiQOieNoLYUZrgdcyk2r9.8ps4DPuGY3PpgBe	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
292	1754175220	lgm.bocon	lgm.bocon@yavirac.edu.ec	$2b$10$MXWKfFWBZULBD7myhF1I2eh0fTBaHef43iRRg0qxfaoIbpM4l9r8G	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
293	1754219994	jkg.chalacan	jkg.chalacan@yavirac.edu.ec	$2b$10$9b9RMHqijKKji/uPaSys.uIDWhpXd7BorrUC97ufGwcis6zDOwc4G	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
294	1754245486	ddt.pucuji	ddt.pucuji@yavirac.edu.ec	$2b$10$Vaqt03xnw7TEf2W7KSnuweLfT2h8GZ5JKsdJl13mnbBzRQFIPn1KG	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
295	1754253142	msj.ortiz	msj.ortiz@yavirac.edu.ec	$2b$10$thuUQ1C8FAt3de2A.L.mge.ljP5fFMBlHyhQhcdS5TuiXFjcl5.si	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
296	1754392023	mjb.ontaneda	mjb.ontaneda@yavirac.edu.ec	$2b$10$d4ncpar3oIHMYgzqGCMAFeiycftoQMPaHb2Fps0OesPFAb0xKXANe	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
297	1754451829	bat.real	bat.real@yavirac.edu.ec	$2b$10$a2DDACK2DwiJADnA0J4jR.SZRDC2YZeXebL8gKbydSv0ifQbnLVsG	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
298	1754587036	gsa.vaca	gsa.vaca@yavirac.edu.ec	$2b$10$FcjrqlyJHM50Es/wFlTT0.89/RLPoE1YKcQfD5U7Jd5HbUli3EZYS	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
299	1754668901	jfm.lorente	jfm.lorente@yavirac.edu.ec	$2b$10$GTBrPgbrQK3EaHxmoHaVqeN1JirkJB146Q0yu15YDTQtYLr.dcqyW	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
300	1754708293	elp.achote	elp.achote@yavirac.edu.ec	$2b$10$aT4zBWDjKKWlmYb.D6z7COlVswiQitNTGyJt11VePT7tUC1QbjGGO	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
301	1755009089	kec.ortiz	kec.ortiz@yavirac.edu.ec	$2b$10$erz211xR1NyUF0yL6mJxWeQLqHzuv6w9siDBre6kzeCOab1JkTRvK	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
302	1755013800	maa.ortiz	maa.ortiz@yavirac.edu.ec	$2b$10$gRNjO2mwtFK7PN.CsS24buJgmyy8CsbnWcv2FWusfazZemWHrYBIy	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
303	1755368089	fec.andrade	fec.andrade@yavirac.edu.ec	$2b$10$Gfln3hNqsVGMUXIv8yusQ.sOl8O1lfLDl5ljkgA9UtifGS44kuVnC	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
304	1755429857	jlp.alajo	jlp.alajo@yavirac.edu.ec	$2b$10$QBqakcds.OYkxthEMLvuOeunGgR02hpRLluWHmKO.TGeI1/hMOu/2	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
305	1755449004	evo.gomez	evo.gomez@yavirac.edu.ec	$2b$10$o9bPt.DJMcdu9xYSiUdfPO64cBU4y8c0Z/7XBUm.u2hcVWdOjoWpS	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
306	1755453659	asv.proaño	asv.proaño@yavirac.edu.ec	$2b$10$Zg66DncycJxHwkVVwK5xz./51VPacAmruywBAAdpl6qlHdIdh9QRO	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
307	1755536099	maf.chimborazo	maf.chimborazo@yavirac.edu.ec	$2b$10$jmoOUsXdp8XrzSj1OKRwuOv32OhpwFAmlnKPedkR9Q.2pUevVLsq6	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
308	1755536891	cap.insuasti	cap.insuasti@yavirac.edu.ec	$2b$10$ZEO6SHPtD3Qec3BKgct2juHjhbju28LcnCoVrgVQ0FN2F66V/ECt2	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
309	1755552658	djg.aroca	djg.aroca@yavirac.edu.ec	$2b$10$Xjj.l3yAJ2goQNXkegm3zenZgWl9B5hrxNhBjMsbm7F9zTZbvatpS	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
310	1755580154	tyz.demera	tyz.demera@yavirac.edu.ec	$2b$10$sWtRO/CANcJ4iDWG5BaX8umKrFs0sdchL7nWQ18Q26Y7kJjJvs2LW	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
311	1755631007	dgc.morocho	dgc.morocho@yavirac.edu.ec	$2b$10$PZL.bVZq1iqeg9kz4gplquTz0WIGGwiFlK2oNy7Qg0vZtCfcnScRO	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
312	1755645148	jal.pacho	jal.pacho@yavirac.edu.ec	$2b$10$y3pbNVOCNS0Op/d9k3pzW.WZZkdxptFrWILlZaH4qDuBsmXxnwfIu	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
313	1755694096	oer.nogales	oer.nogales@yavirac.edu.ec	$2b$10$ZKrYtBF2GN/owJa9O2XOTu.ODZV54WT92efnn8/zHUWJyp1j9LwKC	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
314	1755770466	laf.vargas	laf.vargas@yavirac.edu.ec	$2b$10$DW/LhLTeS1WzMBLwNX9he.r/PbyHm9m1fddOVUA1oL9UEkqCNYMmu	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
315	1755952577	cad.tambaco	cad.tambaco@yavirac.edu.ec	$2b$10$CCZKKUTLKB/pkUIFqX/0ROI3ED8OWKmI.lJbG56akKVvVzLc1hdsm	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
316	1756104764	cdr.vera	cdr.vera@yavirac.edu.ec	$2b$10$m88Io3ko0.2nt55NqvY0MObSj2F5.GbWJTEIj8H7k4zmd/AIeV1se	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
317	1756205405	agr.carchi	agr.carchi@yavirac.edu.ec	$2b$10$vbFlZ6B2wH4P6/EpSskxe.SH7ywvqlV0eEView1zdEtfxdSit9tDG	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
318	3050593627	aja.de	aja.de@yavirac.edu.ec	$2b$10$mwOegxiBxRfje4Kbhik7N.rqCoqoLWQ1MlFne6YGnPuzLWjaTxWBS	2024-07-02 16:53:30.668	2024-07-02 16:53:30.668	t	4
\.


--
-- Name: Agreement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myUser
--

SELECT pg_catalog.setval('public."Agreement_id_seq"', 1, false);


--
-- Name: Career_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myUser
--

SELECT pg_catalog.setval('public."Career_id_seq"', 2, true);


--
-- Name: Company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myUser
--

SELECT pg_catalog.setval('public."Company_id_seq"', 1, false);


--
-- Name: Documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myUser
--

SELECT pg_catalog.setval('public."Documents_id_seq"', 88, true);


--
-- Name: Permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myUser
--

SELECT pg_catalog.setval('public."Permission_id_seq"', 87, true);


--
-- Name: Project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myUser
--

SELECT pg_catalog.setval('public."Project_id_seq"', 1, false);


--
-- Name: Rol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myUser
--

SELECT pg_catalog.setval('public."Rol_id_seq"', 6, true);


--
-- Name: StudentAssignedToCompany_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myUser
--

SELECT pg_catalog.setval('public."StudentAssignedToCompany_id_seq"', 312, true);


--
-- Name: Student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myUser
--

SELECT pg_catalog.setval('public."Student_id_seq"', 312, true);


--
-- Name: Tutor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myUser
--

SELECT pg_catalog.setval('public."Tutor_id_seq"', 6, true);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myUser
--

SELECT pg_catalog.setval('public."User_id_seq"', 318, true);


--
-- Name: Agreement Agreement_pkey; Type: CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Agreement"
    ADD CONSTRAINT "Agreement_pkey" PRIMARY KEY (id);


--
-- Name: Career Career_pkey; Type: CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Career"
    ADD CONSTRAINT "Career_pkey" PRIMARY KEY (id);


--
-- Name: Company Company_pkey; Type: CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Company"
    ADD CONSTRAINT "Company_pkey" PRIMARY KEY (id);


--
-- Name: Documents Documents_pkey; Type: CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Documents"
    ADD CONSTRAINT "Documents_pkey" PRIMARY KEY (id);


--
-- Name: Permission Permission_pkey; Type: CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Permission"
    ADD CONSTRAINT "Permission_pkey" PRIMARY KEY (id);


--
-- Name: Project Project_pkey; Type: CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_pkey" PRIMARY KEY (id);


--
-- Name: RolHasPermission RolHasPermission_pkey; Type: CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."RolHasPermission"
    ADD CONSTRAINT "RolHasPermission_pkey" PRIMARY KEY ("idRol", "idPermission");


--
-- Name: Rol Rol_pkey; Type: CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Rol"
    ADD CONSTRAINT "Rol_pkey" PRIMARY KEY (id);


--
-- Name: StudentAssignedToCompany StudentAssignedToCompany_pkey; Type: CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."StudentAssignedToCompany"
    ADD CONSTRAINT "StudentAssignedToCompany_pkey" PRIMARY KEY (id);


--
-- Name: Student Student_pkey; Type: CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_pkey" PRIMARY KEY (id);


--
-- Name: Tutor Tutor_pkey; Type: CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Tutor"
    ADD CONSTRAINT "Tutor_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: Agreement_code_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "Agreement_code_key" ON public."Agreement" USING btree (code);


--
-- Name: Career_code_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "Career_code_key" ON public."Career" USING btree (code);


--
-- Name: Career_idCoordinator_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "Career_idCoordinator_key" ON public."Career" USING btree ("idCoordinator");


--
-- Name: Career_idRespStepDual_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "Career_idRespStepDual_key" ON public."Career" USING btree ("idRespStepDual");


--
-- Name: Career_idViceCoordinator_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "Career_idViceCoordinator_key" ON public."Career" USING btree ("idViceCoordinator");


--
-- Name: Company_dniRepresentLegal_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "Company_dniRepresentLegal_key" ON public."Company" USING btree ("dniRepresentLegal");


--
-- Name: Company_email_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "Company_email_key" ON public."Company" USING btree (email);


--
-- Name: Company_idUser_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "Company_idUser_key" ON public."Company" USING btree ("idUser");


--
-- Name: Company_name_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "Company_name_key" ON public."Company" USING btree (name);


--
-- Name: Company_ruc_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "Company_ruc_key" ON public."Company" USING btree (ruc);


--
-- Name: Permission_name_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "Permission_name_key" ON public."Permission" USING btree (name);


--
-- Name: Rol_code_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "Rol_code_key" ON public."Rol" USING btree (code);


--
-- Name: Rol_name_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "Rol_name_key" ON public."Rol" USING btree (name);


--
-- Name: Student_dni_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "Student_dni_key" ON public."Student" USING btree (dni);


--
-- Name: Student_email_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "Student_email_key" ON public."Student" USING btree (email);


--
-- Name: Student_idUser_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "Student_idUser_key" ON public."Student" USING btree ("idUser");


--
-- Name: Tutor_dni_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "Tutor_dni_key" ON public."Tutor" USING btree (dni);


--
-- Name: Tutor_email_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "Tutor_email_key" ON public."Tutor" USING btree (email);


--
-- Name: Tutor_idUser_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "Tutor_idUser_key" ON public."Tutor" USING btree ("idUser");


--
-- Name: User_dni_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "User_dni_key" ON public."User" USING btree (dni);


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: User_userName_key; Type: INDEX; Schema: public; Owner: myUser
--

CREATE UNIQUE INDEX "User_userName_key" ON public."User" USING btree ("userName");


--
-- Name: Agreement Agreement_idCompany_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Agreement"
    ADD CONSTRAINT "Agreement_idCompany_fkey" FOREIGN KEY ("idCompany") REFERENCES public."Company"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Career Career_idCoordinator_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Career"
    ADD CONSTRAINT "Career_idCoordinator_fkey" FOREIGN KEY ("idCoordinator") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Career Career_idRespStepDual_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Career"
    ADD CONSTRAINT "Career_idRespStepDual_fkey" FOREIGN KEY ("idRespStepDual") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Career Career_idViceCoordinator_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Career"
    ADD CONSTRAINT "Career_idViceCoordinator_fkey" FOREIGN KEY ("idViceCoordinator") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Company Company_idCareer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Company"
    ADD CONSTRAINT "Company_idCareer_fkey" FOREIGN KEY ("idCareer") REFERENCES public."Career"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Company Company_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Company"
    ADD CONSTRAINT "Company_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Project Project_idAcademicTutor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_idAcademicTutor_fkey" FOREIGN KEY ("idAcademicTutor") REFERENCES public."Tutor"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Project Project_idBusinessTutor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_idBusinessTutor_fkey" FOREIGN KEY ("idBusinessTutor") REFERENCES public."Tutor"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Project Project_idCompany_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_idCompany_fkey" FOREIGN KEY ("idCompany") REFERENCES public."Company"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: RolHasPermission RolHasPermission_idPermission_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."RolHasPermission"
    ADD CONSTRAINT "RolHasPermission_idPermission_fkey" FOREIGN KEY ("idPermission") REFERENCES public."Permission"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: RolHasPermission RolHasPermission_idRol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."RolHasPermission"
    ADD CONSTRAINT "RolHasPermission_idRol_fkey" FOREIGN KEY ("idRol") REFERENCES public."Rol"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: StudentAssignedToCompany StudentAssignedToCompany_idCompany_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."StudentAssignedToCompany"
    ADD CONSTRAINT "StudentAssignedToCompany_idCompany_fkey" FOREIGN KEY ("idCompany") REFERENCES public."Company"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: StudentAssignedToCompany StudentAssignedToCompany_idProject_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."StudentAssignedToCompany"
    ADD CONSTRAINT "StudentAssignedToCompany_idProject_fkey" FOREIGN KEY ("idProject") REFERENCES public."Project"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: StudentAssignedToCompany StudentAssignedToCompany_idStudent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."StudentAssignedToCompany"
    ADD CONSTRAINT "StudentAssignedToCompany_idStudent_fkey" FOREIGN KEY ("idStudent") REFERENCES public."Student"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Student Student_idCareer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_idCareer_fkey" FOREIGN KEY ("idCareer") REFERENCES public."Career"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Student Student_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Tutor Tutor_idCareer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Tutor"
    ADD CONSTRAINT "Tutor_idCareer_fkey" FOREIGN KEY ("idCareer") REFERENCES public."Career"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Tutor Tutor_idCompany_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Tutor"
    ADD CONSTRAINT "Tutor_idCompany_fkey" FOREIGN KEY ("idCompany") REFERENCES public."Company"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Tutor Tutor_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."Tutor"
    ADD CONSTRAINT "Tutor_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: User User_idRol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myUser
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_idRol_fkey" FOREIGN KEY ("idRol") REFERENCES public."Rol"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

