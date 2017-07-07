From: jh80.chung@samsung.com (Jaehoon Chung)
Date: Fri, 07 Jul 2017 17:25:04 +0900
Subject: [PATCH] arc: remove num-slots from arc platforms
In-Reply-To: <1499415208.11821.12.camel@synopsys.com>
References: <1499238645-29178-1-git-send-email-shawn.lin@rock-chips.com>
 <CGME20170707081336epcas5p159cc360125944d4f07cde68806da5fac@epcas5p1.samsung.com>
 <1499415208.11821.12.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <49811cd0-51b6-3041-236e-450d20ad25e7@samsung.com>
To: linux-snps-arc@lists.infradead.org

On 07/07/2017 05:13 PM, Alexey Brodkin wrote:
> Hi Shawn,
> 
> On Wed, 2017-07-05@15:10 +0800, Shawn Lin wrote:
>> dwmmc driver deprecated num-slots and plan to get rid
>> of it finally. Just move a step to cleanup it from DT.
>>
>> Cc: Jaehoon Chung <jh80.chung at samsung.com>
>> Signed-off-by: Shawn Lin <shawn.lin at rock-chips.com>
>> ---
> 
> Acked-by: Alexey Brodkin <abrodkin at synopsys.com>

Reviewed-by: Jaehoon Chung <jh80.chung at samsung.com>

Best Regards,
Jaehoon Chung

> 
> Probably it worth for Vineet to pull this patch to his ARC tree.
> 
> -Alexey
> 
