Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2ADC77B60
	for <linux-snps-arc@archiver.kernel.org>; Fri, 28 Apr 2023 13:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bLDZnCRI1wwyektZoZDRLZEmRCp2uVp0Ds8m6il2h5M=; b=wSO/XO4XjUrPuZ
	3UdUEmjAFgHpft34mcUJISuqwcxk1Hilr2kpaUs9Z5lqKMUkJb31tJoWsavRjv2qGoS8vviunmaP3
	Nbs44qigmnl+uy+TQw4cELMIY5N+U92bhW4cM1kRvfny/F9lW4udmEWTHVTDLHR2IaleYxgl4H1jP
	8UO1SfnOhrYjACQihR8nUODHisQTStILudBsG4DXc+qTnl+NdHDKLiuGfVro5VHJ5l3O3B3MFxskD
	asl/9JBvE0EF+s2uU9pKMSp0bsQXKOL0d8XcbgTcFSmTXJpUOUk/L2iG5w0lzkLz05xBiNt16KQhL
	Y++VXGX4BX0iTUJ5QxRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psNoe-00ACH1-36;
	Fri, 28 Apr 2023 13:07:12 +0000
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com ([2a02:2350:5:401::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psNob-00ACBA-1f
	for linux-snps-arc@lists.infradead.org;
	Fri, 28 Apr 2023 13:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=m4sJ+fThLhFeWg7X6kLvwa3/DCsUq6Addkr6Ox/63p0=;
	b=bIWcbnCVTMxSTG2/SQkpkiauTRzdjLlitM8+y6JLCZq45eKjII3dhIT9CX/k6z3u48vGxGMScqx9G
	 n5WQVZPQD0rNLUlKVdnlAOEvwqZ1sY8/bjLQ4/AuTeSVglaIYAjpG8D201DeL/wpaoJREkGbHO6fJ4
	 alPDaPVFLLrpGalDRW2MOeDlKD92IsU2Fck6fN4uSatZvzNk1k/kA5Hb8QlXIcz94LDN0CPkMu8YEt
	 hRyeUJJqTKB7xhgnQfl1I0N/pQWQw22WdPWLnymZNB3FBOSYNYaC/7+XDT/spP+i3I7/VmeYNmjE/i
	 PPJfosYGRWa3MwoQwx/hnbJhWvQRNEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=m4sJ+fThLhFeWg7X6kLvwa3/DCsUq6Addkr6Ox/63p0=;
	b=qNBtiTicBN3wXCrqOwcNqd0yQGLKWp9PsyJHm2ixxR+jqNPJfF+zvhggJjKoBx35Pnw1WhT1mEY5q
	 gcEohH4AA==
X-HalOne-ID: 904541fb-e5c5-11ed-95bb-13111ccb208d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay2 (Halon) with ESMTPSA
	id 904541fb-e5c5-11ed-95bb-13111ccb208d;
	Fri, 28 Apr 2023 13:07:04 +0000 (UTC)
Date: Fri, 28 Apr 2023 15:07:02 +0200
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
Subject: Re: [PATCH v2 4/5] fbdev: Include <linux/io.h> in drivers
Message-ID: <20230428130702.GD3995435@ravnborg.org>
References: <20230428092711.406-1-tzimmermann@suse.de>
 <20230428092711.406-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230428092711.406-5-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_060709_705082_FEC2B726 
X-CRM114-Status: GOOD (  12.70  )
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

On Fri, Apr 28, 2023 at 11:27:10AM +0200, Thomas Zimmermann wrote:
> Fbdev's main header file, <linux/fb.h>, includes <asm/io.h> to get
> declarations of I/O helper functions. From these declaratons, it later
> defines framebuffer I/O helpers, such as fb_{read,write}[bwlq]() or
> fb_memset().
> 
> The framebuffer I/O helpers pre-date Linux' current I/O code and will
> be replaced by regular I/O helpers. Prepare this change by adding an
> include statement for <linux/io.h> to all source files that use the
> framebuffer I/O helpers. They will still get declarations of the I/O
> functions even after <linux/fb.h> has been cleaned up.
When fb.h uses a symbol from io.h, then it shall include that
file so it is self contained.
So it is wrong to push the io.h include to the users of
fb_{read,write,xxx}. Maybe fb.h only uses macros as is the case here,
but that is no excuse nt to include io.h.

Drop these changes.

> Driver source
> files that already include <asm/io.h> convert to <linux/io.h>.
This is a nice cleanup - we should keep that.

	Sam

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
