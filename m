From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 15 Jan 2016 13:17:47 +0000
Subject: [PATCH 2/2] arc770: move arc patches to taregt/linux/generic
References: <1452813142-9857-1-git-send-email-abrodkin@synopsys.com>
 <1452813142-9857-3-git-send-email-abrodkin@synopsys.com>
 <5698CDBD.2010908@openwrt.org> <1452854954.18381.37.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E8518B@us01wembx1.internal.synopsys.com>
 <5698ED16.1040107@openwrt.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E851F3@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Friday 15 January 2016 06:29 PM, Felix Fietkau wrote:
>>>>> +Subject: [PATCH 1/2] openwrt: arc - remove dependency on DEVTMPFS
>>>>> >>>> +
>>>>> >>>> +OpenWRT builds initramfs so that it doesn't require DEVTMPFS so dropping
>>>>> >>>> +this dependency. 
>> > 
>> > Really ? AFAIKR (circa 2012) DEVTMPFS was *needed* for dynamic device nodes and
>> > that included the common case of initramfs NOT having static device nodes.
>> > 
>> > So back then I added the code in question to kernel Kconfig because initramfs was
>> > my primary workflow and occassionally I would fail to include DEVTMPFS causing
>> > userspace boot to go bonkers (FWIW I was using the buildroot trick of a pre-init
>> > script which would automount devtmpfs before exec'ing the real init)
>> > 
>> > Now arguably I can add DEVTMPFS to defconfigs, but then we don't need the kconfig
>> > dependency framework at all.
>> > 
>> > Another idea is to add DEVTMPFS unconditionally to Kconfig, but I fail to remember
>> > why I didn't do it at the time. Does anyone know if it interferes with real rootfs
>> > backed by real devices ?
> OpenWrt works just fine without DEVTMPFS - doesn't matter if initramfs
> is enabled or not.

The discussion is about adding a patch to up upstream ARC kernel, not specific to
openwrt.
BTW if openwrt builds for initramfs, it has to enable DEVTMPFS under the hood.
Perhaps there are dependencies in openwrt build system which take care of that
already - o/w it just won't work (assuming dynamic dev nodes).

>  I also don't think there's anything architecture
> specific about requiring DEVTMPFS or not, so I'd say it doesn't make any
> sense to select it from arch/arc/Kconfig.

You are indeed right - Kconfig is not the "ideal" place to add this (it's not like
we support PCI or not) and it best belongs to *defconfigs.

-Vineet
