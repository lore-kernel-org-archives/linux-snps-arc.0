Return-Path: <SRS0=t4uf=4H=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E70D3C5ACC4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2020 23:18:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9786208C4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2020 23:18:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PqAiHUE6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9786208C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j2mjEchr+A7MU9yI9HDZM60ryUiwUgHmFq7wtgTvJsg=; b=PqAiHUE6EzCadtLgd32S/W+DE
	1w2pVOeMjKOhRRaJFtd5ASgl/2e1/qsX2YmzwGTVmPc8hzJVQWFFWa57j3mVxYlDHH7Gl62QFM+gR
	aNFha4dhHpUIvsiN42jhm7A4K3M54WZUK7Ni+8SuzBVPbXH/Bht3nnaNS6wF8xxZClpbkBZN7TXE8
	eJjdPW97CiJv27BU73tyjqi4e68rVPpaGsSwru7WTGe4zuOhvQOSv7cwkg+6gFWDk1nKxRSpqauOI
	wprkKxua5iuP/54yNwYwBQxNmLM7bEwiOYi0q6juVHPA79QK44QEelQ/Xsv8UcQYLU8VbVHl+1rzY
	aj/XjqLcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4Ybz-0008HE-Jc; Wed, 19 Feb 2020 23:18:35 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4Ybw-0008GN-AK
 for linux-snps-arc@lists.infradead.org; Wed, 19 Feb 2020 23:18:33 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48NDDK4Qc5z1rW5r;
 Thu, 20 Feb 2020 00:18:25 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48NDDK32N3z1qyDW;
 Thu, 20 Feb 2020 00:18:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id LVWOe2tBYFhT; Thu, 20 Feb 2020 00:18:23 +0100 (CET)
X-Auth-Info: /W5gyUFGBfrN+uahcxr3+UeS+ikCIuxuDL/0mgylJv8=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 20 Feb 2020 00:18:23 +0100 (CET)
Date: Thu, 20 Feb 2020 00:18:22 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [RFC v6 07/23] RISC-V: Use 64-bit time_t and off_t for RV32 and
 RV64
Message-ID: <20200220001822.703ee8a1@jawa>
In-Reply-To: <8239db87-d736-a6e2-913d-c1e5e937688f@synopsys.com>
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <67f2298c-30ab-1508-4a10-6ee285df7ad1@synopsys.com>
 <CAKmqyKO6u15cDbQQ644GrABi=6WWQsNLiCVLszrmDCdcWBnCPA@mail.gmail.com>
 <c9f11e9e-7c33-0000-e32c-346d425d7c69@synopsys.com>
 <mvmimk3567z.fsf@suse.de>
 <8239db87-d736-a6e2-913d-c1e5e937688f@synopsys.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_151832_656527_D71E9118 
X-CRM114-Status: GOOD (  15.02  )
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
 "arnd@arndb.de" <arnd@arndb.de>, Andreas Schwab <schwab@suse.de>,
 "palmerdabbelt@google.com" <palmerdabbelt@google.com>,
 "zongbox@gmail.com" <zongbox@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "adhemerval.zanella@linaro.org" <adhemerval.zanella@linaro.org>,
 "macro@wdc.com" <macro@wdc.com>, Alistair Francis <alistair23@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "joseph@codesourcery.com" <joseph@codesourcery.com>
Content-Type: multipart/mixed; boundary="===============2375597199625806001=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============2375597199625806001==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/aJiua_9CMNzKDHiPsMPKqM="; protocol="application/pgp-signature"

--Sig_/aJiua_9CMNzKDHiPsMPKqM=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vineet,

> On 2/19/20 12:30 AM, Andreas Schwab wrote:
> > On Feb 19 2020, Vineet Gupta wrote:
> >  =20
> >> On 2/18/20 5:03 PM, Alistair Francis wrote: =20
> >>>>> +#define STAT_IS_KERNEL_STAT 1 =20
> >>>> Isn't this irrelevant: seems to be only used for legacy
> >>>> __NR_stat/__NR_stat64 syscalls based__xstat()/__xstat64(). =20
> >>> Is it? It seems to be used in a few places, including:
> >>>
> >>> sysdeps/unix/sysv/linux/fxstatat.c
> >>> sysdeps/unix/sysv/linux/xstatconv.c =20
> >> AFAIK that is not part of the asm-generic syscall ABI which ARC,
> >> RISCV et al use ! =20
> >
> > The latter is still included by everyone, though. =20
>=20
> Correct, although it only builds a "dummy" struct for #ifdef
> STAT_IS_KERNEL_STAT i.e. for either values of this define - we might
> as well move that dummy out and make the rest of code ifndef.
>=20
> Rest of code in that function __xstat_conv is not meant for
> asm-generic syscall ABI  anyways.

Please keep in mind that there are some architectures (like 32 bit
ARM), which are NOT using asm-generic API.

Those archs also require support for 64 bit time. That is why Alistair
put the [sg]etitimer conversion code into sysdeps/unix/sysv/linux/
directory.

In that way all eligible archs could reuse the same conversion code.

>=20
> Thx,
> -Vineet
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/aJiua_9CMNzKDHiPsMPKqM=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl5Nwj4ACgkQAR8vZIA0
zr0zbAgAinfNBTnVw6Kamf+VlVbQJhsAfyjv1Dl7l5CNRQsXe7c/kRgu4c6BWoj7
Z9WV7veB09TSlkxCrsuxFrDyG+Bnxp5t0KR13z/YyK0EgKtG7Z6rwAc6/xwQZ87Z
+Zg3TIaVSYnqiqyypdiZZxxhy6tD8LZmr3lAOsibzRunI2O1zPWwYhWO4fityWTQ
sv74JAIw3IDEJIxt0NB3ub91QPqu0UAGRsMu/maCN0bAQaHkoCaLyw6OMH++lnnv
aisgn2YP+EJwA811fm8dUVEPSc5UfeWNllq8AGUke9uc/3t8iyB1VH5NjAHtDCiC
eeX78wDvwDqXgknccscnttrxyrE0DA==
=wDor
-----END PGP SIGNATURE-----

--Sig_/aJiua_9CMNzKDHiPsMPKqM=--


--===============2375597199625806001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============2375597199625806001==--

