Return-Path: <SRS0=dSES=2D=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B01B9C43603
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Dec 2019 10:22:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8652C2067C
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Dec 2019 10:22:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OPS18ieE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="QqURz+p6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8652C2067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G1bPS5MytFQ+BXoGTaAWJpNS39Hfnrd1IXpjBTMcQq4=; b=OPS18ieEWjRpyW
	IA9KiUt0MEDVPtJYYjQnRaFF116YtXTtfl6nZT/GxX0l/PLiwU2decpFqXKI6RiGdZBYS2LqxjXO8
	cEORKnOk4NzyAw48AzRihT8vIvTcLf6rf0FUD5VF8mc1QtxmU3nPXOhKcLt3bxeYdca2NTVoaH5F2
	hkRH7chfa2PszDUz577KGIstILE7VIhV+P/bFzhRuzAhrZH43lN5vIxlUYAsX9x2tR4CRDkbGlqY7
	qHJ+yblCmUiuPOo2Y3EvOsKEdc1k3twy5SCiFmyCkIHMP2y/utXj5Si8NQxgqM57EGfHftvixcWCW
	rWessER0Bi0hem34zHxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifi5a-0005CC-L0; Fri, 13 Dec 2019 10:22:26 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifi5X-0005BX-Qw
 for linux-snps-arc@lists.infradead.org; Fri, 13 Dec 2019 10:22:25 +0000
Received: by mail-wm1-x341.google.com with SMTP id u2so964253wmc.3
 for <linux-snps-arc@lists.infradead.org>; Fri, 13 Dec 2019 02:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QY3NvhBzfNLuo8ft1+5cod4Pq4jbW4pl0EICF70IjAY=;
 b=QqURz+p6OpfSht0UEiMFNp1Wvl5pvnnJfmrnrvcjDYoxzJkBADQ3DpjCZ5cMJbjo79
 Yr9RP8Fc3OfzTYQvoAMAbxW66g8tEBlxyAsrCIarB4/TbjVDkUJP8xUAbs11MbLlUtlN
 FCdCBOHgnF4XHvA5rltRbVp85iqjCOEcck760=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QY3NvhBzfNLuo8ft1+5cod4Pq4jbW4pl0EICF70IjAY=;
 b=oS77OJt4kc+zr9eX/LEp1wF2kC+3o+Jyz5dzqOgIum9mA1HbcNpu+H875JCJaQMK9V
 WufQSiz4dRIs8s6Ou3rTbFo6d5y4/neunZ7ysTVuoc9BwH8aqLqphl9n+FjZsCoY2hS/
 j2IWsc8Yrt8Fxx85t23qIrGgKNGlPPelYQsD/zr/POjfossb88Tem72jbDtoJwYtkRL2
 H1ngx4jGlFAiFTJMMAfHgAOqBJJD5T6CbDw9AQguOOxLn3DQ/TMUiB173EZqO+oiEWK1
 Yfm2iyd06QSnhqVyQoL9fEgF7y3V+g5XBK0NeBlFXY0LOueAyrVEQ4BF0fFY01uG0w7Y
 kDpg==
X-Gm-Message-State: APjAAAXB3LvxH7CtOKCiwpzgJwoRS5JCs8ErhEBj5e6vWZa6HAN/7hyG
 QSqjGQYgvb4kPhxp5wG6z3FVgg==
X-Google-Smtp-Source: APXvYqzBq7k83Laq7gm+anpzvKyH4RR4LWTb0RsNVZZezRVdWRlgoqKhOJ9hmJPnNxebBV64GRpehA==
X-Received: by 2002:a1c:3d07:: with SMTP id k7mr4235810wma.79.1576232541864;
 Fri, 13 Dec 2019 02:22:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id x18sm9523281wrr.75.2019.12.13.02.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 02:22:21 -0800 (PST)
Date: Fri, 13 Dec 2019 11:22:19 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [GIT PULL] drm/arc: Yet another set of minor fixes
Message-ID: <20191213102219.GE624164@phenom.ffwll.local>
References: <CY4PR1201MB012062AAE1D2223BEF3AB204A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <20191127100634.GE29965@phenom.ffwll.local>
 <CY4PR1201MB01201760E81B40589D182E08A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <CAKMK7uHSm6oKUUDxQxPkOJMj4Ut6+B1dFdZGoauNjrT_o841sA@mail.gmail.com>
 <CY4PR1201MB0120529194B092E2C2ACD77EA1540@CY4PR1201MB0120.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR1201MB0120529194B092E2C2ACD77EA1540@CY4PR1201MB0120.namprd12.prod.outlook.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191213_022223_872605_B4C3405B 
X-CRM114-Status: GOOD (  14.80  )
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
Cc: David Airlie <airlied@linux.ie>, arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Dec 13, 2019 at 10:20:39AM +0000, Alexey Brodkin wrote:
> Hi Daniel,
> 
> [snip]
> 
> > > Thanks for the pointers
> > >
> > > > Or respin this one, but these small pulls have a habit of occasionally
> > > > getting lost :-/
> > >
> > > Well I'd better re-spin this, see below.
> > >
> > > The following changes since commit acc61b8929365e63a3e8c8c8913177795aa45594:
> > >
> > >   Merge tag 'drm-next-5.5-2019-11-22' of git://people.freedesktop.org/~agd5f/linux into drm-next
> > (2019-11-26 08:40:23 +1000)
> > >
> > > are available in the Git repository at:
> > >
> > >   git@github.com:abrodkin/linux.git tags/arcpgu-updates-2019.11.27
> > >
> > > for you to fetch changes up to 9c2acc26c899aa12ad009dff10a5573ef769a7fd:
> > >
> > >   DRM: ARC: PGU: add ARGB8888 format to supported format list (2019-11-27 16:43:39 +0300)
> > >
> > > ----------------------------------------------------------------
> > > Clean-up and fixes for FourCC handling in ARC PGU.
> > >
> > > ----------------------------------------------------------------
> > > Eugeniy Paltsev (4):
> > >       DRM: ARC: PGU: fix framebuffer format switching
> > >       DRM: ARC: PGU: cleanup supported format list code
> > >       DRM: ARC: PGU: replace unsupported by HW RGB888 format by XRGB888
> > >       DRM: ARC: PGU: add ARGB8888 format to supported format list
> > >
> > >  drivers/gpu/drm/arc/arcpgu_crtc.c | 36 ++++++++++++++++++------------------
> > >  drivers/gpu/drm/arc/arcpgu_regs.h |  2 +-
> > >  2 files changed, 19 insertions(+), 19 deletions(-)
> 
> Not sure if you noticed re-spin of my pull-request in the previous message.
> Do you want me to send it in a separate email?

Yeah I guess this got lost again.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
