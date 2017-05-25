From: noamca@mellanox.com (Noam Camus)
Date: Thu, 25 May 2017 11:16:26 +0000
Subject: [PATCH 07/10] ARC: [plat-eznps] disabled stall counter due to a
 HW bug
In-Reply-To: <1495710620.5393.29.camel@synopsys.com>
References: <1495679660-9598-1-git-send-email-noamca@mellanox.com>
 <1495679660-9598-8-git-send-email-noamca@mellanox.com>
 <1495710620.5393.29.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR05MB1638FB06732440CAB09FC898AAFF0@DB5PR05MB1638.eurprd05.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Alexey Brodkin [mailto:Alexey.Brodkin at synopsys.com] 
>Sent: Thursday, May 25, 2017 14:10 PM
...
>> diff --git a/arch/arc/plat-eznps/mtm.c b/arch/arc/plat-eznps/mtm.c 
>> index aaaaffd..e0cb36b 100644
>> --- a/arch/arc/plat-eznps/mtm.c
>> +++ b/arch/arc/plat-eznps/mtm.c
>> @@ -119,8 +119,6 @@ void mtm_enable_core(unsigned int cpu)
>> ?	mt_ctrl.value = 0;
>> ?	mt_ctrl.hsen = 1;
>> ?	mt_ctrl.hs_cnt = MT_CTRL_HS_CNT;
>> -	mt_ctrl.sten = 1;
>> -	mt_ctrl.st_cnt = MT_CTRL_ST_CNT;

>Even though I don't know your architecture this change doesn't make enough sense to me in absence of better explanation of what is really done here.

>I.e. how removal of those 2 lines above improve your situation.
By removing 2 lines I am resorting to HW reset value where sten=0 i.e. feature is disabled.
I will rewrite the explanation

-Noam
