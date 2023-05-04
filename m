Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99459C7EE26
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 May 2023 15:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxbVPJ9nPhWh/Ax8ER2uJq+N4LJVBtXfbGtq52WtxPg=; b=tXQqb+u2rF/vvI
	tch1rSYSLv23kefb5Ly9f59JH7DmFc7/iMlgT+A3ZYoEprMogMfjkya+uf5/mWXPktuiuTOYnuzsI
	xJiElIeMqNzWraqJbOCs3ayaMiNRrfMY1iTPQ2EDmKALTT4XeSWhV4ljzGgC2HtXBOxZUxMUjeWoQ
	USrDKeJN8XIprZQ5i4PXkJiijQqXF6mdRwcyypVWqqI+qxqPbXIDgpK96oxAGBTgz/vO3PTWtbNuX
	7kudZSZMI9aqYjlaiiXLitjjyef4g4guP+LCyvAeLCsKveNKH1k/Mikhdu864xOXugHWKLrjfwfKT
	2tF4/wrTtQoKPS9rTc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pub1J-008EfF-1m;
	Thu, 04 May 2023 15:37:25 +0000
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com ([2a02:2350:5:400::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pub1E-008Ebb-2Q
	for linux-snps-arc@lists.infradead.org;
	Thu, 04 May 2023 15:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=9OJXCjk1pQ5JPAczTbrYybaJ9yabhk+psqf49vWpZU0=;
	b=qvdNlqsBf3EoYvHRBBEpiAYN3JzfiOdN6jSoMib4fSHXY6tHmBqjeEye3YBBnQuOKlWgJbulyd9UO
	 jXb4IaCN8kX7dVnV05joCTZniXryC4lrp6RnU2s7jkJl8wdsPp6Q9OZJRYK7vfSOzXS4rmS40/eTZk
	 Oj8wFMqUI5Uf91JBzDLM6lwl/AI9nYaZL5MM0+ScxSnZS/IO/f0jfqapazU7a2UnCPXICl2bDXeIun
	 cpFA4+5zlWP+xxx7duxSDE9p2dLtJQt9zPGpmx+m59A/DqeQkbQKqGGVNVvHnMEXAS+E65XGv8vXxP
	 Xw2bDTTmGVCCvcUOan+7GsoDw8Ub2IQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=9OJXCjk1pQ5JPAczTbrYybaJ9yabhk+psqf49vWpZU0=;
	b=A41ejzmStbYNhncUAuSBS4onolrQNPxZTtME0No712Sqv3KLgK2LD8qZyKm6pcZPa7vmoiglPmcsF
	 +lL4ka5AQ==
X-HalOne-ID: 87f70a6c-ea91-11ed-bbbe-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay1 (Halon) with ESMTPSA
	id 87f70a6c-ea91-11ed-bbbe-99461c6a3fe8;
	Thu, 04 May 2023 15:37:12 +0000 (UTC)
Date: Thu, 4 May 2023 17:37:10 +0200
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
Subject: Re: [PATCH v4 4/6] fbdev: Include <linux/fb.h> instead of <asm/fb.h>
Message-ID: <20230504153710.GA518522@ravnborg.org>
References: <20230504074539.8181-1-tzimmermann@suse.de>
 <20230504074539.8181-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504074539.8181-5-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_083721_402176_24EFA969 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

On Thu, May 04, 2023 at 09:45:37AM +0200, Thomas Zimmermann wrote:
> Replace include statements for <asm/fb.h> with <linux/fb.h>. Fixes
> the coding style: if a header is available in asm/ and linux/, it
> is preferable to include the header from linux/. This only affects
> a few source files, most of which already include <linux/fb.h>.
> 
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks,
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
