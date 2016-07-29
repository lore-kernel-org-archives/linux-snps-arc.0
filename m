From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 29 Jul 2016 15:46:30 -0700
Subject: Build failure in linux mainline when building arcv2 images
In-Reply-To: <20160729214854.GA21977@roeck-us.net>
References: <579ACC26.9020106@roeck-us.net>
 <25e43ee1-5015-9dc3-777e-6101872f2ec4@synopsys.com>
 <579B5D79.8060907@roeck-us.net>
 <66774d12-285a-438f-c050-fba65601bd3c@synopsys.com>
 <20160729214854.GA21977@roeck-us.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1cc37edf-d48e-9b98-1bb6-f20e319cf12b@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 07/29/2016 02:48 PM, Guenter Roeck wrote:
>>>> Yeah there's a 4.8.5 based one (referred to as GNU 2016.03) - will prebuilt
>>>> toolchain suffice or would you prefer building on your own. Prebuilt could be
>>>> found below.
>>>>
>>>> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2016.03
>>>>
>>>>
>>>> For building on your own, Alexey can point to upstream buildroot which enabled
>>>> 2016.03 tools.
>>>>
>>>
>>> Unfortunately, I get the same error when using "arc-linux-gcc.br_real (Buildroot
>>> 2016.05) 4.8.5".
>>
>> Weird - I don't see this when building mainline of now using prebuilt 2016.03
>> tools on github . I'm building axs103_smp_defconfig.
>>
> What exactly is prebuilt 2016.03 based on ? 

GNU 2016.03 based tools - but not built with BR, but with our internal scripts
(toolchain repo on github) - although it doesn't really matter,

> The arc tree on github only has an
> arc-2016.02 branch. I tried it, but it reports the same error. I also tried
> abrodkin-arc-2016.03, but it doesn't build for me.

I think github buildroot repo for ARC is kind of stale - Alexey would know more.

>> What exact buildroot commit did u use to build your tools BTW - I can try and
>> replicate that here !
>>
> I used buildroot 2016.05.

So I'm looking at upstream buildroot but something is weird is happening - friday
woes maybe.

What you want is
2016-05-19 09439560b9f9 toolchain: bump ARC tools to arc-2016.03 release

which seems to be present in released 2016.05, but when I checkout 2016.05 tag (or
aa6fd11feebff) that patch is not there !

Sorry we would have to defer this to next week or when Alexey takes a look.

-Vineet
