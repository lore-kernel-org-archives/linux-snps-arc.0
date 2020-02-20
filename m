Return-Path: <SRS0=2k9h=4I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA241C11D05
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 16:33:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACD69206F4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 16:33:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PISBijw3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACD69206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0Dd+UPvZ0YjxeDGZmmHpL2oYjxqf+LBpIPpBmrH1AB4=; b=PISBijw32vmFiyxI/iYlHZa+e
	oRjm7CO0Z3M/ii0s0Xs7/WAnr3VDyrO7IYog4fxudYYa7NsONkNHx4VP2ANKjnwPUDb5FPfu+8JXC
	NNzsQai2Uzmj/ADnDLlVZIdVehUO87coDZuqcGj0ifPtGTXMHkXxpPae5Mmsr4U+qhOXRD7yE2UlN
	1u9eSs2Sip1JmZQWA8UCwOpJeMrHFyxhEq6C/NtZm0cd6fc+myL4VTwWbVOVLAXi1uZdgehPDdLdw
	Uejq8yorkMOgb8+84hrmRC5U4lP+sjxVqCSLsOOMqbpbEhcFQFlKkNLtu30SH6nQpp4ZtOBfd7atr
	N75GsZqSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4olG-00027v-Mo; Thu, 20 Feb 2020 16:33:14 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4ojn-0000Pm-DG
 for linux-snps-arc@lists.infradead.org; Thu, 20 Feb 2020 16:31:47 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48Ng8Y3kCgz1rhwS;
 Thu, 20 Feb 2020 17:31:41 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48Ng8Y1jw9z1qyDx;
 Thu, 20 Feb 2020 17:31:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id klGPyEh0-yGg; Thu, 20 Feb 2020 17:31:39 +0100 (CET)
X-Auth-Info: St6I2udxrUGyOoWuaJbRBrYWa6p3CB7SDPScdUpuDq0=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 20 Feb 2020 17:31:39 +0100 (CET)
Date: Thu, 20 Feb 2020 17:31:32 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
Message-ID: <20200220173132.05f2fad5@jawa>
In-Reply-To: <CAK8P3a2vvuqzLQqrYkyyYBFATDjCpBuR2Zquu-xB2BWmc5GQWA@mail.gmail.com>
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
 <20200220164245.035e09b1@jawa>
 <CAK8P3a2vvuqzLQqrYkyyYBFATDjCpBuR2Zquu-xB2BWmc5GQWA@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_083143_783155_F4FDCA37 
X-CRM114-Status: GOOD (  19.58  )
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
Content-Type: multipart/mixed; boundary="===============5070217079447634866=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============5070217079447634866==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/+=e/DFIQan3L3=Q8ptHbIuT"; protocol="application/pgp-signature"

--Sig_/+=e/DFIQan3L3=Q8ptHbIuT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

> On Thu, Feb 20, 2020 at 4:42 PM Lukasz Majewski <lukma@denx.de> wrote:
> > > On Thu, Feb 20, 2020 at 2:15 PM Lukasz Majewski <lukma@denx.de>
> > > wrote: =20
>=20
> >
> > I do see two approaches here:
> >
> > 1. In glibc:
> >
> > When -D_TIME_BITS=3D64 is set - redirections are enabled for syscall
> > wrappers; for example __clock_settime64 is used instead of
> > __clock_settime (e.g. sysdeps/unix/sysv/linux/clock_settime).
> >
> > The latter is guarded by #ifdef __TIMESIZE !=3D 64 so we could change
> > mechanically that __clock_settime returns -1 and sets errno to
> > -ENOTSUPP =20
>=20
> What I meant is to remove the __clock_settime function from the
> library entirely to cause a link failure. I suppose replacing most
> "__TIMESIZE !=3D 64" with '0' would do that. Ideally I'd just set

I think that replacing "__TIMESIZE !=3D 64" with '0' would be the
simplest option.

> __TIMESIZE to 64, but doing that would make the ABI incompatible
> with mainline glibc.
>=20
> > 2. In kernel - return -ENOTSUPP when clock_settime syscall instead
> > of clock_settime64 is invoked. =20
>=20
> We already have that with CONFIG_COMPAT_32BIT_TIME, but
> at the moment I think that still breaks glibc's usage of __NR_futex,
> and a compile-time error is always better than a runtime error,
> as it's easier to catch them reliably

Ok.

>=20
>       Arnd




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/+=e/DFIQan3L3=Q8ptHbIuT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl5OtGQACgkQAR8vZIA0
zr0viQf9E8aL8VBwVoqe4ftHsu5FS1GjYziRDSqlJEWCGpNnIkzvErZC3tquiH44
53WCE1uUw8ogfNfBkDtCnCZAb2wdsL0NmZBNIXEZTeSYf105voFe52qGO8AjnO1J
PF1Mrh4HVyh0sxfeVro12v2axVIjO3fGqJGdABpkZ3VeFYAWjOcyKcqHKZeyTEhM
eNzfClydbg741Kw4wFEvayJu5XL75sOTNkIAmPeWtTgLWeo+yIISbhuO2eK1vwUi
xMxoSZUYUF/6ihamErS+JsEfuiqx2nwTHKfRSx3I5Ro+5kW+wSoiNefkcSyx2w9F
2xzzE7UlEEtVlQH7lIFEItoHcna5sg==
=/j/H
-----END PGP SIGNATURE-----

--Sig_/+=e/DFIQan3L3=Q8ptHbIuT--


--===============5070217079447634866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============5070217079447634866==--

