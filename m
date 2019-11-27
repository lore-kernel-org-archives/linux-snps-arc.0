Return-Path: <SRS0=kWcA=ZT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EBCAC432C0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Nov 2019 14:06:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 632C620678
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Nov 2019 14:06:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e6ZwLib4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="WNVu+0kx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 632C620678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hK5wNE+HTvBodJd4867cZHd+FdL18TkImEtJ81KCpgk=; b=e6ZwLib4Hhm17k
	alQaLShFb5tyG4pETAYm7nl52OjQGRIMQEbWmWKaNseufxeK1VV2eMjhf8bf5nC9U47Wb8rgefRcV
	TtSnTDOl0K00cHmcocXt2Vf+vVwv+H2N7DLhNS5mMM7JcRFDCX8fAjvo3am+XiQ4kI8VX+O8T3/E4
	AVLa/HwZhb7GpP9eziiIkCJupkdPaSE/Tnv8P0eSq6Y2iC2VsQQaupRN9tq0JOINo0zxbfWAfNPKx
	F8lWZqimmL0RlDibJ1/aJz4qAYQJwFAbRGno8LlBR+BTWA0y/d79WtMNhxkLH2aH3HAdw6SN31oIS
	VQYgK7oBqWt8sdUcknGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZxxQ-0001x2-GU; Wed, 27 Nov 2019 14:06:16 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZxxN-0001w2-5A
 for linux-snps-arc@lists.infradead.org; Wed, 27 Nov 2019 14:06:15 +0000
Received: by mail-oi1-x242.google.com with SMTP id e9so20183024oif.8
 for <linux-snps-arc@lists.infradead.org>; Wed, 27 Nov 2019 06:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NzKA6GzPA/LjwSxPSnN5mlvFFtejMgAiZMOLRkhv5Xk=;
 b=WNVu+0kxAqXq/4zKaExPUraBrv5jW4nYVOLsmiM2Y9BlF2hsoqjmLeQL+vQIqQqzLz
 ItTPWbIs+wbYhUHRjnmH/lWwN3RhQI9aV7HffXUOQOGRfPYmGWxkV/GZ6ZCgut3pFRQy
 8Z9k2z8Ovqp9A+K+gJfkk4Mdcdj9AkqpUjUgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NzKA6GzPA/LjwSxPSnN5mlvFFtejMgAiZMOLRkhv5Xk=;
 b=ilxHv9oAHkL/cfsYm8hxo2xdxQvMmflLnYKKBDFYghrFIKhM9heAn0hKlk34SzM7uL
 0YogJhF+FO7OJALV01YYcYt6ARpyCmUF3DGptnBVTt8XkfKpGjasrQyLzvhF5eYfWdxS
 YFAJRztyXT3gzK3LVIMRvu69z17ZiZ3/zqjZLw7NSuSxJEaG9QPBBXT27E6LKs0pQ+wG
 0JhfnjScofB4ts/8OjuO+Qr+asL2T+Hhcl2+wsiWzr1auwVHO+mog4LXYk8FBmyH7uG3
 uCFeLvHQqsDxE4G5wTxvQU+5fNkthG+6boPfZ8BsKSsgM8ft/Q2zh2LdZ1nlo8qMksUW
 KwUw==
X-Gm-Message-State: APjAAAWFmuqCcmx5qkyTBDFP7O84zm8vf6dQl8N0M+yT0/w+JZsl6apd
 vHtzklz6w0oSWu5c1lJ0tVrDZToK17geFL4RYFuCGVGk
X-Google-Smtp-Source: APXvYqxzGXE+JojxaBPB5WZr+AtTUHNKe8CUhTyvJYqUsCUu+gfwF8GyD1mfNx/bcBg/eFvHjJUoVdQeE6cmL9Alsdk=
X-Received: by 2002:a05:6808:4cf:: with SMTP id
 a15mr4176186oie.132.1574863571801; 
 Wed, 27 Nov 2019 06:06:11 -0800 (PST)
MIME-Version: 1.0
References: <CY4PR1201MB012062AAE1D2223BEF3AB204A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <20191127100634.GE29965@phenom.ffwll.local>
 <CY4PR1201MB01201760E81B40589D182E08A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR1201MB01201760E81B40589D182E08A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 27 Nov 2019 15:06:00 +0100
Message-ID: <CAKMK7uHSm6oKUUDxQxPkOJMj4Ut6+B1dFdZGoauNjrT_o841sA@mail.gmail.com>
Subject: Re: [GIT PULL] drm/arc: Yet another set of minor fixes
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_060613_254696_46215540 
X-CRM114-Status: GOOD (  27.25  )
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Nov 27, 2019 at 2:49 PM Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
>
> Hi Daniel,
>
> > -----Original Message-----
> > From: Daniel Vetter <daniel@ffwll.ch>
> > Sent: Wednesday, November 27, 2019 1:07 PM
> > To: Alexey Brodkin <abrodkin@synopsys.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>; David Airlie <airlied@linux.ie>; arcml <linux-snps-
> > arc@lists.infradead.org>; Eugeniy Paltsev <paltsev@synopsys.com>; dri-devel@lists.freedesktop.org
> > Subject: Re: [GIT PULL] drm/arc: Yet another set of minor fixes
> >
> > On Wed, Nov 27, 2019 at 07:48:04AM +0000, Alexey Brodkin wrote:
> > > Hi David, Daniel!
> > >
> > > The following changes since commit 8082731830a0b95f7f7a63b78de67de446013c80:
> > >
> > >   drm/vram: remove unused declaration (2019-11-27 07:51:49 +0100)
> > >
> > > are available in the Git repository at:
> > >
> > >   git@github.com:abrodkin/linux.git tags/arcpgu-updates-2019.11.27
> > >
> > > for you to fetch changes up to b2c68fb15a4c2e27f80353d3067dce30882a0972:
> > >
> > >   DRM: ARC: PGU: add ARGB8888 format to supported format list (2019-11-27 10:38:24 +0300)
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
> >
> > Uh, this seems to be based on some random snapshot of drm-misc-next, so
> > contains a _lot_ more than just these 4 patches (compared to drm-next).
>
> Indeed it's based off of today's "drm-misc-next". That's because I still get
> lost when I have to deal with DRM trees which we have a plenty.
>
> I guess there should be a clean explanation of which repo and branch should be
> used for which purpose, right? May I have a reference to it then?

It's the same as for any other subsystem:
- don't base your stuff on top of random other trees
- except when you have a very specific excuse (i.e. functional
conflict with stuff in drm-next or something like that), use a release
tag from Linus' tree as your baseline

And when generating the pull, actually generate the pull against the
target tree/branch (drm-fixes or drm-next), not something else.
-Daniel

>
> > If you want to move arcpgu to drm-misc (which would make tons of sense imo)
>
> Could you please elaborate a bit on this? Given we have a couple a patches if
> at all for each kernel release I'd prefer to escape a need to use yet another
> repo, tools etc as this doesn't simplify anything but instead makes simple
> things much more complex (if done rarely).
>
> > then:
> > - create a MAINTAINER patch to add drm-misc as the git repo for it
> > - request your account for drm-misc, see https://www.freedesktop.org/wiki/AccountRequests/
> > - and set up the scripts https://drm.pages.freedesktop.org/maintainer-tools/getting-started.html
>
> Thanks for the pointers
>
> > Or respin this one, but these small pulls have a habit of occasionally
> > getting lost :-/
>
> Well I'd better re-spin this, see below.
>
> The following changes since commit acc61b8929365e63a3e8c8c8913177795aa45594:
>
>   Merge tag 'drm-next-5.5-2019-11-22' of git://people.freedesktop.org/~agd5f/linux into drm-next (2019-11-26 08:40:23 +1000)
>
> are available in the Git repository at:
>
>   git@github.com:abrodkin/linux.git tags/arcpgu-updates-2019.11.27
>
> for you to fetch changes up to 9c2acc26c899aa12ad009dff10a5573ef769a7fd:
>
>   DRM: ARC: PGU: add ARGB8888 format to supported format list (2019-11-27 16:43:39 +0300)
>
> ----------------------------------------------------------------
> Clean-up and fixes for FourCC handling in ARC PGU.
>
> ----------------------------------------------------------------
> Eugeniy Paltsev (4):
>       DRM: ARC: PGU: fix framebuffer format switching
>       DRM: ARC: PGU: cleanup supported format list code
>       DRM: ARC: PGU: replace unsupported by HW RGB888 format by XRGB888
>       DRM: ARC: PGU: add ARGB8888 format to supported format list
>
>  drivers/gpu/drm/arc/arcpgu_crtc.c | 36 ++++++++++++++++++------------------
>  drivers/gpu/drm/arc/arcpgu_regs.h |  2 +-
>  2 files changed, 19 insertions(+), 19 deletions(-)
>
> -Alexey
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
