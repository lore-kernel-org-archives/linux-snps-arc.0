Return-Path: <SRS0=yFMY=5L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F22C43331
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 14:29:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4B5F20787
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 14:29:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GpCj/j6Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4B5F20787
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=subdivi.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HB9Xv80eUBFAi9gGhxU5sUss8zobv9dGOJtnbQCqbqE=; b=GpCj/j6YkfYy/f
	HxBBRFEGECHssjxXb70C0QLyE3d3+qdCeGPK9Gh2ADyjFBXprW+/AlnUVYra/3tyjpl/V4rphQZw5
	gsjWwmR41RZS4wCIN/ND7hgB3BedYNwb3vavYswGfOFwZCTG/5/a4duPvAaNd1qxMh6zyejRRxq2R
	nTbvivY0Gi31F/4kJ2vo2Wg8X3fPWeq6H4/cPR3m4D4uP/ixMRO1kIAIUdG2qzMpDbfstX31xHs57
	jM8qqmJuqGn/akVwZNksajS/6frNniRA/TvikWDkZA888VRGtS186CF9BMct7VG3V6QIbkO2ajvhH
	2IL1ED8Y2d8W14ER7f6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHTVD-0002cg-UJ; Thu, 26 Mar 2020 14:28:59 +0000
Received: from isilmar-4.linta.de ([136.243.71.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHTVB-0002XY-1A
 for linux-snps-arc@lists.infradead.org; Thu, 26 Mar 2020 14:28:58 +0000
Received: from isilmar-4.linta.de (isilmar.linta [10.0.0.1])
 by isilmar-4.linta.de (Postfix) with ESMTP id ABB4B2000AE;
 Thu, 26 Mar 2020 14:28:54 +0000 (UTC)
Date: Thu, 26 Mar 2020 15:28:36 +0100
From: Helmut Grohne <helmut@subdivi.de>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: ARC rebootstrap prereq (was Re: switching ARC to 64-bit time_t )
Message-ID: <20200326142836.GA24503@alf.mars>
Mail-Followup-To: Helmut Grohne <helmut@subdivi.de>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "debian-arm@lists.debian.org" <debian-arm@lists.debian.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>,
 Vineet Gupta <vineetg76@gmail.com>,
 Claudiu  Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
References: <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
 <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
 <20200220162735.GA26634@alf.mars>
 <2c3d76a7-fa94-d16e-2803-a98a4761e427@gmail.com>
 <20200326055408.GA31088@alf.mars>
 <CY4PR1201MB0120B23B823811B061CFCCFDA1CF0@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <20200326122401.GA5669@alf.mars>
 <CY4PR1201MB01202B2FF493C221420F422DA1CF0@CY4PR1201MB0120.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR1201MB01202B2FF493C221420F422DA1CF0@CY4PR1201MB0120.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_072857_224947_B3B8C493 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
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
Cc: GNU C Library <libc-alpha@sourceware.org>,
 Vineet Gupta <vineetg76@gmail.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "debian-arm@lists.debian.org" <debian-arm@lists.debian.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Alexey,

On Thu, Mar 26, 2020 at 12:53:45PM +0000, Alexey Brodkin wrote:
> Sorry for this stupid question but I'm not very familiar with use-cases for
> libatomic-ops so would like to get some more clarification on what's needed here.
> 
> I know that GCC has quite a few built-ins for atomic ops and we do implement them.
> I'm adding our GCC maintainer (Claudiu) in the Cc so he may jump in if needed.

One part of the question here is "why do we need libatomic-ops?". The
answer to that is, because libgc uses it and libgc is used by e.g.  gcc,
gnutls, guile, and make. Possibly, some of these could be built without
libgc, but this is how they are packaged for Debian at present.  Package
dependencies currently say that we need libatomic-ops.

The other part is "what is missing in libatomic-ops"? If you look at a
more recent implementation, such as riscv, you see that it basically
says "trust gcc". So I guess all you need here is an arc-specific
implementation that says "gcc knows what it is doing, use its
primitives".

Given sufficient work, I guess libatomic-ops could be removed in favour
of using the gcc built-ins directly. Not sure whether that'd fly with
libgc upstream though.

So no, this is not a stupid question. Thank you for asking.

Helmut

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
