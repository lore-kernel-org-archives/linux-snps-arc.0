From: noamca@mellanox.com (Noam Camus)
Date: Tue, 22 Aug 2017 06:16:08 +0000
Subject: [PATCH v3 07/11] ARC: [plat-eznps] new command line argument for
 HW scheduler at MTM
In-Reply-To: <390c39c5-9188-ad39-a61b-b959e79a469a@synopsys.com>
References: <1497516241-16446-1-git-send-email-noamca@mellanox.com>
 <1497516241-16446-8-git-send-email-noamca@mellanox.com>
 <390c39c5-9188-ad39-a61b-b959e79a469a@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <AM5PR0502MB299613C7F53BA5E02F46A47DAA840@AM5PR0502MB2996.eurprd05.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Vineet Gupta [mailto:Vineet.Gupta1 at synopsys.com] 
>Sent: Monday, August 21, 2017 20:04 PM
....
>> +
>> +/* Handle an out of bounds mtm hs counter value */ static void __init 
>> +handle_mtm_hs_ctr_out_of_bounds_error(uint8_t val) {
>> +	pr_err("** The value must be in range [%d,%d] (inclusive)\n",
>> +		MT_HS_CNT_MIN, MT_HS_CNT_MAX);
>> +
>> +	mtm_hs_ctr = val;


>This error handling doesn't make sense to me - if the value is not in range, why bother setting it at all. I'll fix it up locally.
Just look what we provide handle_mtm_hs_ctr_out_of_bounds_error() as parameter and it will be sensible to you :)

Noam 
