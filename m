From: noamca@mellanox.com (Noam Camus)
Date: Tue, 1 Nov 2016 07:49:57 +0000
Subject: [PATCH 5/9] ARC: breakout aux handling into a seperate header
In-Reply-To: <1477954096-770-6-git-send-email-vgupta@synopsys.com>
References: <35bde193-8492-83e0-fb03-8385d8afd007@synopsys.com>
 <1477954096-770-1-git-send-email-vgupta@synopsys.com>
 <1477954096-770-6-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB6PR0501MB25185BC1DEA31D83F95BBEC5AAA10@DB6PR0501MB2518.eurprd05.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Vineet Gupta [mailto:Vineet.Gupta1 at synopsys.com] 
>Sent: Tuesday, November 1, 2016 12:48 AM

>ARC timers use aux registers for programming and this paves way for moving ARC timer drivers into drivers/clocksource

Maybe in this patch or just another one could you move from timer.c to the new soc header all timer related Aux registers definitions?
This could be used by timer-nps driver.
 
i.e.:
/* Timer related Aux registers */
#define ARC_REG_TIMER0_LIMIT    0x23    /* timer 0 limit */
#define ARC_REG_TIMER0_CTRL     0x22    /* timer 0 control */
#define ARC_REG_TIMER0_CNT      0x21    /* timer 0 count */
#define ARC_REG_TIMER1_LIMIT    0x102   /* timer 1 limit */
#define ARC_REG_TIMER1_CTRL     0x101   /* timer 1 control */
#define ARC_REG_TIMER1_CNT      0x100   /* timer 1 count */

#define TIMER_CTRL_IE   (1 << 0) /* Interrupt when Count reaches limit */
#define TIMER_CTRL_NH   (1 << 1) /* Count only when CPU NOT halted */

#define ARC_TIMER_MAX   0xFFFFFFFF
