Return-Path: <SRS0=6MfY=IC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3233CC433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Mar 2021 13:56:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A97E764E5F
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Mar 2021 13:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A97E764E5F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6J0adhZ6IN7ZS2inUpXMY8YPEa2VcuB/MyqUHKfwgrI=; b=bJ/tLekTac2Ahscf7218bU8Az
	C4/PkOhiWLWPi2fH1h9n3yhXjq5t8gOW+Eym3oox37LgojUPA9x+AnuTxmOEd+IeR91e9ya3zwGD0
	+zaz1S51Q99ehaINbOsZT4JDk+KCskMuE2fRBPNqJip/P2uA5OefTQ2lntL0m1uZEMgvhd7Z1eRca
	bhlenN6FOivZPMoyHzLOmuTtJ2v13AjlW588WsH7hrJRcpPSu1CRrMXHbkM5+nm5WRmac13ExC2AJ
	5kxHlpG5j+k18rgBPZ08dwur5uIzApVXh0rUMIHSXVIWfRZk3V7EEX+ImHnyYT7B83s+3C4Yd8fhQ
	WyqS46kFw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHoSM-008okd-Pr; Thu, 04 Mar 2021 13:55:58 +0000
Received: from master.debian.org ([2001:41b8:202:deb:216:36ff:fe40:4001])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHoSF-008oid-Kz
 for linux-snps-arc@lists.infradead.org; Thu, 04 Mar 2021 13:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org; 
 s=smtpauto.master;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-ID:Content-Description;
 bh=iRKMbGZ8eoUOQF/pqAzNbCSD93fWTTA20MfvSXne3yQ=; b=q6Nm4H2h/1mColfbFE63QWFfOk
 metxwa9R9vfIz5bF6QrLPvWjbeio9YWEHNZa6vqu+MBI+syby+yRhXni2KJcmYzJzxfVlSat+2965
 Kd7bxFNDy5zliis4BKVwqAwduF1jkkRAq7zwSbja4NuZXbrqv2L3Q1oTB+VPNNKJ6mnq+HMq6m2ky
 7VSccJQzdWhNFCLJUoyWuehOGTJsiPiHDJSuG4vEroPiOooqJSXC0Ilj++9qiHkwJn9b4tqrcqUTQ
 PNqaLUhhfUfxHld5q8DtjDlP9vMltW1gYqe/926R3G1XrMGckQqKowg+WWKVqr2HewGAE1DohKXly
 0Yu69C9A==;
Received: from guillem by master.debian.org with local (Exim 4.92)
 (envelope-from <guillem@master.debian.org>)
 id 1lHoS9-0007sa-5n; Thu, 04 Mar 2021 13:55:45 +0000
Date: Thu, 4 Mar 2021 14:55:43 +0100
From: Guillem Jover <guillem@debian.org>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, 980963@bugs.debian.org
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc <linux-snps-arc@lists.infradead.org>
Subject: Re: Bug#980963: dpkg: Please add ARC architecture
Message-ID: <YEDm3/c3h4lW7jjK@thunder.hadrons.org>
References: <161152061283.11410.4872085138884291562.reportbug@abrodkin-5550.internal.synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="yJmHD9zC4l7sxDmU"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <161152061283.11410.4872085138884291562.reportbug@abrodkin-5550.internal.synopsys.com>
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


--yJmHD9zC4l7sxDmU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi!

On Sun, 2021-01-24 at 23:36:52 +0300, Alexey Brodkin wrote:
> Package: dpkg
> Version: 1.19.7ubuntu3-1~202101232134~ubuntu20.04.1
> Severity: wishlist
> Tags: patch

> ARC architecture seem to match requirements for being added to the dpkg
> (https://wiki.debian.org/Teams/Dpkg/FAQ#Q._Can_we_add_support_for_new_dpkg_architectures.3F):
> 
>  * GNU triplet is there since 2013,
>    see: https://git.savannah.gnu.org/cgit/config.git/commit/?id=986360de6e412cbed27dbe2dbfb64ddbd18e7370
>  * Binutils, GCC & uClibc support ARC for many years now,
>    glibc 2.32 finally gained ARC support, see https://lists.gnu.org/archive/html/info-gnu/2020-08/msg00002.html 

Sorry, didn't reply up to now due to the freeze, this not looking
ready yet (as glibc is not even in Debian), but mostly because it
slipped my mind, but that kind of blocks progress on your side.
So let's see. :)

Or, were you looking to get this included for bullseye? (I think this
would not qualify, but, I think we might have done exceptions in such
cases in the past.)

Is the ABI fully stabilized now?

> >From 96523e18473b56743bf2f7d308c2d786f337e52e Mon Sep 17 00:00:00 2001
> From: Alexey Brodkin <abrodkin@synopsys.com>
> Date: Sun, 24 Jan 2021 00:34:52 +0300
> Subject: [PATCH] Add ARC architecture

> diff --git a/data/cputable b/data/cputable
> index 9f2a8e0e4..114a66ecb 100644
> --- a/data/cputable
> +++ b/data/cputable
> @@ -20,6 +20,8 @@ i386		i686		(i[34567]86|pentium)	32	little
>  ia64		ia64		ia64			64	little
>  alpha		alpha		alpha.*			64	little
>  amd64		x86_64		(amd64|x86_64)		64	little
> +arc		arc		arc.*			32	little
> +arceb		arc		arceb.*			32	big
>  armeb		armeb		arm.*b			32	big
>  arm		arm		arm.*			32	little
>  arm64		aarch64		aarch64			64	little

This looked incorrect, as it ends up not being a bijective relation,
so the lines need to be swapped. The problem is that the comments do
not explain this nor the test suite checks. So I improved both with the
attached patches, which I'll commit into master once I open it up for
1.21.x.

Also just to make sure, the GNU triplets are:

  arc-linux-gnu
  arceb-linux-gnu

No ABI modifiers (stuff like “eabi”) for the libc part (“gnu“) right?

Thanks,
Guillem

--yJmHD9zC4l7sxDmU
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-test-Add-unit-tests-for-architecture-bijective-mappi.patch"
Content-Transfer-Encoding: quoted-printable

=46rom f5cae4f8fc4ef67ec5e26dffeb3b3c540949f554 Mon Sep 17 00:00:00 2001
=46rom: Guillem Jover <guillem@debian.org>
Date: Mon, 25 Jan 2021 05:37:06 +0100
Subject: [PATCH] test: Add unit tests for architecture bijective mapping
 property

The architectures need to have the bijective property when converting
back and forth from the Debian arch name to the GNU triplet. Enforce
this in the test suite to make it easier to guarantee this when adding
new architectures to the tables.
---
 scripts/t/Dpkg_Arch.t | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/scripts/t/Dpkg_Arch.t b/scripts/t/Dpkg_Arch.t
index a3a9e6fee..4f26778aa 100644
--- a/scripts/t/Dpkg_Arch.t
+++ b/scripts/t/Dpkg_Arch.t
@@ -16,7 +16,7 @@
 use strict;
 use warnings;
=20
-use Test::More tests =3D> 16836;
+use Test::More tests =3D> 17914;
=20
 use_ok('Dpkg::Arch', qw(debarch_to_debtuple debarch_to_multiarch
                         debarch_eq debarch_is debarch_is_wildcard
@@ -24,9 +24,12 @@ use_ok('Dpkg::Arch', qw(debarch_to_debtuple debarch_to_m=
ultiarch
                         debarch_to_abiattrs debarch_to_cpubits
                         debarch_list_parse
                         debtuple_to_debarch gnutriplet_to_debarch
+                        debtuple_to_gnutriplet gnutriplet_to_debtuple
                         get_host_gnu_type
                         get_valid_arches));
=20
+my @valid_arches =3D get_valid_arches();
+
 sub get_valid_wildcards
 {
     my %wildcards;
@@ -37,7 +40,7 @@ sub get_valid_wildcards
         any-any-any-any
     );
=20
-    foreach my $archname (get_valid_arches()) {
+    foreach my $archname (@valid_arches) {
         my @tuple =3D debarch_to_debtuple($archname);
=20
         my @wildcards_arch =3D (
@@ -174,7 +177,17 @@ is(gnutriplet_to_debarch(undef), undef, 'undef gnutrip=
let');
 is(gnutriplet_to_debarch('unknown-unknown-unknown'), undef, 'unknown gnutr=
iplet');
 is(gnutriplet_to_debarch('x86_64-linux-gnu'), 'amd64', 'known gnutriplet');
=20
-is(scalar get_valid_arches(), 539, 'expected amount of known architectures=
');
+foreach my $arch (@valid_arches) {
+    my @tuple =3D debarch_to_debtuple($arch);
+    is(debtuple_to_debarch(@tuple), $arch,
+       "bijective arch $arch to tuple @tuple");
+
+    my $triplet =3D debtuple_to_gnutriplet(@tuple);
+    is_deeply([ gnutriplet_to_debtuple($triplet) ], \@tuple,
+              "bijective triplet $triplet to tuple @tuple");
+}
+
+is(scalar @valid_arches, 539, 'expected amount of known architectures');
=20
 {
     local $ENV{CC} =3D 'false';
--=20
2.30.1


--yJmHD9zC4l7sxDmU
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment;
	filename="0001-arch-Clarify-that-the-regex-columns-need-to-be-order.patch"
Content-Transfer-Encoding: quoted-printable

=46rom 06cf2888850c63c59bf75820d2b69159684e6ba3 Mon Sep 17 00:00:00 2001
=46rom: Guillem Jover <guillem@debian.org>
Date: Mon, 25 Jan 2021 05:41:00 +0100
Subject: [PATCH] arch: Clarify that the regex columns need to be ordered to
 match first

The entries are used in a first match order, so the regexes need to
be listed from most specific to less specific.
---
 data/cputable | 3 ++-
 data/ostable  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/data/cputable b/data/cputable
index 9f2a8e0e4..505641659 100644
--- a/data/cputable
+++ b/data/cputable
@@ -11,7 +11,8 @@
 # - Column 2 is the GNU name for the CPU, used to output build, host and
 #   target variables in =E2=80=98dpkg-architecture=E2=80=99.
 # - Column 3 is an extended regular expression used to match against the
-#   CPU part of the output of the GNU config.guess script.
+#   CPU part of the output of the GNU config.guess script. The order of
+#   this column is important as it is used in a first match basis.
 # - Column 4 is the size (in bits) of pointers.
 # - Column 5 is the endianness (byte ordering in numbers).
 #
diff --git a/data/ostable b/data/ostable
index 99c1f889d..055363bb9 100644
--- a/data/ostable
+++ b/data/ostable
@@ -11,7 +11,8 @@
 # - Column 2 is the GNU name for the system, used to output build, host and
 #   target variables in =E2=80=98dpkg-architecture=E2=80=99.
 # - Column 3 is an extended regular expression used to match against the
-#   system part of the output of the GNU config.guess script.
+#   system part of the output of the GNU config.guess script. The order of
+#   this column is important as it is used in a first match basis.
 #
 # <Debian name>		<GNU name>		<config.guess regex>
 eabi-uclibc-linux	linux-uclibceabi	linux[^-]*-uclibceabi
--=20
2.30.1


--yJmHD9zC4l7sxDmU
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--yJmHD9zC4l7sxDmU--

