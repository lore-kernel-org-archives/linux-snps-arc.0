Return-Path: <SRS0=RZv2=45=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B3CC10DCE
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Mar 2020 10:56:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2ACE20724
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Mar 2020 10:56:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qM++TYwq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="kjtDKke2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2ACE20724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+RISEnTUyM9V7j2XVsVKeeVYhZz3LaZQuL/f8gecq4=; b=qM++TYwqB9NYg9
	nrizyg6nfA8cKrxOZxJDDetY0blSZ8hykIPIyIS3jRPAO1GlKjGsnnHoMf4YJ1/Z8bwT+QV5bgVt/
	oeKZCZA9XJwwuXP9Yk3yqkDCpJIUxCVtgh9mdu9kd25BFhEm2AG73/uiZLS8M2XymT64FyJXWhB5r
	nrEEjr4YXh72ztqc5dcx4B15Sal2sWMZyxP8xcWZlc0SUM5hUkaLUPPt59xXPQlpE7U+KNJmMcmlx
	XG8fY88cCT8/wOV8apNILy2gCgVT+FdTBPNIividu8PuVxpWxSAyjV2NU2bVY2BEtv7F4JBQXLUGp
	ty35l3RGqejCI6x7hhlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCLVb-0003pL-1D; Thu, 12 Mar 2020 10:56:11 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2] helo=ozlabs.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCLVY-0003oH-0V
 for linux-snps-arc@lists.infradead.org; Thu, 12 Mar 2020 10:56:09 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48dQjL3pfwz9sPF;
 Thu, 12 Mar 2020 21:55:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584010558;
 bh=72/MkVf9VVMOXQXQBCEOJd5iIUWgKkmEQGqh1LToq2c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=kjtDKke2a24ahWnaI2Uj0G4Fe2Y+Jmmv/GYwuEOLFEW9uRKLJ/Eh8hY/uIvPOkWOq
 hSpbFhZ+nkMkq9HnJFD5n60KJODzNOkbfNQ2xKBvxmtGjcLFu/cP0AF6WyLXOSMULb
 6fFjUvKvb8/nZ+iPRU20W0VkcxW1QK6SeQvdds5ZfmEH3nf/wYggGS/dPu8fp0XU/0
 5piT2dBaqMVbWuvgxSVjBFiUYMtS2zI6exgAeql41Nme4eoBMZr+hItq7bW8gr3rM3
 jCRuhb1gAjdGh5ftRaRGO6Z5fFXzHCOWGuRXdE2RxOkjZdMiy8L8pyOPyQMC+hwaj9
 VAqGftLnfpYYg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Richard Henderson
 <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta
 <vgupta@synopsys.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich
 Felker <dalias@libc.org>, Dave Airlie <airlied@redhat.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs
 <bskeggs@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Jiri
 Slaby <jirislaby@gmail.com>, Nick Kossifidis <mickflemm@gmail.com>, Luis
 Chamberlain <mcgrof@kernel.org>, Kalle Valo <kvalo@codeaurora.org>, "David
 S. Miller" <davem@davemloft.net>, Dave Jiang <dave.jiang@intel.com>, Jon
 Mason <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Arnd Bergmann
 <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Andrew
 Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-ntb@googlegroups.com,
 virtualization@lists.linux-foundation.org, linux-arch@vger.kernel.org
Subject: Re: [RESEND PATCH v2 1/9] iomap: Constify ioreadX() iomem argument
 (as in generic implementation)
In-Reply-To: <20200219175007.13627-2-krzk@kernel.org>
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-2-krzk@kernel.org>
Date: Thu, 12 Mar 2020 21:55:44 +1100
Message-ID: <87ftedj0zz.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_035608_212257_389A56A5 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Krzysztof Kozlowski <krzk@kernel.org> writes:
> diff --git a/arch/powerpc/kernel/iomap.c b/arch/powerpc/kernel/iomap.c
> index 5ac84efc6ede..9fe4fb3b08aa 100644
> --- a/arch/powerpc/kernel/iomap.c
> +++ b/arch/powerpc/kernel/iomap.c
> @@ -15,23 +15,23 @@
>   * Here comes the ppc64 implementation of the IOMAP 
>   * interfaces.
>   */
> -unsigned int ioread8(void __iomem *addr)
> +unsigned int ioread8(const void __iomem *addr)
>  {
>  	return readb(addr);
>  }
> -unsigned int ioread16(void __iomem *addr)
> +unsigned int ioread16(const void __iomem *addr)
>  {
>  	return readw(addr);
>  }
> -unsigned int ioread16be(void __iomem *addr)
> +unsigned int ioread16be(const void __iomem *addr)
>  {
>  	return readw_be(addr);
>  }
> -unsigned int ioread32(void __iomem *addr)
> +unsigned int ioread32(const void __iomem *addr)
>  {
>  	return readl(addr);
>  }
> -unsigned int ioread32be(void __iomem *addr)
> +unsigned int ioread32be(const void __iomem *addr)
>  {
>  	return readl_be(addr);
>  }
> @@ -41,27 +41,27 @@ EXPORT_SYMBOL(ioread16be);
>  EXPORT_SYMBOL(ioread32);
>  EXPORT_SYMBOL(ioread32be);
>  #ifdef __powerpc64__
> -u64 ioread64(void __iomem *addr)
> +u64 ioread64(const void __iomem *addr)
>  {
>  	return readq(addr);
>  }
> -u64 ioread64_lo_hi(void __iomem *addr)
> +u64 ioread64_lo_hi(const void __iomem *addr)
>  {
>  	return readq(addr);
>  }
> -u64 ioread64_hi_lo(void __iomem *addr)
> +u64 ioread64_hi_lo(const void __iomem *addr)
>  {
>  	return readq(addr);
>  }
> -u64 ioread64be(void __iomem *addr)
> +u64 ioread64be(const void __iomem *addr)
>  {
>  	return readq_be(addr);
>  }
> -u64 ioread64be_lo_hi(void __iomem *addr)
> +u64 ioread64be_lo_hi(const void __iomem *addr)
>  {
>  	return readq_be(addr);
>  }
> -u64 ioread64be_hi_lo(void __iomem *addr)
> +u64 ioread64be_hi_lo(const void __iomem *addr)
>  {
>  	return readq_be(addr);
>  }
> @@ -139,15 +139,15 @@ EXPORT_SYMBOL(iowrite64be_hi_lo);
>   * FIXME! We could make these do EEH handling if we really
>   * wanted. Not clear if we do.
>   */
> -void ioread8_rep(void __iomem *addr, void *dst, unsigned long count)
> +void ioread8_rep(const void __iomem *addr, void *dst, unsigned long count)
>  {
>  	readsb(addr, dst, count);
>  }
> -void ioread16_rep(void __iomem *addr, void *dst, unsigned long count)
> +void ioread16_rep(const void __iomem *addr, void *dst, unsigned long count)
>  {
>  	readsw(addr, dst, count);
>  }
> -void ioread32_rep(void __iomem *addr, void *dst, unsigned long count)
> +void ioread32_rep(const void __iomem *addr, void *dst, unsigned long count)
>  {
>  	readsl(addr, dst, count);
>  }

This looks OK to me.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
