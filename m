Return-Path: <SRS0=t4uf=4H=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13E1C5ACC4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2020 23:11:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A093B208C4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2020 23:11:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B2RBezvy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A093B208C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bNmdPCj5BND0SteGW4awLjxtO69BZ72q4TqMPHE3vq4=; b=B2RBezvy+xf4ZgQ6VcrsNk3bz
	xM0b7YjJicB3V0+BB4XWsTzvFAXS1mNVvtQkeL7yqI1vdTwLWJwFBI2AajUAPJLbqUHTHI5U4VI5a
	EIZbVso5OWFr6wxIFoMqUCeG1390swyw/xBZd9O1uIgZsA1TR6rltD77mn7yXy95VS6ep/9TMK6Tv
	aBgTYUE78PJdLiErhkHmGbPa4vM5dMFffzXPYOs5pdZu5cWar1SLnz+xVx4QvZZTzS2T9VV+0INhJ
	wvtsgzO8h9g8lZsf55nah9RqU/a5Fb4ed/u3XKZ0M7rnmTJ2AxQAV2QYqfzf5Q7tDkd3EKpK2urml
	6ryD2Zw+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4YVN-00068y-8J; Wed, 19 Feb 2020 23:11:45 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4YVJ-00068V-KZ
 for linux-snps-arc@lists.infradead.org; Wed, 19 Feb 2020 23:11:43 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48ND4W5kNHz1qqkb;
 Thu, 20 Feb 2020 00:11:39 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48ND4W4XM8z1qyDX;
 Thu, 20 Feb 2020 00:11:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 7eEe3U-EHCz8; Thu, 20 Feb 2020 00:11:37 +0100 (CET)
X-Auth-Info: 0o5sB6RE4L9wtE2eKyjDF9dAGmH8cavT92qfgeRvg34=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 20 Feb 2020 00:11:37 +0100 (CET)
Date: Thu, 20 Feb 2020 00:11:36 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
Message-ID: <20200220001136.2f14236e@jawa>
In-Reply-To: <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
 <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
 <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_151141_983353_45366B57 
X-CRM114-Status: GOOD (  27.59  )
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
Cc: Florian Weimer <fweimer@redhat.com>,
 GNU C Library <libc-alpha@sourceware.org>, Arnd Bergmann <arnd@arndb.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Zong Li <zongbox@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "Maciej W. Rozycki" <macro@wdc.com>, Alistair Francis <alistair23@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Joseph Myers <joseph@codesourcery.com>
Content-Type: multipart/mixed; boundary="===============3637025437107586711=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============3637025437107586711==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/n3p10OblihJaNJjS38Aq6Ll"; protocol="application/pgp-signature"

--Sig_/n3p10OblihJaNJjS38Aq6Ll
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Vineet,

> Hi Alistair, Arnd
>=20
> On 2/14/20 2:39 PM, Alistair Francis wrote:
> > On Tue, Feb 11, 2020 at 5:30 PM Joseph Myers
> > <joseph@codesourcery.com> wrote: =20
> >> On Tue, 11 Feb 2020, Alistair Francis wrote:
> >> =20
> >>>>> diff --git a/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h
> >>>>> b/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h new file mode
> >>>>> 100644 index 0000000000..0da3bdeb5d
> >>>>> --- /dev/null
> >>>>> +++ b/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h =20
> >>>> I was hoping newer arches could simply use the asm-generic one ?
> >>>> =20
> >>> We need to specify that RV32 uses a 64-bit time_t. The generic
> >>> ones don't do that for 32-bit arches. =20
> >> Since it seems we'd like future 32-bit ports of glibc to use
> >> 64-bit time and offsets, we should make that as easy as possible.
> >>
> >> That is, you need an RISC-V-specific bits/timesize.h.  But you
> >> shouldn't need an RISC-V-specific bits/typesizes.h - rather, make
> >> the linux/generic one do the right thing for __TIME_T_TYPE based
> >> on bits/timesize.h.  And have some other header that 32-bit
> >> linux/generic ports can use to say whether they use the 64-bit
> >> offset/stat/statfs interface, that bits/typesizes.h can use
> >> together with its existing __LP64__ check, and make the
> >> definitions of __OFF_T_TYPE etc. check that as well, and then you
> >> shouldn't need an RISC-V-specific bits/typesizes.h - the
> >> RISC-V-specific headers should be strictly minimal.  (No
> >> architecture-specific bits/time64.h headers should be needed in
> >> any case.) =20
> > Ok, I have updated this. I'll send the patch once my "Always use
> > 32-bit time_t for certain syscalls" series is in (the headers are
> > changed in that series). =20
>=20
> I guess you haven't pushed changes yet, which don't make full copy of
> typesizes.h ?
>=20
> Anyhow I have a version based on your prior next branch where I
> switched ARC to 64-bit time_t - things work fine in general but I see
> some additional failures with the testsuite.
>=20
> Consider io/test-stat2.c which calls stat() and stat64() and compares
> the results: it now fails for ctime mismatch
>=20
> | ...
> | st_atime: [72] 644245094405576070 vs [72] 644245094405576070=C2=A0 OK
> | st_mtime: [88] 1975684956160000000 vs [88] 1975684956160000000=C2=A0 OK
> | st_ctime: [104] 0 vs [104] 2306351876938924035=C2=A0 FAIL
>=20
>=20
> In kernel asm-generic stat64 has 32-bit ctime (secs)
>=20
> =C2=A0=C2=A0=C2=A0 struct stat64 {
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 int=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
_atime;=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 <-- offset =
72
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 unsigned int=C2=A0=C2=A0=C2=A0 st_a=
time_nsec;
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 int=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
_mtime;=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 <-- offset =
*80*
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 unsigned int=C2=A0=C2=A0=C2=A0 st_m=
time_nsec;
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 int=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
_ctime;=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 <-- offset =
92
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 unsigned int=C2=A0=C2=A0=C2=A0 st_c=
time_nsec;
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 };
>=20
> In glibc, we have 64-bit time_t based timestamps so the structure
> diverges with kernel counterpart from time fields onwards.
>=20
> =C2=A0=C2=A0=C2=A0 __extension__ typedef __int64_t __time_t;=C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0 <-- ARC switched
> to 64-bit time_t
>=20
> =C2=A0=C2=A0=C2=A0 struct timespec
> =C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0 =C2=A0 __time_t tv_sec;=C2=A0=C2=A0=C2=A0 <-- 8
> =C2=A0=C2=A0=C2=A0 =C2=A0 long int tv_nsec;=C2=A0=C2=A0=C2=A0 <-- 4
> =C2=A0=C2=A0=C2=A0 =C2=A0 int: 32;=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <-- 4
> =C2=A0=C2=A0=C2=A0 };
>=20
> =C2=A0=C2=A0=C2=A0 struct stat64
> =C2=A0=C2=A0=C2=A0 =C2=A0 {
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 struct timespec st_atim;=C2=A0=C2=
=A0=C2=A0 <-- offset 72
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 struct timespec st_mtim;=C2=A0=C2=
=A0=C2=A0 <-- offset *88*
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 struct timespec st_ctim;=C2=A0=C2=
=A0=C2=A0 <-- offset 104
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 int __glibc_reserved[2];
> =C2=A0=C2=A0=C2=A0 =C2=A0 };
>=20
> However glibc stat64()wrapper calls
> sysdeps/unix/sysv/linux/generic/wordsize-32/xstat64.c
>=20
> which for ARC is just doing a pass thru syscall because we do have
> __NR_fstatat64
> - hence the issues I see.
>=20
> It needs itemized copy
>=20
> =C2=A0=C2=A0=C2=A0 __xstat64 (int vers, const char *name, struct stat64 *=
buf)
> =C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0 #ifdef __NR_fstatat64
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 return INLINE_SYSCALL (fstat=
at64, 4, AT_FDCWD, name, buf,
> 0); #else
> =C2=A0=C2=A0=C2=A0 ....
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 int rc =3D INLINE_SYSCALL (s=
tatx, 5, AT_FDCWD, name,
> AT_NO_AUTOMOUNT, STATX_BASIC_STATS, &tmp);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __cp_stat64_statx (buf, &tmp);
> =C2=A0=C2=A0=C2=A0 #endif
>=20
> An the reason this all works on RISCV is that your kernel doesn't
> define __ARCH_WANT_STAT64 -> lacks __NR_statat64 and instead uses the
> statx call which does itemized copy and would work fine when copying
> from 32-bits time (in kernel) to 64-bits container in glibc. Is this
> is right understanding or am I missing something here.
>=20
> How do I build a latest RISCV 32-bit kernel + userland - do you have
> a buildroot branch somewhere that I can build / test with qemu ?

Maybe a bit off topic - there is such QEMU and Yocto/OE based test
sandbox for ARM32:

https://github.com/lmajewski/meta-y2038

(the README provides steps for setup).

>=20
> Thx,
> -Vineet
>=20
>=20
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/n3p10OblihJaNJjS38Aq6Ll
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl5NwKgACgkQAR8vZIA0
zr1NNwf/THhlVUrZMVNC9/JPyaFpDhJ+bvBSxQyXzrZARQmxZxlfCJFc22Af/eXc
LvW8MObbzONvU1wVw9Lbpab5WwijFSGCvBGv9ou+tjTekV6wJsZXPd70BDrQfvkc
XCwaktJyigVOMw7x//8WPfgv2D994lAhnqj9jeLlbWmUWiiPACA/GarBzeDwJHzQ
A8dzC03TF27/YUX3eqKFzwNHmt0kzAfa7oQ8qi/sPkuWH/kqSKOO82KGgKWf+hkq
oXZpcICGrlvcp/e5IVpz7kkR+Lcad72/X9KSNgTyhc1acL8zSf2GSuPGbiZKzzqS
jybStlfRwvxzQK2FcJ36PBAOtR00og==
=hp6T
-----END PGP SIGNATURE-----

--Sig_/n3p10OblihJaNJjS38Aq6Ll--


--===============3637025437107586711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============3637025437107586711==--

