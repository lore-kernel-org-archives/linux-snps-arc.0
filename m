Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A652C7EE26
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 May 2023 20:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GqM2bxuECIz8kwipBQ6T9WwnevuMcRE6yv8ZKgrG5E=; b=xVRaoTwHDxZUiv
	3dsISw2pG2IYeNU5Wvwnh16XqDLPLGWCET7uxjULzYHMyR6ITiRXAeAKRQ4ZUUV2Y+iU94lMHGodR
	+UB16WDQIrIfQZx9fKQFSC+Pno3IuvWX/dMOMPsZ8h1ZP7KJGhFXE/9kx+vfqLI5gAoMX18eBmZ7E
	mQPBJovp+LJU16uiF2YMLsEp5gznrcTEQ0yY18ZHO/P1Yk47Y7FKKFdKdwD05+zEFaCBIjuNaHJOv
	MQt5s8uAXsyRl0GdItvGXMHm1hQbNpOzRHRXhSX/3mjnN2hJT5xW8JZeYGSYo+OohJ8ukoBS7PEhE
	TWY6Gx4BvkEfHvoKl3qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptwIR-002X55-0D;
	Tue, 02 May 2023 20:08:23 +0000
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com ([2a02:2350:5:403::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptwIN-002X2F-0f
	for linux-snps-arc@lists.infradead.org;
	Tue, 02 May 2023 20:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=7Cvc9t2uj+JoEAOf6QiHMtCJcRgtJ26CtzLE3dOVCX4=;
	b=DAJTs66FtfCQ420jLek75/3/XNBefU855ewUyaKmXxygVB6ZwaaX4BG60IJjSKwTrXzoHzbhc711S
	 zlp4kZr4AVZMkk0zrDEzy7AwKvjS2/gg0wnNG0W/6Cto4FTV5PtE5S4fDV657GDHfaQzB5Ya9TG/kV
	 016qrq5lr1THB0fUDBipjErF2RTfNeOJgg7A+ZHrJaIi4OqW5scOKWYMFFV4N2UMUU69v6W/Pr8BQs
	 NJZFnLxFZi/NWItgGcOv4voyhae1n2JoPlDwDZo2F51Gk2sc4H8BM9ikcvgRwc/nFF3aPAbXAJpFDE
	 mfmUAPNEjXGlbQD2yXDOnYBNY2Abkjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=7Cvc9t2uj+JoEAOf6QiHMtCJcRgtJ26CtzLE3dOVCX4=;
	b=BufBpesF4qmcj+3WAckz7l+cGAVlOpWomuRms3hnfY+4zICRqPq9RxbIV9afOQ/RW6dKCGaonFM0Q
	 kOp2kKxBA==
X-HalOne-ID: 10b6caa3-e925-11ed-9f58-592bb1efe9dc
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay4 (Halon) with ESMTPSA
	id 10b6caa3-e925-11ed-9f58-592bb1efe9dc;
	Tue, 02 May 2023 20:08:14 +0000 (UTC)
Date: Tue, 2 May 2023 22:08:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, geert@linux-m68k.org, javierm@redhat.com,
	daniel@ffwll.ch, vgupta@kernel.org, chenhuacai@kernel.org,
	kernel@xen0n.name, davem@davemloft.net,
	James.Bottomley@hansenpartnership.com, arnd@arndb.de,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-parisc@vger.kernel.org
Subject: Re: [PATCH v3 6/6] fbdev: Rename fb_mem*() helpers
Message-ID: <20230502200813.GC319489@ravnborg.org>
References: <20230502130223.14719-1-tzimmermann@suse.de>
 <20230502130223.14719-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230502130223.14719-7-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_130819_394444_A9331AC9 
X-CRM114-Status: GOOD (  11.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Thomas.

On Tue, May 02, 2023 at 03:02:23PM +0200, Thomas Zimmermann wrote:
> Update the names of the fb_mem*() helpers to be consistent with their
> regular counterparts. Hence, fb_memset() now becomes fb_memset_io(),
> fb_memcpy_fromfb() now becomes fb_memcpy_fromio() and fb_memcpy_tofb()
> becomes fb_memcpy_toio(). No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
...
>  
> -#ifndef fb_memcpy_fromfb
> -static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
> +#ifndef fb_memcpy_fromio
> +static inline void fb_memcpy_fromio(void *to, const volatile void __iomem *from, size_t n)
>  {
>  	memcpy_fromio(to, from, n);
>  }
> -#define fb_memcpy_fromfb fb_memcpy_fromfb
> +#define fb_memcpy_fromio fb_memcpy_fromio
>  #endif
>  
> -#ifndef fb_memcpy_tofb
> -static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
> +#ifndef fb_memcpy_toio
> +static inline void fb_memcpy_toio(volatile void __iomem *to, const void *from, size_t n)
>  {
>  	memcpy_toio(to, from, n);
>  }
> -#define fb_memcpy_tofb fb_memcpy_tofb
> +#define fb_memcpy_toio fb_memcpy_toio
>  #endif
>  
>  #ifndef fb_memset
> -static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
> +static inline void fb_memset_io(volatile void __iomem *addr, int c, size_t n)
>  {
>  	memset_io(addr, c, n);
>  }
> -#define fb_memset fb_memset
> +#define fb_memset fb_memset_io

The static inlines wrappers does not provide any value, and could be replaced by
direct calls to memcpy_fromio(), memcpy_toio(), memset_io().

If you decide to keep the wrappers I will not hold you back, so the
patch has my:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

But I prefer the direct calls without the wrappers....

	Sam

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
