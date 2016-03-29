From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Tue, 29 Mar 2016 15:21:54 +0200
Subject: [PATCH v6 2/3] clocksource: Add NPS400 timers driver
In-Reply-To: <56FA7A77.6080901@synopsys.com>
References: <1458570272-23037-1-git-send-email-noamca@mellanox.com>
 <1458570272-23037-3-git-send-email-noamca@mellanox.com>
 <56FA7A77.6080901@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56FA8172.5020008@linaro.org>
To: linux-snps-arc@lists.infradead.org

On 03/29/2016 02:52 PM, Vineet Gupta wrote:
> On Monday 21 March 2016 07:54 PM, Noam Camus wrote:
>> From: Noam Camus <noamc at ezchip.com>
>>
>> Add internal tick generator which is shared by all cores.
>> Each cluster of cores view it through dedicated address.
>> This is used for SMP system where all CPUs synced by same
>> clock source.
>>
>> Signed-off-by: Noam Camus <noamc at ezchip.com>
>> Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
>> Cc: Rob Herring <robh+dt at kernel.org>
>> Cc: Thomas Gleixner <tglx at linutronix.de>
>> Cc: John Stultz <john.stultz at linaro.org>
>> Acked-by: Vineet Gupta <vgupta at synopsys.com>
>
> @Noam, AFAIKR, Daniel did ack the prev version - can you please double check and
> repost this again.
>
> @Daniel, this patch depends on a include/soc header introduced by patch 1/3 of the
> series. For 4.7, how should we merge it - take both via ARC tree !

There are two ways to do this when there are multiple tree dependencies:
   - put a common branch to be shared between trees
   - ask for the maintainer for an acked-by and pick it in a single tree

Given the nature of the patch (initial submission), I agree you pick it 
through your tree.

   -- Daniel

-- 
  <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
