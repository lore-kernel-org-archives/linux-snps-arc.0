Return-Path: <SRS0=kWcA=ZT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C04C432C3
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Nov 2019 10:06:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1774920656
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Nov 2019 10:06:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H0Xtz4gI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="OBAJB64V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1774920656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JCU4Mp6aON4lRVXaP6OFCcCQWdl68ohXJ/nKCEAq7YY=; b=H0Xtz4gIh8Fzjs
	RKGtU6v2mvoZ1UTd7V+7r7ysEPzyXjf2jO/aaVI0LAD4l+PM1hkW9lK9uFkbJjKdV5mPbWdoEhtVm
	KDuke1FVQPaaUBq9KS6k8zffaL06Enkx9QeW+Uro1sxaVUmB/TW7Bfz6C1RxpXxUMb2gkUvbscUoW
	G3B8HIUAnqx+a0c4yJ5Q11FzW/eJpiVT2wizY4Kot/a7l1DwiM8lDW4gs4Dn6GeK6JhvWozrcEWRk
	hMtFigkkfFaJIz6XF1GgxydeDrTTvbn7gvf6gkRafLyYdfZY5UruYRYTh4DpdNXBfsoc5Qm5JxM5h
	hyYHmgTliYsk1rAghWdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZuDY-0005Hj-Sh; Wed, 27 Nov 2019 10:06:40 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZuDW-0005HH-UX
 for linux-snps-arc@lists.infradead.org; Wed, 27 Nov 2019 10:06:40 +0000
Received: by mail-wm1-x344.google.com with SMTP id y5so6710713wmi.5
 for <linux-snps-arc@lists.infradead.org>; Wed, 27 Nov 2019 02:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7L9Wk/FKnkC/Zlgs/brH2Y9L4gw6e7ePkqKzatJyV5M=;
 b=OBAJB64VnmKGCTfGn3SW8x4eg/DvfWol9yiUX+vOlSDEA4CGelx6yGSUoehrrm4MI5
 SFTTWfhg7dxBVQKOxfuOEgb6NAL5Nes6YuirdLTE37IKlDmmhQk/YZ8EA1pdlwnNia0x
 NcRo6nn/C+sPc9InSPJuf31TBSRb7iG7h2Dto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7L9Wk/FKnkC/Zlgs/brH2Y9L4gw6e7ePkqKzatJyV5M=;
 b=XpVitUruOYXKUoD4K8WmWn6Y7yfJMB42h8BTL8ZKM/sPOOKOSIWn4Quuuzl81o0IiH
 QeLpFT9bu6hqino0Jk8Q3BkwjMor5jrrore8Ot19dm4E5bwR7GdWr/S+qU8cHpzrq9AH
 S9C085RPrZy2gEfRHROAqszEpBu5mqcp2sV/mmXgOHL5JWgkeLT67SVmCIRiodKzZcvc
 oZIgGh+elkMvBUQEjP2c7IB6OPaWzG9XOPvwFyiZzBbAALevZan4jI99dCNZKLF5AZAt
 ys+3+ZDCBc0aKXnG/3iSMcwpqxk8FS/ZANXPkMmUnto7uOgZHlT0PyPfSGg6gLZI8Koz
 MVqQ==
X-Gm-Message-State: APjAAAUY1YFBNvDc6M1McTtQ8KPYAGV/9pjVC0Z6Ws0lYA4wrORJCRFx
 fI574ka/DQW0DhXHY7s4Jgtwww==
X-Google-Smtp-Source: APXvYqzGMkDTLgkJPNAZe0OvTL1yVegf7OXXJJD2YqJrrUrWDZej0Pz1/vqbXU243kH6lwj1D9/G/g==
X-Received: by 2002:a1c:a906:: with SMTP id s6mr3571133wme.125.1574849197255; 
 Wed, 27 Nov 2019 02:06:37 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id u1sm6150282wmc.3.2019.11.27.02.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 02:06:36 -0800 (PST)
Date: Wed, 27 Nov 2019 11:06:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [GIT PULL] drm/arc: Yet another set of minor fixes
Message-ID: <20191127100634.GE29965@phenom.ffwll.local>
References: <CY4PR1201MB012062AAE1D2223BEF3AB204A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR1201MB012062AAE1D2223BEF3AB204A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_020638_985615_78D28877 
X-CRM114-Status: GOOD (  15.28  )
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

On Wed, Nov 27, 2019 at 07:48:04AM +0000, Alexey Brodkin wrote:
> Hi David, Daniel!
> 
> The following changes since commit 8082731830a0b95f7f7a63b78de67de446013c80:
> 
>   drm/vram: remove unused declaration (2019-11-27 07:51:49 +0100)
> 
> are available in the Git repository at:
> 
>   git@github.com:abrodkin/linux.git tags/arcpgu-updates-2019.11.27
> 
> for you to fetch changes up to b2c68fb15a4c2e27f80353d3067dce30882a0972:
> 
>   DRM: ARC: PGU: add ARGB8888 format to supported format list (2019-11-27 10:38:24 +0300)
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

Uh, this seems to be based on some random snapshot of drm-misc-next, so
contains a _lot_ more than just these 4 patches (compared to drm-next).

If you want to move arcpgu to drm-misc (which would make tons of sense
imo) then:
- create a MAINTAINER patch to add drm-misc as the git repo for it
- request your account for drm-misc, see https://www.freedesktop.org/wiki/AccountRequests/
- and set up the scripts https://drm.pages.freedesktop.org/maintainer-tools/getting-started.html

Or respin this one, but these small pulls have a habit of occasionally
getting lost :-/

Cheers, Daniel

> 
>  drivers/gpu/drm/arc/arcpgu_crtc.c | 36 ++++++++++++++++++------------------
>  drivers/gpu/drm/arc/arcpgu_regs.h |  2 +-
>  2 files changed, 19 insertions(+), 19 deletions(-)
> 
> Thanks,
> Alexey

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
