Return-Path: <SRS0=yFMY=5L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48448C43331
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 06:19:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96E9A20719
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 06:19:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ldgeFEXf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96E9A20719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=subdivi.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9C0l1LEoXm2Bqa8Cb7kaWQbYrI3msUfQ7yqd/Uy5xa0=; b=ldgeFEXfmAb282
	QWE1eBaAK/ZrTr2ucRO7jBpgzQtb4Kg8KNVuqJngslotAmw2hx1CGGpZUlbFys4dsd6dluL4sTzwj
	uzV8uul8lNPbREqgrfUq9AuPbfi6LSMWV6cHKG2k7/dG4B4U1is7bmF02Hp5Z72wewjhkDiQMflIT
	hcdhuNdUccaf2LkH9Hg21UwlmzZnygnSTnpMwWwYPKh376TWCi3ebx9OXHLU8KKkey2ukigYTiGht
	lzQ8y95FcNSNDxbCyMomeYa7psLi1swVx4NnamltloPjV8+qqlOAO5E2FnRoLX+zYFxusBDfnHqET
	Q/GCO2btPTrmHKmWnY1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHLrU-0005FW-0k; Thu, 26 Mar 2020 06:19:28 +0000
Received: from isilmar-4.linta.de ([136.243.71.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHLrQ-0005Et-Q6
 for linux-snps-arc@lists.infradead.org; Thu, 26 Mar 2020 06:19:26 +0000
Received: from isilmar-4.linta.de (isilmar.linta [10.0.0.1])
 by isilmar-4.linta.de (Postfix) with ESMTP id C22C32000AE;
 Thu, 26 Mar 2020 06:19:18 +0000 (UTC)
Date: Thu, 26 Mar 2020 06:54:08 +0100
From: Helmut Grohne <helmut@subdivi.de>
To: Vineet Gupta <vineetg76@gmail.com>
Subject: Re: ARC rebootstrap prereq (was Re: switching ARC to 64-bit time_t )
Message-ID: <20200326055408.GA31088@alf.mars>
Mail-Followup-To: Helmut Grohne <helmut@subdivi.de>,
 Vineet Gupta <vineetg76@gmail.com>,
 GNU C Library <libc-alpha@sourceware.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 debian-arm@lists.debian.org
References: <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
 <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
 <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
 <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
 <20200220162735.GA26634@alf.mars>
 <2c3d76a7-fa94-d16e-2803-a98a4761e427@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c3d76a7-fa94-d16e-2803-a98a4761e427@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_231924_998332_95366C80 
X-CRM114-Status: UNSURE (   7.29  )
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
Cc: debian-arm@lists.debian.org, arcml <linux-snps-arc@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Vineet,

On Wed, Mar 25, 2020 at 05:25:58PM -0700, Vineet Gupta wrote:
> ARC glibc is still in works, but assuming that will happen in near future what
> other upstream prerequisites are needed. The obvious ones would be Linux kernel,
> gcc, binutils: all 3 of which are supported for ARC. From a quick glance at debian
> wiki pages, I presume *bootstrap is mostly done native, so needs qemu ? (full/user
> emulation ? And does qemu need to be upstream too ?

Given that I ran into the glibc issue, I can tell that at least
rudimentary arc support support is already available in Debian unstable
for binutils, linux and gcc. (Otherwise, I would not have come as far as
glibc.) Once glibc is in place, work can proceed on the Debian side.
guile, libatomic-ops, libffi, libgpg-error and nspr ususally need a
little upstream support. dpkg, gmp, openssl, and perl usually need
Debian-specific changes. I'd recommend looking into libatomic-ops and
libffi early. The other packages are usually simple.

The aim of rebootstrap is to create a package set for essential +
build-essential using cross builds without using any qemu. Beyond that
point, you'd switch to native building. Unless real hardware is
available, you'd need qemu after the reboostrap phase. Whether you use
full or user emulation is your choice, but I guess that you can speed up
builds using user emulation, because it allows you to mix and match
binaries. When you upstream your qemu is also your choice.

Please get in touch with me once a suitable glibc is packaged for Debian
unstable or experimental. Please use debian-cross@lists.debian.org or
irc.oftc.net #debian-bootstrap at that point. Alternatively, package a
glibc locally (like Arnd did).

Helmut

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
