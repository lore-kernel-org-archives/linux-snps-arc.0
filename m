Return-Path: <SRS0=2k9h=4I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38D3C11D04
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 10:29:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AB2420801
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 10:29:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q3SnKla/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AB2420801
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v9sTEcU6L9sVOgZiMMW23i0l0Vk9SU4e1/QkBYTJl6M=; b=Q3SnKla/acajO6MOx2DJ9QS/d
	27YFKIuqX049V9veFdvCE6TDusrgEU1fBLwfEeFgqYvB0DGw0QPoWJKCg0zgYptGeVpju5NrRXZxo
	BDAeomAYisv891TTCSVObVMUzJ/C+odDVJiboawhKtzLLvfV4Auuadtd5bLDX6CIkTtnlvIBDSQ2q
	WLllowwPCjLXCBMBl+FhX826l3BVah8Jdoii1Jt5G7g0UtfTAhnkymwfxBquJFjudZuqx+8GPg+ba
	LOmhsj1C/tvcT1MkG3W2uFlQODzOKcc1Xel9smRsngmSoj3IFCvOMp4gPn3vGO+cw7g+O2V1DkgZ+
	qkncAXVPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4j4o-0006uk-Cw; Thu, 20 Feb 2020 10:29:02 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4j4i-0006m7-I9
 for linux-snps-arc@lists.infradead.org; Thu, 20 Feb 2020 10:28:58 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48NW5w5VgJz1rgD3;
 Thu, 20 Feb 2020 11:28:52 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48NW5w44Htz1qqkR;
 Thu, 20 Feb 2020 11:28:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id EZY2-cdt1mnu; Thu, 20 Feb 2020 11:28:49 +0100 (CET)
X-Auth-Info: 1jE8h4agnCzOzuTh9gwANAXAa6udKRj2cqiUAMAuXWA=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 20 Feb 2020 11:28:49 +0100 (CET)
Date: Thu, 20 Feb 2020 11:28:43 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Arnd Bergmann <arnd@arndb.de>, Joseph Myers <joseph@codesourcery.com>
Subject: Re: [RFC v6 07/23] RISC-V: Use 64-bit time_t and off_t for RV32 and
 RV64
Message-ID: <20200220112843.76b8eb27@jawa>
In-Reply-To: <CAK8P3a3MTQf_fnEWiGVxzexZzYNQ34h29aNxH_YApmsVzY6OsA@mail.gmail.com>
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <67f2298c-30ab-1508-4a10-6ee285df7ad1@synopsys.com>
 <CAKmqyKO6u15cDbQQ644GrABi=6WWQsNLiCVLszrmDCdcWBnCPA@mail.gmail.com>
 <c9f11e9e-7c33-0000-e32c-346d425d7c69@synopsys.com>
 <mvmimk3567z.fsf@suse.de>
 <8239db87-d736-a6e2-913d-c1e5e937688f@synopsys.com>
 <20200220001822.703ee8a1@jawa>
 <de8f8e28-630f-7b87-1a96-6131588a0346@synopsys.com>
 <alpine.DEB.2.21.2002200044040.28780@digraph.polyomino.org.uk>
 <CAK8P3a3MTQf_fnEWiGVxzexZzYNQ34h29aNxH_YApmsVzY6OsA@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_022856_937757_EEDD37E0 
X-CRM114-Status: GOOD (  18.81  )
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
Cc: "fweimer@redhat.com" <fweimer@redhat.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 Andreas Schwab <schwab@suse.de>, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "palmerdabbelt@google.com" <palmerdabbelt@google.com>,
 "zongbox@gmail.com" <zongbox@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "adhemerval.zanella@linaro.org" <adhemerval.zanella@linaro.org>,
 "macro@wdc.com" <macro@wdc.com>, Alistair Francis <alistair23@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============5023704425012162662=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============5023704425012162662==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/xRVKA3tADcirkk8eefr5+cw"; protocol="application/pgp-signature"

--Sig_/xRVKA3tADcirkk8eefr5+cw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd, Joseph,

> On Thu, Feb 20, 2020 at 1:46 AM Joseph Myers
> <joseph@codesourcery.com> wrote:
> >
> > On Thu, 20 Feb 2020, Vineet Gupta wrote:
> > =20
> > > The first 4 will need more work as sym aliasing like
> > >       strong_alias (__xstat64, __xstat)
> > >
> > > will be needed in those ARM files (which in turn use i386). =20
> >
> > The situation for Arm is fundamentally different from that for ARC.
> >
> > For ARC, you only need a single public stat structure (using 64-bit
> > times and offsets).
> >
> > For Arm, a third public stat structure will need to be added
> > alongside the existing two, initially used internally in
> > 64-bit-time stat functions that aren't exported from glibc,
> > eventually to be used with _TIME_BITS=3D64 with the 64-bit-time stat
> > interfaces exported once all the _TIME_BITS=3D64 interfaces are
> > ready. =20
>=20
> But surely that structure layout would be the same on ARM and ARC
> as well as all other 32-bit architectures with _TIME_BITS=3D64, right?
>=20

For ARM32 stat case (current):

./io/stat.c -> __xstat -> ./sysdeps/unix/sysv/linux/xstat64.c
and then struct stat64 buf is filled by the kernel.



The generic idea (which requires converting
./sysdeps/unix/sysv/linux/xstat64.c) would be to use statx always in
glibc instead of stat* syscalls (as it is done in
sysdeps/unix/sysv/linux/generic/wordsize-32/xstat64.c)


To do that we do need in-glibc internal new type - namely struct
stat64_time64

which would have always:

__time64_t st_atime; (and st_mtime, st_ctime).

instead of=20

__time_t st_atime;

and also introduce __cp_stat64_time64_statx along with __cp_stat64_statx

as struct statx inherently support 64 bit time via struct
statx_timestamp even on 32 bit archs.


IMHO using statx as widely as possible in glibc is the easiest way to
convert stat* and friends functions to support Y2038.


> What's wrong with having a single implementation for the most
> recent set of stat syscalls, with the older variants being only
> compiled for architectures that need them to support _TIME_BITS=3D32
> and/or _FILE_OFFSET_BITS=3D32?
>=20
>         Arnd




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/xRVKA3tADcirkk8eefr5+cw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl5OX1sACgkQAR8vZIA0
zr3IxwgAnVS0DkKvOODxCVr9aE8q6Cx75gDY8srUrtoqbLKZmv2XLJL9HFIk2gn1
c7ecztUK+oZ51EVvsiSgvxEzPajDR/FLAebyccAasE7QYEiAVb/CekotjRemKVLo
ycLVWj1B+DZ+lDfIH5Qn6KIZXEVc/RS0hucxSgLwnIYSwaw2j8VzPgm/dQnkuAQ1
xH4+hW7yrO7pE1FJXdvbQbhHQnXywvfiVS6McxQOF2MjHoPvqcNRFG9XFQZpLWaI
+RK1vzi4im4nrYskNo0HISsAyPa08jSI8EjIVeoIy4ULrWo3AggQKaNLWWDvz4Ca
8GYPqh1oDLi2XHPbZ8GUwIo7H3cdlg==
=xflW
-----END PGP SIGNATURE-----

--Sig_/xRVKA3tADcirkk8eefr5+cw--


--===============5023704425012162662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============5023704425012162662==--

