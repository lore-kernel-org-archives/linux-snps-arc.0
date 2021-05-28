Return-Path: <SRS0=8B7N=KX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26ACDC4707F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 28 May 2021 03:50:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C22E6611AB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 28 May 2021 03:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C22E6611AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoyjTY+FEsU3DbJewhOEjjpLLHVLtTwIKnAYZrEL+eI=; b=QqvydN3kJQVopDQVfxBxMgeIWH
	Qb7g5jKCez2p/xKiumfVuQ6u9RGSKOw6KSPJSdDsd5vV0WN+zpnRW+a42fjhABkB/QbeY7IgQXdqd
	W3qOJ0XflsEeNXTYrCURXu7gnT4ZojTFg9TfQX1iPmi9iMnzXNWBCY98UjB3+RkS2vmWcsuIoFLon
	vpqxk9a3PCuQs80CJ1amw+r/GioaRr6DPU005TL/n8NKhpfYUBPFCL8SUnunWUcWmRLWpBu43BWiN
	xwJkuaiWvWDDkCxm1i9L23+F0UmvHtIUS90ZtX3tkltcYAsFCsE9tdODubqajv8iTZqiFa1tWcb/6
	5ZeqHa6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmTWA-00BhIU-AW; Fri, 28 May 2021 03:50:38 +0000
Received: from master.debian.org ([2001:41b8:202:deb:216:36ff:fe40:4001])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmTVz-00BhBu-H5
 for linux-snps-arc@lists.infradead.org; Fri, 28 May 2021 03:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org; 
 s=smtpauto.master;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-ID:Content-Description;
 bh=ZkDQLbuKIBcN7facqJSPmkD0NKS6vmVrlKxGTUUvdiU=; b=Xq7eO2WqeWaHF6/EijSNUyZ4q2
 xJvWa5vYCZQgrf0QOCOquotpIHAF0aZrOC6QtaDAlbTPZ5SkHBgzwUF6uQ4PniICU//QzBM6Wyws+
 rvXDzMg911nMz57Zn9rMw8NZ1HipQCDu5/j4UUCvjmxsduIUIxmDP3hi8eHZWezjkfGP/95KCbS+0
 8dNuhIykXsCdBDtiWfX6aO1TzYF8sFhRwn235lhwHFYPNenLZL1Q/jdfN9j8Kom0n8dTTVpo+yb1B
 560MXros3cz6N5Rh1OzrE8e/mpm5qdqYbF+X1RlqahqAp/K8DzFDOz8l3iOwOVVqiPZtqjL69pLpA
 C4I7eJWQ==;
Received: from guillem by master.debian.org with local (Exim 4.92)
 (envelope-from <guillem@master.debian.org>)
 id 1lmTVo-0007jO-3I; Fri, 28 May 2021 03:50:16 +0000
Date: Fri, 28 May 2021 05:50:13 +0200
From: Guillem Jover <guillem@debian.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>, 980963@bugs.debian.org
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 linux-snps-arc@lists.infradead.org, Helmut Grohne <helmut@subdivi.de>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 debian-cross@lists.debian.org
Subject: Re: Bug#980963: dpkg: Please add ARC architecture
Message-ID: <YLBodXkvCmMgO+ia@thunder.hadrons.org>
Mail-Followup-To: Guillem Jover <guillem@debian.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, 980963@bugs.debian.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 linux-snps-arc@lists.infradead.org,
 Helmut Grohne <helmut@subdivi.de>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 debian-cross@lists.debian.org
References: <161152061283.11410.4872085138884291562.reportbug@abrodkin-5550.internal.synopsys.com>
 <161152061283.11410.4872085138884291562.reportbug@abrodkin-5550.internal.synopsys.com>
 <YEDm3/c3h4lW7jjK@thunder.hadrons.org>
 <f6ff72c8-46d0-db07-a741-fc9fa37f899b@synopsys.com>
 <6ca2d929-60d3-3846-876b-3b62dba635c0@synopsys.com>
 <161152061283.11410.4872085138884291562.reportbug@abrodkin-5550.internal.synopsys.com>
 <4e8dbf4f-5e91-778f-7139-19a13e49ae4a@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="5aHUd/bkRAVT9TX9"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e8dbf4f-5e91-778f-7139-19a13e49ae4a@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_205027_797079_607FF927 
X-CRM114-Status: GOOD (  48.20  )
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
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


--5aHUd/bkRAVT9TX9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi!

On Mon, 2021-05-24 at 20:41:23 +0000, Vineet Gupta wrote:
> On 3/26/21 10:39 AM, Vineet Gupta wrote:
> > On 3/4/21 3:56 PM, Vineet Gupta wrote:
> >>> Also just to make sure, the GNU triplets are:
> >>>
> >>>     arc-linux-gnu
> >>>     arceb-linux-gnu
> >>> No ABI modifiers (stuff like “eabi”) for the libc part (“gnu“) right?
> >> Actually it seems we are missing hardfloat here: ARC glibc/gcc support
> >> it very well and should be default for any reasonable performance.
> >>
> >> So I think we should add
> >>      arc-linux-gnuhf
> >>      arceb-linux-gnuhf
> >>
> >> BTW I have oce question: where does one select what default toggles to
> >> build the entire software stack with (say -mcpu etc). Does this rely
> >> on toolchain driver default to DRTH. One of my problems with
> >> rebootstrap was gcc driver defaulting to our legacy cpu. I've cured it
> >> there (and planning to upstream the gcc driver patch).

> > So here's the lay of the land, apologies for the long email, and if
> > some/most of below is not directly relevant to dpkg bug, but I'll
> > provide the background so we are all on same page.
> >
> > We've had 3 revisions of the ISA and ensuing multiple processors in last
> > 15 years:
> >
> > ISA                 Implementations/Processors (Linux capable)
> > ------ ---------------------------------------------------------------
> > ARCompact    ARC700
> > ARCv2            HS38x/HS48x
> > ARCv3:32-bit  HS58MP
> > ARCv3:64-bit  HS68MP
> >
> > - ARCompact is legacy and no new development needed including debian port.
> > - Code for one ISA is not compatible with priors, mainly due to addition
> > of new instructions. In fact given the configurability of the ISA itself
> > (for better or worse), one could end up 2 non-compatible variants of
> > same ISA (think double load/store instructions in ARCv2). But the port
> > can assume the all encompassing super-set of the ISA as baseline.
> > - ARCv3 is currently under development / pre-production but should be
> > kept in mind as it is knocking on the door already.
> >
> > In terms of the ABI critical flavors: there's little/big endian and
> > soft/hard-float.
> > - Again big endian debian is not needed - mainly because of number of
> > customer engagements and resourcing needed to support it
> > - ARCv2 hard-float ABI is same as soft - FPU shares the same register
> > file so the calling conventions are same. However the triplet is
> > different arc-linux-gnuhf [1] as libraries for hard won't run on a
> > soft-float system due to lack of emulation etc.
> > - ARCv3 does have a dedicated FP register file so there's soft and hard ABIs
> >
> > So given all of this, I'd like to propose ARCv2 port with hard-float as
> > baseline. We don't bother with Big-endian. A soft-float would be
> > desirable for debugging and fall-back but not necessary from feature pov.
> >
> > I'm open to port names as maintainers feel appropriate - but stick with
> > current triplets arc-gnu-linux / arc-gnu-linuxhf for ARCv2.
> > For ARCv3, we could have arc64* / arc32*
> >
> > Please let me know if this makes sense.
> >
> > Once we agree, we can start off with requesting changes to GNU config
> > project.
> 
> Further to my msg on IRC, we've gotten pretty far along with ARC 
> rebootstrap [1]. It seems to build 151 packages before failing for perl 
> and I see similar outcome for riscv64 (which is weird as perl should be 
> supported there.
> 
> Anyhow this is just a polite ping to make some progress on ARC.

I discussed this today with Vineet on IRC in #debian-bootstrap, to try
to clarify some things, and this is the summary I think:

* ARCv2 32-bit little-endian

  - The arch based on ARCv2 32-bit is going to be little-endian, and
    ideally will be hard-float, but that's pending on a patch for gcc,
    to flip the default from soft-float. From what I understand while
    hard and soft-float are ABI compatible in the ISA and calling
    convention sense, they are not ABI compatible in the object
    linking sense, and while I guess this could also perhaps be lifted,
    it's not currently the case. My concern is that adding the support
    before the default has been switched might mean "ABI incompatible"
    architectures if we cannot link objects. Vineet, mentioned that
    they might be fine settling with soft-float in that case, even
    with the performance penalty implied (in that case, personally I
    think adding the -gnuhf triplet would be better, but I'd not be
    going to be doing the work, so… :). The patch is supposed to be
    sent upstream around next week or so. I'd prefer to wait what
    ends up happening there, TBH, before committing the support to
    dpkg. As I've mentioned I'm fine with committing it once it hits
    upstream git though.
  - The triplet would be «arc-linux-gnu», the Debian architecture
    would be «arc».

* ARCv3 32/64-bit little-endian

  - These are still in the works, but there's already a GNU triplet
    «arc64-linux-gnu» in GNU config for the 64-bit CPU, the idea is
    for the 32-bit one to use «arc32-linux-gnu».
  - To avoid confusion we discussed that it might make sense to use
    as Debian arch names arc32v3 and arc64v3, to distinguish it
    clearly from the ARCv2 arch, following the existing pattern in
    MIPS r6. Otherwise placing the bitness after the ISA version makes
    for an even more confusing name.
  - This can be proposed for addition once the upstream toolchain has
    support for it, but given that the overall architectures have been
    clarified now, that should then be swift.

I'm attaching the tentative patch for the «arc» arch.

Thanks,
Guillem

--5aHUd/bkRAVT9TX9
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-arch-Add-support-for-ARC-CPU.patch"
Content-Transfer-Encoding: quoted-printable

=46rom d55d11080e8e8d0f4b6d832d4020787c42ba9943 Mon Sep 17 00:00:00 2001
=46rom: Guillem Jover <guillem@debian.org>
Date: Fri, 28 May 2021 04:07:49 +0200
Subject: [PATCH] arch: Add support for ARC CPU

This is based on the ARCv2 32-bit little-endian hard-float ISA.

Closes: #980963
Based-on-patch-by: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
---
 data/cputable         | 1 +
 scripts/t/Dpkg_Arch.t | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/data/cputable b/data/cputable
index 05d2a44b2..b25b97211 100644
--- a/data/cputable
+++ b/data/cputable
@@ -22,6 +22,7 @@ i386		i686		(i[34567]86|pentium)	32	little
 ia64		ia64		ia64			64	little
 alpha		alpha		alpha.*			64	little
 amd64		x86_64		(amd64|x86_64)		64	little
+arc		arc		arc			32	little
 armeb		armeb		arm.*b			32	big
 arm		arm		arm.*			32	little
 arm64		aarch64		aarch64			64	little
diff --git a/scripts/t/Dpkg_Arch.t b/scripts/t/Dpkg_Arch.t
index 4f26778aa..be83dc2eb 100644
--- a/scripts/t/Dpkg_Arch.t
+++ b/scripts/t/Dpkg_Arch.t
@@ -16,7 +16,7 @@
 use strict;
 use warnings;
=20
-use Test::More tests =3D> 17914;
+use Test::More tests =3D> 18407;
=20
 use_ok('Dpkg::Arch', qw(debarch_to_debtuple debarch_to_multiarch
                         debarch_eq debarch_is debarch_is_wildcard
@@ -187,7 +187,7 @@ foreach my $arch (@valid_arches) {
               "bijective triplet $triplet to tuple @tuple");
 }
=20
-is(scalar @valid_arches, 539, 'expected amount of known architectures');
+is(scalar @valid_arches, 554, 'expected amount of known architectures');
=20
 {
     local $ENV{CC} =3D 'false';
--=20
2.32.0.rc0.200.g928e72b83f


--5aHUd/bkRAVT9TX9
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--5aHUd/bkRAVT9TX9--

