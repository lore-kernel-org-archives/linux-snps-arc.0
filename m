From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 23 Aug 2016 10:14:52 -0700
Subject: [PATCH] DW: Read "is_memcpy" and "is_nollp" property from device
 tree.
In-Reply-To: <1471971704.4887.247.camel@linux.intel.com>
References: <1471347080-1411-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1471617566.4887.184.camel@linux.intel.com>
 <1471965258.1562.15.camel@synopsys.com>
 <1471971704.4887.247.camel@linux.intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <15b77367-2f95-deb2-a4dc-c47730bdb939@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/23/2016 10:02 AM, Andy Shevchenko wrote:
> On Tue, 2016-08-23@15:14 +0000, Eugeniy Paltsev wrote:
>
>> DW DMAC on ARC SDP became broken after df5c7386 ("dmaengine: dw:
>>>> some Intel devices has no memcpy support") and 30cb2639
>>>> ("dmaengine: dw: don't override platform data with autocfg")
>>>> commits.
>>> I'm not sure that word 'broken' is a correct one here. Is the
>>> platform
>>> code using this driver in the upstream already? If so, where is it
>>> located?
>>>
>> I'm not sure is it, but, at least, it changed driver behavior for ARC
>> SDP boards.
> The rule of common sense here: if it was never upstreamed it has never
> been broken.

Right !

> I hardly remember any user of DW DMAC by ARC architecture in upstream.

The ARC SDP platform is provided by arch/arc/plat-axs and arch/arc/boot/ax*
The IP Proto-typing kit folks here would just add a DT binding in there and things
would just work out of the box - and that stopped recently - hence the notion of
broken. But I agree one can't fix what can't be seen as broken. I just intervened
to make this comment - I'm sure you and Eugeniy can agree on a workable solution.

Thx,
-Vineet
