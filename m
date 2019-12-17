Return-Path: <SRS0=vbRU=2H=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343E7C43603
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Dec 2019 13:28:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F20BD20717
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Dec 2019 13:27:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rcmNcneB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="f8h4vQvY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F20BD20717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0vS2Y5CAqrhDtS4ISiCWrUiHxxQlgkZafYA/lmcL4A=; b=rcmNcneB326VB/
	Ld8/fkkKIF6WebTkNeqPvkxxZ2J7Pez1YcM0oKWslFrVpTp/+jYxmKqCXpo0EWekNev8Qt88DbuLl
	xpwW7KCg7ohQsmPv2M1xZwnXclA+G0fpxmNfX6mR9FXZSN95ztJl7GfzLy83e5hohwGLoxzI/7HnK
	VlDKmZ73froxaW2LkX32BJDY8HYlTxgR+Nr7r35ucmNvrlqgmt/BlYPM6nvHeZMx2gy61jpFTBzaF
	KcZcwAj/GK8C2b6HVyo6VM9mYmtg4/XVmqq4RL6BejURo9v0t7r6pRl82Z4OTLy1EBsjGV++SYQP2
	g6i7sBmYqnvuMHW6hG8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihCtI-000613-Ta; Tue, 17 Dec 2019 13:27:56 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihCsy-0005hx-NP
 for linux-snps-arc@lists.infradead.org; Tue, 17 Dec 2019 13:27:38 +0000
Received: by mail-wm1-x343.google.com with SMTP id t14so3146471wmi.5
 for <linux-snps-arc@lists.infradead.org>; Tue, 17 Dec 2019 05:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/Bd+h7ZrKit8ez5CAduwJAFXfIeURWl0IveWHe0NC4o=;
 b=f8h4vQvYKcHoQLkRx0Xxf9cV8LBGmBHdy18kZI6FoXE/7h2k0SCzQbnO9tdyhqvz90
 w6tRV/QVpmU7K45XdCVaQjR9LY5yGxdqoPwKLzFRS+7uJr+/lc9GROpp+zbjsmTUVgWZ
 JRN7QiWHcGwHUx45kiWmHxV01NcHFak9N7AFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/Bd+h7ZrKit8ez5CAduwJAFXfIeURWl0IveWHe0NC4o=;
 b=iHceCaPe9N+vbiaTc1HaqK/sndE2IbDUTbQYpHzP2lQCWzctn7RzN/u95eumsqsaYT
 Pn2BZzGGlVoMrVpQlLoiNRCYOTo2t8iQG98e1qxhLt3UTyW3sijTL8Qb1VJGR6B3mwE4
 ADDPtaphVct1T+FcnjvCSTeiyY3pvcyWPJz6zD/mZV4oo1TIdd8Wfn7SnymvZr4AIebI
 Ukv6gm4rVcKpvlNjSP4TRkR2HWghq+FPTmgpKy6JH/LbrzbCQUbxPLvUpZJbIblpGLmR
 vy91gr8EmerFPj1JHwQKOLlrUbabza85qmRPTboo/NVEaja4vCTNg66OeL+zMcY4BQRf
 HTjw==
X-Gm-Message-State: APjAAAUgS1YJdImfA92k78kRclRCL2Maxn8q37+JjEP3Jfm8ziGoTweC
 nm/SKaiv9IVnp2yyx+UqoSHDYg==
X-Google-Smtp-Source: APXvYqzAXa4FIbKFVGUbluEKhURL5JUn5mHz1NEdoT/f8KuzH/frsjKQ5YQI2xo1VcIYl8bx50OXWA==
X-Received: by 2002:a05:600c:21c6:: with SMTP id
 x6mr5326705wmj.177.1576589255099; 
 Tue, 17 Dec 2019 05:27:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id b10sm25832938wrt.90.2019.12.17.05.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 05:27:34 -0800 (PST)
Date: Tue, 17 Dec 2019 14:27:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [GIT PULL REBASED] drm/arc: Yet another set of minor fixes
Message-ID: <20191217132732.GB624164@phenom.ffwll.local>
References: <CY4PR1201MB01204228B5788F0A6619FE45A1510@CY4PR1201MB0120.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR1201MB01204228B5788F0A6619FE45A1510@CY4PR1201MB0120.namprd12.prod.outlook.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191217_052736_809933_134872C8 
X-CRM114-Status: GOOD (  13.37  )
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

On Mon, Dec 16, 2019 at 10:59:39AM +0000, Alexey Brodkin wrote:
> Hi David, Daniel!
> 
> The following changes since commit d1eef1c619749b2a57e514a3fa67d9a516ffa919:
> 
>   Linux 5.5-rc2 (2019-12-15 15:16:08 -0800)
> 
> are available in the Git repository at:
> 
>   git@github.com:abrodkin/linux.git tags/arcpgu-updates-2019.12.16
> 
> for you to fetch changes up to 0ff916e2ef6fb742e4906aac26c470314b59bae8:
> 
>   DRM: ARC: PGU: add ARGB8888 format to supported format list (2019-12-16 13:53:05 +0300)

Applied to drm-next, thanks for respinning.
-Daniel

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
> Note this is based on the current drm/drm-next contents.
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
