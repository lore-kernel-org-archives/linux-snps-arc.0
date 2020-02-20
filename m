Return-Path: <SRS0=2k9h=4I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D17C11D05
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 15:42:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 393EA2071E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 15:42:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hhyp/7mw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 393EA2071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ocL5V/MWiPhEuJ2lYzcgXY1HGmxPdlZ3rn20U57re3E=; b=Hhyp/7mwyG+PlBVpZ60QPFqGP
	DoiMPXPR9zrSN2xqPSYdYmq5eq2fUniTfz+BD0vWUO6re6dhvynreIw8N1d6rOgNGjlFEEcrC5Yr/
	fXSzKXu02A8AAFrkJHLLr7XbF2Hlhes3F4+EaXsrQoBU10HPFwrNZpjmwVrrv/4Zqavm0V44lHS45
	yyzmeRsM1fE52bxU6RKvcPEK4yIGOvMXNkYYKuHai74j8Yvip5pOeceFwGYV+KI91pWKKrOv3Jp3e
	MSsOiajTNBzjezPC2S2Cd8qPKRJooPZUEKl2GrvxcA3X5WGrycW2vITVSRWnCgy661Y072vBwTfCT
	uavHHwf/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4nyb-0003Gq-Cc; Thu, 20 Feb 2020 15:42:57 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4nyX-0003G9-W5
 for linux-snps-arc@lists.infradead.org; Thu, 20 Feb 2020 15:42:55 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48Nf486w9Kz1rjYD;
 Thu, 20 Feb 2020 16:42:48 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48Nf485NMzz1qyF2;
 Thu, 20 Feb 2020 16:42:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id BpDHsdSaGXf5; Thu, 20 Feb 2020 16:42:46 +0100 (CET)
X-Auth-Info: zOQhyixsTwR8IiwRW2gdYJlthA+kRmB763Z/9yvLAOk=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 20 Feb 2020 16:42:46 +0100 (CET)
Date: Thu, 20 Feb 2020 16:42:45 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
Message-ID: <20200220164245.035e09b1@jawa>
In-Reply-To: <CAK8P3a2qLZBAuP-YT2=KZoP+V23TAKvw5W1_2t7rEr2RobLsWw@mail.gmail.com>
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
 <CAK8P3a1nte0nGMw8_aeS__iJsTvsSGYYuKivAYBdiGH-GjVGew@mail.gmail.com>
 <20200220141451.3fa2fc3f@jawa>
 <CAK8P3a2qLZBAuP-YT2=KZoP+V23TAKvw5W1_2t7rEr2RobLsWw@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_074254_329372_45E4C556 
X-CRM114-Status: GOOD (  27.07  )
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
 GNU C Library <libc-alpha@sourceware.org>, Viresh Kumar <vireshk@kernel.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Zong Li <zongbox@gmail.com>,
 debian-arm@lists.debian.org, Alistair Francis <alistair.francis@wdc.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "Maciej W. Rozycki" <macro@wdc.com>, Alistair Francis <alistair23@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Joseph Myers <joseph@codesourcery.com>
Content-Type: multipart/mixed; boundary="===============8890751723490408694=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============8890751723490408694==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/_+0U1ibXM/sUZ=ofsrj+8Gs"; protocol="application/pgp-signature"

--Sig_/_+0U1ibXM/sUZ=ofsrj+8Gs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

> On Thu, Feb 20, 2020 at 2:15 PM Lukasz Majewski <lukma@denx.de> wrote:
> > > On Thu, Feb 20, 2020 at 10:37 AM Lukasz Majewski <lukma@denx.de>
> > > wrote: =20
> > > > > On Thu, Feb 20, 2020 at 12:11 AM Lukasz Majewski
> > > > > <lukma@denx.de> Are there any glibc issues that prevent it
> > > > > from working correctly, =20
> > > >
> > > > I think that the glibc wrappers for most important syscalls are
> > > > now converted.
> > > >
> > > > What is missing:
> > > >
> > > > - NTPL (threads)
> > > > - stat =20
> > >
> > > Do you mean that code using these will fail to work correctly with
> > > -D_TIME_BITS=3D64 at the moment, or that the interfaces are there
> > > but they are not y2038 safe? =20
> >
> > For ARM32 (branch [2]):
> >
> > - Without -D_TIME_BITS=3D64 defined during compilation (as we do have
> >   now) the glibc is fully functional, but when you set date after
> >   03:14:08 UTC on 19.01.2038 you will see the date reset (to 1901)
> > in the user space programs (after calling e.g. 'date'). =20
>=20
> I'd actually consider intentionally breaking this for a Debian
> bootstrap, at least initially, so that any application that
> accidentally gets built without -D_TIME_BITS=3D64 runs into a build or
> link failure.

I do see two approaches here:

1. In glibc:

When -D_TIME_BITS=3D64 is set - redirections are enabled for syscall
wrappers; for example __clock_settime64 is used instead of
__clock_settime (e.g. sysdeps/unix/sysv/linux/clock_settime).

The latter is guarded by #ifdef __TIMESIZE !=3D 64 so we could change
mechanically that __clock_settime returns -1 and sets errno to -ENOTSUPP


2. In kernel - return -ENOTSUPP when clock_settime syscall instead of
clock_settime64 is invoked.

>=20
> > - With -D_TIME_BITS=3D64 set during compilation - and using branch
> > [2] - syscalls listed in [1] will provide correct date after Y2038
> > 32 bit overflow. Other (i.e. not converted ones) will use overflow
> > date (1901 year). The glibc will also be fully functional up till
> > Y2038 overflow. =20
>=20
> Ok.
>=20
> > > > - In-glibc test coverage when -D_TIME_BITS=3D64 is used. I do have
> > > >   some basic tests [4], but this may be not enough. =20
> > >
> > > This is probably something where debian-rebootstrap could help,
> > > as building and testing more user space packages will excercise
> > > additional code paths in glibc as well. =20
> >
> > Yes this _could_ help. Do you have any tutorial/howto similar to one
> > from [4]? =20
>=20
> Not sure, maybe Helmut has some references.
>=20
> > > There is also some work
> > > in Linaro to ensure that LTP tests the low-level syscall
> > > interfaces in both the time32 and time64 variants. =20
> >
> > Interesting. Is this work now publicly available? =20
>=20
> I think this is currently in the planning stage, but once patches
> are available, they would be posted to the ltp mailing list. Viresh
> should have more details on this.
>=20
>        Arnd




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/_+0U1ibXM/sUZ=ofsrj+8Gs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl5OqPUACgkQAR8vZIA0
zr0B8Af+Ift4OmCyXI/2bE2dkSxUJsyu4E2hxF4iciRrw07i4o98qEUxddFXGdVa
yqIjianmp7slzh6U13N6YufAKiBCMF2hqAOd7RTtjfz0cLeWJBxpNFIEwCXZ7a97
E7atBXWLy7SCQe54CiWPKMwQ491SML/cbT6l6IVjolIq/csu6sYvUg18X+u4Y1y6
ZgTKwGDXeBVWxCylyf8wvtdEqr8lFL2iquXSGdVfRCY8hBcBOiKTZEivJy4wkCNo
jiOR9JWf8b4AeEDFO8/C6ECjslTWRny6e/H5UGw7rdGRFo586MM3ZiaDSmvAvNRp
iN9lBNM0ehRlwZzvirpMGZkujd8LEw==
=xOfG
-----END PGP SIGNATURE-----

--Sig_/_+0U1ibXM/sUZ=ofsrj+8Gs--


--===============8890751723490408694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============8890751723490408694==--

