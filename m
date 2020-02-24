Return-Path: <SRS0=ka13=4M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F444C35679
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 10:14:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03B5720836
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 10:14:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tnci1Mvd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03B5720836
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tkuY9CFrUq346PR0GSzg30Qu6S4LsvNkothqfRvR4mY=; b=tnci1MvdAO23X0q1NwH8hFVK9
	7sZUrcbHNor6EzZJO6U1h+Mygjm6mYy/fTnkB4ClXOafEM54MIxlQi0MHdp/sE4u52Xr1DxDTtlMv
	kx6WYDT23dv08I48nHTqIMhLuoXEDIf99q9ClTLhxHhnSefb8Im49h3zRWuvJp2giECDfzSG0W4Tw
	ldEOzkuI/VM+O22NWPPmejnpBsoh8/BeIkvxOBM2MemgzAVK1boCJqZuHh9Le1IjsY3E1Gkyb+Y2o
	ZrUz8rsOrIAtqc73k5xPF4zFq3wAemelPqJAdqGpR4bEnGGNTUQdiuuVTXZMv5jBnpZ+vYfgoRdtt
	+H3LCIuBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6Al0-0003wj-PJ; Mon, 24 Feb 2020 10:14:34 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Akx-0003pK-DM
 for linux-snps-arc@lists.infradead.org; Mon, 24 Feb 2020 10:14:33 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48QybR1tVGz1qqkv;
 Mon, 24 Feb 2020 11:14:27 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48QybR0GD9z1qqkw;
 Mon, 24 Feb 2020 11:14:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id LxZhLG3r3IH7; Mon, 24 Feb 2020 11:14:25 +0100 (CET)
X-Auth-Info: tCU4saywbWe1WX2XJuJvyYdLg+ka0PyglMxFcGZXO84=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 24 Feb 2020 11:14:25 +0100 (CET)
Date: Mon, 24 Feb 2020 11:14:24 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Andreas Schwab <schwab@suse.de>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
Message-ID: <20200224111424.33759b2e@jawa>
In-Reply-To: <mvmpne4xqpb.fsf@suse.de>
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
 <20200224100051.2511d797@jawa> <mvmpne4xqpb.fsf@suse.de>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_021431_747614_6054CAB1 
X-CRM114-Status: GOOD (  13.72  )
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
 Palmer Dabbelt <palmerdabbelt@google.com>,
 GNU C Library <libc-alpha@sourceware.org>, Arnd Bergmann <arnd@arndb.de>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, Helmut Grohne <helmutg@debian.org>,
 Zong Li <zongbox@gmail.com>, debian-arm@lists.debian.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "Maciej W. Rozycki" <macro@wdc.com>, Alistair Francis <alistair23@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Joseph Myers <joseph@codesourcery.com>
Content-Type: multipart/mixed; boundary="===============5511310421586717311=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============5511310421586717311==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/EYcu8m7AvDRepTZ4+_kr/6N"; protocol="application/pgp-signature"

--Sig_/EYcu8m7AvDRepTZ4+_kr/6N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

> On Feb 24 2020, Lukasz Majewski wrote:
>=20
> >> elf/check-localplt complains about the newly added symbols
> >>=20
> >> Extra PLT reference: libc.so: __lutimes64
> >> Extra PLT reference: libc.so: __wait4_time64
> >> Extra PLT reference: libc.so: __setitimer64
> >> Extra PLT reference: libc.so: __utime64
> >> Extra PLT reference: libc.so: __timerfd_gettime64
> >> Extra PLT reference: libc.so: __clock_settime64
> >> Extra PLT reference: libc.so: __utimes64
> >> Extra PLT reference: libc.so: __gettimeofday64
> >> Extra PLT reference: libc.so: __clock_gettime64
> >> Extra PLT reference: libc.so: __futimesat64
> >> Extra PLT reference: libc.so: __clock_getres64
> >> Extra PLT reference: libc.so: __futimes64
> >> Extra PLT reference: libc.so: __futimens64
> >> Extra PLT reference: libc.so: __utimensat64
> >> Extra PLT reference: libc.so: __getrusage64
> >> Extra PLT reference: libc.so: __timespec_get64
> >> Extra PLT reference: libc.so: __getitimer64
> >> Extra PLT reference: libc.so: __ppoll64
> >> Extra PLT reference: libc.so: __timerfd_settime64
> >> Extra PLT reference: libc.so: __clock_nanosleep_time64
> >> Extra PLT reference: libc.so: __sched_rr_get_interval64
> >> Extra PLT reference: libc.so: __settimeofday64
> >> Extra PLT reference: librt.so: __timer_gettime64
> >> Extra PLT reference: librt.so: __mq_timedreceive_time64
> >> Extra PLT reference: librt.so: __mq_timedsend_time64
> >> Extra PLT reference: librt.so: __timer_settime64
> >>  =20
> >
> > The above problems are somewhat expected. Those are redirected
> > symbols, which are exported as GLIBC_PRIVATE in several Versions
> > files.
> >
> > I do guess that we will have a consensus if we add those as a
> > "normal" exported symbols or keep them "private". =20
>=20
> They need to grow hidden aliases.

Could you explain it a bit more?



If I add those functions as hidden_alias then those would be accessible
inside glibc without PLT, but will not be exported (and redirection for
Y2038 will not work).



>=20
> Andreas.
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/EYcu8m7AvDRepTZ4+_kr/6N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl5TogAACgkQAR8vZIA0
zr3Z7Qf/aQm5g8J32sNhGAgsJFvQ9tQKjEjgviCjtCXzJoytVdlKxucjkT2RerNT
tJr2+eaosizYQ/DTLhfnfD3g6vDy5Z68TaevHU2zZ+1tFGfaS8Ce8YFoAFKroetl
17a9BiQCvYfPCpaQtEN5o1GQywy7ExB4UQMDc1X748XzN8zL+Vynh3GV8QOETF6p
i+NrCwBCIhs+vQ6nV/blwt1PoEU1PCP/DwvOciR2ZRrWRkkoMu+y77qTKoxLvbmh
lkSNcP0ih666nNtkp1uwEFV5ABDJn9/7OZ4QlpeE4XtX3UMl2qFHpygcQ6nZcxYA
1FMugM4EqbMV0LbW4nJhC0LnUJLihg==
=RzYY
-----END PGP SIGNATURE-----

--Sig_/EYcu8m7AvDRepTZ4+_kr/6N--


--===============5511310421586717311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============5511310421586717311==--

