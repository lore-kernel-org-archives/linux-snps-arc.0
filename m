From: noamca@mellanox.com (Noam Camus)
Date: Thu, 25 May 2017 11:12:33 +0000
Subject: [PATCH 06/10] ARC: [plat-eznps] Fix TLB Errata
In-Reply-To: <1495710058.5393.23.camel@synopsys.com>
References: <1495679660-9598-1-git-send-email-noamca@mellanox.com>
 <1495679660-9598-7-git-send-email-noamca@mellanox.com>
 <1495710058.5393.23.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR05MB1638EAAC31FC44FA9CB40E4CAAFF0@DB5PR05MB1638.eurprd05.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Alexey Brodkin [mailto:Alexey.Brodkin at synopsys.com] 
>Sent: Thursday, May 25, 2017 14:01 PM

...
>> ?	/* Get free TLB slot: Set = computed from vaddr, way = random */
>> ?	sr??TLBGetIndex, [ARC_REG_TLBCOMMAND]
>> ?
>> @@ -287,6 +294,9 @@ ex_saved_reg1:
>> ?#else
>> ?	sr TLBInsertEntry, [ARC_REG_TLBCOMMAND]
>> ?#endif
>> +#ifdef CONFIG_EZNPS_MTM_EXT
>> +88:
>> +#endif

>Not sure if label itself required wrapping in ifdefs. It just makes code bulkier and harder to read.
I will remove the wrapping.

-Noam
