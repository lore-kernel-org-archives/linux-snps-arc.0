From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 7 Apr 2016 14:52:33 +0530
Subject: [PATCH v6 2/3] clocksource: Add NPS400 timers driver
In-Reply-To: <56FA8172.5020008@linaro.org>
References: <1458570272-23037-1-git-send-email-noamca@mellanox.com>
 <1458570272-23037-3-git-send-email-noamca@mellanox.com>
 <56FA7A77.6080901@synopsys.com> <56FA8172.5020008@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <570626D9.4050809@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tuesday 29 March 2016 06:51 PM, Daniel Lezcano wrote:
> On 03/29/2016 02:52 PM, Vineet Gupta wrote:
>> On Monday 21 March 2016 07:54 PM, Noam Camus wrote:
>>> From: Noam Camus <noamc at ezchip.com>
>>>
>>> Add internal tick generator which is shared by all cores.
>>> Each cluster of cores view it through dedicated address.
>>> This is used for SMP system where all CPUs synced by same
>>> clock source.
>>>
>>> Signed-off-by: Noam Camus <noamc at ezchip.com>
>>> Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
>>> Cc: Rob Herring <robh+dt at kernel.org>
>>> Cc: Thomas Gleixner <tglx at linutronix.de>
>>> Cc: John Stultz <john.stultz at linaro.org>
>>> Acked-by: Vineet Gupta <vgupta at synopsys.com>
>>
>> @Noam, AFAIKR, Daniel did ack the prev version - can you please double check and
>> repost this again.
>>
>> @Daniel, this patch depends on a include/soc header introduced by patch 1/3 of the
>> series. For 4.7, how should we merge it - take both via ARC tree !
> 
> There are two ways to do this when there are multiple tree dependencies:
>   - put a common branch to be shared between trees
>   - ask for the maintainer for an acked-by and pick it in a single tree
> 
> Given the nature of the patch (initial submission), I agree you pick it through
> your tree.

BTW, you'd acked the v4 of this patch - can you take a quick look and provide your
ACK for v8 2/3, ditto for 1/3 which introduces the common soc header.

Quick link to v8 is:
http://lists.infradead.org/pipermail/linux-snps-arc/2016-April/000830.html

Thx,
-Vineet
