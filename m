Return-Path: <SRS0=uFJY=5Y=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2A8C2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Apr 2020 01:59:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4DB62074F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Apr 2020 01:59:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FIE8+hVF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGUK0v3Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4DB62074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NBP5WSzpvTp+cCl/HbWvNbwvIVG5imPfhqC3dmm7XGw=; b=FIE8+hVFDM970R
	p4SS1bkzwXJKGT3zXc5qdHsMedR6UEUgoDli7qnn2BB3LTlu9JY9BQ8Vbi+EXN10nIfh4wrBocoo3
	C5GQnkJtwOnJj/KQkxpaH9iO07nZyl4Aw7vbj5xAxd0fjAliq+owI5Dy0ggIwT4D6KKi+9ms/YhnK
	E2DPhYz6oOKN0a1JGjCl9S7Cpafy9F5QflhP1hm4wpPFjlfO9O4IgqxamjNzyGAe5NGZkjPHCvv9V
	HM7W0MHRlSctT5sh+VN4HjTMQ+HAs5dOvNTktptuRxGE/K66lP2AQfA2izklvS+DCwv9RVP69849b
	h2quh1SMsKeYe2p+EVMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jM00Q-0006s8-FP; Wed, 08 Apr 2020 01:59:54 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM00O-0006rn-P9
 for linux-snps-arc@lists.infradead.org; Wed, 08 Apr 2020 01:59:54 +0000
Received: by mail-ot1-x344.google.com with SMTP id 22so5332660otf.0
 for <linux-snps-arc@lists.infradead.org>; Tue, 07 Apr 2020 18:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=F/UEX/qu552SCPFaaat1hu6i9S00M212yRB97ZlFyqw=;
 b=dGUK0v3QQ28XF/v/4rttw4NK/ilYlCaYkXrMBehOnMI3WsTobhpVFN2tErUSmvtD6J
 MNpwr0w8TltTkwPqLmOxkQTU9IkmlhEXWM0Sn1ILNxdD1JyifDauV4pZhVNvA189Tltd
 IJvU0fmMImx+hgrgtBqWcnad8EC5/zmWB6PTauFyXUUBfYZIwHqcQ+cGJ6rr4qfOvobO
 YoLU7oTh+GsyIzRoseGo01fJ65VodPSGb4PQFQfvE8fcAXmkYk7i46pVO90c5tIbzSbO
 u7KdV45BleSxjj6NShhMGJdTsubQ5c+NUx5HHalLU3sU9flTKyR2l9ruCEE2EQzcL/M/
 f+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=F/UEX/qu552SCPFaaat1hu6i9S00M212yRB97ZlFyqw=;
 b=Z+CVhHoORD3OHyZu2e3DslT0mr/WHBxF+jDHQASz7VYyFv0LE1d2FmSFHGgmU9x8mU
 usQcuLB5kMs7cAubVet5WqKjR8p4ujVE7TiQ0gap925hjDFQRHWILgIF9j+ZdBkdy2lX
 shx7xcx47WKavjePrsQXmqSs8wMu72WkRxqpV/BXQrU4X6DAzxMM3uhUA16r2TKnefEc
 wYBk1kGLhS2ANBBbzMqMCDQxl86ijKo1i77IZIoTr3UWAZXHyuUGnSfTeRYEEKGtiMnp
 m8q4CEBJqEGvjtQSFqgKHCTtKEWFqSb5vWazzGhm11OPi1a5qO/US9qtbfrkuujTmjgz
 /0Tw==
X-Gm-Message-State: AGi0PuZ/vFZHjzXp9ea9/dCn28Z9SGrLreBX6IWVuRMa/GndAc0qUdsP
 uJx9TLFMQUeIzIG7jEcCqQk=
X-Google-Smtp-Source: APiQypJGBjWcy1K64T6QMq8WocCCTCUCqLf6FUlZTIYYZdEbAk6ISTQSX178vh57adpTgRUPbM6P+g==
X-Received: by 2002:a05:6830:1495:: with SMTP id
 s21mr4225254otq.35.1586311191582; 
 Tue, 07 Apr 2020 18:59:51 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::3])
 by smtp.gmail.com with ESMTPSA id f184sm3221012oib.26.2020.04.07.18.59.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Apr 2020 18:59:51 -0700 (PDT)
Date: Tue, 7 Apr 2020 18:59:49 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH] ARC: [plat-hsdk]: fix USB regression
Message-ID: <20200408015949.GA40360@ubuntu-s3-xlarge-x86>
References: <20200407161933.10874-1-Eugeniy.Paltsev@synopsys.com>
 <20200408012028.GA40613@ubuntu-s3-xlarge-x86>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408012028.GA40613@ubuntu-s3-xlarge-x86>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_185952_839519_3F1761CF 
X-CRM114-Status: GOOD (  17.82  )
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
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Apr 07, 2020 at 06:20:28PM -0700, Nathan Chancellor wrote:
> On Tue, Apr 07, 2020 at 07:19:33PM +0300, Eugeniy Paltsev wrote:
> > As of today the CONFIG_USB isn't explicitly present in HSDK defconfig
> > as it is implicitly forcibly enabled by UDL driver which selects CONFIG_USB
> > in its kconfig.
> > The commit 5d50bd440bc2 ("drm/udl: Make udl driver depend on CONFIG_USB")
> > reverse the dependencies between UDL and USB so UDL now depends on
> > CONFIG_USB and not selects it. This introduces regression for ARC HSDK
> > board as HSDK defconfig wasn't adjusted and now it misses USB support
> > due to lack of CONFIG_USB enabled.
> > 
> > Fix that.
> > 
> > Fixes: 5d50bd440bc2 ("drm/udl: Make udl driver depend on CONFIG_USB")
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> > ---
> >  arch/arc/configs/hsdk_defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
> > index 0974226fab55..f79c15892704 100644
> > --- a/arch/arc/configs/hsdk_defconfig
> > +++ b/arch/arc/configs/hsdk_defconfig
> > @@ -65,6 +65,7 @@ CONFIG_DRM_UDL=y
> >  CONFIG_DRM_ETNAVIV=y
> >  CONFIG_FB=y
> >  CONFIG_FRAMEBUFFER_CONSOLE=y
> > +CONFIG_USB
> 
> Shouldn't this be CONFIG_USB=y?
> 
> As it stands, this patch does nothing.
> 
> Cheers,
> Nathan

Nevermind, I came across v2 on the mailing list, sorry for the noise.

Cheers,
Nathan

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
