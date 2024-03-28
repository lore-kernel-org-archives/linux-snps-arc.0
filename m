Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7AFC54E64
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 Mar 2024 07:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cpnm1GbLgu1TbIxRY3y9hcaWKJx6ltXt1j22T+1NmA8=; b=08Y0EP0eLOJSIM
	6FoF/ylGNwbzRTjE8KK/0Oa7ZtSvM26e3peGLIYCmY4DNRh/zYlNjq7+j20IMsF6J5HxuRCTI7pDW
	BY7Fi8KnGlwiZEXnkvHSBrjxlx21mdvKcCFkX5hDWrNyBA2kKw3hwB0H8TyehRL/8kxXhbp+A20QD
	WZX+8KFX/1SAU85oZR8bZLYr1uU1ovjHbtOaMtIAxV98mqKH9MRL90662G3NRXilUTJGe4mafBbhv
	XRqQXORd4VZZgo/maaPI6pd6n/raCFZX+LnoPpiMyIDRfTvghVorc07uiuuZyHtWThQM2hHD6F40E
	YxIyApIjWLV4pZ74e0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpk9b-0000000Cray-2MI7;
	Thu, 28 Mar 2024 07:26:27 +0000
Received: from mailrelay5-1.pub.mailoutpod3-cph3.one.com ([46.30.211.244])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpk9X-0000000CrZW-1HDq
	for linux-snps-arc@lists.infradead.org;
	Thu, 28 Mar 2024 07:26:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=dyKv5n7Yl7LRdH+1tEzFGNQHD1DRdGd99PJrS6/p+zs=;
	b=FO3avDbtCVJhZmbtPb25Z7M92okwL42Lwzwk0Xt1eFKNFfW85ebYPD1a4Iz7nbfQa1BVxuB2fck3t
	 dV01QiC6wivs5sf4FR4Dwcj/7zxIoo8LiqS5TizyDmf/zwISEz8XHoo+q0YBAqS+W/jFG4FUQ44kvh
	 t0uaYwTBtz7fuc9aKHnSrFR3GY32xONVYLJIM0g3hDiXwbLR9BD/o3eEuUuj3l3UwYm6F6muVvvj3L
	 eaFcKcGJK55ShMf9yqSyFAGh9is77eUJyw3RtIOaPW++JhkBvC7HK4Ge1s3CMNfQOfP48o4EmSO883
	 mKHiYwbBSpWF7oBq3uTpz9wEoyMQoiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=dyKv5n7Yl7LRdH+1tEzFGNQHD1DRdGd99PJrS6/p+zs=;
	b=tWmWJ3NDZTn8BTwQyoXUT6BJQOWPfdg24c2VPAtEdn8oRObE4JrU9XMtFz3jWr/w4xs53mowsZ7/3
	 oWNGr4OCg==
X-HalOne-ID: 4ddcab29-ecd4-11ee-9a1b-9fce02cdf4bb
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay5.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 4ddcab29-ecd4-11ee-9a1b-9fce02cdf4bb;
	Thu, 28 Mar 2024 07:25:09 +0000 (UTC)
Date: Thu, 28 Mar 2024 08:25:07 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: arnd@arndb.de, javierm@redhat.com, deller@gmx.de,
	sui.jingfeng@linux.dev, linux-arch@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-sh@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 2/3] arch: Remove struct fb_info from video helpers
Message-ID: <20240328072507.GC1573630@ravnborg.org>
References: <20240327204450.14914-1-tzimmermann@suse.de>
 <20240327204450.14914-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240327204450.14914-3-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_002623_598618_F4E9D4B1 
X-CRM114-Status: GOOD (  11.60  )
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
On Wed, Mar 27, 2024 at 09:41:30PM +0100, Thomas Zimmermann wrote:
> The per-architecture video helpers do not depend on struct fb_info
> or anything else from fbdev. Remove it from the interface and replace
> fb_is_primary_device() with video_is_primary_device(). The new helper
> is similar in functionality, but can operate on non-fbdev devices.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Andreas Larsson <andreas@gaisler.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Cc: "H. Peter Anvin" <hpa@zytor.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
