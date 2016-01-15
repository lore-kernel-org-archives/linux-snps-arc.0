From: nbd@openwrt.org (Felix Fietkau)
Date: Fri, 15 Jan 2016 13:59:02 +0100
Subject: [PATCH 2/2] arc770: move arc patches to taregt/linux/generic
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4E8518B@us01wembx1.internal.synopsys.com>
References: <1452813142-9857-1-git-send-email-abrodkin@synopsys.com>
 <1452813142-9857-3-git-send-email-abrodkin@synopsys.com>
 <5698CDBD.2010908@openwrt.org> <1452854954.18381.37.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E8518B@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5698ED16.1040107@openwrt.org>
To: linux-snps-arc@lists.infradead.org

On 2016-01-15 13:25, Vineet Gupta wrote:
> +CC Thomas, Peter
> 
> On Friday 15 January 2016 04:19 PM, Alexey Brodkin wrote:
>> Hi Felix,
>>
>> On Fri, 2016-01-15@11:45 +0100, Felix Fietkau wrote:
>>> On 2016-01-15 00:12, Alexey Brodkin wrote:
>>>> Given those patches are relevant to any ARC platform and even
>>>> ISA version it makes perfect sense for patches to exist
>>>> in one place instead of being duplicated for each new ARC-based ASIC.
>>>>
>>>> Note this is a prerequisite for upstreaming of ARC HS38 support in
>>>> OpenWRT.
>>>>
>>>> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
>>>> Cc: Felix Fietkau <nbd at openwrt.org>
>>>> Cc: Jo-Philipp Wich <jow at openwrt.org>
>>>> Cc: Jonas Gorski <jogo at openwrt.org>
>>>> --- /dev/null
>>>> +++ b/target/linux/generic/patches-4.4/331-arc-remove-dependency-on-DEVTMPFS.patch
>>>> @@ -0,0 +1,36 @@
>>>> +From adfbf9e6cad93281cffceab078e7f6f2a8e094f9 Mon Sep 17 00:00:00 2001
>>>> +From: Alexey Brodkin <abrodkin at synopsys.com>
>>>> +Date: Thu, 13 Aug 2015 01:56:02 +0300
>>>> +Subject: [PATCH 1/2] openwrt: arc - remove dependency on DEVTMPFS
>>>> +
>>>> +OpenWRT builds initramfs so that it doesn't require DEVTMPFS so dropping
>>>> +this dependency. 
> 
> Really ? AFAIKR (circa 2012) DEVTMPFS was *needed* for dynamic device nodes and
> that included the common case of initramfs NOT having static device nodes.
> 
> So back then I added the code in question to kernel Kconfig because initramfs was
> my primary workflow and occassionally I would fail to include DEVTMPFS causing
> userspace boot to go bonkers (FWIW I was using the buildroot trick of a pre-init
> script which would automount devtmpfs before exec'ing the real init)
> 
> Now arguably I can add DEVTMPFS to defconfigs, but then we don't need the kconfig
> dependency framework at all.
> 
> Another idea is to add DEVTMPFS unconditionally to Kconfig, but I fail to remember
> why I didn't do it at the time. Does anyone know if it interferes with real rootfs
> backed by real devices ?
OpenWrt works just fine without DEVTMPFS - doesn't matter if initramfs
is enabled or not. I also don't think there's anything architecture
specific about requiring DEVTMPFS or not, so I'd say it doesn't make any
sense to select it from arch/arc/Kconfig.

>>>> That helps to escape 2 separate kernel rebuilds with
>>>> +and without initramfs.
>>>> +
>>>> +2 builds happen because OpenWRT first builds kernel and later modules.
>>>> +When building entire kernel with simple "make" INITRAMFS sets to a real
>>>> +value and so was triggering DEVTMPFS selection. Then when building only
>>>> +modules with "make modules" command INITRAMFS is zeroed and so kernel
>>>> +config was changing that lead to full kernel rebuild.
> 
> Just curious, why does make module zero out INITRAMFS - to save a bit of build time ?
OpenWrt builds both initramfs and non-initramfs images, so it resets the
INITRAMFS config item when it generates the kernel config for the first
time.

- Felix
