Return-Path: <SRS0=XK7L=AT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E00C433E0
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jul 2020 06:59:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 437DF2075B
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jul 2020 06:59:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UAxjFQDa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 437DF2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qSZ34Z0y6M9WJDR6bPY+s8D4Oj9rVohn9/SWjc1BnCE=; b=UAxjFQDawOcxSpcIFBnk1Lqac
	D67Ggb7gqY6gU94izKSt7k2gJJNyd/nLFeHPmmnOIZjLEQK7WzinwG7ZzeRcbk5+BN9/0yG48U3pV
	0afv7rGOT4oo+LcBd7gvOOMOXnCtHceXqnA4QQo+V3DLHEyqbBrbacHvj5C0Zop4FmQIgb27+KSUK
	wDkRI4Var75VWc3/5JdYVG5LkHnL2RU0cWQaNvJVw1jdbkKkaIkaQD2JHsKQEBlfeR8awAEBUXn4m
	OUP9NRTfwsV7b/vjY+juWbqVvQqGB+mihm+82LBRftTm1sCrWUGf0o/31Lwj6gETwkJnkxjp3FwWt
	HWcAVrX3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jt42x-0007Dd-Jr; Wed, 08 Jul 2020 06:59:11 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jt42v-0007Cj-1O
 for linux-snps-arc@lists.infradead.org; Wed, 08 Jul 2020 06:59:10 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4B1qsk6kBSz1qrfw;
 Wed,  8 Jul 2020 08:59:06 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4B1qsk5bbNz1qqkL;
 Wed,  8 Jul 2020 08:59:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 3YMvZkC4YDuQ; Wed,  8 Jul 2020 08:59:04 +0200 (CEST)
X-Auth-Info: GUo1nTuGKCQdDv1OAlwdQi6PpsBNHg1/wZMNuxtqz8w=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  8 Jul 2020 08:59:04 +0200 (CEST)
Date: Wed, 8 Jul 2020 08:58:57 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH 1/3] y2038: linux: Provide __futimes64 implementation
Message-ID: <20200708085857.22f7568f@jawa>
In-Reply-To: <d93d6c50-92e7-65aa-9ee8-990c7a036ef3@synopsys.com>
References: <20200217131735.18180-1-lukma@denx.de>
 <20200217131735.18180-2-lukma@denx.de>
 <347a5a21-c308-4fae-5b80-34ee22fe8c78@synopsys.com>
 <20200707092120.071d5157@jawa>
 <d93d6c50-92e7-65aa-9ee8-990c7a036ef3@synopsys.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_025909_302624_534765BE 
X-CRM114-Status: GOOD (  22.92  )
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
Cc: Albert ARIBAUD <albert.aribaud@3adev.fr>,
 arcml <linux-snps-arc@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>
Content-Type: multipart/mixed; boundary="===============6252249288823227857=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============6252249288823227857==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/Wavn_vXgVP0tAos+t/n3CRm"; protocol="application/pgp-signature"

--Sig_/Wavn_vXgVP0tAos+t/n3CRm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vineet,

> On 7/7/20 12:21 AM, Lukasz Majewski wrote:
> >> ARC is 32-bit + TIMESIZE=3D=3D64 but the new code is not getting built
> >> (instead generic variant is). How do I override the generic fiel to
> >> be built instead ? =20
> > The futimes.c from sysdeps/unix/sysv/linux/ shall be built.=20
> >=20
> > The futimes.c is defined in following locations:
> > y2038-glibc/misc
> > y2038-glibc/sysdeps/unix/sysv/linux
> > y2038-glibc/sysdeps/mach/hurd
> >=20
> > The first one is a stub. The last one is for hurd.
> > ARC shall use the middle one as well. =20
>=20
> It seems I mixed up the various *utime* files.
> Following are currently building for ARC
>=20
> sysdeps/unix/sysv/linux/generic/futimesat.c
> sysdeps/unix/sysv/linux/generic/utimes.c    #2
>=20
> sysdeps/unix/sysv/linux/futimes.c
> sysdeps/unix/sysv/linux/futimens.c
> sysdeps/unix/sysv/linux/utimensat.c
>=20
> The issue is generic/utimes.c
>=20
> Is that the right file to build. If yes then it needs fixing as it
> expects __NR_utimensat (and thus require the aliasing hack in ARC
> sysdep.h)
>=20
> #define __NR_utimensat		__NR_utimensat_time6
>=20
> P.S. I know glibc wiki has a bunch of pages (from Arnd?) for the
> y2038 support.=20

This wiki page was developed by Albert Aribaud and shall give you a
grasp about the work needed for Y2038 conversion.

However, it is now outdated as we already made some progress.

The most accurate list of supported/converted syscalls can be found
here:
https://github.com/lmajewski/y2038_glibc/commit/b94a7f1126dc5bd652ba3a85675=
3e85e48a6e845

and the most up to date development branch for Y2038 conversion:
https://github.com/lmajewski/y2038_glibc/commits/y2038_edge

(I've sent yesterday a patch series to convert futex to futex_time64).

> Are there other (newer) docs which explain the whole
> song and dance or is it the usual RTFC.
>=20
> > When I'm in doubt (or when for example code is auto generated to
> > wrap a syscall) I do use
> > https://github.com/lmajewski/meta-y2038/blob/master/README
> >=20
> > with gdb to check which function is called. Maybe it would help you
> > too? =20
>=20
> Yeah. I typically use build logs to see which exact file is built and
> then objdump to corroborate.

Ok.

>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/Wavn_vXgVP0tAos+t/n3CRm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl8FbrEACgkQAR8vZIA0
zr15wggA4gWQXtg1MTaKJWth4w7sJ1M//kpSItiV+jpJJvT+7Px7I5ws47H2zwVB
glDFsJC9dwW2bQyPM0eCNIq2bmCzfztZS5fcLDIGVKvI4p97uydyGvJ9AEqAMrIR
qXNy9e4MsZxdthG8Qh2SIcOqf3rf9oi81qq1AotljyoqMwV7qF8nOg61+Zm6C8DA
tZVois1oGusYQ7CbCAHBCd7t9NGYHLvD/uf4iAklzsqfD0laiXOz+HSqLEFFeXuI
PAV8Y1dZqWk+hT8djvOjIw1E1DpyJ5clNWLaFfutHR0LwWk1DKCqbxDq5vEH3spg
/yZewZEznhmN7KtqMh2ZtMludq/kDQ==
=9jK9
-----END PGP SIGNATURE-----

--Sig_/Wavn_vXgVP0tAos+t/n3CRm--


--===============6252249288823227857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============6252249288823227857==--

