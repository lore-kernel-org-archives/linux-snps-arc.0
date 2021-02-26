Return-Path: <SRS0=8MwS=H4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C60C433DB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 26 Feb 2021 10:36:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2BD064F03
	for <linux-snps-arc@archiver.kernel.org>; Fri, 26 Feb 2021 10:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2BD064F03
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=subdivi.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IrWeP8IBVlQ1KwsKJBV7f2OBmzsRpNhncg9mt0eHXPg=; b=NNJfizLGII0wWvXqPxfqMMuw8
	iKBBbS6P/LIsssZ1TIzucFELJ6IahvssTTvjoDgujDXgRFotgvC52irJsdoh/fYWR7Fah1RzMD6tP
	MBzBi6z3w2t8ZZ5qhIbzyTz8nm11FZ1WW7XlSrK58w51JIPL4QhHtR1T+LGqAiQD6fW+yZSEzjpoL
	Kz0FA2Ggjkgbd9dISpejLcMsHlmJZ3l+YvXfNLMxKB8G6VAMmNBB5hSTuipslEHPyRS3cxAts3pmz
	/Q7svsWfUNXZTZaU7vy73rTTtgdH0nOo7yfEO0dKbuA/qGLimvvnrS8P3z0VwxFCTISyqFgXJ8CPw
	s8tCKLQWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFaUN-0003jY-4p; Fri, 26 Feb 2021 10:36:51 +0000
Received: from isilmar-4.linta.de ([136.243.71.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFaUL-0003hZ-Fd
 for linux-snps-arc@lists.infradead.org; Fri, 26 Feb 2021 10:36:50 +0000
Received: from isilmar-4.linta.de (isilmar.linta [10.0.0.1])
 by isilmar-4.linta.de (Postfix) with ESMTP id 94242200263;
 Fri, 26 Feb 2021 10:36:38 +0000 (UTC)
Date: Fri, 26 Feb 2021 10:47:20 +0100
From: Helmut Grohne <helmut@subdivi.de>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: ARC rebootstrap prereq (was Re: switching ARC to 64-bit time_t )
Message-ID: <YDjDqP4IXxtL886p@alf.mars>
Mail-Followup-To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "debian-cross@lists.debian.org" <debian-cross@lists.debian.org>,
 GNU C Library <libc-alpha@sourceware.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "debian-glibc@lists.debian.org" <debian-glibc@lists.debian.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
 <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
 <20200220162735.GA26634@alf.mars>
 <2c3d76a7-fa94-d16e-2803-a98a4761e427@gmail.com>
 <20200326055408.GA31088@alf.mars>
 <775ecf3d-bc33-ff9c-347d-3b2f0db6c509@synopsys.com>
 <20200826154354.GC8835@alf.mars>
 <20200826211627.GA3969691@aurel32.net>
 <72128fcf-2409-ef98-4e77-bc2ac40ccada@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <72128fcf-2409-ef98-4e77-bc2ac40ccada@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_053649_655465_AA53FFF6 
X-CRM114-Status: UNSURE (   8.10  )
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
Cc: "debian-glibc@lists.debian.org" <debian-glibc@lists.debian.org>,
 "debian-cross@lists.debian.org" <debian-cross@lists.debian.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Vineet,

On Wed, Feb 24, 2021 at 08:17:53PM +0000, Vineet Gupta wrote:
> Checking in to see if things have change since my last posting on this 
> topic.

Appreciated. I would have forgotten about arc.

> Is glibc 2.32 now packaged for debian so we can attempt ARC rebootstrap ?

Unfortunately, no. Debian has started freezing in preparating of the
bullseye release. Only up to version 2.31 is packaged and Aurelien seems
a little busy these days. If I recall correctly, 2.32 drops some
backwards compatibility stuff that Debian still relies on $somewhere,
but is transitioning away already. So it's not just dumping 2.32
together with the 2.31 packaging in experimental.

Before that happens, there is little I can do to help. With 2.31, we
still get:
| checking sysdep dirs... configure: error: The arc is not supported.
I'm still interested in supporting the arc bootstrap. Please get back
with me when we can move on.

You can check Debian's glibc version at
https://tracker.debian.org/pkg/glibc at any time in the version column.

Helmut


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
