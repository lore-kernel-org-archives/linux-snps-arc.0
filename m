Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC91DC77B7C
	for <linux-snps-arc@archiver.kernel.org>; Fri, 28 Apr 2023 13:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yw9WuJH2dnamd3EDOVtDWy4YqO/iSBKod7SUDHQ7enc=; b=XnSUfota76VjCw
	HUwZXGHNDDu98NUvl5cauzBlgMqFshaVx3ObEZTuqtQoX8q0cTfZPr1AyGFRnUramvBIq1SULE6SI
	/T2Ug8byDumoU6klF+OaSLUfm/TjAUSyKSEEkq7jgiBmo72DvtKmIl4qiyfWFD8xXIZ8SAln2CE4P
	eCUby9HUa13LpK3F4kUhv8zQQzQWQJRlEB2McFjASmIPCdkPJ/SlB2/No0wVUGEa1tldJytnE1IEc
	Jv1mdVrjHrBo8zEGeSOCYGw44hjBxzqjQMJYIdXBQcMSmfvL1QFPQnrYq8Kcn0//cOq12lpSj5b9+
	AI6VhB/a70oPTN7ydOGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psNuv-00AGbW-35;
	Fri, 28 Apr 2023 13:13:41 +0000
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com ([2a02:2350:5:402::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psNuq-00AGVF-2x
	for linux-snps-arc@lists.infradead.org;
	Fri, 28 Apr 2023 13:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=K3hI1/6PyaWFpzEBQJz+6tOnP/hMA6RM+an+N2/SAGU=;
	b=p3ndZrQKMSUlzm/nDAnCwsGo9L0gGsWF75qxTZlsIwroX36ZzR9n/TqOk4Ikh1KZ1uEf801ySHAOB
	 yuaU+Ld6Tw73sXVUTCxgTr+rQtcP3cQmoy6O/PS1W8Sw8U9Pz9QGbdm64v/oi2D93X9aS9pWDvQBjj
	 1loPbH8TJoA3VwFcCEH3fDeOHvFgiaivV98L8z4aVI/2AqW+CcNGaMH4Ja1wy5lJuo0gXHVO8OyZ+J
	 /MQqwNKpEigOaL2YHWV6UAAtq1w9lPACg3xLRKCDc+ma3cU6cZxRVzOTH6WsG+3ThvFok4EbOK+CEe
	 srZdeI7kmtl+ASR7D+jcke8Z2koxNkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=K3hI1/6PyaWFpzEBQJz+6tOnP/hMA6RM+an+N2/SAGU=;
	b=MuIZq23kU+epw5Oh27NhFCj+lmErbvHXzjBgCVAf/M7xbtvvXoyNyi3h3ZVbeWRyRg+tHgMDHRmS6
	 X388u8sCA==
X-HalOne-ID: 79fad2fe-e5c6-11ed-b78f-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay3 (Halon) with ESMTPSA
	id 79fad2fe-e5c6-11ed-b78f-b90637070a9d;
	Fri, 28 Apr 2023 13:13:34 +0000 (UTC)
Date: Fri, 28 Apr 2023 15:13:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, geert@linux-m68k.org, javierm@redhat.com,
	daniel@ffwll.ch, vgupta@kernel.org, chenhuacai@kernel.org,
	kernel@xen0n.name, davem@davemloft.net,
	James.Bottomley@hansenpartnership.com, arnd@arndb.de,
	linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/5] fbdev: Use regular I/O function for framebuffers
Message-ID: <20230428131333.GF3995435@ravnborg.org>
References: <20230428092711.406-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230428092711.406-1-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_061337_180798_AF5E9F49 
X-CRM114-Status: GOOD (  16.30  )
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

On Fri, Apr 28, 2023 at 11:27:06AM +0200, Thomas Zimmermann wrote:
> (was: fbdev: Move framebuffer I/O helpers to <asm/fb.h>)
> 
> Fbdev provides helpers for framebuffer I/O, such as fb_readl(),
> fb_writel() or fb_memcpy_to_fb(). The implementation of each helper
> depends on the architecture, but they all come down to regular I/O
> functions of similar names. So use the regular functions instead.
> 
> The first patch a simple whitespace cleanup.
> 
> Until now, <linux/fb.h> contained an include of <asm/io.h>. As this
> will go away patches 2 to 4 prepare include statements in the various
> drivers. Source files that use regular I/O helpers, such as readl(),
> now include <linux/io.h>. Source files that use framebuffer I/O
> helpers, such as fb_readl(), also include <linux/io.h>.
> 
> Patch 5 replaces the architecture-based if-else branching in 
> <linux/fb.h> by define statements that map to Linux' I/O fucntions.
> 
> After this change has been merged and included in a few release
> without complains, we can update the drivers to regular I/O functions
> and remove the fbdev-specific defines.
> 
> The patchset has been built for a variety of platforms, such as x86-64,
> arm, aarch64, ppc64, parisc, m64k, mips and sparc.
> 
> v2:
> 	* use Linux I/O helpers (Sam, Arnd)
Much better, thanks!

	Sam

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
