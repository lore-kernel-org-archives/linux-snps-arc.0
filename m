Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2ADC77B7E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 28 Apr 2023 16:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F1INa1fZ2NpXcIX1quaTxgefDzK5czgkyJmnJ9dxfx8=; b=xrNInkAx2CQHpO
	oJJiAgX2fY96/besy6bBOlDDg7BR0Hjy5OATBTMSbmjs9sEl94r++IzHK7Cnx0sGtnxRt6e9hwyVw
	s8wtD1egYeLqNNyc4gV2U4UWQ/GeAFwzlAquaIyY2rDiiQ1bLGulIFYHHzMjViF7Nuw7ooJUSQNuE
	y3/sSkzJQ8J4VYO+EJr1Kln3B/ih0D1kffMWcsaX2LsHwUHnvoKfOZ9CQxO00Nh4xA/Ykc/24jo28
	0TgQltVPvdok7A86j7Bh0SnKaTeoIZ9yfeC774fgHQ9H/csf0h83nXLkrvF1ex2hPa1pNhHlcjnsN
	zRK29ftj27orc7LtcHew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psRMb-00BHU6-0o;
	Fri, 28 Apr 2023 16:54:29 +0000
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com ([2a02:2350:5:401::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psRMW-00BHSE-1u
	for linux-snps-arc@lists.infradead.org;
	Fri, 28 Apr 2023 16:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=4h2Y9ZZQ14tdvAGC5hFpqIKQWvmB0qe68pQRnQlSShc=;
	b=IrdAXdZPKho0zoQxG/scktRALZpl2c237XlKLT5EIx0ja7nZb83hqvUgOuyY55pNvHYqH3FsErtl1
	 5jx6Clb6lkPL8TkUqCtTnSvfCnAc1GKTQxpoyL9YYmuFWy6pRl3ovRobT6YFtqeLlVGxUM3+fK10GW
	 26P+hLCnm+zpPHV7tOv/ibW1ECpjZ4qETcRhhPvrkIFIONhGHQGcxNm6MxcY5BEqj85CuJqzXS5rce
	 1Inl5d47E3sR2kFuS+NTw8OWDudvX6hThvyhlLeRI9ruUhs5QS1y61KsI01ISxy6adAYh2hLAOXbIt
	 t6mRhKxKsnm9awtbASezT6BrkUMBpFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=4h2Y9ZZQ14tdvAGC5hFpqIKQWvmB0qe68pQRnQlSShc=;
	b=2sOyzdZRm0G5akePNgNy9pFImOAXPUTPUHEcB6iUeB7W+50cDIuX1agx3ldJaHWZog9XyDftdQu09
	 P8qxcwNCA==
X-HalOne-ID: 4d02a9c5-e5e5-11ed-9bd2-13111ccb208d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay2 (Halon) with ESMTPSA
	id 4d02a9c5-e5e5-11ed-9bd2-13111ccb208d;
	Fri, 28 Apr 2023 16:54:14 +0000 (UTC)
Date: Fri, 28 Apr 2023 18:54:12 +0200
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
Subject: Re: [PATCH v2 5/5] fbdev: Define framebuffer I/O from Linux' I/O
 functions
Message-ID: <20230428165412.GA4010212@ravnborg.org>
References: <20230428092711.406-1-tzimmermann@suse.de>
 <20230428092711.406-6-tzimmermann@suse.de>
 <20230428131221.GE3995435@ravnborg.org>
 <900eaf1c-4d29-2c26-c220-6b4e089d9b94@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <900eaf1c-4d29-2c26-c220-6b4e089d9b94@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_095425_560022_36D6350F 
X-CRM114-Status: UNSURE (   8.45  )
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

On Fri, Apr 28, 2023 at 04:18:38PM +0200, Thomas Zimmermann wrote:
> I'd be happy to have fb_() wrappers that are I/O helpers without
> ordering guarantees. I'd just wouldn't want them in <linux/fb.h>

How about throwing them into a new drm_fb.h header file.
This header file could be the home for all the fb stuff that is
shared between drm and the legacy fbdev.

Then we may slowly migrate more fbdev stuff to drm and let the legacy
fbdev stuff use the maintained drm stuff.
Dunno, the pain may not be worth it.

	Sam

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
