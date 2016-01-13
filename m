From: noamc@ezchip.com (Noam Camus)
Date: Wed, 13 Jan 2016 01:58:38 +0000
Subject: for-next
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4E8480F@us01wembx1.internal.synopsys.com>
References: <HE1PR02MB138793412FB23A86E7E5AB51D6FE0@HE1PR02MB1387.eurprd02.prod.outlook.com>,
 <C2D7FE5348E1B147BCA15975FBA23075F4E8480F@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <HE1PR02MB1387F45D8AB1A8CEDFD64A81D6CB0@HE1PR02MB1387.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

1) I will fix my DT but the problem will remain, this panic is bad if we cannot see it on console.
If panic cannot be deferred, what about moving this check to later point in boot time, if this may not make sense consider to restore use of BUG()

2)
>From 628cdfb5182562461cebc5d6d66d45f708ba1881 Mon Sep 17 00:00:00 2001
From: Noam Camus <noamc@ezchip.com>
Date: Wed, 6 Jan 2016 13:59:08 +0200
Subject: [PATCH 1/1] ldk: linux: fix UAPI byte order

The decision was upon CONFIG_CPU_BIG_ENDIAN which is not
defined by user.

Use __BIG_ENDIAN__from CPP which is defined from toolchain itself.
Signed-off-by: Noam Camus <noamc at ezchip.com>
---
 .../arch/arc/include/uapi/asm/byteorder.h          |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arc/include/uapi/asm/byteorder.h b/arch/arc/include/uapi/asm/byteorder.h
index 9da71d4..ea5ca44 100644
--- a/arch/arc/include/uapi/asm/byteorder.h
+++ b/arch/arc/include/uapi/asm/byteorder.h
@@ -9,7 +9,7 @@
 #ifndef __ASM_ARC_BYTEORDER_H
 #define __ASM_ARC_BYTEORDER_H
 
-#ifdef CONFIG_CPU_BIG_ENDIAN
+#ifdef __BIG_ENDIAN__
 #include <linux/byteorder/big_endian.h>
 #else
 #include <linux/byteorder/little_endian.h>
-- 
1.7.1

3) I opened a ticket

Thanks

________________________________________
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Sent: Tuesday, January 12, 2016 12:41 PM
To: Noam Camus
Cc: Alexey Brodkin; arcml
Subject: Re: for-next

On Friday 01 January 2016 04:14 AM, Noam Camus wrote:
>
> Hi Vineet,
>
>
>  Few things I encountered lately:
>
>  1. Too early invisible panic due to link base not matching DT.
>

You need to fix the DT which u already did.
How do you propose to fix this anyways - show me a patch ?

>  1. uapi/asm/ headers which uses CONFIG_* which are not declared by user
>     application.
>

I agree that we can align it better for BE/LE. Can u send a patch ?

But this is not fool proof for other things. e.g. for 4K page the config items are
different. Alexey initially wanted to make uClibc options same which I turned down
since I don't want to keep a dependency on namespace. kernel developers shd be
free to do stuff w/o worrying about trickling name change in other projects. And
this is not because I'm mainly a kernel developer :-) It is just about software
engineering !

>  1. bus error from user space is not L2 at nSIM.
>

You need to create a nsim STAR for that !

-Vineet

> Let me know your opinion here.
>
> Happy new year
> Noam
>
>
