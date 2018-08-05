#include "stdafx.h"
#include "mtDef.h"
#include "function.h"

#define TBL_SIZE	16

uint8_t	tbl_coil_trans[TBL_SIZE]	= { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
uint8_t	tbl_temp[TBL_SIZE]			= { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

CONST uint8_t	tbl_sqrt[] =
{
255 , 255 , 255 , 255 , 255 , 255 , 255 , 255 , 255 , 255 ,
255 , 255 , 255 , 255 , 255 , 250 , 243 , 236 , 229 , 224 ,
218 , 213 , 209 , 204 , 200 , 196 , 192 , 189 , 186 , 183 ,
180 , 177 , 174 , 171 , 169 , 167 , 164 , 162 , 160 , 158 ,
156 , 154 , 152 , 151 , 149 , 147 , 146 , 144 , 143 , 141 ,
140 , 139 , 137 , 136 , 135 , 134 , 132 , 131 , 130 , 129 ,
128 , 127 , 126 , 125 , 124 , 123 , 122 , 121 , 120 , 120 ,
119 , 118 , 117 , 116 , 115 , 115 , 114 , 113 , 113 , 112 ,
111 , 110 , 110 , 109 , 108 , 108 , 107 , 107 , 106 , 105 ,
105 , 104 , 104 , 103 , 103 , 102 , 102 , 101 , 101 , 100 , 
100
};

CONST uint8_t	tbl_predict[] =
{
//	Ver1.0 ������
/*
0, 47, 47, 48, 48, 49, 49, 50, 50, 51,
52, 53, 54, 55, 56, 58, 59, 60, 62, 63,
65, 66, 68, 70, 72, 74, 76, 78, 80, 82,
84, 86, 89, 91, 94, 96, 99, 101, 104, 107,
109, 112, 115, 118, 121, 124, 127, 130, 134, 138,
143, 147, 152, 156, 161, 166, 170, 173, 176, 178,
179, 180, 181, 182, 183, 184, 185, 186, 187, 188,
189, 189, 190, 190, 191, 191, 192, 192, 193, 193,
193, 194, 194, 194, 195, 195, 195, 195, 196, 196,
196, 196, 197, 197, 197, 198, 198, 199, 199, 199,
200
*/
/*	2015.1.23
*/
/*	2016.12.22
 1:22.5%
 8:25.0%
15:30.0%
19:35.0%
23:40.0%
27:45.0%
32:50.0%
*/
0	,	45	,	45	,	46	,	46	,47	,	48	,	48	,	50	,	51	,
52	,	53	,	55	,	57	,	59	,61	,	63	,	66	,	68	,	71	,
74	,	76	,	79	,	81	,	84	,86	,	88	,	90	,	93	,	95	,
97	,	99	,	101	,	103	,	105	,107	,	109	,	112	,	114	,	116	,
118	,	120	,	122	,	124	,	126	,128	,	130	,	132	,	134	,	136	,
138	,	140	,	141	,	143	,	145	,147	,	149	,	151	,	152	,	154	,
156	,	158	,	159	,	161	,	162	,164	,	165	,	167	,	168	,	169	,
171	,	172	,	173	,	174	,	176	,177	,	178	,	179	,	180	,	181	,
182	,	183	,	184	,	185	,	186	,187	,	188	,	189	,	190	,	191	,
192	,	193	,	194	,	194	,	195	,196	,	197	,	198	,	198	,	199	,
200
};

CONST uint8_t	tbl_predict2[] =
{
//	Ver1.0 ��ʹ�� 
/*
25, 25, 25, 25, 25, 25, 26, 26, 26, 26,
27, 27, 27, 28, 28, 28, 29, 29, 30, 30,
30, 30, 31, 31, 31, 32, 32, 32, 33, 33,
33, 34, 34, 35, 36, 36, 37, 38, 38, 39,
40, 41, 42, 43, 44, 45, 47, 48, 49, 51,
52, 53, 55, 56, 58, 59, 61, 63, 64, 66,
67, 69, 71, 72, 74, 76, 77, 79, 80, 81,
83, 84, 86, 87, 88, 89, 91, 92, 93, 94,
95, 97, 98, 99, 101, 102, 104, 106, 108, 110, 
112, 115, 117, 121, 125, 130, 136, 145, 160, 174, 
200
*/
45	,	45	,	45	,	45	,	45	,45	,	45	,	45	,	45	,	46	,
46	,	47	,	47	,	47	,	48	,49	,	49	,	50	,	50	,	51	,
52	,	52	,	53	,	54	,	54	,55	,	55	,	56	,	57	,	57	,
58	,	59	,	59	,	60	,	61	,62	,	63	,	64	,	65	,	66	,
67	,	68	,	69	,	71	,	72	,73	,	74	,	76	,	77	,	78	,
79	,	81	,	82	,	84	,	85	,87	,	88	,	90	,	91	,	93	,
94	,	96	,	97	,	99	,	100	,102	,	103	,	105	,	107	,	108	,
110	,	111	,	113	,	115	,	116	,118	,	120	,	122	,	124	,	126	,
128	,	130	,	132	,	135	,	137	,140	,	143	,	145	,	148	,	151	,
154	,	158	,	161	,	165	,	169	,173	,	178	,	183	,	188	,	194	,
200									

};

uint16_t	calc_make_normal_long(void)
{
	uint8_t	i;
	uint16_t	s = 0;
	for( i=0; i<TBL_SIZE; i++ )
	{
		vtbl._r[i] = (uint8_t)((uint16_t)vtbl.coil[i] * (uint16_t)tbl_temp[i] / 100);
		s += vtbl._r[i];
	}
	return s;
}

uint8_t	calc_get_max_id(void)
{
	uint8_t	i;
	uint8_t j = 0;
	for( i=1; i<TBL_SIZE; i++ )
	{
		if( vtbl.coil[j] < vtbl.coil[i] )
			j = i;
	}
	return j;
}

uint8_t	calc_get_max_id2(void)
{
	uint8_t	i;
	uint8_t j = 0;
	for( i=1; i<TBL_SIZE; i++ )
	{
		if( vtbl._r[j] < vtbl._r[i] )
			j = i;
	}
	return j;
}

uint16_t	calc_trans_long(void)
{
	uint8_t	i;
	uint8_t k;
	uint8_t	sqr;
	uint16_t s = 0;
	k = calc_get_max_id();
	k = vtbl.coil[k];
	for( i=0; i<TBL_SIZE; i++ )
	{
		sqr = (uint8_t)((uint16_t)vtbl.coil[i] * 100 / k);
		tbl_coil_trans[i] = tbl_sqrt[sqr];
		s += vtbl.coil[i];
	}
	return s;	
}

void	calc_trans_long2(void)
{
	uint8_t	i;
	uint8_t j;
	uint8_t k;
	j = calc_get_max_id2();
	k = vtbl._r[j];
	for( i=0; i<TBL_SIZE; i++ )
	{
		vtbl._r[i] = (uint8_t)((uint16_t)vtbl._r[i] * 100 / k);
	}
	for( i=0; i<TBL_SIZE; i++ )
	{
		vtbl._r[i] = (uint8_t)((uint16_t)vtbl._r[i] * 100 / tbl_coil_trans[i]);
	}
	k = vtbl._r[j];
	for( i=0; i<TBL_SIZE; i++ )
	{
		vtbl._r[i] = (uint8_t)((uint16_t)vtbl._r[i] * 100 / k);
	}
}

uint8_t	__sol = 0;

uint8_t	calc_final(void)
{
	uint8_t	i;
	uint8_t	j;
	uint16_t	i16;
	uint32_t	j16;

	i16 = calc_trans_long();
	j16 = calc_make_normal_long();
	j16 = j16/2;
	i16 = (uint16_t)(j16 * vtbl.max / i16); 
	calc_trans_long2();
	for( i=0; i<TBL_SIZE; i++ )
	{
		if( vtbl._r[i] != 0 )
		{	
			//	On/Off Control
			if( funcInfo.opMode == 0 )
				vtbl._r[i] = 200;
			else
				vtbl._r[i] = tbl_predict2[vtbl._r[i]];
		}
	}
	i16 &= 0xff;
	__sol = tbl_predict[i16];
	/*	debug only
	 */
	if( __sol != 0 )
	{
//15:30.0%
//23:40.0%
//32:50.0%
		j = 32;
		if( __sol < j )
			__sol = j;
	}
	
	return __sol;
}

