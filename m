Return-Path: <SRS0=2k9h=4I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62780C11D04
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 13:15:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16C79206ED
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 13:15:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IPlASywH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16C79206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pr6sZj4WXPmzwZ7y7rpr8aKcwtVar0s6gli+8+bbXrY=; b=IPlASywHHXFdGlzfvYTKKoxnh
	Rc6wVdPDZvGbrOyd1cYRFNmv8xtNNQnwqQyus8VFYRflOU1o503Vt3ygvkOrV/97sDC/4ggF970ty
	A114/Ya13HtcUYIbLddOH/Q1nRFODSsqyWPcZX/wjUDv5itSY0d/wxdzhICTVBYaJNtsLrXRgPdY4
	8+YEP8+TpC8G5q5xDN6Kq9/T/ylcqQ0V1EubGIqcP033C9lY68T3DbXf1BpdSVzmJkIU5Q8SeVPb+
	g/+2xkvyRySeksI4RKPr+uwFMbkr58gdlAIs+z0bYKdgddcevxBwYn5RydJhdu+kSP4agic5BwF8E
	eJYzAngKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4lfZ-0000Rt-6B; Thu, 20 Feb 2020 13:15:09 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4lfV-0007sx-DU
 for linux-snps-arc@lists.infradead.org; Thu, 20 Feb 2020 13:15:07 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48NZnd3Gddz1qr48;
 Thu, 20 Feb 2020 14:15:01 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48NZnd1R45z1qyDx;
 Thu, 20 Feb 2020 14:15:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id V6OLNUCwAH-o; Thu, 20 Feb 2020 14:14:58 +0100 (CET)
X-Auth-Info: XwGyd8TN7S6Rh/QMS6nWUb+RDT4iTYtxpOAT4H+CbCk=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 20 Feb 2020 14:14:58 +0100 (CET)
Date: Thu, 20 Feb 2020 14:14:51 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
Message-ID: <20200220141451.3fa2fc3f@jawa>
In-Reply-To: <CAK8P3a1nte0nGMw8_aeS__iJsTvsSGYYuKivAYBdiGH-GjVGew@mail.gmail.com>
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
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_051505_769639_C28633A3 
X-CRM114-Status: GOOD (  31.95  )
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
Content-Type: multipart/mixed; boundary="===============3429467607507933061=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============3429467607507933061==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/.Lr44PqzF.BjZHvWSRoYEZo"; protocol="application/pgp-signature"

--Sig_/.Lr44PqzF.BjZHvWSRoYEZo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

> On Thu, Feb 20, 2020 at 10:37 AM Lukasz Majewski <lukma@denx.de>
> wrote:
> > > On Thu, Feb 20, 2020 at 12:11 AM Lukasz Majewski <lukma@denx.de>
> > >
> > > Would it be possible to take a snapshot of your glibc tree =20
> >
> > The description of the status of Y2038 supporting glibc on ARM 32
> > can be found here [1].
> >
> > The most recent patches for Y2038 supporting glibc can be always
> > found in the 'y2038_edge' branch [2]. =20
>=20
> Ok.
>=20
> > > and start testing this out with debian-rebootstrap [1]? =20
> >
> > I've been using OE/Yocto for testing as it allows building glibc
> > sources for x86_64, x86, x86-x32, arm32 (probably also for ppc32 and
> > mips - but not tested).
> >...
> > However, I did not yet tried debian-rebootstrap. I will look if this
> > can be reused as well. =20
>=20
> The reason I'm asking about debian-rebootstrap is less about testing
> glibc itself than about testing the rest of user space to figure out
> better what needs to be done when rebuilding with _TIME_BITS=3D64, and
> to start fixing more upstream packages, with the hope of having enough
> of it done in time for the Debian 11 release.

Ok. I see. Thanks for the information.

Validating the packages was one of the reasons to move from some custom
made test images/setup to Yocto/OE (as it is very close to customers
needs).

>=20
> > > Are there any glibc issues that prevent it from working
> > > correctly, =20
> >
> > I think that the glibc wrappers for most important syscalls are now
> > converted.
> >
> > What is missing:
> >
> > - NTPL (threads)
> > - stat =20
>=20
> Do you mean that code using these will fail to work correctly with
> -D_TIME_BITS=3D64 at the moment, or that the interfaces are there
> but they are not y2038 safe?=20

For ARM32 (branch [2]):

- Without -D_TIME_BITS=3D64 defined during compilation (as we do have
  now) the glibc is fully functional, but when you set date after
  03:14:08 UTC on 19.01.2038 you will see the date reset (to 1901) in
  the user space programs (after calling e.g. 'date').

- With -D_TIME_BITS=3D64 set during compilation - and using branch [2] -
  syscalls listed in [1] will provide correct date after Y2038 32 bit
  overflow. Other (i.e. not converted ones) will use overflow date (1901
  year). The glibc will also be fully functional up till Y2038 overflow.

> Without pthreads or stat, we probably
> wouldn't get too far in rebootstrap, but if the interfaces are there
> and mostly work, then we don't need to rely on them being
> y2038-safe just yet.

According to my above statement the second assumption is correct.

> An obvious next step would be to run the
> resulting code with the RTC set 20 years ahead, and that requires
> it all to work.

Yes. This is what I do for the test setup [3]. I do use
clock_settime syscall (now it is working correctly) or just 'date'
from user space.

>=20
> > - In-glibc test coverage when -D_TIME_BITS=3D64 is used. I do have
> >   some basic tests [4], but this may be not enough. =20
>=20
> This is probably something where debian-rebootstrap could help,
> as building and testing more user space packages will excercise
> additional code paths in glibc as well.=20

Yes this _could_ help. Do you have any tutorial/howto similar to one
from [4]?

I also think that some tests from debian-rebootstrap could be moved to
glibc test framework (test suite). For example tests for
clock_settime/gettime/nanosleep/ etc. In that way the
glibc-many-build.py would run those tests for all supported ports.

Then the debian-rebootstrap could test for more sophisticated bugs
(like dependencies between syscalls, etc).

> There is also some work
> in Linaro to ensure that LTP tests the low-level syscall interfaces
> in both the time32 and time64 variants.

Interesting. Is this work now publicly available?


>=20
>       Arnd

Links:=20

[1] -
https://github.com/lmajewski/y2038_glibc/commit/4f72f695d1ac428fe945cd7d5e9=
5770180d4a7c1
[2] - https://github.com/lmajewski/y2038_glibc/commits/y2038_edge
[3] - https://github.com/lmajewski/y2038-tests
[4] - https://github.com/lmajewski/meta-y2038/blob/master/README

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/.Lr44PqzF.BjZHvWSRoYEZo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl5OhksACgkQAR8vZIA0
zr2gTAf+JuLaN3cAoCJLs4ti/DWz7x0bhfRs8RnT84ngE3shi10/lvHZHb5DBNx6
B79cUxqKPVTRqp3+aF4cjwXbTIs3SWrHJK2cciYU1W8STu5B0Ge0NKMwHey5m5Ks
81dVBi+PJl2E9iDjQoTEgwqJA808oGP+dpu9QJZpVye9bhTxdS/jFeN/ddZ3yNsr
hs7kdtSYnBbfbkIk8yuPSIkFKWZSpzEVeDnNVVZlX7dYwzrb1DyAnHwqAhSYkT13
sC+kCiJf06lfKd4WI3kFEIKz0VsZ2uWNcgEID0nQyhFvl4qD6CSkTWwKEUUHXW16
/37pfVMA9KXPz1MVcaicyvVwIiExFA==
=jcs8
-----END PGP SIGNATURE-----

--Sig_/.Lr44PqzF.BjZHvWSRoYEZo--


--===============3429467607507933061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============3429467607507933061==--

