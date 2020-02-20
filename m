Return-Path: <SRS0=2k9h=4I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF478C11D04
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 09:37:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C16FF2465D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 09:37:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SMbUmY7m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C16FF2465D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GjJApXcQsrNxnTZg6lxTnUwGs5BA73WkpkpW6cJBiIM=; b=SMbUmY7mwgCwj0kd5TiU6aMeE
	rHl0yKx8RBwDjVpmPrUk3rcQCXNrJ6yWnFBRXzXJrfz9IE+KGMPQsCPFldYYJB25MySqroygnbF5I
	cOpxMHzsKrfKKd+IDfNqpQXcTKvs/iYV8WZZziJ7WXwvmLaT1dt4V9eLMY/No9LHqQdWsoepP6P4a
	zUIxgiUEcBpjrkhVGpLT+BzeoGR2PeDXiFdXQcDlrImeGLXRXZuYxh25AOFv712AJz9Wvlp/EtSQo
	ALMEZgXmSFmKr8FqROUwVYdo9/NwxzshfxIsHPbpFnt7g3+XrVkT4pvFDQApKcOrx99CxVCFpqZ3J
	aosQ5ozSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4iH6-0001JJ-PV; Thu, 20 Feb 2020 09:37:40 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4iH3-0001IV-SE
 for linux-snps-arc@lists.infradead.org; Thu, 20 Feb 2020 09:37:40 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48NTyc6sQwz1qrLj;
 Thu, 20 Feb 2020 10:37:28 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48NTyc5RdJz1qyDw;
 Thu, 20 Feb 2020 10:37:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id BKqcWqRXRI8M; Thu, 20 Feb 2020 10:37:23 +0100 (CET)
X-Auth-Info: SU9Mza7MDc59WXYX32rSPOXZ6wuahFVk6kQksTCSEM4=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 20 Feb 2020 10:37:23 +0100 (CET)
Date: Thu, 20 Feb 2020 10:37:16 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
Message-ID: <20200220103716.2f526933@jawa>
In-Reply-To: <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
 <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
 <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
 <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_013738_215436_6906A377 
X-CRM114-Status: GOOD (  24.94  )
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
Content-Type: multipart/mixed; boundary="===============0683518373143996291=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============0683518373143996291==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/vC/vBq+bALgZT/lHUWWGW6G"; protocol="application/pgp-signature"

--Sig_/vC/vBq+bALgZT/lHUWWGW6G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

> On Thu, Feb 20, 2020 at 12:11 AM Lukasz Majewski <lukma@denx.de>
> wrote:
> > > On 2/14/20 2:39 PM, Alistair Francis wrote: =20
> > > > On Tue, Feb 11, 2020 at 5:30 PM Joseph Myers =20
> > > An the reason this all works on RISCV is that your kernel doesn't
> > > define __ARCH_WANT_STAT64 -> lacks __NR_statat64 and instead uses
> > > the statx call which does itemized copy and would work fine when
> > > copying from 32-bits time (in kernel) to 64-bits container in
> > > glibc. Is this is right understanding or am I missing something
> > > here.
> > >
> > > How do I build a latest RISCV 32-bit kernel + userland - do you
> > > have a buildroot branch somewhere that I can build / test with
> > > qemu ? =20
> >
> > Maybe a bit off topic - there is such QEMU and Yocto/OE based test
> > sandbox for ARM32:
> >
> > https://github.com/lmajewski/meta-y2038
> >
> > (the README provides steps for setup). =20
>=20
> (continuing off-topic, with debian-arm and Helmut on Cc)
>=20
> Would it be possible to take a snapshot of your glibc tree

The description of the status of Y2038 supporting glibc on ARM 32 can
be found here [1].

The most recent patches for Y2038 supporting glibc can be always found
in the 'y2038_edge' branch [2].

I also do have a 'warrior' based glibc branch [3], which is a bunch of
hacks to have glibc 2.29 Y2038 supporting. However, my policy now is
"upstream first" - so I would recommend adding any further glibc work
on top of [2].

> and
> start testing this out with debian-rebootstrap [1]?

I've been using OE/Yocto for testing as it allows building glibc
sources for x86_64, x86, x86-x32, arm32 (probably also for ppc32 and
mips - but not tested).

I'm able to use runqemu to test the built glibc with kernel 4.19, 5.1
(for armv7).
This qemu run system can be used to run-test glibc tests on ARM32 with
test-wrapper=3D'/opt/Y2038/glibc/src/scripts/cross-test-ssh.sh

Last but not least - OE/Yocto is used to provide BSP for embedded
systems, so I'm aligned with customers' needs.

However, I did not yet tried debian-rebootstrap. I will look if this
can be reused as well.

>=20
> Are there any glibc issues that prevent it from working correctly,

I think that the glibc wrappers for most important syscalls are now
converted.=20

What is missing:

- NTPL (threads)
- stat
- In-glibc test coverage when -D_TIME_BITS=3D64 is used. I do have
  some basic tests [4], but this may be not enough.

> aside from the exact ABI not being final yet?
>=20
>         Arnd
>=20
> [1] https://wiki.debian.org/HelmutGrohne/rebootstrap


Links:

[1] -
https://github.com/lmajewski/y2038_glibc/commit/4f72f695d1ac428fe945cd7d5e9=
5770180d4a7c1
[2] - https://github.com/lmajewski/y2038_glibc/commits/y2038_edge
[3] -
https://github.com/lmajewski/y2038_glibc/commits/Y2038-2.29-glibc-warrior-0=
1-08-2019

[4] - https://github.com/lmajewski/y2038-tests

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/vC/vBq+bALgZT/lHUWWGW6G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl5OU0wACgkQAR8vZIA0
zr0Ucgf/TjTitIITtlDJPyyILfY93C1oAK6IlQ5bKZbRnpC44Qrm+JU9CGi9iUit
pv8MteGoCyUIH8L9Aia/aUi0xLj+0WgSC+6dLoDpyqQ6kuniXjEeoZ1YeYBxEPzm
lNGx5346XXd1vOBzAnRIaAepfI8imkVE/g+wMr2cP8z6iOUw0slivR/ps4xmjOUy
hZdTW4gkAb4t37PaBr/TrT4S5+8lKQhdbn1ix4WDI+4CxLdCk8gckA+gT/y0Nj2y
LPAzyADc/KvfmLd1mkL1kZ4Z/JhvviNvDHtU+LvmmWuzxaOzhlKtRWpBrAz1wwRN
Z3PTBHVYYjBuZoOHcKyS8zcqhJKqpQ==
=pdIo
-----END PGP SIGNATURE-----

--Sig_/vC/vBq+bALgZT/lHUWWGW6G--


--===============0683518373143996291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============0683518373143996291==--

