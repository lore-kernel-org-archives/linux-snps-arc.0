From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 7 Nov 2017 08:49:28 -0800
Subject: [PATCH] ARCv2: Accomodate NS48 MMUv5 by releaxing MMU ver checking
In-Reply-To: <1510068782.8417.10.camel@synopsys.com>
References: <1509996651-7174-1-git-send-email-vgupta@synopsys.com>
 <1510068782.8417.10.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <956fb604-8695-c475-0507-a582c3671b26@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/07/2017 07:33 AM, Alexey Brodkin wrote:
> Hi Vineet,
>
> Subject contains one typo: NS48 -> HS48.
>
> On Mon, 2017-11-06@11:30 -0800, Vineet Gupta wrote:
>> HS48 cpus will have a new MMUv5, although Linux is currently not
>> explicitly supporting the newer features (so remains at V4).
>> The existing software/hardware version check is very tight and causes
>> boot abort. Given that the MMUv5 hardware is backwards compatible,
>> relax the boot check to allow current kernel support level to work
>> with new hardware.
> I don't terribly like this approach with assuming all ARCv2 MMUs are
> backward-compatible. This time v5 is indeed backward compatible with
> v4 from our stand-point. But what if v6 becomes non-compatible to
> both v4 and v6?

The guiding principle for new cores is that we will try to keep things compatible. 
There's no MMUv6 spec'ed yet - so we can't speak for it already.

> That said I'd prefer to add each particular MMU version explicitly like
> we used to do previously.

But most of the v5 features don't apply to Linux - so what support in software 
will you actually add. There's no point bumbing kconfig to V5 and pretneding we 
support a v5 feature when there's none we are supporting.

> Your intention to make built today binaries future-proof is understood but
> again if following MMUs become non-compatible we'll need to rewrite this code
> again.

It is not so much about future proofing - but just supporting the new hardware 
with sufficient changes.
If MMUs become non compatible then we come up with a comaptibility matrix or some 
such - although I'm hoping we won't.

> One better option would be more precise encoding of MMU version in hardware
> such that based on combination of features we may decide if we may handle it.

That's already done today in the MMU Build config register. It's just that the new 
features don't really apply to Linux per se - not right away atleast.

-Vineet
