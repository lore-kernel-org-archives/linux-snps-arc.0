From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 29 Nov 2018 19:33:22 +0000
Subject: [PATCH] ARC: change defconfig defaults to ARCv2
References: <20181127222045.18491-1-khilman@baylibre.com>
 <C2D7FE5348E1B147BCA15975FBA230750146419633@US01WEMBX2.internal.synopsys.com>
 <7h36rjae1i.fsf@baylibre.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA230750146419E64@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/29/18 11:18 AM, Kevin Hilman wrote:
> Hi Vineet,
>
> Vineet Gupta <vineet.gupta1 at synopsys.com> writes:
>
>> On 11/27/18 2:21 PM, Kevin Hilman wrote:
>>> Change the default defconfig (used with 'make defconfig') to the ARCv2
>>> nsim_hs_defconfig, and also switch the default Kconfig ISA selection to
>>> ARCv2.
>>>
>>> This allows several default defconfigs (e.g. make defconfig, make
>>> allnoconfig, make tinyconfig) to all work with ARCv2 by default.
>>>
>>> Signed-off-by: Kevin Hilman <khilman at baylibre.com>
>> Applied to for-curr
> If it's not too late, could you tag this for stable?
>
> Even though this is not technicall a regression, Greg said (in a
> different thread) he'd be willing to accept this for stable if it fixes
> the builders like kernelCI.

Sure thing. But this change actually causes regression in our in-house testing for
the arc700 defconfigs which falter due to missing CONFIG_ISA_ARCOMPACT which was
the default before. Alexey found this and will post a fixup whcih I plan to squash
into ur patch to keep bisectability (and allow trivial stable backports) and then
regen the relevant defconfigs.

-Vineet
