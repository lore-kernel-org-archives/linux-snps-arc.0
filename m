Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9D9C7EE2D
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 May 2023 19:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZouhDzHqFp6zs4L+G1FqGWPJ4ZWOO+T/Tm95o+Mtmw=; b=1Q2pKy1Ver5JlX
	kiwxyp1w53q8mk2Pzyf8t1zAoLkFKOT+zrriwRqcAWqzh0HRuTrfgUoKFtufVRY8Xz8Cr/OmP0Kxy
	KzZiCC2U/H58HTFiveouAx5EfPhiGt/MwsVTlusLxEcA0VAQstQzCz+rTT7Rw0VF/aFSwwP2S2q7/
	OjN27REu9fKipj9GAQOE0swNEZN9Bjb76vjgmJuMVVVmK7VlMgHvabDeKoXIlR3dmoBse/0ReEmOC
	WzsyXbL1q7YL6YhTXP1Now6yf7LyHrr2j+MOEBQaIeKkUaz+X4jX7pOR1BsTblzxuF4AErDi4FweW
	Snlt5ssZGbJ+JxiMfeeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptw5E-002V9I-29;
	Tue, 02 May 2023 19:54:44 +0000
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com ([2a02:2350:5:400::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptw5A-002V7V-1d
	for linux-snps-arc@lists.infradead.org;
	Tue, 02 May 2023 19:54:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=w8AYFc45O0NSET2uKXuZttSIHO5lI9T1X8bLU49ivoE=;
	b=kInIw482HDfm6bpoAz1sLMDMLP3rOIWNjuMerayf0RvX4o3BuEimQ3bxRyGbsxcPj19euojDP5y4e
	 Z/JS3LV4PcZPRg4llnFz7WOs7qYBOlWL9Qf1JOf7n6zwdAYH4X7tMXg/6lWf4i+0yy8oczAga7SZVc
	 BtQ/fUaOxi2SuFKuF3gv/SCPYAX4AKaifz3JHL7M4lvV31utXuXH890fO8n+9P8Ao0Mqy845bRh15e
	 aA3ka1TvnQRm1gh6VorcOUp9qudNzF86fqTll2cC6eRr7owW+f28KAr5tMS3vAtLDHf4hmoBC9ITSv
	 rzSnX266wUy3E2fdGJyKO9JjLxQLpkQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=w8AYFc45O0NSET2uKXuZttSIHO5lI9T1X8bLU49ivoE=;
	b=C1LvBG55q+HMla4pI7wcdYeyi9TR37VaVBIFhPId1l2slSful+bcYpB9k+shRarpk0DSh6j/kaMLO
	 A51lTJFCg==
X-HalOne-ID: 2612f7da-e923-11ed-94d1-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay1 (Halon) with ESMTPSA
	id 2612f7da-e923-11ed-94d1-99461c6a3fe8;
	Tue, 02 May 2023 19:54:30 +0000 (UTC)
Date: Tue, 2 May 2023 21:54:29 +0200
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
Subject: Re: [PATCH v3 4/6] fbdev: Include <linux/io.h> via <asm/fb.h>
Message-ID: <20230502195429.GA319489@ravnborg.org>
References: <20230502130223.14719-1-tzimmermann@suse.de>
 <20230502130223.14719-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230502130223.14719-5-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_125441_646510_4ED09FCB 
X-CRM114-Status: GOOD (  15.46  )
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

Hi Thomas,

On Tue, May 02, 2023 at 03:02:21PM +0200, Thomas Zimmermann wrote:
> Fbdev's main header file, <linux/fb.h>, includes <asm/io.h> to get
> declarations for I/O helper functions. From these declarations, it
> later defines framebuffer I/O helpers, such as fb_{read,write}[bwlq]()
> or fb_memset().
> 
> The framebuffer I/O helpers depend on the system architecture and
> will therefore be moved into <asm/fb.h>. Prepare this change by first
> adding an include statement for <linux/io.h> to <asm-generic/fb.h>.
> Include <asm/fb.h> in all source files that use the framebuffer I/O
> helpers, so that they still get the necessary I/O functions.
> 
...
> 
> diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
> index 60a96fdb5dd8..fd38e8a073b8 100644
> --- a/drivers/video/fbdev/arkfb.c
> +++ b/drivers/video/fbdev/arkfb.c
> @@ -27,6 +27,8 @@
>  #include <linux/console.h> /* Why should fb driver call console functions? because console_lock() */
>  #include <video/vga.h>
>  
> +#include <asm/fb.h>

When we have a header like linux/fb.h - it is my understanding that it is
preferred to include that file, and not the asm/fb.h variant.

This is assuming the linux/fb.h contains the generic stuff, and includes
asm/fb.h for the architecture specific parts.

So drivers will include linux/fb.h and then they automatically get the
architecture specific parts from asm/fb.h.

In other words, drivers are not supposed to include asm/fb.h, if
linux.fb.h exists - and linux/fb.h shall include the asm/fb.h.

If the above holds true, then it is wrong and not needed to add asm/fb.h
as seen above.


There are countless examples where the above are not followed,
but to my best understanding the above it the preferred way to do it.

	Sam

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
