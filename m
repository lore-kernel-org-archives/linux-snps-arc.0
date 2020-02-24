Return-Path: <SRS0=ka13=4M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B54C35679
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 09:01:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B18E42080D
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 09:01:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cnE13HOs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B18E42080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JBQTVwRbLk4QSqvSIhmv0k8rpt1N8uI4bGTkJfjR9aQ=; b=cnE13HOsOG0ZBd8BbEh2a1WEZ
	y8LR0ASzCjggvSUK4XzfMYTs0SlshHvJiJz11+zfspMEwS2Ph9G2qdoaBBCHwkJrGgztVGxZdcSZb
	FMfzLc3ZtutEEEVYCBeqN5548Qn31l14Wwyc/HZHg+DgH5yqbT2DBoYCoXodNYmRRqvSN4OtHWjio
	DYQJcBx6fYe1WjIGY4yLu51317OJ/SLMRrfvByOkfSHQCc1J6RO/ZyMpb7x9L+MJGHCkpfhiWPwhj
	pW0RtXUILDJdNrRKnv/0Ze9xox5/DwgtYq9neHbvVLMxF5Mu6K3WVXiwvYU4jrvlNQTif1Z+Yk9ls
	KZSq4AZTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j69by-0007QR-T6; Mon, 24 Feb 2020 09:01:10 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j69bv-0007L4-8e
 for linux-snps-arc@lists.infradead.org; Mon, 24 Feb 2020 09:01:09 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48Qwyj4fxJz1rfc9;
 Mon, 24 Feb 2020 10:01:01 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48Qwyj1q9fz1qwyW;
 Mon, 24 Feb 2020 10:01:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id TwBJSzeXKw1t; Mon, 24 Feb 2020 10:00:58 +0100 (CET)
X-Auth-Info: ZyneIAVNBnTjgMEgMOezmMppMUHtZDIOyq4x54mtpwI=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 24 Feb 2020 10:00:58 +0100 (CET)
Date: Mon, 24 Feb 2020 10:00:51 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
Message-ID: <20200224100051.2511d797@jawa>
In-Reply-To: <CAK8P3a2n6fRm4C5Ywyk5ys92jSOAc5SwvBVZyFOY9=4rB2pyjw@mail.gmail.com>
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
 <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
 <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
 <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
 <20200220103716.2f526933@jawa>
 <CAK8P3a2n6fRm4C5Ywyk5ys92jSOAc5SwvBVZyFOY9=4rB2pyjw@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_010107_609778_10A61A4B 
X-CRM114-Status: GOOD (  16.85  )
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
Cc: Florian Weimer <fweimer@redhat.com>, Helmut Grohne <helmutg@debian.org>,
 GNU C Library <libc-alpha@sourceware.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Zong Li <zongbox@gmail.com>,
 debian-arm@lists.debian.org, Alistair Francis <alistair.francis@wdc.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "Maciej W. Rozycki" <macro@wdc.com>, Alistair Francis <alistair23@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Joseph Myers <joseph@codesourcery.com>
Content-Type: multipart/mixed; boundary="===============2976245858146241525=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============2976245858146241525==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/D8PnkI3kStRGbZd2r3hfsDY"; protocol="application/pgp-signature"

--Sig_/D8PnkI3kStRGbZd2r3hfsDY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

> On Thu, Feb 20, 2020 at 10:37 AM Lukasz Majewski <lukma@denx.de>
> wrote:
>=20
> > [2] - https://github.com/lmajewski/y2038_glibc/commits/y2038_edge =20
>=20
> I tried packaging this into a .deb package for use with rebootstrap,
> but ran into a couple of test failures from glibc itself, when
> testing the i386 version while running on an older x86_64 kernel
> (4.15):

Thanks for testing. I do use 4.19 as the oldest kernel.

>=20
> +---------------------------------------------------------------------+
> |     Encountered regressions that don't match expected failures.
> |
> +---------------------------------------------------------------------+
> FAIL: elf/check-localplt FAIL: nptl/tst-cancel19
> FAIL: rt/tst-mqueue2
> make: *** [debian/rules.d/build.mk:116:
> /home/arnd/glibc-2.31/stamp-dir/check_i386] Error 1
>=20
> elf/check-localplt complains about the newly added symbols
>=20
> Extra PLT reference: libc.so: __lutimes64
> Extra PLT reference: libc.so: __wait4_time64
> Extra PLT reference: libc.so: __setitimer64
> Extra PLT reference: libc.so: __utime64
> Extra PLT reference: libc.so: __timerfd_gettime64
> Extra PLT reference: libc.so: __clock_settime64
> Extra PLT reference: libc.so: __utimes64
> Extra PLT reference: libc.so: __gettimeofday64
> Extra PLT reference: libc.so: __clock_gettime64
> Extra PLT reference: libc.so: __futimesat64
> Extra PLT reference: libc.so: __clock_getres64
> Extra PLT reference: libc.so: __futimes64
> Extra PLT reference: libc.so: __futimens64
> Extra PLT reference: libc.so: __utimensat64
> Extra PLT reference: libc.so: __getrusage64
> Extra PLT reference: libc.so: __timespec_get64
> Extra PLT reference: libc.so: __getitimer64
> Extra PLT reference: libc.so: __ppoll64
> Extra PLT reference: libc.so: __timerfd_settime64
> Extra PLT reference: libc.so: __clock_nanosleep_time64
> Extra PLT reference: libc.so: __sched_rr_get_interval64
> Extra PLT reference: libc.so: __settimeofday64
> Extra PLT reference: librt.so: __timer_gettime64
> Extra PLT reference: librt.so: __mq_timedreceive_time64
> Extra PLT reference: librt.so: __mq_timedsend_time64
> Extra PLT reference: librt.so: __timer_settime64
>=20

The above problems are somewhat expected. Those are redirected symbols,
which are exported as GLIBC_PRIVATE in several Versions files.

I do guess that we will have a consensus if we add those as a "normal"
exported symbols or keep them "private".

> which seems a bug in the test suite. The other two get a segfault
> that I have not debugged, but I guess this is likely a problem in your
> patches. Have you seen the same thing?

I only do run the full (including full test suite) glibc-many-build
(and my Y2038 tests) on the patches which I post to glibc-alpha.

The Y2038 changes I do test manually if they work as expected - but I
do not run yet the (full) test suites on it, as first _all_ glibc
functions needs to be converted before _TIME_BITS=3D64 is added.

The issue is probably with the redirection code. I will look on them
soon.

>=20
>        Arnd




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/D8PnkI3kStRGbZd2r3hfsDY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl5TkMMACgkQAR8vZIA0
zr3ThAf+NJxc3PKU8LyFtA+ReK0PUEZv6+0c7vjNwog9RUfY08qe4rsumGlgDP4f
RXeYhjvl+e38QlSlddDuW3USa3GxsxcEMrkwHyX9uLn/duFtQnQS3IDfHpN9kmGc
PPGJae2EVHvKsDggaZ209VUL1hjuLaANkZBUm+Pl1Ow/aAfXgrq1hEXtZi5AJpz+
Qi8K3ezsCFKIpTBeFQzBCDjV31v6TCQi0muoa/Y8QZ6Bn7Uj4RDiorcgrJwzpq4e
9PquxKPFsKFBDqSGJj5tivuIuiySGNR3dZ7nHdQcTB+IG4MMdjdaZ34Hc9XohXCx
/kh+Xjljpsoo+E6jr5LuWj7WDHZv0g==
=Z5M9
-----END PGP SIGNATURE-----

--Sig_/D8PnkI3kStRGbZd2r3hfsDY--


--===============2976245858146241525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============2976245858146241525==--

