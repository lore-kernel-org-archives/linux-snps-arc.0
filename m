Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDADC77B75
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 May 2023 17:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rg3cSr06/9ZPlRAz0qS1ZXwqGbBE9y5YjU8P4VKtSUE=; b=m65CgBHGsHePNN
	uAGkK4EAxgt8MIsZiAHzi38iNVWfss5PgrTFHeWTqIjueEFgatQq/59GlKEEFt367Y2f8jIEMuHlU
	Jxg5NR4cRgX5BJrFAKV+9whuMVKRH+eNm+tbhpZ6eC/CAi/RuLM58kC3uk4qgub0NmCKyXg/w4SNI
	CTAdfb1yoQCNXgrYrQoKChrU4mTlG1z5wpeFoSIM6S+E8orDbU4HUVNlB93ck7fmp9mpX/v4ix0R1
	YnmcMnz5NKO72JOb0jEkDH8R39m2cek0OFT95n1bKazrp8ca/2tsM7JL6p2X5mHc8AyD+XoX2/TWx
	3wYUH9X+/ymtN2GK9oug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyyjL-006fA9-1z;
	Tue, 16 May 2023 17:44:59 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyyjI-006f86-0W;
	Tue, 16 May 2023 17:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1684259054; i=deller@gmx.de;
	bh=28Q2XTKI3jOrWHGJRY35mfdpvNOlP9oZTBSK7WL8Bjk=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=eXaGMvBKqACcsFqkTyYRfQM2481JQl71DzQiEIaVDzUVH1aDV1H4R33xqAwl3T9xg
	 WyGs2k/8xP0S2HR/CekXsMf6yLBmqry4QSYxr4BvpJva3Ks/s2ycdHnF+/EoAr+h6u
	 NIoYxuVUMWztf2AdYwAzRMjkS9hI8Pd8dMPpn7VuHOMlyOdCyXRmWCYoqqSUxHBvmw
	 evV8w3qjZaKNyexAvtHeNQIrjaAsxgulFEKp3nDKkDglGurFZX71jPAWLjfTwmgGYG
	 s4H5RwDK7jPGN43mnLsgqXe6Vt8DhM5WO+h9lRK2vxVHJEwQX4XP6bFslTwNi3OGd0
	 TeuNvCu0UJvAw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.150.20]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5mKP-1qDPOg4AKR-017Dz0; Tue, 16
 May 2023 19:44:14 +0200
Message-ID: <df527e53-3148-02f0-241b-fbc5e28b1618@gmx.de>
Date: Tue, 16 May 2023 19:44:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 1/7] fbdev/hitfb: Cast I/O offset to address
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, geert@linux-m68k.org,
 javierm@redhat.com, daniel@ffwll.ch, vgupta@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, davem@davemloft.net,
 James.Bottomley@HansenPartnership.com, arnd@arndb.de, sam@ravnborg.org,
 suijingfeng@loongson.cn
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Artur Rojek <contact@artur-rojek.eu>
References: <20230512102444.5438-1-tzimmermann@suse.de>
 <20230512102444.5438-2-tzimmermann@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230512102444.5438-2-tzimmermann@suse.de>
X-Provags-ID: V03:K1:rSOrO+0jt4O4RzM9l14Bz6wfGEKXucA0j3Waundj3xcBKFDFc52
 MmW0hsb8NLlq0rH9mMz/XUMz+PTuDsa6n+7OMeP7elMOy6xV14Nc64lHY1vMLN09t7CrUAU
 aro3xE6YuZBtr5yHHhTsC4g3TbNooxbmvDC+2u1zgRm2sKkzCxIS3lxPvtY+OC7z04Uhti5
 72FlfAhLCIiPZ2ZVXmmOQ==
UI-OutboundReport: notjunk:1;M01:P0:ecBgGlwkX5Y=;oQwXswBOboXoEMT5pniOW9e5zDy
 TDc0juyT2oeDOAYSymZ4Yve6mAwtAQYgC4JulDpsWI54/lpT/3D7R4HTWQBItkMqSmELB7Tfh
 k/xHSW5SHoW+vvUk5sL4+IR5vxCspl8eKgpH3nyPYnge684GFJK7ApwoTiF0bEeuMEPeE0f98
 5nKB5Ki2nXvssTP6YWZstlRi9vmm7UDfKmr6dJC7XQRSdL459sxpPqb6y5Py+VeOtrwRswQ9b
 mgX6Q416C2OMUv1g2qvDpI/CUwPMRZVR7PdDu0s1ziJFjAoZ4bpAU0a2Amuhqx8ipGBYPgxy9
 8K9IWqbt6vD0urHXico4zJpR6rXjjdvRQeMftW7c4y+Mn7o+Gzt+zxbKNHywWhVRr/GF+ybXC
 yB72kKK2MPCb8Ol4bxPSD2qxRs+u6yR+B5tS0PfJiS96Acllk7UA/0W8kS5K14nUpMPF1nBjW
 SgGVsJmvnSiuIjlbaZLisaUJpWXTZIYL9DjVqv50wqiLFUrTuaMcFH8IXzLv29VjHSZNEOpBo
 DUYeBfYKUtlMQjLEL/KhlDZ//O00ulUgDkRDV3l+HMC3KDxM4w1qVuyk9g6rR1gHVFvtRMw4B
 pKUdaCegbB6YWC3baOTepNotkyxry/FsXyBxefzaocIcXxJipYn7OyR61jwcy7DFoul70oAn1
 0a2ZvSp2XLUaT8vIUNhNrNECPa3NCDdrWfNByBWiFrW8o/WVtK5oM6zVT1IzOnAYuzrkDTjAD
 uoZnelK3f6VSOHLd7t16PWGRCXk7M6eV8Pew6pM1LwlLxJGYb0XchPIobzDo+3uuXqgw8k1x/
 qfxDOSuCv3W9gkj/I6aq7QqrnHkYz1J9yv4wny00fCDTmiez/GMrUxjchUPzeZj1hpyqCP4Kg
 AodCMcCoACTsxxNkm24VDBz4N08R7D9G25UWZxxPaXTBo0szFnbZxYJX0JCcEfySdyg7jco/x
 Rp2dTA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_104456_510481_D618A490 
X-CRM114-Status: GOOD (  29.78  )
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

On 5/12/23 12:24, Thomas Zimmermann wrote:
> Cast I/O offsets to pointers to use them with I/O functions. The I/O
> functions expect pointers of type 'volatile void __iomem *', but the
> offsets are plain integers. Build warnings are
>
>    ../drivers/video/fbdev/hitfb.c: In function 'hitfb_accel_wait':
>    ../arch/x86/include/asm/hd64461.h:18:33: warning: passing argument 1 of 'fb_readw' makes pointer from integer without a cast [-Wint-conversion]
>     18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
>        |                                 ^~~~~~~~~~~~~~~~~~~~~~
>        |                                 |
>        |                                 unsigned int
>    ../arch/x86/include/asm/hd64461.h:93:33: note: in expansion of macro 'HD64461_IO_OFFSET'
>     93 | #define HD64461_GRCFGR          HD64461_IO_OFFSET(0x1044)       /* Accelerator Configuration Register */
>        |                                 ^~~~~~~~~~~~~~~~~
>    ../drivers/video/fbdev/hitfb.c:47:25: note: in expansion of macro 'HD64461_GRCFGR'
>     47 |         while (fb_readw(HD64461_GRCFGR) & HD64461_GRCFGR_ACCSTATUS) ;
>        |                         ^~~~~~~~~~~~~~
>    In file included from ../arch/x86/include/asm/fb.h:15,
>    from ../include/linux/fb.h:19,
>    from ../drivers/video/fbdev/hitfb.c:22:
>    ../include/asm-generic/fb.h:52:57: note: expected 'const volatile void *' but argument is of type 'unsigned int'
>     52 | static inline u16 fb_readw(const volatile void __iomem *addr)
>        |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
>
> This patch only fixes the build warnings. It's not clear if the I/O
> offsets can legally be passed to the I/O helpers. It was apparently
> broken in 2007 when custom inw()/outw() helpers got removed by
> commit 34a780a0afeb ("sh: hp6xx pata_platform support."). Fixing the
> driver would require setting the I/O base address.

I think your patch is the best you can do for now... So...

Acked-by: Helge Deller <deller@gmx.de>

Thanks!
Helge


> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202305102136.eMjTSPwH-lkp@intel.com/
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Artur Rojek <contact@artur-rojek.eu>
> ---
>   drivers/video/fbdev/hitfb.c | 122 ++++++++++++++++++++----------------
>   1 file changed, 69 insertions(+), 53 deletions(-)
>
> diff --git a/drivers/video/fbdev/hitfb.c b/drivers/video/fbdev/hitfb.c
> index 3033f5056976..7737923b7a0a 100644
> --- a/drivers/video/fbdev/hitfb.c
> +++ b/drivers/video/fbdev/hitfb.c
> @@ -42,17 +42,33 @@ static struct fb_fix_screeninfo hitfb_fix = {
>   	.accel		= FB_ACCEL_NONE,
>   };
>
> +static volatile void __iomem *hitfb_offset_to_addr(unsigned int offset)
> +{
> +	return (__force volatile void __iomem *)(uintptr_t)offset;
> +}
> +
> +static u16 hitfb_readw(unsigned int offset)
> +{
> +	return fb_readw(hitfb_offset_to_addr(offset));
> +}
> +
> +static void hitfb_writew(u16 value, unsigned int offset)
> +{
> +	fb_writew(value, hitfb_offset_to_addr(offset));
> +}
> +
>   static inline void hitfb_accel_wait(void)
>   {
> -	while (fb_readw(HD64461_GRCFGR) & HD64461_GRCFGR_ACCSTATUS) ;
> +	while (hitfb_readw(HD64461_GRCFGR) & HD64461_GRCFGR_ACCSTATUS)
> +		;
>   }
>
>   static inline void hitfb_accel_start(int truecolor)
>   {
>   	if (truecolor) {
> -		fb_writew(6, HD64461_GRCFGR);
> +		hitfb_writew(6, HD64461_GRCFGR);
>   	} else {
> -		fb_writew(7, HD64461_GRCFGR);
> +		hitfb_writew(7, HD64461_GRCFGR);
>   	}
>   }
>
> @@ -63,11 +79,11 @@ static inline void hitfb_accel_set_dest(int truecolor, u16 dx, u16 dy,
>   	if (truecolor)
>   		saddr <<= 1;
>
> -	fb_writew(width-1, HD64461_BBTDWR);
> -	fb_writew(height-1, HD64461_BBTDHR);
> +	hitfb_writew(width-1, HD64461_BBTDWR);
> +	hitfb_writew(height-1, HD64461_BBTDHR);
>
> -	fb_writew(saddr & 0xffff, HD64461_BBTDSARL);
> -	fb_writew(saddr >> 16, HD64461_BBTDSARH);
> +	hitfb_writew(saddr & 0xffff, HD64461_BBTDSARL);
> +	hitfb_writew(saddr >> 16, HD64461_BBTDSARH);
>
>   }
>
> @@ -80,7 +96,7 @@ static inline void hitfb_accel_bitblt(int truecolor, u16 sx, u16 sy, u16 dx,
>
>   	height--;
>   	width--;
> -	fb_writew(rop, HD64461_BBTROPR);
> +	hitfb_writew(rop, HD64461_BBTROPR);
>   	if ((sy < dy) || ((sy == dy) && (sx <= dx))) {
>   		saddr = WIDTH * (sy + height) + sx + width;
>   		daddr = WIDTH * (dy + height) + dx + width;
> @@ -91,32 +107,32 @@ static inline void hitfb_accel_bitblt(int truecolor, u16 sx, u16 sy, u16 dx,
>   				maddr =
>   				    (((width >> 4) + 1) * (height + 1) - 1) * 2;
>
> -			fb_writew((1 << 5) | 1, HD64461_BBTMDR);
> +			hitfb_writew((1 << 5) | 1, HD64461_BBTMDR);
>   		} else
> -			fb_writew(1, HD64461_BBTMDR);
> +			hitfb_writew(1, HD64461_BBTMDR);
>   	} else {
>   		saddr = WIDTH * sy + sx;
>   		daddr = WIDTH * dy + dx;
>   		if (mask_addr) {
> -			fb_writew((1 << 5), HD64461_BBTMDR);
> +			hitfb_writew((1 << 5), HD64461_BBTMDR);
>   		} else {
> -			fb_writew(0, HD64461_BBTMDR);
> +			hitfb_writew(0, HD64461_BBTMDR);
>   		}
>   	}
>   	if (truecolor) {
>   		saddr <<= 1;
>   		daddr <<= 1;
>   	}
> -	fb_writew(width, HD64461_BBTDWR);
> -	fb_writew(height, HD64461_BBTDHR);
> -	fb_writew(saddr & 0xffff, HD64461_BBTSSARL);
> -	fb_writew(saddr >> 16, HD64461_BBTSSARH);
> -	fb_writew(daddr & 0xffff, HD64461_BBTDSARL);
> -	fb_writew(daddr >> 16, HD64461_BBTDSARH);
> +	hitfb_writew(width, HD64461_BBTDWR);
> +	hitfb_writew(height, HD64461_BBTDHR);
> +	hitfb_writew(saddr & 0xffff, HD64461_BBTSSARL);
> +	hitfb_writew(saddr >> 16, HD64461_BBTSSARH);
> +	hitfb_writew(daddr & 0xffff, HD64461_BBTDSARL);
> +	hitfb_writew(daddr >> 16, HD64461_BBTDSARH);
>   	if (mask_addr) {
>   		maddr += mask_addr;
> -		fb_writew(maddr & 0xffff, HD64461_BBTMARL);
> -		fb_writew(maddr >> 16, HD64461_BBTMARH);
> +		hitfb_writew(maddr & 0xffff, HD64461_BBTMARL);
> +		hitfb_writew(maddr >> 16, HD64461_BBTMARH);
>   	}
>   	hitfb_accel_start(truecolor);
>   }
> @@ -127,17 +143,17 @@ static void hitfb_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
>   		cfb_fillrect(p, rect);
>   	else {
>   		hitfb_accel_wait();
> -		fb_writew(0x00f0, HD64461_BBTROPR);
> -		fb_writew(16, HD64461_BBTMDR);
> +		hitfb_writew(0x00f0, HD64461_BBTROPR);
> +		hitfb_writew(16, HD64461_BBTMDR);
>
>   		if (p->var.bits_per_pixel == 16) {
> -			fb_writew(((u32 *) (p->pseudo_palette))[rect->color],
> +			hitfb_writew(((u32 *) (p->pseudo_palette))[rect->color],
>   				  HD64461_GRSCR);
>   			hitfb_accel_set_dest(1, rect->dx, rect->dy, rect->width,
>   					     rect->height);
>   			hitfb_accel_start(1);
>   		} else {
> -			fb_writew(rect->color, HD64461_GRSCR);
> +			hitfb_writew(rect->color, HD64461_GRSCR);
>   			hitfb_accel_set_dest(0, rect->dx, rect->dy, rect->width,
>   					     rect->height);
>   			hitfb_accel_start(0);
> @@ -162,7 +178,7 @@ static int hitfb_pan_display(struct fb_var_screeninfo *var,
>   	if (xoffset != 0)
>   		return -EINVAL;
>
> -	fb_writew((yoffset*info->fix.line_length)>>10, HD64461_LCDCBAR);
> +	hitfb_writew((yoffset*info->fix.line_length)>>10, HD64461_LCDCBAR);
>
>   	return 0;
>   }
> @@ -172,33 +188,33 @@ int hitfb_blank(int blank_mode, struct fb_info *info)
>   	unsigned short v;
>
>   	if (blank_mode) {
> -		v = fb_readw(HD64461_LDR1);
> +		v = hitfb_readw(HD64461_LDR1);
>   		v &= ~HD64461_LDR1_DON;
> -		fb_writew(v, HD64461_LDR1);
> +		hitfb_writew(v, HD64461_LDR1);
>
> -		v = fb_readw(HD64461_LCDCCR);
> +		v = hitfb_readw(HD64461_LCDCCR);
>   		v |= HD64461_LCDCCR_MOFF;
> -		fb_writew(v, HD64461_LCDCCR);
> +		hitfb_writew(v, HD64461_LCDCCR);
>
> -		v = fb_readw(HD64461_STBCR);
> +		v = hitfb_readw(HD64461_STBCR);
>   		v |= HD64461_STBCR_SLCDST;
> -		fb_writew(v, HD64461_STBCR);
> +		hitfb_writew(v, HD64461_STBCR);
>   	} else {
> -		v = fb_readw(HD64461_STBCR);
> +		v = hitfb_readw(HD64461_STBCR);
>   		v &= ~HD64461_STBCR_SLCDST;
> -		fb_writew(v, HD64461_STBCR);
> +		hitfb_writew(v, HD64461_STBCR);
>
> -		v = fb_readw(HD64461_LCDCCR);
> +		v = hitfb_readw(HD64461_LCDCCR);
>   		v &= ~(HD64461_LCDCCR_MOFF | HD64461_LCDCCR_STREQ);
> -		fb_writew(v, HD64461_LCDCCR);
> +		hitfb_writew(v, HD64461_LCDCCR);
>
>   		do {
> -		    v = fb_readw(HD64461_LCDCCR);
> +		    v = hitfb_readw(HD64461_LCDCCR);
>   		} while(v&HD64461_LCDCCR_STBACK);
>
> -		v = fb_readw(HD64461_LDR1);
> +		v = hitfb_readw(HD64461_LDR1);
>   		v |= HD64461_LDR1_DON;
> -		fb_writew(v, HD64461_LDR1);
> +		hitfb_writew(v, HD64461_LDR1);
>   	}
>   	return 0;
>   }
> @@ -211,10 +227,10 @@ static int hitfb_setcolreg(unsigned regno, unsigned red, unsigned green,
>
>   	switch (info->var.bits_per_pixel) {
>   	case 8:
> -		fb_writew(regno << 8, HD64461_CPTWAR);
> -		fb_writew(red >> 10, HD64461_CPTWDR);
> -		fb_writew(green >> 10, HD64461_CPTWDR);
> -		fb_writew(blue >> 10, HD64461_CPTWDR);
> +		hitfb_writew(regno << 8, HD64461_CPTWAR);
> +		hitfb_writew(red >> 10, HD64461_CPTWDR);
> +		hitfb_writew(green >> 10, HD64461_CPTWDR);
> +		hitfb_writew(blue >> 10, HD64461_CPTWDR);
>   		break;
>   	case 16:
>   		if (regno >= 16)
> @@ -302,11 +318,11 @@ static int hitfb_set_par(struct fb_info *info)
>   		break;
>   	}
>
> -	fb_writew(info->fix.line_length, HD64461_LCDCLOR);
> -	ldr3 = fb_readw(HD64461_LDR3);
> +	hitfb_writew(info->fix.line_length, HD64461_LCDCLOR);
> +	ldr3 = hitfb_readw(HD64461_LDR3);
>   	ldr3 &= ~15;
>   	ldr3 |= (info->var.bits_per_pixel == 8) ? 4 : 8;
> -	fb_writew(ldr3, HD64461_LDR3);
> +	hitfb_writew(ldr3, HD64461_LDR3);
>   	return 0;
>   }
>
> @@ -337,9 +353,9 @@ static int hitfb_probe(struct platform_device *dev)
>   	hitfb_fix.smem_start = HD64461_IO_OFFSET(0x02000000);
>   	hitfb_fix.smem_len = 512 * 1024;
>
> -	lcdclor = fb_readw(HD64461_LCDCLOR);
> -	ldvndr = fb_readw(HD64461_LDVNDR);
> -	ldr3 = fb_readw(HD64461_LDR3);
> +	lcdclor = hitfb_readw(HD64461_LCDCLOR);
> +	ldvndr = hitfb_readw(HD64461_LDVNDR);
> +	ldr3 = hitfb_readw(HD64461_LDR3);
>
>   	switch (ldr3 & 15) {
>   	default:
> @@ -429,9 +445,9 @@ static int hitfb_suspend(struct device *dev)
>   	u16 v;
>
>   	hitfb_blank(1,0);
> -	v = fb_readw(HD64461_STBCR);
> +	v = hitfb_readw(HD64461_STBCR);
>   	v |= HD64461_STBCR_SLCKE_IST;
> -	fb_writew(v, HD64461_STBCR);
> +	hitfb_writew(v, HD64461_STBCR);
>
>   	return 0;
>   }
> @@ -440,12 +456,12 @@ static int hitfb_resume(struct device *dev)
>   {
>   	u16 v;
>
> -	v = fb_readw(HD64461_STBCR);
> +	v = hitfb_readw(HD64461_STBCR);
>   	v &= ~HD64461_STBCR_SLCKE_OST;
>   	msleep(100);
> -	v = fb_readw(HD64461_STBCR);
> +	v = hitfb_readw(HD64461_STBCR);
>   	v &= ~HD64461_STBCR_SLCKE_IST;
> -	fb_writew(v, HD64461_STBCR);
> +	hitfb_writew(v, HD64461_STBCR);
>   	hitfb_blank(0,0);
>
>   	return 0;


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
