Return-Path: <SRS0=1o5z=CE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC08C433E1
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Aug 2020 21:16:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EB9A20737
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Aug 2020 21:16:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UL5e0c3w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="MoVOc5p4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EB9A20737
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aurel32.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8unIwW3tyGQQ23qFuAVAdMSEgHnjTpQ17nuSq9y8Cy0=; b=UL5e0c3w8wiId5kjIkDZnNAWqn
	cWxJzo7c8RW7FIU8JLJ2LcPrU/GGeUcJOWipELh9EtZdw0YADm0fhJbQ6eK2lwGVcbxLa6SgwUVTW
	VHAXNmGu0bMszDT6IadAObcnz2UdrM6Ahi8tydZAuizq1Bj7os2J5yBICI2jcKgLPeCNBSoCjs5dj
	Nc1t/8PZzo9TRy3KHS1Tqf/l7asQapXxTzRbtqu9X+niSLYfDCw5x6fHoZm376+kq3FEYlOfQv0l7
	leW5jrHcchs8yN3/7R9EP68RCfffRTzcW3U+6pDkFT38Z5zzwlL9NKkGQv1PCDh9W/VjQar60dJiL
	4eRw5KMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kB2mg-0000mj-5r; Wed, 26 Aug 2020 21:16:42 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB2md-0000lx-RX
 for linux-snps-arc@lists.infradead.org; Wed, 26 Aug 2020 21:16:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
 ; s=202004.hall;
 h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Content-Transfer-Encoding:Cc:From:Reply-To:
 Subject:Content-ID:Content-Description:X-Debbugs-Cc;
 bh=yVeWp3+277ktV9RRJb/DpW2RVmxcdBBkHL63bTge0Vg=; b=MoVOc5p4c0Q46nKwHag46pOIOp
 V4S5njX18ss5Gu+UOPuK4SE+kY0swNqRWwuOKvrNWFzAJ/e+DYZ4aJ2H2cZ25ChsbY9P1n2woq/sG
 TokcKExUmVTqHTSNb3xBT60t45zElPuSiaeQ4j0mwei+LZbmQeguN4/qSXVjzthWKlOzbRidNdy5A
 +Vn7awOm4EnpRhIGLmIK4xtDxiLRSRiNIWHUx5OD+NeO1rv3Ao9pj5kafoTNrZ5+fSSS3r1pnMSuw
 E5LDL/H9M5FDHck+Ih7qkvWFzoVowPF4BzW0uwL9Ailx2X1UAW21BWX6ZeeQ8WHJKj89P4QjzMtut
 FE47qYBw==;
Received: from [2a01:e35:2fdd:a4e1:fe91:fc89:bc43:b814] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <aurelien@aurel32.net>)
 id 1kB2mS-00011k-C1; Wed, 26 Aug 2020 23:16:28 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.94)
 (envelope-from <aurelien@aurel32.net>)
 id 1kB2mR-00Gf9E-Ou; Wed, 26 Aug 2020 23:16:27 +0200
Date: Wed, 26 Aug 2020 23:16:27 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "debian-cross@lists.debian.org" <debian-cross@lists.debian.org>,
 GNU C Library <libc-alpha@sourceware.org>,
 arcml <linux-snps-arc@lists.infradead.org>, debian-glibc@lists.debian.org
Subject: Re: ARC rebootstrap prereq (was Re: switching ARC to 64-bit time_t )
Message-ID: <20200826211627.GA3969691@aurel32.net>
Mail-Followup-To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "debian-cross@lists.debian.org" <debian-cross@lists.debian.org>,
 GNU C Library <libc-alpha@sourceware.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 debian-glibc@lists.debian.org
References: <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
 <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
 <20200220162735.GA26634@alf.mars>
 <2c3d76a7-fa94-d16e-2803-a98a4761e427@gmail.com>
 <20200326055408.GA31088@alf.mars>
 <775ecf3d-bc33-ff9c-347d-3b2f0db6c509@synopsys.com>
 <20200826154354.GC8835@alf.mars>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826154354.GC8835@alf.mars>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_171640_003763_A64636A2 
X-CRM114-Status: GOOD (  14.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Helmut,

On 2020-08-26 17:43, Helmut Grohne wrote:
> Hi Vineet,
> 
> On Wed, Aug 26, 2020 at 02:39:53PM +0000, Vineet Gupta wrote:
> > Following up as ARC glibc port was merged upstream in 2.32. Can we now give
> > rebootstrap a spin for ARC Debian enablement.
> 
> That's great news. Unfortunately, it's not that easy yet. rebootstrap
> requires the relevant software to be packaged for Debian and the glibc
> packaging has only reached 2.31 yet. 2.32 is not even in experimental
> yet.
> 
> Trying rebootstrap with an experimental glibc is not entirely trivial,
> but possible.
> 
> Aurelien (Cced via d-glibc@l.d.o), are there plans to upload 2.32 to
> experimental anytime soon?

No it's not planned soon. glibc 2.32 has removed support for nsl and
rpc, so we first have to do the transition to their replacement. That is
libnsl, libnss-nis and libnss-nisplus for nsl, and rpcsvc-proto and
libtirpc3 for rpc. The nsl transition is in good state, but the packages
are stuck in NEW. We've started to work on the rpc transition, however
there is a lot more work, we have at least ~50 packages that FTBFS and
need to be manually patched to use libtirpc3 instead of the glibc
implementation.

We definitely need to use experimental to test those two transitions and
ask for archive rebuilds, so it's not possible to upload a 2.32 package
there.

> Alternatively, can we segregate the relevant diff between 2.31 and 2.32
> and apply it to the unstable package without bumping the version?

I don't think that's really possible, new ports introduced in version
2.32 will have all the symbol versions set to GLIBC_2.32.

Regards,
Aurelien


PS Helmut: Once libnsl, libnss-nis and libnss-nisplus are out of NEW,
you might want to see if they can be cross-built, and if that impacts
the bootstrap process as the glibc packages are going to depend on those
(in the same way as for the libxcrypt transition).

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
