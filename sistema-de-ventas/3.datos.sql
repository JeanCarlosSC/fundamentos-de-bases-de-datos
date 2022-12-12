INSERT INTO cliente(k_rut, n_nom_cliente, n_ape_cliente, n_calle, o_numero, n_barrio, n_ciudad, v_limite_c, v_saldo)
	VALUES
	(451325497513,	 'Maria',	 'Perez',	 'Obregon',	135,	 'Villa_Luz',	 'Bogota',	3623000,	44000),
	(483246546123,	 'Carlos',	 'Sanchez',	 'Sucre',	45,	 'El_cortijo',	 'Mosquera',	2422000,	3000),
	(456123879551,	 'Pedro',	 'Sandoval',	 'Celestino',	26,	 'Modelo_Norte',		'Bogota',	911000,	0),
	(456978412367,	 'Ramiro',	 'Barbosa',	 'Miranda',	136,	 'Modelo_Norte',		'Bogota',	1584000,	45000),
	(469756712354,	 'Juan',     'Torres',	 'Gaitan',	15,	 'Villa_Luz',	 'Chia',	1130000,	44000),
	(463124579996,	 'Jairo',	 'Camacho',	 'Orquideas',	65,	 'El_cortijo',		'Bogota',	2849000,	0),
	(465795336798,	 'Juana',	 'Arevalo',	 'Mutis',	68, 'Bachue',		'Bogota',	746000,	0),
	(412649872697,	 'David',	 'Torres',	 'Santander',	45,	 'Modelo_Norte',		'Bogota',	1908000,	45000);


INSERT INTO telefono(k_telefono, k_rut)
	VALUES
	(6872345,	451325497513),
	(5694712,	483246546123),
	(5981236,	456123879551),
	(6457812,	456978412367),
	(3658842,	469756712354),
	(2364895,	463124579996),
	(6851235,	465795336798),
	(6986532,	412649872697);

INSERT INTO proveedor(k_rut, n_calle, o_numero, n_barrio, n_ciudad, o_pag_web)
	VALUES
	(981265142137, 'Arciniegas', 12, 'Bachue',	'Bogota', 'www.lalechefeliz.com'),
	(823654891231, 'Leon', 45, 'Normandia', 'Chia', 'www.harinasperez.com'),
	(659875132345, 'Caldas', 89, 'Bachue', 'Bogota', 'www.familiagalletas.com'),
	(168795236454, 'Carlos', 154, 'Villa_Luz', 'Bogota', 'www.elcampofrutasverduras.com'),
	(365489451254, 'Constitucion', 79,'Villa_Luz', 'Cota', 'www.carnesypollos.com');

INSERT INTO categoria(k_id_categoria, n_categoria, o_des_categoria)
	VALUES
	(5556,	'Lacteos',	'Productos lacteos y productos analogos, excluidos los productos de la categoria de alimentos'),
	(5449,	'Aceites',	'Grasas y aceites y emulsiones grasas'),
	(3274,	'Frutas_verduras',	'Frutas y hortalizas (incluidos hongos y setas, raices y tuberculos, legumbres y leguminosas y aloe vera), algas marinas y nueces y semillas'),		
	(8222,	'Cereales',	'Cereales y productos a base de cereales, derivados de granos de cereales, de raices y tuberculos, legumbres, y leguminosas y medula o corazon blando de palmera'),
	(9749,	'Panes',	'Productos de panaderia'),
	(3320,	'Carnes',	'Carne y productos carnicos, incluidos los de aves de corral y caza'),	
	(5529,	'Pescado',	'Pescado y productos pesqueros, incluidos los moluscos, crustaceos y equinodermos');

INSERT INTO producto(k_id_producto, v_precio, n_producto, o_stock, k_rut, k_id_categoria)
	VALUES
	(13383, 12200,	'Leche',	191,	981265142137,	5556),
	(59243,	4500,	'Cuajada',	242,	981265142137,	5556),
	(21403, 18500,	'Leche condensada',	219,	981265142137,	5556),
	(64276, 7500,	'Nata',	185,	981265142137,	5556),
	(48623, 14300,	'Leche en polvo',	92,	981265142137,	5556),
	(86631, 7800,	'Queso',	59,	981265142137,	5556),
	(39026, 15300,	'Queso no madurado',	97,	981265142137,	5556),
	(92279,	6400,	'Postres lacteos', 	133,	981265142137,	5556),
	(13904,	4500,	'Aceites vegetales',	175,	981265142137,	5449),
	(96661,	19600,	'Mantequilla', 	189,	981265142137,	5449),
	(24127,	9800,	'Frutas frescas',	68,	168795236454,	3274),
	(27695,	5500,	'Vinagre de fruta',	170,	168795236454,	3274),
	(32846,	1600,	'Enlatados',	62,	168795236454,	3274),
	(98412,	4900,	'Mermelada',	200,	168795236454,	3274),
	(47958,	17600,	'Pulpa',	71,	168795236454,	3274),
	(50464,	4000,	'Rellenos de fruta',	20,	168795236454,	3274),
	(19441,	17500,	'Hortalizas',	210,	168795236454,	3274),
	(30639,	8800,	'Hongos y setas',	183,	168795236454,	3274),
	(24992,	17700,	'Raices y tuberculos',	128,	168795236454,	3274),
	(82883,	11900,	'Legumbres y leguminosas',	56,	168795236454,	3274),
	(96611,	5900,	'Algas marinas',	60,	168795236454,	3274),
	(22550,	2600,	'Nueces y semillas', 	83,	168795236454,	3274),
	(16487,	16700,	'Salsa de soja',	219,	168795236454,	3274),
	(14164,	8100,	'Arroz',	37,	823654891231,	8222),
	(85383,	16500,	'Harinas y almidones', 	98,	823654891231,	8222),
	(11689,	19400,	'Pastas y fideos',	55,	823654891231,	8222),
	(40851,	10300,	'Postres a base de cereales y almidon', 	149,	823654891231,	8222),
	(93186,	12600,	'Mezclas batidas para rebozar', 	222,	823654891231,	8222),
	(83367,	6300, 'Pan', 	1,	659875132345,	9749),
	(30238,	11800,	'Crackers',	16,	659875132345,	9749),
	(63316,	15600,	'Base de pan',	72,	659875132345,	9749),
	(43849,	9600,	'Bollos dulces',	25,	659875132345,	9749),
	(24000,	1100,	'Tortas', 	247,	659875132345,	9749),
	(81821,	14900,	'Galletas',	165,	659875132345,	9749),
	(20458,	8500, 'Pasteles', 	84,	659875132345,	9749),
	(83094,	17500,	'Mezclas para pasteleria fina', 	248,	659875132345,	9749),
	(63983,	15900,	'Pollo',	152,	365489451254,	3320),
	(15441,	14300,	'Salchicha',	122,	365489451254,	3320),
	(26586,	18200,	'Salchichon',	157,	365489451254,	3320),
	(32422,	3800,	'Cerdo',	130,	365489451254,	3320),
	(20682,	10000,	'Pavo',	222,	365489451254,	3320),
	(42102,	19400,	'Pato',	214,	365489451254,	3320),
	(31581,	3200,	'Tripas comestibles', 	109,	365489451254,	3320),
	(50552,	12400,	'Moluscos',	234,	365489451254,	5529),
	(46686,	3000,	'Crustaceos',	79,	365489451254,	5529),
	(15131,	8200,	'Pescado fresco',	119,	365489451254,	5529),
	(92432,	19800,	'Filetes de pescado', 	160,	365489451254,	5529),
	(59507, 7300, 	'Salmon',	146,	365489451254,	5529),
	(99714,	6100,	'Caviar',	211,	365489451254,	5529);

INSERT INTO venta(k_id_venta, f_venta, v_descuento, v_monto_final, v_precio_venta, k_rut)
	VALUES
	(834459,	'24/07/2010',	235000,	0, 0, 451325497513),
	(624380,	'08/02/2010',	82900,	0, 0, 483246546123),
	(532725,	'07/04/2011',	79200,	0, 0, 456123879551),
	(627670,	'27/11/2015',	222800,	0, 0, 456978412367),
	(313453,	'21/05/2014',	81800,	0, 0, 469756712354),
	(861084,	'11/12/2009',	148900,	0, 0, 463124579996),
	(980323,	'04/01/2011',	236600,	0, 0, 465795336798),
	(845553,	'20/05/2011',	65600,	0, 0, 412649872697),
	(960902,	'30/06/2016',	173400,	0, 0, 451325497513),
	(660225,	'17/04/2010',	205000,	0, 0, 483246546123),
	(721217,	'04/11/2013',	244500,	0, 0, 456123879551),
	(875653,	'11/02/2014',	132200,	0, 0, 469756712354),
	(642205,	'10/04/2015',	216800,	0, 0, 463124579996),
	(426468,	'07/09/2016',	142400,	0, 0, 412649872697),
	(288668,	'10/06/2015',	68800,	0, 0, 483246546123),
	(304651,	'03/01/2010',	198000,	0, 0, 456123879551);

	SELECT pr_insertar_venta_producto(96611,834459,7);
	SELECT pr_insertar_venta_producto(83367,		834459,	4);
	SELECT pr_insertar_venta_producto(30238,		834459,	20);
	SELECT pr_insertar_venta_producto(63316,		834459,	8);
	SELECT pr_insertar_venta_producto(43849,		834459,	1);
	SELECT pr_insertar_venta_producto(24000,		624380,	9);
	SELECT pr_insertar_venta_producto(40851,		624380,	16);
	SELECT pr_insertar_venta_producto(24992,		624380,	11);
	SELECT pr_insertar_venta_producto(82883,		624380,	8);
	SELECT pr_insertar_venta_producto(24127,		624380,	14);
	SELECT pr_insertar_venta_producto(27695,		624380,	6);
	SELECT pr_insertar_venta_producto(32846,		624380,	6);
	SELECT pr_insertar_venta_producto(98412,		624380,	8);
	SELECT pr_insertar_venta_producto(47958,		532725,	16);
	SELECT pr_insertar_venta_producto(83367,		532725,	4);
	SELECT pr_insertar_venta_producto(30238,		532725,	9);
	SELECT pr_insertar_venta_producto(63316,		627670,	15);
	SELECT pr_insertar_venta_producto(39026,		627670,	9);
	SELECT pr_insertar_venta_producto(92279,		627670,	4);
	SELECT pr_insertar_venta_producto(13904,		627670,	4);
	SELECT pr_insertar_venta_producto(96661,		627670,	20);
	SELECT pr_insertar_venta_producto(83367,		627670,	16);
	SELECT pr_insertar_venta_producto(30238,		627670,	20);
	SELECT pr_insertar_venta_producto(43849,		627670,	7);
	SELECT pr_insertar_venta_producto(24000,		313453,	17);
	SELECT pr_insertar_venta_producto(98412,		313453,	4);
	SELECT pr_insertar_venta_producto(47958,		313453,	9);
	SELECT pr_insertar_venta_producto(48623,		313453,	20);
	SELECT pr_insertar_venta_producto(86631,		861084,	2);
	SELECT pr_insertar_venta_producto(39026,		861084,	18);
	SELECT pr_insertar_venta_producto(92279,		861084,	15);
	SELECT pr_insertar_venta_producto(13904,		861084,	17);
	SELECT pr_insertar_venta_producto(96661,		861084,	14);
	SELECT pr_insertar_venta_producto(24127,		861084,	1);
	SELECT pr_insertar_venta_producto(27695,		861084,	15);
	SELECT pr_insertar_venta_producto(32846,		861084,	7);
	SELECT pr_insertar_venta_producto(98412,	    861084,	5);
	SELECT pr_insertar_venta_producto(47958,		861084,	11);
	SELECT pr_insertar_venta_producto(83367,		861084,	14);
	SELECT pr_insertar_venta_producto(30238,		980323,	11);
	SELECT pr_insertar_venta_producto(63316,		980323,	5);
	SELECT pr_insertar_venta_producto(24000,		980323,	14);
	SELECT pr_insertar_venta_producto(81821,		980323,	20);
	SELECT pr_insertar_venta_producto(43849,		980323,	5);
	SELECT pr_insertar_venta_producto(24000,		845553,	1);
	SELECT pr_insertar_venta_producto(98412,		845553,	8);
	SELECT pr_insertar_venta_producto(47958,		845553,	4);
	SELECT pr_insertar_venta_producto(48623,		845553, 19);
	SELECT pr_insertar_venta_producto(86631,		845553,	14);
	SELECT pr_insertar_venta_producto(39026,		845553,	5);
	SELECT pr_insertar_venta_producto(31581,		960902,	7);
	SELECT pr_insertar_venta_producto(50552,		960902,	9);
	SELECT pr_insertar_venta_producto(46686,		960902,	12);
	SELECT pr_insertar_venta_producto(32846,		960902,	18);
	SELECT pr_insertar_venta_producto(98412,		660225,	4);
	SELECT pr_insertar_venta_producto(47958,		660225,	13);
	SELECT pr_insertar_venta_producto(59243,		660225,	13);
	SELECT pr_insertar_venta_producto(21403,		660225,	8);
	SELECT pr_insertar_venta_producto(64276,		660225,	15);
	SELECT pr_insertar_venta_producto(48623,		660225,	12);
	SELECT pr_insertar_venta_producto(86631,		660225,	1);
	SELECT pr_insertar_venta_producto(39026,		660225,	19);
	SELECT pr_insertar_venta_producto(92279,		721217,	4);
	SELECT pr_insertar_venta_producto(47958,		721217,	18);
	SELECT pr_insertar_venta_producto(48623,		721217,	13);
	SELECT pr_insertar_venta_producto(86631,		721217,	9);
	SELECT pr_insertar_venta_producto(39026,		721217, 17);
	SELECT pr_insertar_venta_producto(31581,		721217,	12);
	SELECT pr_insertar_venta_producto(98412,		875653,	7);
	SELECT pr_insertar_venta_producto(47958, 	875653,	13);
	SELECT pr_insertar_venta_producto(48623,		875653,	3);
	SELECT pr_insertar_venta_producto(86631, 	875653,	12);
	SELECT pr_insertar_venta_producto(39026,		875653,	5);
	SELECT pr_insertar_venta_producto(92279,		875653,	16);
	SELECT pr_insertar_venta_producto(13904,		875653,19);
	SELECT pr_insertar_venta_producto(96661,		875653,	15);
	SELECT pr_insertar_venta_producto(24127,		642205,	2);
	SELECT pr_insertar_venta_producto(27695,		642205,	8);
	SELECT pr_insertar_venta_producto(32846,		642205,	18);
	SELECT pr_insertar_venta_producto(24000,		642205,	11);
	SELECT pr_insertar_venta_producto(21403,		642205,	15);
	SELECT pr_insertar_venta_producto(92432,		642205,	8);
	SELECT pr_insertar_venta_producto(40851,		426468,	17);
	SELECT pr_insertar_venta_producto(24992,		426468,	17);
	SELECT pr_insertar_venta_producto(63316,		288668,	1);
	SELECT pr_insertar_venta_producto(39026,		288668,	11);
	SELECT pr_insertar_venta_producto(92279,		288668,	9);
	SELECT pr_insertar_venta_producto(13904,		288668,	6);
	SELECT pr_insertar_venta_producto(63316,		304651,	16);
	SELECT pr_insertar_venta_producto(43849,		304651,	9);