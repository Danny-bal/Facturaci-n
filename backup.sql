PGDMP      3                |         	   Comercial    16.3    16.3 e    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16565 	   Comercial    DATABASE        CREATE DATABASE "Comercial" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE "Comercial";
                postgres    false            _           1247    16567 	   sexo_enum    TYPE     ;   CREATE TYPE public.sexo_enum AS ENUM (
    'M',
    'F'
);
    DROP TYPE public.sexo_enum;
       public          postgres    false            �            1259    16571    ajustes    TABLE     �   CREATE TABLE public.ajustes (
    ajucodigo integer NOT NULL,
    empcodigo character varying(7) NOT NULL,
    ajudescripcion character varying(60) NOT NULL,
    ajufecha date NOT NULL,
    ajucantidadtotal numeric(9,2)
);
    DROP TABLE public.ajustes;
       public         heap    postgres    false            �            1259    16574    ajustes_ajucodigo_seq    SEQUENCE     �   CREATE SEQUENCE public.ajustes_ajucodigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.ajustes_ajucodigo_seq;
       public          postgres    false    215            �           0    0    ajustes_ajucodigo_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.ajustes_ajucodigo_seq OWNED BY public.ajustes.ajucodigo;
          public          postgres    false    216            �            1259    16575    bonificaciones    TABLE     �   CREATE TABLE public.bonificaciones (
    boncodigo character varying(5) NOT NULL,
    bondescripcion character varying(30) NOT NULL,
    bonvalor numeric(7,2) NOT NULL
);
 "   DROP TABLE public.bonificaciones;
       public         heap    postgres    false            �            1259    16578    bxn    TABLE     �   CREATE TABLE public.bxn (
    boncodigo character varying(5) NOT NULL,
    nomcodigo character varying(7) NOT NULL,
    bxnvalor numeric(7,2) NOT NULL,
    bxnstatus character varying(3) NOT NULL
);
    DROP TABLE public.bxn;
       public         heap    postgres    false            �            1259    16581    clientes    TABLE     �  CREATE TABLE public.clientes (
    clicodigo character varying(7) NOT NULL,
    clinombre character varying(60) NOT NULL,
    cliidentificacion character varying(13) NOT NULL,
    clidireccion character varying(60) NOT NULL,
    clitelefono character varying(10) NOT NULL,
    clicelular character varying(10) NOT NULL,
    cliemail character varying(60),
    clitipo character varying(3) NOT NULL,
    clistatus character varying(3) NOT NULL,
    cliimage character varying(4000),
    CONSTRAINT ck_clicelular_formato CHECK (((clicelular)::text ~ '^[0-9]{10}$'::text)),
    CONSTRAINT ck_cliemail_formato CHECK (((cliemail)::text ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'::text)),
    CONSTRAINT ck_cliidentificacion_formato CHECK (((cliidentificacion)::text ~ '^[0-9]{10,13}$'::text)),
    CONSTRAINT ck_clistatus_valores CHECK (((clistatus)::text = ANY (ARRAY[('ACT'::character varying)::text, ('INA'::character varying)::text]))),
    CONSTRAINT ck_clitelefono_formato CHECK (((clitelefono)::text ~ '^[0-9]{7,10}$'::text)),
    CONSTRAINT ck_clitipo_valores CHECK (((clitipo)::text = ANY (ARRAY[('NAT'::character varying)::text, ('JUR'::character varying)::text])))
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    16592    compras    TABLE     �  CREATE TABLE public.compras (
    ocnumero character varying(9) NOT NULL,
    prvcodigo character varying(7) NOT NULL,
    ocfecha date NOT NULL,
    ocsubtotal numeric(9,2) NOT NULL,
    ocdescuento numeric(9,2),
    ocvalor_iva numeric(9,2),
    ocvalor_ice numeric(9,2),
    ocformapago character varying(5) NOT NULL,
    ocfactura_asociada character varying(30) NOT NULL,
    ocstatus character varying(3)
);
    DROP TABLE public.compras;
       public         heap    postgres    false            �            1259    16595 
   descuentos    TABLE     �   CREATE TABLE public.descuentos (
    descodigo character varying(5) NOT NULL,
    desdescripcion character varying(30) NOT NULL,
    desvalor numeric(7,2) NOT NULL
);
    DROP TABLE public.descuentos;
       public         heap    postgres    false            �            1259    16598    dxn    TABLE     �   CREATE TABLE public.dxn (
    nomcodigo character varying(7) NOT NULL,
    descodigo character varying(5) NOT NULL,
    dxnvalor numeric(7,2) NOT NULL,
    dxnstatus character varying(3) NOT NULL
);
    DROP TABLE public.dxn;
       public         heap    postgres    false            �            1259    16601 	   empleados    TABLE     �  CREATE TABLE public.empleados (
    empcodigo character varying(7) NOT NULL,
    empapellido1 character varying(30) NOT NULL,
    empapellido2 character varying(30),
    empnombre1 character varying(30) NOT NULL,
    empnombre2 character varying(30),
    empfechanacimiento date NOT NULL,
    empsexo public.sexo_enum NOT NULL,
    empemail character varying(60) NOT NULL,
    empdireccion character varying(60) NOT NULL,
    emptiposangre character varying(3) NOT NULL,
    empsueldo numeric(7,2) NOT NULL,
    empbanco character varying(30) NOT NULL,
    empcuenta character varying(20) NOT NULL,
    empstatus character varying(3) NOT NULL
);
    DROP TABLE public.empleados;
       public         heap    postgres    false    863            �            1259    16604    estados_producto    TABLE     y   CREATE TABLE public.estados_producto (
    estcodigo character(3) NOT NULL,
    estdescripcion character(50) NOT NULL
);
 $   DROP TABLE public.estados_producto;
       public         heap    postgres    false            �            1259    16607    facturas    TABLE     U  CREATE TABLE public.facturas (
    facnumero character varying(9) NOT NULL,
    clicodigo character varying(7) NOT NULL,
    facfecha date NOT NULL,
    facsubtotal numeric(9,2) NOT NULL,
    facdescuento numeric(9,2),
    faciva numeric(9,2),
    facice numeric(9,2),
    facformapago character varying(5) NOT NULL,
    facstatus character varying(3) NOT NULL,
    CONSTRAINT ck_facdescuento CHECK (((facdescuento IS NULL) OR (facdescuento >= (0)::numeric))),
    CONSTRAINT ck_facformapago CHECK (((facformapago)::text = ANY (ARRAY[('EFECT'::character varying)::text, ('TARCR'::character varying)::text, ('TARDB'::character varying)::text, ('TRANS'::character varying)::text, ('CHEQ'::character varying)::text]))),
    CONSTRAINT ck_facice CHECK (((facice IS NULL) OR (facice >= (0)::numeric))),
    CONSTRAINT ck_faciva CHECK (((faciva IS NULL) OR (faciva >= (0)::numeric))),
    CONSTRAINT ck_facstatus CHECK (((facstatus)::text = ANY ((ARRAY['PEN'::character varying, 'PAG'::character varying, 'CAN'::character varying])::text[]))),
    CONSTRAINT ck_facsubtotal CHECK ((facsubtotal >= (0)::numeric))
);
    DROP TABLE public.facturas;
       public         heap    postgres    false            �            1259    16615    ingresos    TABLE     	  CREATE TABLE public.ingresos (
    ingcodigo integer NOT NULL,
    empcodigo character varying(7) NOT NULL,
    ingdescripcion character varying(30) NOT NULL,
    ingfecha date NOT NULL,
    ingcantidadtotal numeric(9,2),
    ingreferencia character varying(60)
);
    DROP TABLE public.ingresos;
       public         heap    postgres    false            �            1259    16618    ingresos_ingcodigo_seq    SEQUENCE     �   CREATE SEQUENCE public.ingresos_ingcodigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.ingresos_ingcodigo_seq;
       public          postgres    false    226            �           0    0    ingresos_ingcodigo_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.ingresos_ingcodigo_seq OWNED BY public.ingresos.ingcodigo;
          public          postgres    false    227            �            1259    16619    nominas    TABLE     @  CREATE TABLE public.nominas (
    nomcodigo character varying(7) NOT NULL,
    empcodigo character varying(7) NOT NULL,
    nomanio character varying(4) NOT NULL,
    nommes character varying(2) NOT NULL,
    nomfechainicial date NOT NULL,
    nomfechafinal date NOT NULL,
    nomstatus character varying(3) NOT NULL
);
    DROP TABLE public.nominas;
       public         heap    postgres    false            �            1259    16622 	   productos    TABLE     �  CREATE TABLE public.productos (
    procodigo character varying(9) NOT NULL,
    prodescripcion character varying(50) NOT NULL,
    prounidadmedida character varying(3) NOT NULL,
    prosaldoinicial numeric(9,2) NOT NULL,
    proingresos numeric(9,2) NOT NULL,
    proegresos numeric(9,2) NOT NULL,
    proajustes numeric(9,2) NOT NULL,
    prosaldofinal numeric(9,2) NOT NULL,
    procostoum numeric(7,2) NOT NULL,
    proprecioum numeric(7,2) NOT NULL,
    prostatus character varying(3) NOT NULL
);
    DROP TABLE public.productos;
       public         heap    postgres    false            �            1259    16625    proveedores    TABLE     �  CREATE TABLE public.proveedores (
    prvcodigo character varying(7) NOT NULL,
    prvnombre character varying(30) NOT NULL,
    prvidentificacion character varying(10) NOT NULL,
    prvdireccion character varying(60) NOT NULL,
    prvtelefono character varying(10),
    prvcelular character varying(10),
    prvemail character varying(60),
    prvtipo character varying(3) NOT NULL,
    prvstatus character varying(3) NOT NULL
);
    DROP TABLE public.proveedores;
       public         heap    postgres    false            �            1259    16628    pxa    TABLE     �   CREATE TABLE public.pxa (
    ajucodigo integer NOT NULL,
    procodigo character varying(9) NOT NULL,
    pxacantidad numeric(9,2) NOT NULL
);
    DROP TABLE public.pxa;
       public         heap    postgres    false            �            1259    16631    pxf    TABLE     r  CREATE TABLE public.pxf (
    facnumero character varying(9) NOT NULL,
    procodigo character varying(9) NOT NULL,
    pxfcantidad numeric(9,2) NOT NULL,
    pxfvalor numeric(7,2) NOT NULL,
    pxfsubtotal numeric(9,2) NOT NULL,
    pxfstatus character varying(3) NOT NULL,
    CONSTRAINT ck_pxfcantidad CHECK ((pxfcantidad > (0)::numeric)),
    CONSTRAINT ck_pxfstatus CHECK (((pxfstatus)::text = ANY (ARRAY[('ACT'::character varying)::text, ('INA'::character varying)::text]))),
    CONSTRAINT ck_pxfsubtotal CHECK ((pxfsubtotal = (pxfcantidad * pxfvalor))),
    CONSTRAINT ck_pxfvalor CHECK ((pxfvalor > (0)::numeric))
);
    DROP TABLE public.pxf;
       public         heap    postgres    false            �            1259    16638    pxi    TABLE     �   CREATE TABLE public.pxi (
    ingcodigo integer NOT NULL,
    procodigo character varying(9) NOT NULL,
    pxicantidad numeric(9,2) NOT NULL
);
    DROP TABLE public.pxi;
       public         heap    postgres    false            �            1259    16641    pxo    TABLE       CREATE TABLE public.pxo (
    ocnumero character varying(9) NOT NULL,
    procodigo character varying(9) NOT NULL,
    pxccantidad numeric(9,2) NOT NULL,
    pxcvalor numeric(7,2) NOT NULL,
    pxcsubtotal numeric(9,2) NOT NULL,
    pxcstatus character varying(3) NOT NULL
);
    DROP TABLE public.pxo;
       public         heap    postgres    false            �            1259    16644    pxs    TABLE     �   CREATE TABLE public.pxs (
    salcodigo integer NOT NULL,
    procodigo character varying(9) NOT NULL,
    pxscantidad numeric(9,2) NOT NULL
);
    DROP TABLE public.pxs;
       public         heap    postgres    false            �            1259    16647    salidas    TABLE       CREATE TABLE public.salidas (
    salcodigo integer NOT NULL,
    empcodigo character varying(7) NOT NULL,
    saldescripcion character varying(30) NOT NULL,
    salfecha date NOT NULL,
    salcantidadtotal numeric(9,2),
    salreferencia character varying(60)
);
    DROP TABLE public.salidas;
       public         heap    postgres    false            �            1259    16650    salidas_salcodigo_seq    SEQUENCE     �   CREATE SEQUENCE public.salidas_salcodigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.salidas_salcodigo_seq;
       public          postgres    false    236            �           0    0    salidas_salcodigo_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.salidas_salcodigo_seq OWNED BY public.salidas.salcodigo;
          public          postgres    false    237            �            1259    16651    unidades_medida    TABLE     v   CREATE TABLE public.unidades_medida (
    umcodigo character(3) NOT NULL,
    umdescripcion character(50) NOT NULL
);
 #   DROP TABLE public.unidades_medida;
       public         heap    postgres    false            �           2604    16654    ajustes ajucodigo    DEFAULT     v   ALTER TABLE ONLY public.ajustes ALTER COLUMN ajucodigo SET DEFAULT nextval('public.ajustes_ajucodigo_seq'::regclass);
 @   ALTER TABLE public.ajustes ALTER COLUMN ajucodigo DROP DEFAULT;
       public          postgres    false    216    215            �           2604    16655    ingresos ingcodigo    DEFAULT     x   ALTER TABLE ONLY public.ingresos ALTER COLUMN ingcodigo SET DEFAULT nextval('public.ingresos_ingcodigo_seq'::regclass);
 A   ALTER TABLE public.ingresos ALTER COLUMN ingcodigo DROP DEFAULT;
       public          postgres    false    227    226            �           2604    16656    salidas salcodigo    DEFAULT     v   ALTER TABLE ONLY public.salidas ALTER COLUMN salcodigo SET DEFAULT nextval('public.salidas_salcodigo_seq'::regclass);
 @   ALTER TABLE public.salidas ALTER COLUMN salcodigo DROP DEFAULT;
       public          postgres    false    237    236            �          0    16571    ajustes 
   TABLE DATA           c   COPY public.ajustes (ajucodigo, empcodigo, ajudescripcion, ajufecha, ajucantidadtotal) FROM stdin;
    public          postgres    false    215   ڌ       �          0    16575    bonificaciones 
   TABLE DATA           M   COPY public.bonificaciones (boncodigo, bondescripcion, bonvalor) FROM stdin;
    public          postgres    false    217   O�       �          0    16578    bxn 
   TABLE DATA           H   COPY public.bxn (boncodigo, nomcodigo, bxnvalor, bxnstatus) FROM stdin;
    public          postgres    false    218   �       �          0    16581    clientes 
   TABLE DATA           �   COPY public.clientes (clicodigo, clinombre, cliidentificacion, clidireccion, clitelefono, clicelular, cliemail, clitipo, clistatus, cliimage) FROM stdin;
    public          postgres    false    219   G�       �          0    16592    compras 
   TABLE DATA           �   COPY public.compras (ocnumero, prvcodigo, ocfecha, ocsubtotal, ocdescuento, ocvalor_iva, ocvalor_ice, ocformapago, ocfactura_asociada, ocstatus) FROM stdin;
    public          postgres    false    220   �       �          0    16595 
   descuentos 
   TABLE DATA           I   COPY public.descuentos (descodigo, desdescripcion, desvalor) FROM stdin;
    public          postgres    false    221   !�       �          0    16598    dxn 
   TABLE DATA           H   COPY public.dxn (nomcodigo, descodigo, dxnvalor, dxnstatus) FROM stdin;
    public          postgres    false    222   ��       �          0    16601 	   empleados 
   TABLE DATA           �   COPY public.empleados (empcodigo, empapellido1, empapellido2, empnombre1, empnombre2, empfechanacimiento, empsexo, empemail, empdireccion, emptiposangre, empsueldo, empbanco, empcuenta, empstatus) FROM stdin;
    public          postgres    false    223   �       �          0    16604    estados_producto 
   TABLE DATA           E   COPY public.estados_producto (estcodigo, estdescripcion) FROM stdin;
    public          postgres    false    224   %�       �          0    16607    facturas 
   TABLE DATA           �   COPY public.facturas (facnumero, clicodigo, facfecha, facsubtotal, facdescuento, faciva, facice, facformapago, facstatus) FROM stdin;
    public          postgres    false    225   B�       �          0    16615    ingresos 
   TABLE DATA           s   COPY public.ingresos (ingcodigo, empcodigo, ingdescripcion, ingfecha, ingcantidadtotal, ingreferencia) FROM stdin;
    public          postgres    false    226   ̨       �          0    16619    nominas 
   TABLE DATA           s   COPY public.nominas (nomcodigo, empcodigo, nomanio, nommes, nomfechainicial, nomfechafinal, nomstatus) FROM stdin;
    public          postgres    false    228   ��       �          0    16622 	   productos 
   TABLE DATA           �   COPY public.productos (procodigo, prodescripcion, prounidadmedida, prosaldoinicial, proingresos, proegresos, proajustes, prosaldofinal, procostoum, proprecioum, prostatus) FROM stdin;
    public          postgres    false    229   P�       �          0    16625    proveedores 
   TABLE DATA           �   COPY public.proveedores (prvcodigo, prvnombre, prvidentificacion, prvdireccion, prvtelefono, prvcelular, prvemail, prvtipo, prvstatus) FROM stdin;
    public          postgres    false    230   Ȭ       �          0    16628    pxa 
   TABLE DATA           @   COPY public.pxa (ajucodigo, procodigo, pxacantidad) FROM stdin;
    public          postgres    false    231   ��       �          0    16631    pxf 
   TABLE DATA           b   COPY public.pxf (facnumero, procodigo, pxfcantidad, pxfvalor, pxfsubtotal, pxfstatus) FROM stdin;
    public          postgres    false    232   �       �          0    16638    pxi 
   TABLE DATA           @   COPY public.pxi (ingcodigo, procodigo, pxicantidad) FROM stdin;
    public          postgres    false    233   `�       �          0    16641    pxo 
   TABLE DATA           a   COPY public.pxo (ocnumero, procodigo, pxccantidad, pxcvalor, pxcsubtotal, pxcstatus) FROM stdin;
    public          postgres    false    234   ��       �          0    16644    pxs 
   TABLE DATA           @   COPY public.pxs (salcodigo, procodigo, pxscantidad) FROM stdin;
    public          postgres    false    235   �       �          0    16647    salidas 
   TABLE DATA           r   COPY public.salidas (salcodigo, empcodigo, saldescripcion, salfecha, salcantidadtotal, salreferencia) FROM stdin;
    public          postgres    false    236   ]�       �          0    16651    unidades_medida 
   TABLE DATA           B   COPY public.unidades_medida (umcodigo, umdescripcion) FROM stdin;
    public          postgres    false    238   R�       �           0    0    ajustes_ajucodigo_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.ajustes_ajucodigo_seq', 1, false);
          public          postgres    false    216            �           0    0    ingresos_ingcodigo_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.ingresos_ingcodigo_seq', 1, false);
          public          postgres    false    227            �           0    0    salidas_salcodigo_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.salidas_salcodigo_seq', 1, false);
          public          postgres    false    237            �           2606    16659    ajustes ajustes_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.ajustes
    ADD CONSTRAINT ajustes_pkey PRIMARY KEY (ajucodigo);
 >   ALTER TABLE ONLY public.ajustes DROP CONSTRAINT ajustes_pkey;
       public            postgres    false    215            �           2606    16661 "   bonificaciones bonificaciones_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.bonificaciones
    ADD CONSTRAINT bonificaciones_pkey PRIMARY KEY (boncodigo);
 L   ALTER TABLE ONLY public.bonificaciones DROP CONSTRAINT bonificaciones_pkey;
       public            postgres    false    217            �           2606    16663    bxn bxn_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.bxn
    ADD CONSTRAINT bxn_pkey PRIMARY KEY (boncodigo, nomcodigo);
 6   ALTER TABLE ONLY public.bxn DROP CONSTRAINT bxn_pkey;
       public            postgres    false    218    218            �           2606    16665    clientes clientes_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (clicodigo);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    219            �           2606    16667    compras compras_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_pkey PRIMARY KEY (ocnumero);
 >   ALTER TABLE ONLY public.compras DROP CONSTRAINT compras_pkey;
       public            postgres    false    220            �           2606    16669    descuentos descuentos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.descuentos
    ADD CONSTRAINT descuentos_pkey PRIMARY KEY (descodigo);
 D   ALTER TABLE ONLY public.descuentos DROP CONSTRAINT descuentos_pkey;
       public            postgres    false    221            �           2606    16671    dxn dxn_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.dxn
    ADD CONSTRAINT dxn_pkey PRIMARY KEY (nomcodigo, descodigo);
 6   ALTER TABLE ONLY public.dxn DROP CONSTRAINT dxn_pkey;
       public            postgres    false    222    222            �           2606    16673    empleados empleados_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (empcodigo);
 B   ALTER TABLE ONLY public.empleados DROP CONSTRAINT empleados_pkey;
       public            postgres    false    223            �           2606    16675 &   estados_producto estados_producto_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.estados_producto
    ADD CONSTRAINT estados_producto_pkey PRIMARY KEY (estcodigo);
 P   ALTER TABLE ONLY public.estados_producto DROP CONSTRAINT estados_producto_pkey;
       public            postgres    false    224            �           2606    16677    facturas facturas_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (facnumero);
 @   ALTER TABLE ONLY public.facturas DROP CONSTRAINT facturas_pkey;
       public            postgres    false    225            �           2606    16679    ingresos ingresos_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.ingresos
    ADD CONSTRAINT ingresos_pkey PRIMARY KEY (ingcodigo);
 @   ALTER TABLE ONLY public.ingresos DROP CONSTRAINT ingresos_pkey;
       public            postgres    false    226            �           2606    16681    nominas nominas_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.nominas
    ADD CONSTRAINT nominas_pkey PRIMARY KEY (nomcodigo);
 >   ALTER TABLE ONLY public.nominas DROP CONSTRAINT nominas_pkey;
       public            postgres    false    228            �           2606    16683    productos productos_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (procodigo);
 B   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
       public            postgres    false    229            �           2606    16685    proveedores proveedores_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (prvcodigo);
 F   ALTER TABLE ONLY public.proveedores DROP CONSTRAINT proveedores_pkey;
       public            postgres    false    230            �           2606    16687    pxa pxa_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.pxa
    ADD CONSTRAINT pxa_pkey PRIMARY KEY (ajucodigo, procodigo);
 6   ALTER TABLE ONLY public.pxa DROP CONSTRAINT pxa_pkey;
       public            postgres    false    231    231            �           2606    16689    pxf pxf_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.pxf
    ADD CONSTRAINT pxf_pkey PRIMARY KEY (facnumero, procodigo);
 6   ALTER TABLE ONLY public.pxf DROP CONSTRAINT pxf_pkey;
       public            postgres    false    232    232            �           2606    16691    pxi pxi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.pxi
    ADD CONSTRAINT pxi_pkey PRIMARY KEY (ingcodigo, procodigo);
 6   ALTER TABLE ONLY public.pxi DROP CONSTRAINT pxi_pkey;
       public            postgres    false    233    233            �           2606    16693    pxo pxo_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.pxo
    ADD CONSTRAINT pxo_pkey PRIMARY KEY (ocnumero, procodigo);
 6   ALTER TABLE ONLY public.pxo DROP CONSTRAINT pxo_pkey;
       public            postgres    false    234    234            �           2606    16695    pxs pxs_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.pxs
    ADD CONSTRAINT pxs_pkey PRIMARY KEY (salcodigo, procodigo);
 6   ALTER TABLE ONLY public.pxs DROP CONSTRAINT pxs_pkey;
       public            postgres    false    235    235            �           2606    16697    salidas salidas_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.salidas
    ADD CONSTRAINT salidas_pkey PRIMARY KEY (salcodigo);
 >   ALTER TABLE ONLY public.salidas DROP CONSTRAINT salidas_pkey;
       public            postgres    false    236            �           2606    16699 $   unidades_medida unidades_medida_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.unidades_medida
    ADD CONSTRAINT unidades_medida_pkey PRIMARY KEY (umcodigo);
 N   ALTER TABLE ONLY public.unidades_medida DROP CONSTRAINT unidades_medida_pkey;
       public            postgres    false    238            �           2606    16700 $   ajustes fk_ajustes_autoriza_empleado    FK CONSTRAINT     �   ALTER TABLE ONLY public.ajustes
    ADD CONSTRAINT fk_ajustes_autoriza_empleado FOREIGN KEY (empcodigo) REFERENCES public.empleados(empcodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 N   ALTER TABLE ONLY public.ajustes DROP CONSTRAINT fk_ajustes_autoriza_empleado;
       public          postgres    false    223    215    4807            �           2606    16705    bxn fk_bxn_bxn2_bonifica    FK CONSTRAINT     �   ALTER TABLE ONLY public.bxn
    ADD CONSTRAINT fk_bxn_bxn2_bonifica FOREIGN KEY (boncodigo) REFERENCES public.bonificaciones(boncodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 B   ALTER TABLE ONLY public.bxn DROP CONSTRAINT fk_bxn_bxn2_bonifica;
       public          postgres    false    218    217    4795            �           2606    16710    bxn fk_bxn_bxn_nominas    FK CONSTRAINT     �   ALTER TABLE ONLY public.bxn
    ADD CONSTRAINT fk_bxn_bxn_nominas FOREIGN KEY (nomcodigo) REFERENCES public.nominas(nomcodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 @   ALTER TABLE ONLY public.bxn DROP CONSTRAINT fk_bxn_bxn_nominas;
       public          postgres    false    4815    228    218            �           2606    16715 "   compras fk_compras_provee_proveedo    FK CONSTRAINT     �   ALTER TABLE ONLY public.compras
    ADD CONSTRAINT fk_compras_provee_proveedo FOREIGN KEY (prvcodigo) REFERENCES public.proveedores(prvcodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public.compras DROP CONSTRAINT fk_compras_provee_proveedo;
       public          postgres    false    230    4819    220            �           2606    16720    dxn fk_dxn_dxn2_nominas    FK CONSTRAINT     �   ALTER TABLE ONLY public.dxn
    ADD CONSTRAINT fk_dxn_dxn2_nominas FOREIGN KEY (nomcodigo) REFERENCES public.nominas(nomcodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 A   ALTER TABLE ONLY public.dxn DROP CONSTRAINT fk_dxn_dxn2_nominas;
       public          postgres    false    4815    228    222            �           2606    16725    dxn fk_dxn_dxn_descuent    FK CONSTRAINT     �   ALTER TABLE ONLY public.dxn
    ADD CONSTRAINT fk_dxn_dxn_descuent FOREIGN KEY (descodigo) REFERENCES public.descuentos(descodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 A   ALTER TABLE ONLY public.dxn DROP CONSTRAINT fk_dxn_dxn_descuent;
       public          postgres    false    4803    221    222            �           2606    16730 '   ingresos fk_ingresos_respondex_empleado    FK CONSTRAINT     �   ALTER TABLE ONLY public.ingresos
    ADD CONSTRAINT fk_ingresos_respondex_empleado FOREIGN KEY (empcodigo) REFERENCES public.empleados(empcodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Q   ALTER TABLE ONLY public.ingresos DROP CONSTRAINT fk_ingresos_respondex_empleado;
       public          postgres    false    226    4807    223            �           2606    16735 $   nominas fk_nominas_mantiene_empleado    FK CONSTRAINT     �   ALTER TABLE ONLY public.nominas
    ADD CONSTRAINT fk_nominas_mantiene_empleado FOREIGN KEY (empcodigo) REFERENCES public.empleados(empcodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 N   ALTER TABLE ONLY public.nominas DROP CONSTRAINT fk_nominas_mantiene_empleado;
       public          postgres    false    228    223    4807            �           2606    16740    pxa fk_pxa_pxa2_ajustes    FK CONSTRAINT     �   ALTER TABLE ONLY public.pxa
    ADD CONSTRAINT fk_pxa_pxa2_ajustes FOREIGN KEY (ajucodigo) REFERENCES public.ajustes(ajucodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 A   ALTER TABLE ONLY public.pxa DROP CONSTRAINT fk_pxa_pxa2_ajustes;
       public          postgres    false    4793    231    215            �           2606    16745    pxa fk_pxa_pxa_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public.pxa
    ADD CONSTRAINT fk_pxa_pxa_producto FOREIGN KEY (procodigo) REFERENCES public.productos(procodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 A   ALTER TABLE ONLY public.pxa DROP CONSTRAINT fk_pxa_pxa_producto;
       public          postgres    false    4817    231    229            �           2606    16750    pxf fk_pxf_facnumero    FK CONSTRAINT        ALTER TABLE ONLY public.pxf
    ADD CONSTRAINT fk_pxf_facnumero FOREIGN KEY (facnumero) REFERENCES public.facturas(facnumero);
 >   ALTER TABLE ONLY public.pxf DROP CONSTRAINT fk_pxf_facnumero;
       public          postgres    false    225    232    4811            �           2606    16755    pxf fk_pxf_procodigo    FK CONSTRAINT     �   ALTER TABLE ONLY public.pxf
    ADD CONSTRAINT fk_pxf_procodigo FOREIGN KEY (procodigo) REFERENCES public.productos(procodigo);
 >   ALTER TABLE ONLY public.pxf DROP CONSTRAINT fk_pxf_procodigo;
       public          postgres    false    232    4817    229            �           2606    16760    pxf fk_pxf_pxf2_facturas    FK CONSTRAINT     �   ALTER TABLE ONLY public.pxf
    ADD CONSTRAINT fk_pxf_pxf2_facturas FOREIGN KEY (facnumero) REFERENCES public.facturas(facnumero) ON UPDATE RESTRICT ON DELETE RESTRICT;
 B   ALTER TABLE ONLY public.pxf DROP CONSTRAINT fk_pxf_pxf2_facturas;
       public          postgres    false    225    232    4811            �           2606    16765    pxf fk_pxf_pxf_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public.pxf
    ADD CONSTRAINT fk_pxf_pxf_producto FOREIGN KEY (procodigo) REFERENCES public.productos(procodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 A   ALTER TABLE ONLY public.pxf DROP CONSTRAINT fk_pxf_pxf_producto;
       public          postgres    false    232    229    4817            �           2606    16770    pxi fk_pxi_pxi2_ingresos    FK CONSTRAINT     �   ALTER TABLE ONLY public.pxi
    ADD CONSTRAINT fk_pxi_pxi2_ingresos FOREIGN KEY (ingcodigo) REFERENCES public.ingresos(ingcodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 B   ALTER TABLE ONLY public.pxi DROP CONSTRAINT fk_pxi_pxi2_ingresos;
       public          postgres    false    233    226    4813            �           2606    16775    pxi fk_pxi_pxi_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public.pxi
    ADD CONSTRAINT fk_pxi_pxi_producto FOREIGN KEY (procodigo) REFERENCES public.productos(procodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 A   ALTER TABLE ONLY public.pxi DROP CONSTRAINT fk_pxi_pxi_producto;
       public          postgres    false    229    4817    233            �           2606    16780    pxo fk_pxo_pxo2_compras    FK CONSTRAINT     �   ALTER TABLE ONLY public.pxo
    ADD CONSTRAINT fk_pxo_pxo2_compras FOREIGN KEY (ocnumero) REFERENCES public.compras(ocnumero) ON UPDATE RESTRICT ON DELETE RESTRICT;
 A   ALTER TABLE ONLY public.pxo DROP CONSTRAINT fk_pxo_pxo2_compras;
       public          postgres    false    220    234    4801            �           2606    16785    pxo fk_pxo_pxo_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public.pxo
    ADD CONSTRAINT fk_pxo_pxo_producto FOREIGN KEY (procodigo) REFERENCES public.productos(procodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 A   ALTER TABLE ONLY public.pxo DROP CONSTRAINT fk_pxo_pxo_producto;
       public          postgres    false    234    229    4817            �           2606    16790    pxs fk_pxs_pxs2_salidas    FK CONSTRAINT     �   ALTER TABLE ONLY public.pxs
    ADD CONSTRAINT fk_pxs_pxs2_salidas FOREIGN KEY (salcodigo) REFERENCES public.salidas(salcodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 A   ALTER TABLE ONLY public.pxs DROP CONSTRAINT fk_pxs_pxs2_salidas;
       public          postgres    false    236    235    4831            �           2606    16795    pxs fk_pxs_pxs_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public.pxs
    ADD CONSTRAINT fk_pxs_pxs_producto FOREIGN KEY (procodigo) REFERENCES public.productos(procodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 A   ALTER TABLE ONLY public.pxs DROP CONSTRAINT fk_pxs_pxs_producto;
       public          postgres    false    235    4817    229            �           2606    16800 #   salidas fk_salidas_dispone_empleado    FK CONSTRAINT     �   ALTER TABLE ONLY public.salidas
    ADD CONSTRAINT fk_salidas_dispone_empleado FOREIGN KEY (empcodigo) REFERENCES public.empleados(empcodigo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 M   ALTER TABLE ONLY public.salidas DROP CONSTRAINT fk_salidas_dispone_empleado;
       public          postgres    false    4807    223    236            �   e   x�3�t��544�t�*-.IU(�/R��+�KIL�<�9O�������D��D�Ȕ�X���������#�C]�v�c�###�z��z�t��9MAzb���� cw+�      �   �   x�m̱� ����	�L�H�&u� ��,V��2B��`W���~�P�8s!�5�X�K̵є�X����)�(g�@9q]/�!��B#vf6f����ؙ9���f;��}J�|�~2T�s�����ՃU��g!���m�R� BPC`      �   H   x�5ȹ�0���G}�}���>B��t���_$ʎ3&���\"tT�d!����F)C�'7�L���]�<      �   �  x���9��F��m�����Flm	�}H"����ޠ���s����]l�IO�O!i�#DdU���C��V�Aȉ��O�ӭ�D{"o� B(
�>�$�4�gz�8Sg.9��4�Cr&꼟�v���u����sQ��r�9���!EB��Q����r���jh�c�G��It�h�D���o��OH؉5��ٳ�A�`�v��aJ�r�q��3"_��������*�r���J�l�	ٵ����J�t9.��w��I�Oɵ~M��<��5��ϴ�����%:�	��A�'6������J�6��嬾?�����V�p��ߏ���T����a����r�|}2<K��_$#N�ZJU�x��}(�C��1-���IƳ�q0~9�s1��R�I��h�_h�=L����D�<I����gU���r�����	"�Q�'%8���VE|�	�J���VE�����������#��D+*��o�%��μr �'�Ɏ	��#F]dE{f�d�ڳ�AuLi˃��������@H��\Կ�����BC'������δ�K��Y����w��O0�3��#U���j�A��es1G^�~� (r��i`�?��h���0�b��Dt!��N��I�����@@���SL��)��H� ���1������[��y ^P�cG�����~ߤ����|���6�i��
�U{��'���6��X��,������rU��k'�D�CN�+:�����e��m��ģ@�솷�o~��(��[�]N�~�V��CY��p�?U��cE�^%=�D�0G7�^��ctk��[���K�ݜw���������9.��$~6�f[�H�%����1]��iv+ׅ|����h��\+A�T�s�F$�­���	���� ��6%X�E�b��,Ё(�q�����Eى;<=k�j��4�.t�˒_R����Jqi�%'M@�y��{6*\	Q�"�H,xm��T<Q�J�uTf��R�H�M�r��	1��:�V�5��:����rѶ�@0�Wg��wX�йܸ�5x�_S<���P؄���Z�'�	�w��$���,%����k{CZ��y��y� (����a="�G���$���T�ѻ�_ne�bV��cF�5���2Y����4'�8�n`Jdڦ��;k�a���հr#v�u���u%j(�he'�;n1�\�:����
�BY[���J�gOK|�R+�凡�I-JN�]&�E9�\����B,b�M�^^v�.�t+Y��RY_�2"����T���|(r�Av����{�VLB�e�w	���� 3;	6A<�s�0��B�_Y]*�mĻm7+����p���x��wP�:lp��Uta�<u���	ʂ���u�ȣ��"8�����n��ؕW?�.S�!�r��L�ygz� j�P�����.aG90��ٶ}�q���Tx�ڱ��6�	�
����"J�i�;�ޡ�(��a��pҧO�5� ���0�Abvv'ޢ5�E��Ã��Z��j�)��C����
�"�V__$�&��E}����zQ}�{�$k�E�Qjt2܃��6��t��Q��[��<�~��ro̹��$�^�bsM�f���T�.�׻9ıfq��1�ey�U�����.3��u�8��|*�'X�	��������6�a���p�1�e������ �{ w�G����E�� �H��&������#�6b�EC+�AGb��-�Ɂ\f��ח�a�)L�͕�cOy2� �&cF��u��A2��]�Ѹ��3*���2����ٮ:�]���lV~uc�)�Jc���.����m��M��`4�kL�m#W�����c�2P}��Y�?���ފƤ�)�k5dV�װO=�ڐ�<읬��g�yI���������<�zH�`6X�9ٽ���.���v���5y�k��ѝ� Yn�ăi&�/I�Y�/��m=�����@7���U��^Y�j_�Sd�]ർ�F��F�L9
�������<�s�����P阛���쎿��Pb)�se����b��#g/�j�,��|�w��aX�l��gh٥�=uWg�S�N�%��t0��m{�6���g�QE�I�@r������ls3�p�� >��9nF2�u��z\���<χY�}�G86��QABpYZSB�+ #1��4���j �5\"���J5ؘ7[��F�z�9<堅x�n���E.�.��!z����:}0��e���+�}�L�A��;.kg�3l���SM𼃋�x4 ��k�k�氡��MZd�F^���'��A�<�伎=S��,ʾ�8nc�)�
&� Q?�}�]6\�m5�	x]�.�����9?�֞��z�ڲ v�ʺxd�M~<��L�=ս�Ģć|}t�v�!�S�็J�}�f>�c6l������5��py���b1E{�bk5�>�4}��P�7y�x�c��[C	�m]�۠��i����(�9�#���^}������
��x�׈ ?02��.wM5`I��~Yٮ���w��@��K�*p�h�%' fߢ��+2�ݼ�w��۶=	�l��A�G��lbލ��ґ�0�]������d^�z�w'lYG��T{Drto_WUV�Ԩ��v>NRpXUBY?��n[jQ��LPQ���y����n>��q�m�	��@00C��R�"��g��9d�S;�k�7x�D��t�m�h\�8 рe�=�����t�z��yf%�9k\f��n-�B(�v�,� ��S�E#�w����5�����n�'�2<P�jW��"q�Z��]�<g� �M/�FZ����O&U㜞�eas�+�zg���n���T<�$��\�=�Ή^Y4�
���o��5=��c���RRS.��ʬsn�B� ��X���&�!�;���.��-�߲����b\~�����Q���p�ox0�EP�¾�#�m���6��c#����l����j)V2�fC���cp\m�~0����rS��n�xF������O�㝠�Wn����+���J-�X�UB�^a�h�b�$ཥ��Y��.~%���U��&���B��h�ՙ��T;@9��ѧ)$GeƋ��bgTRE;��G� ���S��G*'�j1<�g3O��{]��s.�ӳ_]��=�5���~�����      �   (
  x���]R#9��{N�`�%����Y`����c�,�6٪�"&3THJe�K�p|��u��N������O��ݐ;��0t~�0�����u�[�GK������緾7�g�����i������0�u_E����9�B��ʟ�o��?�lh���>�6�����x�Ç�a���X�n�ϢC�������N;?�m~w��g�ؼ̫�����q�y������~wꆱ�� hq �k�vZ�eտ��t����m���n��ᩏ��ͻ�G��R�^4W[�K��Oϛ�=ڕY��?��m��7�|J�x9�K��,x�q�>����؝�1�;�K��ɬ��u�^���9��e�����ߝ�ح���@�p��)���||���bT~z��������Ο�ŝz{4�Swa�7�Vs�毪��;3/�_V�K۸%�kZ��8��<n}Rb��R-\UW�e����+��Ǣ��a=���r�.ŖF1�zO6,CwYJ����hۻ�0I`�R�T꘩��Ԏ�A7
��6=m�.��xH��$0h��X�Z����7k����v?��اS|	�IC=�pu�̴�O��sg�bN�e��Wn>3���\ԥ�#+Й���}O�>��s~��j��7?�ƥ�3+��#�bvg�yӧ���y�q��ux+.k<�]���L5�۝���WV�/�.n���+֏������5��������]qPOOn4yo�C����R�P5���������a��N�,Ռ��/�X������!�6�]��p�����+;���:��#߳=&5�[����^*�Y�Μ�c>�iχ׏~o>35�X����o�+��o������<�9�ծ��˪sOvmV�=���-��_���j����R�ә%Ps,��ՓR�әePs,���I���}fnX���&|Q�j~��3K5�.-�P����g��RͯK*������9�P�\���ByP�jNgF5��`V�<(�ѝ_�i,��՛Q�M�*�~�z�!9F�Y�Y���To:� 7��P���M��&pJ?S�IHAn��3՛��&pJ?S�IHAn��3՛��\j�~�z����KM���ToR���(�L�&!�	\@���ToR���(�L�&!9�� ����$� ��R��3՛)�1��(�L��G
r�� �����HAn��3՛)�ݹ�J?S����(�L��G
"F�� �����HA�{UJ?S�鑂x�UJ?S�鑂�OU���Toz� b��	P���̀D�T5J?S������� ����HA�HU��3՛)��j|~͛)��j�~�z3 #UM����y3 �7lUJ?S������&�W�׼�����&@�g�7R1R�(�L�fD
"F�� ���ތHA�HU�!oF� b��	А7#R1R�hț)�~~4А7#R1R�hț)��j4�͈D�T5�fD
"F�� y3"��]А7RM�� y3!#UM���������&@C�LHA�HU�!o&� b��	А7R��(�!o&� /QPC�LHA^��������DAy3!y���fF
�5�͌�%
jț)�KԐ73R��(�!of� /QPC��HA^��������DAy3#y���fF
�5�͌�%
��7i@
��Λ�{��n�M���DA��&-F�^���y�� /Q���IR��(�vޤ)�Kt;oҀ�%
��7i@
��Λ4 y��n�M2HA^���y�R��(�v�$��%
��7� y��n�M2HA^���y�̒�\���&���H%�To���H%�To���H%�To���H%�ToZ���H%�ToZ���H%�ToZ���H%�ToZ���H%�ToZ���H%�ToZ��0����<@��E

�T�<@��E

�T�<@��E

�T�<@��E

�T�<@��C

�T�<@��C

�T�<@��C

�T�<@��C

�T�<@��C

�T�<@��C

�T�<@��C

�T�<@��C

�T�<@��C

�T�<@��C

�T�<@�&!F*y�z���#�<P�IHA��J���$���H%�ToRP`����7	)(0R�� ՛�%
��7����DAy����DAy����DAy�#E���G
�5�M�%
jț)(JԐ7=RP�(�!oz��(QPC��HAQ����鑂�DAy�#E���G
�5�̀%
jț)(JԐ7RP�(�!o��Ԑ7RP�(�!o��(QPC�HAQ�������DAy3 E���f@
�5�͈%
jț)(JԐ7#RP�(�!oF��(QPCތHAQ�������DAy3.)��А7#RPb����7#RPb����7#RPb����7RPb����7RPb����7RPb����7RPb����7RPb����7RPb����7RPb����7RP�~��:P����#�<P����#�<P����R��׮��73RPb����73RPb����73RPb����73RPb����73RPb����73RPb����73RPb����73RPb����73RPb����7�����y������������6      �   �   x�uʻ
�0 ���+���%�%���4tr	�E
����/Bp)��$
��Y�x��*[Z�w1�R�Cd�D�?8o���	�1-�}�����m�f���nU֑�2B�jk&~[r������j��O�c���C,      �   M   x�-˻�0њƠ��i�,������~n��s>H���eN���!"��1�yZ�%�s
�q	Q´w��'N      �     x����n�@@����`-�`�e����`�Y��Z��m]9��H��~U�������$$�>�}3�X�A �*������R�*󥑙� �#��>�C���}��ۗS�L��Ӵ���?v7^ѵ�fh�~��x�޶�~�;���:0�_ #6e�Pq�IU	��K�0^���-�<�g������p]�V�9�t!vPn��BX��9�c?�����0
�8�̀cY��r��*����D�������}w=��9�%�QU�tK'�@�B#+�0�� �(|��}���^OcE��2�<��R+@�P�k��G�o����/�c�����!l�2�Ј�.D��H|�G�}S���v�~E��¡	ŉfMx>l�A�&����?dn�騆8Jb�$Ph#�>���K���$<
0!����v�����)�$8wK���h��Y�PF>n���,��~Ғ���4M��wh�4.Da��(��/A7�t�!	|����q{���O'��?3Y�      �      x������ � �      �   z   x�m�M
1�ur�����RZ��������t����RSD�q�[@H,�%��E"�>BF�Z��Ұ��� �9a��MȼL����or�:l����{���D�w�c]�95�DD�`+�      �   �  x�=�[�� �o��ǧ


"("I�]u���󹓕�sXg��BuD�)ǒ��!vX�%W^1l�0���{a��?vU�� �J��J�/h�[������ؕ�b�x��x�b�Q�����ZI�L��� z�C!�)O�W!z_�>��q���Zs�����owv�,L��m�"m5�v\�
z��2�:��A�ټ'��͂4�*<�!�oW�B��U��Uܷ{�^4�ܶ'xc������yٕ��h��iNX��鷫� C��Lb���%o�:�=C����G=��8O����3�����f}�q8���hJ��D����T��WM[cjQ+�)���W���r�1v��������be����x�L��z�� �u���s�-���D�@��j��F��8�� �Э܂Ϸ����
yG?jLPTND]x��&�ي��bN�ӌ[Y[�ZR��X���Fig������?��,      �   �   x�U��� ���.��6�g�>&� ��"�h*!�����'I���������+��<���{��
00*�<���6�$X2pS��gҗ�#�%�~��H]g�ќ��ن����_�w�����#~@�ED��3�      �   h  x�]�Kn�0���)|�F��<�Sp"bS]D�g�*���@����/
t3Y�o�q�B)ePK#�#�i�H5J������ |�w����;a{�a=&�Cq8k�do�Q�Z��N��jCd��� �db��P�Q�4�X��9Nr�p����42�
7NNl�2�4�����`�4����h���5��\
;�X�t�>J�=�ߦ�A��0�ɴl>>�Q-Ʒ(�s_���
�����/�06!
1��`�����d�i�ShP���чm���b/���J8���9��!.�28d�����H�1�B^;T����}�?,��嘰%]0�^�7�Iwr J����fK��o��&�Y+˧��$�t���      �   �  x����n�@���� �ͧo�'rjlbc�J���٤/]c$�}��zɩ�^y��HH��R	cV���3��dޡ6%^�L�yA�9��I0c�Y�"��:�;�S����U��zwlc� �2�by�l�.���ҢTpU˵��y�J�t������v#�5�>����rͭ\--���,!̛����<��!$q��1�ȣG�C<�K�=ͅ��8_�6t\ĝ�-�w���[����Kۈ��&
�*\�h�RD�,�%a�W��0�E3F����%��=�1�������&�� ��^��7�z��8�1����ו�U.���z��^�0�$��&����#��k���W6{�!�#=e�\)S^����(�;�QSl�(WZK�)^�������}A��܃����;��,x)�W��q��e�;�?�0��fq�i@����B�J��0��#ІJ\�=|�z��ע�jCJ.�l���3�cOC8$����UA�m���>2�"�KU�
�R.x�n���O,���^����p(�	Nߌ�b�%xK���MF$���Z���=&����B�ބ����"�XӵY�y�����s)a��T�p�1s.����c�\�J�,P���x2yZT+3ܻ��Bu�\�%2OxÎ3r��ܧ��ֲId�z�O�>^v?D�ӊ���?��`��?%�y6u�������L�}�{'z#�"y��;/^��X�V��E��      �   7   x�Mǹ  �����c`�9PDw6�EҐJ��98���%l�Pc޻*"���      �   `   x�sst�500� �@�H����D��G�.7�
#�
cNC��)��Pa�n7�j��a�����"i�[��v�
C�������� �.%�      �   9   x�%�9�@���%'�w8 �qD������L�!#��j���7h��Ei�]P�ND����      �   Z   x�U��� Cϰ����:����Q	�%��!Y��:�<�cV d���t`�;�}@����8!	inR��i�/��� 	_�ֈѷ��Ƿ �      �   :   x�Mʹ  �����c`�9P��Ғg�4��b#��j�V��f�Z1ڈ�Uy�Y�      �   �  x�=�K�� ౮��	ot��"���29�_ǵ��t�Oj���*�(^�&Lw���I@yt*�]r�j�!�/��4��f��� ���
s����H��ስ�iV	I'�%�8�u�j�G%�4KD��1�.�
<����֞��*�/��V;��&�leî��P�h���>��r�]��D~��*�%�ڙ�e�1�p�T��d�7�� �����?=i�[���?E���֦A\W��õa�\<�X��"�s��2
7�\WK�����m�6,�̀���q���B��'���]�s�����QQ��!�;��Գ�(a����W�0s��a�Yb�J)m���6U�p��6 �θ�.�W}&o5��#��)�v �� ����-��ӟb��mz�eG��]����AK�*R�V�!��ɸq(�Љ���7r��7ᾡou/�%n麙�y����&�v�>?'B��C.7�I�&��8��=jڶ�P��      �      x������ � �     