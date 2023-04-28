Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3999AC77B61
	for <linux-snps-arc@archiver.kernel.org>; Fri, 28 Apr 2023 12:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AsupUt3fFGiansjnFFcwCl5BFCpLLxIOhEUlWPylhMg=; b=SsCi8p3ehKoLVo
	U3zeKmNNY/z/wNJpk3hoDSD/JnXOpWvaRrMR9B2/KPdOQRHw9v62BplQflu+qHNeVU6jhYZzSvjBV
	jP0HhZ7aJ1XbXwbqUsMzl89lXztCM+ouIhFQSMtZcrmMjJmsQuUGKsKW5bmswf0zXL8lJFREKK0Z/
	4MYjFX+CXJQTYCNXp24CH8I8P3OuimRekNaZc1z4or/5JSdXvLnDfikaAm5ktXjohjcGIxCTBN2I+
	PqfuHwGO3bFjVIiMS3kt5LhfmLxo1Z3ziGG9ZN/TWpvT8PGzX7J4qDvsPH2xs0ICWzIqNZbWfkdYQ
	kTcHXeArfcQG3El1Bj6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psN42-009hUs-2s;
	Fri, 28 Apr 2023 12:19:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psN3v-009hNS-0A;
	Fri, 28 Apr 2023 12:18:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C037CC14;
	Fri, 28 Apr 2023 05:19:35 -0700 (PDT)
Received: from [10.57.21.5] (unknown [10.57.21.5])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D12E73F5A1;
	Fri, 28 Apr 2023 05:18:47 -0700 (PDT)
Message-ID: <430c73f0-45f4-f81e-6506-bc8cc955d936@arm.com>
Date: Fri, 28 Apr 2023 13:18:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 5/5] fbdev: Define framebuffer I/O from Linux' I/O
 functions
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 geert@linux-m68k.org, javierm@redhat.com, daniel@ffwll.ch,
 vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 davem@davemloft.net, James.Bottomley@HansenPartnership.com, arnd@arndb.de,
 sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org
References: <20230428092711.406-1-tzimmermann@suse.de>
 <20230428092711.406-6-tzimmermann@suse.de>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230428092711.406-6-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_051855_207026_4895138D 
X-CRM114-Status: GOOD (  20.61  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2023-04-28 10:27, Thomas Zimmermann wrote:
> Implement framebuffer I/O helpers, such as fb_read*() and fb_write*()
> with Linux' regular I/O functions. Remove all ifdef cases for the
> various architectures.
> 
> Most of the supported architectures use __raw_() I/O functions or treat
> framebuffer memory like regular memory. This is also implemented by the
> architectures' I/O function, so we can use them instead.
> 
> Sparc uses SBus to connect to framebuffer devices. It provides respective
> implementations of the framebuffer I/O helpers. The involved sbus_()
> I/O helpers map to the same code as Sparc's regular I/O functions. As
> with other platforms, we can use those instead.
> 
> We leave a TODO item to replace all fb_() functions with their regular
> I/O counterparts throughout the fbdev drivers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   include/linux/fb.h | 63 +++++++++++-----------------------------------
>   1 file changed, 15 insertions(+), 48 deletions(-)
> 
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 08cb47da71f8..4aa9e90edd17 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -15,7 +15,6 @@
>   #include <linux/list.h>
>   #include <linux/backlight.h>
>   #include <linux/slab.h>
> -#include <asm/io.h>
>   
>   struct vm_area_struct;
>   struct fb_info;
> @@ -511,58 +510,26 @@ struct fb_info {
>    */
>   #define STUPID_ACCELF_TEXT_SHIT
>   
> -// This will go away
> -#if defined(__sparc__)
> -
> -/* We map all of our framebuffers such that big-endian accesses
> - * are what we want, so the following is sufficient.
> +/*
> + * TODO: Update fbdev drivers to call the I/O helpers directly and
> + *       remove the fb_() tokens.
>    */
> -
> -// This will go away
> -#define fb_readb sbus_readb
> -#define fb_readw sbus_readw
> -#define fb_readl sbus_readl
> -#define fb_readq sbus_readq
> -#define fb_writeb sbus_writeb
> -#define fb_writew sbus_writew
> -#define fb_writel sbus_writel
> -#define fb_writeq sbus_writeq
> -#define fb_memset sbus_memset_io
> -#define fb_memcpy_fromfb sbus_memcpy_fromio
> -#define fb_memcpy_tofb sbus_memcpy_toio
> -
> -#elif defined(__i386__) || defined(__alpha__) || defined(__x86_64__) ||	\
> -	defined(__hppa__) || defined(__sh__) || defined(__powerpc__) ||	\
> -	defined(__arm__) || defined(__aarch64__) || defined(__mips__)
> -
> -#define fb_readb __raw_readb
> -#define fb_readw __raw_readw
> -#define fb_readl __raw_readl
> -#define fb_readq __raw_readq
> -#define fb_writeb __raw_writeb
> -#define fb_writew __raw_writew
> -#define fb_writel __raw_writel
> -#define fb_writeq __raw_writeq

Note that on at least some architectures, the __raw variants are 
native-endian, whereas the regular accessors are explicitly 
little-endian, so there is a slight risk of inadvertently changing 
behaviour on big-endian systems (MIPS most likely, but a few old ARM 
platforms run BE as well).

> +#define fb_readb readb
> +#define fb_readw readw
> +#define fb_readl readl
> +#if defined(CONFIG_64BIT)
> +#define fb_readq readq
> +#endif

You probably don't need to bother making these conditional - 32-bit 
architectures aren't forbidden from providing readq/writeq if they 
really want to, and drivers can also use the io-64-nonatomic headers for 
portability. The build will still fail in a sufficiently obvious manner 
if neither is true.

Thanks,
Robin.

> +#define fb_writeb writeb
> +#define fb_writew writew
> +#define fb_writel writel
> +#if defined(CONFIG_64BIT)
> +#define fb_writeq writeq
> +#endif
>   #define fb_memset memset_io
>   #define fb_memcpy_fromfb memcpy_fromio
>   #define fb_memcpy_tofb memcpy_toio
>   
> -#else
> -
> -#define fb_readb(addr) (*(volatile u8 *) (addr))
> -#define fb_readw(addr) (*(volatile u16 *) (addr))
> -#define fb_readl(addr) (*(volatile u32 *) (addr))
> -#define fb_readq(addr) (*(volatile u64 *) (addr))
> -#define fb_writeb(b,addr) (*(volatile u8 *) (addr) = (b))
> -#define fb_writew(b,addr) (*(volatile u16 *) (addr) = (b))
> -#define fb_writel(b,addr) (*(volatile u32 *) (addr) = (b))
> -#define fb_writeq(b,addr) (*(volatile u64 *) (addr) = (b))
> -#define fb_memset memset
> -#define fb_memcpy_fromfb memcpy
> -#define fb_memcpy_tofb memcpy
> -
> -#endif
> -
>   #define FB_LEFT_POS(p, bpp)          (fb_be_math(p) ? (32 - (bpp)) : 0)
>   #define FB_SHIFT_HIGH(p, val, bits)  (fb_be_math(p) ? (val) >> (bits) : \
>   						      (val) << (bits))

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
