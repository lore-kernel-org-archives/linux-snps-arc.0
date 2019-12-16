Return-Path: <SRS0=ytJj=2G=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1D2C43603
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Dec 2019 10:29:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41874206CB
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Dec 2019 10:29:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uKwFwWU9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="cGP6aCvJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41874206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7xs6VG+mNOaoKT3lNcFwoF7TxEGMLaBtzI9d6D7kDgc=; b=uKwFwWU9YRrIWo
	zShhCQPpG6RwR5269lR+7zqpC9ei6jUz7HrOEJw5roKydUTBpg4kKg2zpyz4Vu+OSUV/SRrXWf/Ji
	6T6htmnQMq/36uK88eVknL4sd1BcT4+0DijS50WHX7phGE/+amDsOoMAMdFx9HssyQGlvEyHnv95o
	EvgEOTgF3hS7A8xTm6BauYnmy+a725twpncBf/hqGgB70huh5HS75JB3xK6nbJadKZ7JN4uhrSVis
	68hp/lih83pwBfBXvka1zVw4PaKq5jzR4vLAw1POxof1NhPNqPK2oDC/w0SuubFn6sm+0v5+Hh9/4
	YntpxhgMxKLWeHXh+m9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igncg-0005ky-Ak; Mon, 16 Dec 2019 10:29:06 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igncd-0005kP-6p
 for linux-snps-arc@lists.infradead.org; Mon, 16 Dec 2019 10:29:04 +0000
Received: by mail-wm1-x336.google.com with SMTP id p17so6100034wmb.0
 for <linux-snps-arc@lists.infradead.org>; Mon, 16 Dec 2019 02:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=46o7gfaBJKWXTkcq7jAyrA6x8PfxHhsT8BvQ5sfS3jI=;
 b=cGP6aCvJaouKqRF113ZIszW+7Jq6GOE1v2MmKkeCKv1mYQDJ+HoY9Z8V/MPmZfGd2U
 pUDJOT6IetAiG84ATEptiwmgdtqEPnWSn/4zKO8isMNvuaoMoUim5xMIOef0BhZ2MldS
 HdmuLehU6XU8/gpx+ejlWQF4cXlHvAPwPnBKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=46o7gfaBJKWXTkcq7jAyrA6x8PfxHhsT8BvQ5sfS3jI=;
 b=pBmv03ylNktJeaRr6tFVeHyCE4zZtTkVJIksk+BUueTZic8uHuCZLDs0LwROImdYJV
 oECYZTV71pmLWmGROel+n0WOg9conapnTV1h+jXnUrFt4zHFHVt0IshieHxA9U+7BCX1
 W4uwoiyWt6ozZvQ7Me/Z5O7aOZ4qjjitpmug+2LpCS2qvAsAKyNy+sqQ8e4KbXkKGTjE
 Za4cc3CEErRh5dQtk4VY196TZbTrKAuEwKtR0OKAPOn8ukho/6uU3j6dcoKUgcVjm136
 5H3pH7F3l7edhasrCGNCtQ7m11pMvuHR1J3YBJaBKVSMBNW0rn3cCiZXqs15UWj0TTC9
 ns4g==
X-Gm-Message-State: APjAAAUqOI10sz/JweHBmRJquLHxmq2oQ9CMmK8h0qnjI8aayXLudcRF
 YPbJD6OL/ncUTc53+a7WZ5nXdw==
X-Google-Smtp-Source: APXvYqxqYBkRX2S1WOmH3iJu+DF4WPqvZ4wos4keiSNNx6sBRLiORSihcgxKEvoS1oZAV5r2/Zr72w==
X-Received: by 2002:a1c:6588:: with SMTP id z130mr30026831wmb.0.1576492141292; 
 Mon, 16 Dec 2019 02:29:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id a1sm21003085wrr.80.2019.12.16.02.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 02:29:00 -0800 (PST)
Date: Mon, 16 Dec 2019 11:28:58 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [GIT PULL] drm/arc: Yet another set of minor fixes
Message-ID: <20191216102858.GR624164@phenom.ffwll.local>
References: <CY4PR1201MB012062AAE1D2223BEF3AB204A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <20191127100634.GE29965@phenom.ffwll.local>
 <CY4PR1201MB01201760E81B40589D182E08A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <CAKMK7uHSm6oKUUDxQxPkOJMj4Ut6+B1dFdZGoauNjrT_o841sA@mail.gmail.com>
 <CY4PR1201MB0120529194B092E2C2ACD77EA1540@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <20191213102219.GE624164@phenom.ffwll.local>
 <CY4PR1201MB01206B89011211BB25EF82ADA1540@CY4PR1201MB0120.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR1201MB01206B89011211BB25EF82ADA1540@CY4PR1201MB0120.namprd12.prod.outlook.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_022903_307011_B2223765 
X-CRM114-Status: GOOD (  13.32  )
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

On Fri, Dec 13, 2019 at 10:24:42AM +0000, Alexey Brodkin wrote:
> Hi Daniel,
> 
> > -----Original Message-----
> > From: Daniel Vetter <daniel@ffwll.ch>
> > Sent: Friday, December 13, 2019 1:22 PM
> > To: Alexey Brodkin <abrodkin@synopsys.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>; David Airlie <airlied@linux.ie>; arcml <linux-snps-
> > arc@lists.infradead.org>; Eugeniy Paltsev <paltsev@synopsys.com>; dri-devel@lists.freedesktop.org
> > Subject: Re: [GIT PULL] drm/arc: Yet another set of minor fixes
> > 
> 
> [snip]
> 
> > > Not sure if you noticed re-spin of my pull-request in the previous message.
> > > Do you want me to send it in a separate email?
> > 
> > Yeah I guess this got lost again.
> 
> So should I re-send it in another email or you will pick it up
> from existing thread?
> 
> If I'm going to re-send it do I need to re-base it on today's drm/drm-next?

I just tried to vacuum it in, but it chokes the scripts since it's
multiple pull requests in one mail with quotes. So please redo in a clean
mail.

Wrt baseline, here's the recommendation in order of my preference:
- Just stuff it into drm-misc-next
- Base your tree on a tag from Linux
- If you need a specific depedency, base your tree on drm-next with that
  patch included.
- If it's even more complicated, do a multi-way topic branch with lots of
  coordination.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
