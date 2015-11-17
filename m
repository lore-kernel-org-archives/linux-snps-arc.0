From: noamc@ezchip.com (Noam Camus)
Date: Tue, 17 Nov 2015 11:38:24 +0000
Subject: [PATCH v2 07/19] ARC: rename smp operation init_irq_cpu() to
 init_per_cpu()
In-Reply-To: <564B0C65.8030006@synopsys.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446893557-29748-8-git-send-email-noamc@ezchip.com>
 <564B0C65.8030006@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR02MB11410B3B88D3A37E68D80BDDD61D0@DB5PR02MB1141.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

From: Vineet Gupta [mailto:Vineet.Gupta1@synopsys.com] 
Sent: Tuesday, November 17, 2015 1:16 PM
>
>
>Acked-by: Vineet Gupta <vgupta at synopsys.com>
>
>Per our disccussion were you also going to rename the similar op in machine_desc ?

No, Just rename the plat_smp_ops.
About machine_desc, I believe that now init_cpu_smp is not needed.
I will remove it if you wish to.

-Noam
