From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 29 Jan 2019 17:15:16 +0000
Subject: [PATCH 1/2] ARCv2: Enable unaligned access in early ASM code
References: <20190116112951.10641-1-Eugeniy.Paltsev@synopsys.com>
 <4881796E12491D4BB15146FE0209CE64681CEB03@DE02WEMBXB.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014642D3FD@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 1/28/19 11:27 PM, Alexey Brodkin wrote:
> Hi Vineet,
>
>> -----Original Message-----
>> From: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
>> Sent: Wednesday, January 16, 2019 2:30 PM
>> To: linux-snps-arc at lists.infradead.org; Vineet Gupta <vgupta at synopsys.com>
>> Cc: linux-kernel at vger.kernel.org; Alexey Brodkin <abrodkin at synopsys.com>; Eugeniy Paltsev
>> <Eugeniy.Paltsev at synopsys.com>
>> Subject: [PATCH 1/2] ARCv2: Enable unaligned access in early ASM code
>>
>> Even though we do enable AD bit in arc_init_IRQ() we need to do
>> it in early ASM code otherwise we may face unaligned data until
>> we reach arc_init_IRQ() because GCC starting from v8.1.0 actively
>> generates unaligned data as it assumes that:
>>  * ARCv2 always has support of unaliged data
>>  * This support is turned on in runtime
>>
>> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> I remember you wanted to have a Kconfig toggle for unaligned access support
> but since this commit is more of a fix for existing (always enabling)
> implementation and so I propose to accept is as it is and moreover backport
> to stable kernels.
>
> And in the separate change introduce discussed Kconfig toggle so we may test
> RTL with unaligned support disabled.
>
> Sounds good?

Fair enough. And to avoid backport merge conflicts we need to keep the redundant
AD bit setting in intc-arcv2.c and rework in Eugeniy's series.

-Vineet
