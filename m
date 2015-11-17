From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 17 Nov 2015 17:12:09 +0530
Subject: [PATCH v2 07/19] ARC: rename smp operation init_irq_cpu() to
 init_per_cpu()
In-Reply-To: <DB5PR02MB11410B3B88D3A37E68D80BDDD61D0@DB5PR02MB1141.eurprd02.prod.outlook.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446893557-29748-8-git-send-email-noamc@ezchip.com>
 <564B0C65.8030006@synopsys.com>
 <DB5PR02MB11410B3B88D3A37E68D80BDDD61D0@DB5PR02MB1141.eurprd02.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <564B1291.1090408@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tuesday 17 November 2015 05:08 PM, Noam Camus wrote:
> From: Vineet Gupta [mailto:Vineet.Gupta1 at synopsys.com] 
> Sent: Tuesday, November 17, 2015 1:16 PM
>> >
>> >
>> >Acked-by: Vineet Gupta <vgupta at synopsys.com>
>> >
>> >Per our disccussion were you also going to rename the similar op in machine_desc ?
> No, Just rename the plat_smp_ops.
> About machine_desc, I believe that now init_cpu_smp is not needed.
> I will remove it if you wish to.
> 
> -Noam

No let us keep it - I think axs platform will need it soon !

-Vineet
