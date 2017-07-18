From: shawn.lin@rock-chips.com (Shawn Lin)
Date: Tue, 18 Jul 2017 16:11:06 +0800
Subject: [PATCH] arc: remove num-slots from arc platforms
In-Reply-To: <52fb6208-713a-bbd6-3a19-d05df63b8fb6@synopsys.com>
References: <1499238645-29178-1-git-send-email-shawn.lin@rock-chips.com>
 <1499415208.11821.12.camel@synopsys.com>
 <52fb6208-713a-bbd6-3a19-d05df63b8fb6@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <fe08e41c-d7b8-c7b5-f2a9-e20e18e1e0e7@rock-chips.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On 2017/7/8 6:35, Vineet Gupta wrote:
> On 07/07/2017 01:13 AM, Alexey Brodkin wrote:
>> Hi Shawn,
>>
>> On Wed, 2017-07-05@15:10 +0800, Shawn Lin wrote:
>>> dwmmc driver deprecated num-slots and plan to get rid
>>> of it finally. Just move a step to cleanup it from DT.
>>>
>>> Cc: Jaehoon Chung <jh80.chung at samsung.com>
>>> Signed-off-by: Shawn Lin <shawn.lin at rock-chips.com>
>>> ---
>> Acked-by: Alexey Brodkin <abrodkin at synopsys.com>
>>
>> Probably it worth for Vineet to pull this patch to his ARC tree.
>>
>> -Alexey
> 
> I'd prefer it goes via the tree which changed the driver in first place !

So does it mean that you are okay for mmc maintainer to pick this up
with your and Alexey's ack?

> 
> BTW we do need this multi-slot support in driver for HSDK - NO ?
> 
> -Vineet
> 
> 
> 
