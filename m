Return-Path: <SRS0=itI7=ZC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F26C43331
	for <linux-snps-arc@archiver.kernel.org>; Sun, 10 Nov 2019 20:36:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 575D2207FA
	for <linux-snps-arc@archiver.kernel.org>; Sun, 10 Nov 2019 20:36:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f2FSRmS5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 575D2207FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qn1jz+py0OM6ME4KHwQ6QoSvEHf8Dr9eld6f7VmjSs0=; b=f2FSRmS5e2IqLs
	i1p2T0cg165nRh2T1lmwjpk9Rsa9fbEK55lbmjQWXv3vcpudUdfAOsgiivaZslqnP4MpshvnJHzpT
	rb684qCd7AF2wm6M1lJsKTyPmGhyC4kgUi9YvLeNXaNIG7IknqvMDwBsdpSL0bnI0x86c82ocPcgo
	kh/1veAIU6zTPlJj8QYKn1pw0d3QyBv8SnnTYlZdMexFprvbCYWGyei/i+tHiGkJB7iCsE57FORM9
	jJRTEcNxMI9kh4bXt4UEvaDeaUdfIARpxN/6P68ZeDE4udULE/8bkRR0MR3dVsG4OgSbdeyTkuN39
	LZxECRIpVr1R6x9/5qIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTtwI-0005zR-5m; Sun, 10 Nov 2019 20:36:02 +0000
Received: from smtp4-g21.free.fr ([212.27.42.4])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTtwF-0005z4-EQ
 for linux-snps-arc@lists.infradead.org; Sun, 10 Nov 2019 20:36:01 +0000
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5d59:a754:4ab2:dcc8])
 (Authenticated sender: yann.morin.1998)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 98BD919F59D;
 Sun, 10 Nov 2019 21:35:36 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 10 Nov 2019 21:35:36 +0100
Date: Sun, 10 Nov 2019 21:35:36 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/3] arch/config.in.arc: Introduce the ARC
 optimized hs38 config
Message-ID: <20191110203536.GE3419@scaer>
References: <20191108174112.28183-1-vgupta@synopsys.com>
 <20191108174112.28183-2-vgupta@synopsys.com>
 <20191109144656.3da6a1b0@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191109144656.3da6a1b0@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191110_123559_778893_05420671 
X-CRM114-Status: GOOD (  18.99  )
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
Cc: buildroot@busybox.net, Evgeniy.Didin@synopsys.com,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Alexey.Brodkin@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Vineet, Thomas, All,

On 2019-11-09 14:46 +0100, Thomas Petazzoni spake thusly:
> +Arnout for legacy handling.
> 
> On Fri,  8 Nov 2019 09:41:10 -0800
> Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> 
> > This corresponds to -mcu=hs38 with mpy-option=9 (64-bit multiplier)
> > 
> > Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> > ---
> >  arch/Config.in.arc | 21 ++++++++++++++-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> > index c65bb01f1f4f..284951b82cee 100644
> > --- a/arch/Config.in.arc
> > +++ b/arch/Config.in.arc
> > @@ -11,13 +11,19 @@ config BR2_arc750d
> >  config BR2_arc770d
> >  	bool "ARC 770D"
> >  
> > -config BR2_archs38
> > +config BR2_archs
> >  	bool "ARC HS38"
> >  	help
> >  	  Generic ARC HS capable of running Linux, i.e. with MMU,
> > -	  caches and multiplier. Also it corresponds to the default
> > +	  caches and 32-bit multiplier. Also it corresponds to the default
> >  	  configuration in older GNU toolchain versions.
> >  
> > +config BR2_archs38
> 
> This re-use of an existing name is a bit annoying. Indeed, all existing
> users of Buildroot that have a configuration with BR2_archs38 will now
> be building for a ARC system with a 64-bit multiplier, while they were
> previously building for a 32-bit multiplier.
> 
> I see that what you have done is to try to be consistent between the
> BR2_ options and the gcc options. I'm hesitating between keeping the
> consistency but making the migration a bit annoying for users, or
> breaking the consistency to make the migration smooth for users.
> 
> Since I think the number of affected users will probably be quite
> small/limited, I think I would be fine with merging your patch as-is,
> but I'd like to hear from others.

I would prefer if we kept the existing name as-is, and introduce the new
variant under a different name, e.g.:

    config BR2_archs38
        bool "ARC HS38"

    config BR2_archs68_64mpy
        bool "ARC HS38 w/ 64-bit mpy"

Because, well, they both are HS38 cores, so we are not wrong in naming
both options with hs38.

It would have been good that the config names match the gcc option, of
course, but that is a minor detail I believe...

Regards,
Yann E. MORIN.

> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
