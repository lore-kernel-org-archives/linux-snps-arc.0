Return-Path: <SRS0=t4uf=4H=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3935FC5ACC5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2020 23:10:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEE60208C4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2020 23:10:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DuuZqUH4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEE60208C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vNPWMnXqWdDeh/yaQYKLLmqZKveMKmoHgLPgIewfKJQ=; b=DuuZqUH4HKKLvMd2mHHWgIhcJ
	cvLfasCr0eX8DwscrNmAqYOl6OKm6XUlKaHyPde6TGd/CbFKqoI9mgW5h0iMaNLZaQMNPYC6WMAwX
	e7WGmtQYEW1VkwarOl1FZcQiVZ2B67JUYwi2dPegOGoTKVmGKr+h/RIqFWZweesbWG1zvpBBA7vgB
	xNUoFO4i0lqwNtwYz4WHV21DErRRMlGuuRZT/tvIicPekDZ2KRbymD1aMF0VXFS7U5d/ZpnL9y8SI
	o15rSnb095XPE60rVM/UxoXsosm7xzypQ0aRAcXREYsQLC69WChPQwr6dmTPJtIK4BmJbKxNJJqh8
	TwCMY5c3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4YTu-00060x-UN; Wed, 19 Feb 2020 23:10:14 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4YTr-0005np-OA
 for linux-snps-arc@lists.infradead.org; Wed, 19 Feb 2020 23:10:13 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48ND2j54KHz1qqkb;
 Thu, 20 Feb 2020 00:10:05 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48ND2j3lrlz1qyDZ;
 Thu, 20 Feb 2020 00:10:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id vqxYuQKz3Pfm; Thu, 20 Feb 2020 00:10:03 +0100 (CET)
X-Auth-Info: F9NhwbgANszRbk0fmaJCrAHQH/VM4Tib0WWsXOP5UxY=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 20 Feb 2020 00:10:02 +0100 (CET)
Date: Thu, 20 Feb 2020 00:09:55 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Joseph Myers <joseph@codesourcery.com>, Vineet Gupta
 <Vineet.Gupta1@synopsys.com>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
Message-ID: <20200220000955.1919c2d0@jawa>
In-Reply-To: <alpine.DEB.2.21.2002182310580.8620@digraph.polyomino.org.uk>
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
 <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
 <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <alpine.DEB.2.21.2002182310580.8620@digraph.polyomino.org.uk>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_151012_105095_83E34F0F 
X-CRM114-Status: GOOD (  13.60  )
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
 arcml <linux-snps-arc@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0482725143880685653=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============0482725143880685653==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/D8wqxqXWSmqcdQrutcs8_=2"; protocol="application/pgp-signature"

--Sig_/D8wqxqXWSmqcdQrutcs8_=2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Joseph, Vineet,

> On Tue, 18 Feb 2020, Vineet Gupta wrote:
>=20
> > An the reason this all works on RISCV is that your kernel doesn't
> > define __ARCH_WANT_STAT64 -> lacks __NR_statat64 and instead uses
> > the statx call which does itemized copy and would work fine when
> > copying from 32-bits time (in kernel) to 64-bits container in
> > glibc. Is this is right understanding or am I missing something
> > here. =20
>=20
> That looks right - so you'll need a way (e.g. a new macro in=20
> kernel_stat.h) to tell the stat implementations to use the statx path
> even though the older stat64 syscalls exist.
>=20

Similar issue is on ARM32 (armv7). It also uses stat instead of statx
(and also needs some conversion to 64 bit types). Potential conversion
patch could be reused on ARM32 as well.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/D8wqxqXWSmqcdQrutcs8_=2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl5NwEMACgkQAR8vZIA0
zr1JAggAxgsH62GYcMOMheRLfqHNohWVqo+BrH4LumW3IAZRTTqxLA4bRkNnZX6N
AykpVqZwcuUttcHehPTnq3Tsn3LM3pCa2cpYq0w8zfycuNwUOL/rxXfuG5hMPGmb
OlyzrMVwI+RWeDHTf+cba/PxYwUheS4cijkJwvPcaQTV899GhQwaBI8kmX9hYCx/
H7jkSAoCSVSuGQpzDbCNhis31iWb6Wv3Q1Iwm8Fvpo1qBWl6Y5bOLay5kSvYa9p/
g3eZJJFuc0sHFs44Z4AyHSEDvOx8ALxktS9GSy8iMGUCV7dqdxl5wJFvu1uBG5er
kmkYtbJpRi728ugkMNxZIhHc+ICDVw==
=cFAc
-----END PGP SIGNATURE-----

--Sig_/D8wqxqXWSmqcdQrutcs8_=2--


--===============0482725143880685653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============0482725143880685653==--

