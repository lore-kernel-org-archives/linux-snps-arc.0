Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5721C77B78
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Apr 2023 19:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MEIoq89T+ZZqW2QTCNSDv1666E4vmrP4CYG8j+s+TEM=; b=Wj9mJz88qxX/tM
	CJJLJCamqvK9cyzAqItprYKGvb1VeY6Cpcfuk/zGriKXkSdV7lf27gSSAWtsCYk+lK0DBM2n6Etk7
	jRCtQwylQDDUAqp5mZOjhz/RSAU8/bVIjmnmL7GyLfwl+VN6WTGQx3IF3YcNZbLKJbM35nO7TKcdj
	SRSaPFLLpygU2HvW0QLGOyAB7RkEpsNRakACZw5utp9Pvybx1ZX/0vi+/IwKFg8A3QjDmdKGH7UvN
	/TFjrgWMKaNMSPYeEs3o5IZ7pmgzr+PWD4V8pOeN4Dvlu1pDg+49kuHqsWaRv/GnPvJ13adL8NMcl
	dT8BXcs2ptlDvwTYWlAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prkhg-004gwb-1B;
	Wed, 26 Apr 2023 19:21:24 +0000
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com ([2a02:2350:5:405::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prkhb-004gvS-1B
	for linux-snps-arc@lists.infradead.org;
	Wed, 26 Apr 2023 19:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=eVeo2+G0wfE7Th9mpMzqAlZwNjPXsqF5qhbG8BjXhfs=;
	b=cAOCLgpYeIgd+SmmPnle/bw2nmkoV/Wcu/JfousxXCWTrIQvRkzjoJkXzUu5C1+v5pjh9PiCe2CkM
	 Qhz+tS62TbtvfjoewZNnQsVIohf5Lh6j3eeLb8oGMplSAWtWY4RmGoC8NWdegN1XZLMnR9ogqNkoQQ
	 uXc2S1EUvclv9hfY33OezLtHys0IF70fCqjzu+pHztUy/Iv8rfBGvFIDt/l34oUk1uqmoZp0TRedDb
	 n3a+nAhUaclrLH2tNkgZu49/49pwlw+NVupLOTPMnq2rs+LzYaCkGqNPvf12SGaHEpL638nDRGgYoM
	 zGAQT7MBPP3QhvGMAQLLL8egMyK3MZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=eVeo2+G0wfE7Th9mpMzqAlZwNjPXsqF5qhbG8BjXhfs=;
	b=do/hY8c+tmgFEa4FnPVB0BzaGeCw1ybrSgm/bAII+A4jObIR152O0J//1DGI4vY4Rp4c904oVYBoa
	 GD/PMttDA==
X-HalOne-ID: 7fc0ec5f-e467-11ed-9e8c-6f01c1d0a443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay6 (Halon) with ESMTPSA
	id 7fc0ec5f-e467-11ed-9e8c-6f01c1d0a443;
	Wed, 26 Apr 2023 19:21:11 +0000 (UTC)
Date: Wed, 26 Apr 2023 21:21:10 +0200
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
Subject: Re: [PATCH 0/5] fbdev: Move framebuffer I/O helpers to <asm/fb.h>
Message-ID: <20230426192110.GA3791243@ravnborg.org>
References: <20230426130420.19942-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230426130420.19942-1-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_122120_754194_23C2019C 
X-CRM114-Status: GOOD (  13.25  )
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

On Wed, Apr 26, 2023 at 03:04:15PM +0200, Thomas Zimmermann wrote:
> Fbdev provides helpers for framebuffer I/O, such as fb_readl(),
> fb_writel() or fb_memcpy_to_fb(). The implementation of each helper
> depends on the architecture. It's still all located in fbdev's main
> header file <linux/fb.h>. Move all of it into each archtecture's
> <asm/fb.h>, with shared code in <asm-generic/fb.h>.

For once I think this cleanup is moving things in the wrong direction.

The fb_* helpers predates the generic io.h support and try to
add a generic layer for read read / write operations.

The right fix would be to migrate fb_* to use the io helpers
we have today - so we use the existing way to handle the architecture
specific details.

From a quick look there seems to be some challenges but the current
helpers that re-do part of io.h is not the way forward and hiding them
in arch/include/asm/fb.h seems counter productive.

	Sam

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
