Return-Path: <SRS0=HBDZ=NM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BC8C4338F
	for <linux-snps-arc@archiver.kernel.org>; Sat, 21 Aug 2021 17:36:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AFFA6120D
	for <linux-snps-arc@archiver.kernel.org>; Sat, 21 Aug 2021 17:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0AFFA6120D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aurel32.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mEIdrsKc2xsS1mqL+v0Leurkn5yK742Hf9tSUaSUYM4=; b=X7hyjoNTDUJmjq
	8ybHjEqW9iGtYp1ajcj8yJJV7luUZDtk/TO0BQjeat2alk3n4xJaSbHSalG2u5/tsF+tze/TRX215
	4WgkdouOMNMyO1qA+zjh3XlHtfLAMIk8+bpGJkiNWocjxw5WBZgDdpMq407RJKdB2WHTWgB8Uv960
	EqAwaEg0RN7y2eCXgoXPAHCtSNgifqxUhxImdUzKDvDoht601GQXWUsmVsQB+aTbLlEhxV7zmUgha
	ec8G6s2unucTX6Xh7HmkX6Ja4T4GhBFZOHSO0rWmYYgWBFZ2XdwImtAdwvwV/Qhm5Uyq7StYmIwrm
	1itzFbLCwac8fZWoRteQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHUv3-00D2GG-HN; Sat, 21 Aug 2021 17:36:33 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHUuy-00D2EQ-DZ
 for linux-snps-arc@lists.infradead.org; Sat, 21 Aug 2021 17:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
 ; s=202004.hall;
 h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Content-Transfer-Encoding:Cc:From:Reply-To:
 Subject:Content-ID:Content-Description:X-Debbugs-Cc;
 bh=6I8JvRrnnSST74bOZpkOTKvIZ/C1EJ4QcobmwBnZBrM=; b=JpV5ZxwagrsRmeXrJHZB4YLYUR
 n2bpVSk8NUeX7LcuEjBU0Da4x5R+tliOJ+JyqJQPZGdaIE/lmZ+CsoyJwzYtqfOlar4imsbYi4HJQ
 qp3kri7nZk8YcZjGdirmUaoCMG2W12lNkEAhMYIIdjyNGml5XaaQk5k1UG9FF4KmHv+6pyAlnCRcS
 9BOo1ym9qQp25SR6OVLZqS5k3uLr56HnzhZ7yHAdjWPYEnVw7na3T9oT4ZP4lu49fHL310M6auD8g
 1/mgxMv3Pmkc+xDQ01FoT41LN7h1xjGXN04mLzWHWh99VBJipuGODx0Enk+UcY3NnW2L1Q7mwFrAr
 z3yAzYvw==;
Received: from [2a01:cb1a:71:ba44:d365:d717:4d3e:4c06] (helo=ohm.aurel32.net)
 by hall.aurel32.net with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <aurelien@aurel32.net>)
 id 1mHUui-0002h1-Nk; Sat, 21 Aug 2021 19:36:12 +0200
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.94.2)
 (envelope-from <aurelien@aurel32.net>)
 id 1mHUub-001x5a-4F; Sat, 21 Aug 2021 19:36:05 +0200
Date: Sat, 21 Aug 2021 19:36:04 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "debian-cross@lists.debian.org" <debian-cross@lists.debian.org>,
 GNU C Library <libc-alpha@sourceware.org>,
 arcml <linux-snps-arc@lists.infradead.org>, debian-glibc@lists.debian.org
Subject: Re: ARC rebootstrap prereq (was Re: switching ARC to 64-bit time_t )
Message-ID: <YSE5hJBT4wzOh6Nn@aurel32.net>
Mail-Followup-To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "debian-cross@lists.debian.org" <debian-cross@lists.debian.org>,
 GNU C Library <libc-alpha@sourceware.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 debian-glibc@lists.debian.org
References: <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
 <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
 <20200220162735.GA26634@alf.mars>
 <2c3d76a7-fa94-d16e-2803-a98a4761e427@gmail.com>
 <20200326055408.GA31088@alf.mars>
 <775ecf3d-bc33-ff9c-347d-3b2f0db6c509@synopsys.com>
 <20200826154354.GC8835@alf.mars>
 <20200826211627.GA3969691@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826211627.GA3969691@aurel32.net>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210821_103628_976048_E8ADC339 
X-CRM114-Status: GOOD (  18.44  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi,

On 2020-08-26 23:16, Aurelien Jarno wrote:
> Hi Helmut,
> 
> On 2020-08-26 17:43, Helmut Grohne wrote:
> > Hi Vineet,
> > 
> > On Wed, Aug 26, 2020 at 02:39:53PM +0000, Vineet Gupta wrote:
> > > Following up as ARC glibc port was merged upstream in 2.32. Can we now give
> > > rebootstrap a spin for ARC Debian enablement.
> > 
> > That's great news. Unfortunately, it's not that easy yet. rebootstrap
> > requires the relevant software to be packaged for Debian and the glibc
> > packaging has only reached 2.31 yet. 2.32 is not even in experimental
> > yet.
> > 
> > Trying rebootstrap with an experimental glibc is not entirely trivial,
> > but possible.
> > 
> > Aurelien (Cced via d-glibc@l.d.o), are there plans to upload 2.32 to
> > experimental anytime soon?
> 
> No it's not planned soon. glibc 2.32 has removed support for nsl and
> rpc, so we first have to do the transition to their replacement. That is
> libnsl, libnss-nis and libnss-nisplus for nsl, and rpcsvc-proto and
> libtirpc3 for rpc. The nsl transition is in good state, but the packages
> are stuck in NEW. We've started to work on the rpc transition, however
> there is a lot more work, we have at least ~50 packages that FTBFS and
> need to be manually patched to use libtirpc3 instead of the glibc
> implementation.
> 
> We definitely need to use experimental to test those two transitions and
> ask for archive rebuilds, so it's not possible to upload a 2.32 package
> there.
> 

Now that the RPC transition is ongoing, I have just uploaded glibc 2.32
to experimental.

Regards,
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
