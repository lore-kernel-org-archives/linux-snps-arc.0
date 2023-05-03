Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACF8C77B78
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 May 2023 19:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JtqRNt+itR4ANOk+hwU5widLRiLM35VoOWMO56BXPBs=; b=yq/tNCdFrkCw0c
	IZj9KQBX1IXf9GSxkGUjxWPoP22e5/522McImFnmDow/+0eB68qRIKJub0vu0W7bzBAuhu36i3Nso
	/Ve0bs+Lso8VQTCFDFHbNFwT24CtyRtcMuMKA0q52PO/ew1gRdLzidWxl2bUnhE9+P/ppkN+q05Gc
	Co1pjuBDWMU1ANaXDu2x6FbsP9ml+Gka8ko9OmQkpHtfa4ef5Wec8vVibkMZ1iK9nvZ0xwtXvj+QM
	bKaege6GUUKwLQ1DJaaSDwR1rNl6VYDewyTtJ7ebbtlvvVZbYtQ5B9oIFQ2jZGkRA23LnztlcjDm5
	UmZC8nbvZ4ri5L46f1OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puHo7-005XVI-1N;
	Wed, 03 May 2023 19:06:31 +0000
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com ([2a02:2350:5:402::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puHo2-005XSM-1W
	for linux-snps-arc@lists.infradead.org;
	Wed, 03 May 2023 19:06:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=WdyijgrhY4RTD1q08ndFDbdTcMhAA946cORCCTZmsdo=;
	b=gNsbDnuimH08qa10cbdLhym1IRrgRdP9AeDQNlOy+MDGfpEbFka6iHLaMl53BJLZ9ds0o+tb2McSK
	 umFvpOk/DQBiNLyNcdfFi+G7QPGueDnWCyi92LsYRkrKz08tjED2SvZo0z4jeOxUD2PPUuOifj2N0K
	 8uHgXDhcBex5pGBKPYq+6EFmdgSXjV5/AF7AzSAHaexKpK0gYptqQ5AiuJKB/RSVWTUx0MmGBla+c1
	 3XCQ1bchQnlI1pRtu0F7C4NDiY7uFhuYU2stFxHDcvsRqF/E8zNYFWRE3hdphxBm2IxdMxYpGmgYdM
	 IX5HrfOaCuHWc45u/ociK//KjVptQZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=WdyijgrhY4RTD1q08ndFDbdTcMhAA946cORCCTZmsdo=;
	b=BFeyD0DeTOJBCOL0z6ux7O7hUQiygYBxE0HwrzdugYwmBlQt32kD7CLH2TN/FY+HRiNUVv4M/2hmJ
	 GRBucEJCA==
X-HalOne-ID: 942bba87-e9e5-11ed-bfec-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay3 (Halon) with ESMTPSA
	id 942bba87-e9e5-11ed-bfec-b90637070a9d;
	Wed, 03 May 2023 19:06:19 +0000 (UTC)
Date: Wed, 3 May 2023 21:06:17 +0200
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
Message-ID: <20230503190617.GB422961@ravnborg.org>
References: <20230502130223.14719-1-tzimmermann@suse.de>
 <20230502130223.14719-7-tzimmermann@suse.de>
 <20230502200813.GC319489@ravnborg.org>
 <828664d0-3562-56cc-019d-1bb8a55826b5@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <828664d0-3562-56cc-019d-1bb8a55826b5@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_120626_659780_575CDAA9 
X-CRM114-Status: GOOD (  20.22  )
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

On Wed, May 03, 2023 at 10:15:46AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 02.05.23 um 22:08 schrieb Sam Ravnborg:
> > Hi Thomas.
> > 
> > On Tue, May 02, 2023 at 03:02:23PM +0200, Thomas Zimmermann wrote:
> > > Update the names of the fb_mem*() helpers to be consistent with their
> > > regular counterparts. Hence, fb_memset() now becomes fb_memset_io(),
> > > fb_memcpy_fromfb() now becomes fb_memcpy_fromio() and fb_memcpy_tofb()
> > > becomes fb_memcpy_toio(). No functional changes.
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > ---
> > ...
> > > -#ifndef fb_memcpy_fromfb
> > > -static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
> > > +#ifndef fb_memcpy_fromio
> > > +static inline void fb_memcpy_fromio(void *to, const volatile void __iomem *from, size_t n)
> > >   {
> > >   	memcpy_fromio(to, from, n);
> > >   }
> > > -#define fb_memcpy_fromfb fb_memcpy_fromfb
> > > +#define fb_memcpy_fromio fb_memcpy_fromio
> > >   #endif
> > > -#ifndef fb_memcpy_tofb
> > > -static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
> > > +#ifndef fb_memcpy_toio
> > > +static inline void fb_memcpy_toio(volatile void __iomem *to, const void *from, size_t n)
> > >   {
> > >   	memcpy_toio(to, from, n);
> > >   }
> > > -#define fb_memcpy_tofb fb_memcpy_tofb
> > > +#define fb_memcpy_toio fb_memcpy_toio
> > >   #endif
> > >   #ifndef fb_memset
> > > -static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
> > > +static inline void fb_memset_io(volatile void __iomem *addr, int c, size_t n)
> > >   {
> > >   	memset_io(addr, c, n);
> > >   }
> > > -#define fb_memset fb_memset
> > > +#define fb_memset fb_memset_io
> > 
> > The static inlines wrappers does not provide any value, and could be replaced by
> > direct calls to memcpy_fromio(), memcpy_toio(), memset_io().
> > 
> > If you decide to keep the wrappers I will not hold you back, so the
> > patch has my:
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > 
> > But I prefer the direct calls without the wrappers....
> 
> At first I was also skeptical if those fb_mem*() wrappers are needed. But
> Arnd mentioned that there are subtle differences between the current code
> and Linux' mem*_io() functions. Keeping the wrappers might be needed.
Saw the dialog, and agree that keeping current behaviour is the way to
go for now even if this is more code and wrappers.

	Sam

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
