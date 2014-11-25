/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/repo/avmis/JKTrigger.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );


static void work_a_2187950162_2523396070_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;
    unsigned char t17;
    unsigned char t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(22, ng0);
    t2 = (t0 + 776U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)2);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    t2 = (t0 + 776U);
    t3 = *((char **)t2);
    t1 = *((unsigned char *)t3);
    t4 = (t1 == (unsigned char)2);
    if (t4 != 0)
        goto LAB8;

LAB9:    t2 = (t0 + 868U);
    t3 = *((char **)t2);
    t1 = *((unsigned char *)t3);
    t4 = (t1 == (unsigned char)2);
    if (t4 != 0)
        goto LAB10;

LAB11:    t2 = (t0 + 936U);
    t7 = xsi_signal_has_event(t2);
    if (t7 == 1)
        goto LAB20;

LAB21:    t5 = (unsigned char)0;

LAB22:    if (t5 == 1)
        goto LAB17;

LAB18:    t4 = (unsigned char)0;

LAB19:    if (t4 == 1)
        goto LAB14;

LAB15:    t1 = (unsigned char)0;

LAB16:    if (t1 != 0)
        goto LAB12;

LAB13:    t2 = (t0 + 936U);
    t7 = xsi_signal_has_event(t2);
    if (t7 == 1)
        goto LAB31;

LAB32:    t5 = (unsigned char)0;

LAB33:    if (t5 == 1)
        goto LAB28;

LAB29:    t4 = (unsigned char)0;

LAB30:    if (t4 == 1)
        goto LAB25;

LAB26:    t1 = (unsigned char)0;

LAB27:    if (t1 != 0)
        goto LAB23;

LAB24:    t2 = (t0 + 936U);
    t7 = xsi_signal_has_event(t2);
    if (t7 == 1)
        goto LAB42;

LAB43:    t5 = (unsigned char)0;

LAB44:    if (t5 == 1)
        goto LAB39;

LAB40:    t4 = (unsigned char)0;

LAB41:    if (t4 == 1)
        goto LAB36;

LAB37:    t1 = (unsigned char)0;

LAB38:    if (t1 != 0)
        goto LAB34;

LAB35:
LAB3:    t2 = (t0 + 3024);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(23, ng0);
    t2 = (t0 + 3084);
    t9 = (t2 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)1;
    xsi_driver_first_trans_fast(t2);
    goto LAB3;

LAB5:    t2 = (t0 + 868U);
    t6 = *((char **)t2);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)2);
    t1 = t8;
    goto LAB7;

LAB8:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 3084);
    t6 = (t2 + 32U);
    t9 = *((char **)t6);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB3;

LAB10:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 3084);
    t6 = (t2 + 32U);
    t9 = *((char **)t6);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB3;

LAB12:    xsi_set_current_line(29, ng0);
    t3 = (t0 + 1236U);
    t11 = *((char **)t3);
    t18 = *((unsigned char *)t11);
    t19 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t18);
    t3 = (t0 + 3084);
    t12 = (t3 + 32U);
    t20 = *((char **)t12);
    t21 = (t20 + 40U);
    t22 = *((char **)t21);
    *((unsigned char *)t22) = t19;
    xsi_driver_first_trans_fast(t3);
    goto LAB3;

LAB14:    t3 = (t0 + 684U);
    t10 = *((char **)t3);
    t16 = *((unsigned char *)t10);
    t17 = (t16 == (unsigned char)3);
    t1 = t17;
    goto LAB16;

LAB17:    t3 = (t0 + 592U);
    t9 = *((char **)t3);
    t14 = *((unsigned char *)t9);
    t15 = (t14 == (unsigned char)3);
    t4 = t15;
    goto LAB19;

LAB20:    t3 = (t0 + 960U);
    t6 = *((char **)t3);
    t8 = *((unsigned char *)t6);
    t13 = (t8 == (unsigned char)3);
    t5 = t13;
    goto LAB22;

LAB23:    xsi_set_current_line(31, ng0);
    t3 = (t0 + 3084);
    t11 = (t3 + 32U);
    t12 = *((char **)t11);
    t20 = (t12 + 40U);
    t21 = *((char **)t20);
    *((unsigned char *)t21) = (unsigned char)3;
    xsi_driver_first_trans_fast(t3);
    goto LAB3;

LAB25:    t3 = (t0 + 684U);
    t10 = *((char **)t3);
    t16 = *((unsigned char *)t10);
    t17 = (t16 == (unsigned char)2);
    t1 = t17;
    goto LAB27;

LAB28:    t3 = (t0 + 592U);
    t9 = *((char **)t3);
    t14 = *((unsigned char *)t9);
    t15 = (t14 == (unsigned char)3);
    t4 = t15;
    goto LAB30;

LAB31:    t3 = (t0 + 960U);
    t6 = *((char **)t3);
    t8 = *((unsigned char *)t6);
    t13 = (t8 == (unsigned char)3);
    t5 = t13;
    goto LAB33;

LAB34:    xsi_set_current_line(33, ng0);
    t3 = (t0 + 3084);
    t11 = (t3 + 32U);
    t12 = *((char **)t11);
    t20 = (t12 + 40U);
    t21 = *((char **)t20);
    *((unsigned char *)t21) = (unsigned char)2;
    xsi_driver_first_trans_fast(t3);
    goto LAB3;

LAB36:    t3 = (t0 + 684U);
    t10 = *((char **)t3);
    t16 = *((unsigned char *)t10);
    t17 = (t16 == (unsigned char)3);
    t1 = t17;
    goto LAB38;

LAB39:    t3 = (t0 + 592U);
    t9 = *((char **)t3);
    t14 = *((unsigned char *)t9);
    t15 = (t14 == (unsigned char)2);
    t4 = t15;
    goto LAB41;

LAB42:    t3 = (t0 + 960U);
    t6 = *((char **)t3);
    t8 = *((unsigned char *)t6);
    t13 = (t8 == (unsigned char)3);
    t5 = t13;
    goto LAB44;

}

static void work_a_2187950162_2523396070_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(36, ng0);

LAB3:    t1 = (t0 + 1236U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 3120);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 3032);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2187950162_2523396070_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(37, ng0);

LAB3:    t1 = (t0 + 1236U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t3);
    t1 = (t0 + 3156);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t4;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t9 = (t0 + 3040);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2187950162_2523396070_init()
{
	static char *pe[] = {(void *)work_a_2187950162_2523396070_p_0,(void *)work_a_2187950162_2523396070_p_1,(void *)work_a_2187950162_2523396070_p_2};
	xsi_register_didat("work_a_2187950162_2523396070", "isim/SCHEME_TEST_isim_beh.exe.sim/work/a_2187950162_2523396070.didat");
	xsi_register_executes(pe);
}
