Return-Path: <SRS0=1o5z=CE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3268C433E1
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Aug 2020 15:44:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 275202078A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Aug 2020 15:44:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m8kujL9+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 275202078A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=subdivi.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h4udfzaHBgrvzNKqNwiW40+YAmTv+ZnAJTWZ2EwUaEM=; b=m8kujL9+838sdVqlf1EY564ey
	4+sGpcwRhvKLnNMtU8/W7oeyRdqawjoWf0k8Gs4WuygV8xyOzuj+Z3eZZirZFlqh2Lz8wfo7BIEUQ
	2KPhU36AhUUuCs4OMa2ByksuWuKweA8NAnKskUX/iNnbBBLEOCvn/zJ4ww+rHMHU7XMc+vB0DatLt
	h0iP7ZVBQ+Qr9eDJJOdQ+4Xdqnc6LHy9Z+jhBto2nWApKBTlO9qECmPRKXCT2NI6TdzUMFw54AgXS
	mp+jsT0OOCukQEqHSOkkHI3mOuMFmPJ2JKCbT/i8Yp6UHEOopi76diqXcjwQdsfl2V0qqNCVEWlfp
	3dnaVnlPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAxay-0006PE-GI; Wed, 26 Aug 2020 15:44:16 +0000
Received: from isilmar-4.linta.de ([136.243.71.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAxaw-0006OK-9B
 for linux-snps-arc@lists.infradead.org; Wed, 26 Aug 2020 15:44:15 +0000
Received: from isilmar-4.linta.de (isilmar.linta [10.0.0.1])
 by isilmar-4.linta.de (Postfix) with ESMTP id 39506200DCF;
 Wed, 26 Aug 2020 15:44:08 +0000 (UTC)
Date: Wed, 26 Aug 2020 17:43:54 +0200
From: Helmut Grohne <helmut@subdivi.de>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: ARC rebootstrap prereq (was Re: switching ARC to 64-bit time_t )
Message-ID: <20200826154354.GC8835@alf.mars>
Mail-Followup-To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "debian-cross@lists.debian.org" <debian-cross@lists.debian.org>,
 GNU C Library <libc-alpha@sourceware.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 debian-glibc@lists.debian.org
References: <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
 <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
 <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
 <20200220162735.GA26634@alf.mars>
 <2c3d76a7-fa94-d16e-2803-a98a4761e427@gmail.com>
 <20200326055408.GA31088@alf.mars>
 <775ecf3d-bc33-ff9c-347d-3b2f0db6c509@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <775ecf3d-bc33-ff9c-347d-3b2f0db6c509@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_114414_431912_3955974D 
X-CRM114-Status: UNSURE (   6.24  )
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
Cc: debian-glibc@lists.debian.org,
 "debian-cross@lists.debian.org" <debian-cross@lists.debian.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Vineet,

On Wed, Aug 26, 2020 at 02:39:53PM +0000, Vineet Gupta wrote:
> Following up as ARC glibc port was merged upstream in 2.32. Can we now give
> rebootstrap a spin for ARC Debian enablement.

That's great news. Unfortunately, it's not that easy yet. rebootstrap
requires the relevant software to be packaged for Debian and the glibc
packaging has only reached 2.31 yet. 2.32 is not even in experimental
yet.

Trying rebootstrap with an experimental glibc is not entirely trivial,
but possible.

Aurelien (Cced via d-glibc@l.d.o), are there plans to upload 2.32 to
experimental anytime soon?

Alternatively, can we segregate the relevant diff between 2.31 and 2.32
and apply it to the unstable package without bumping the version?

Helmut


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
