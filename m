Return-Path: <SRS0=BbR1=4O=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97874C4BA15
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Feb 2020 16:28:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51868206E6
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Feb 2020 16:28:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uwJhsUwr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51868206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6EioGkdkAYObD5pbKG7sb9kiltg/wiqzGnYTSR83uT0=; b=uwJhsUwrJW0sa5XZyepgQg4SS
	VkVeKXS1kX17kDaFI4gaoj6eUpGjqwjqU3SaDi7KjgZcJI/DdoYW1thfMMzmkyj1Gy8ekdbtNOqXs
	loiJCvnrXboRskaWMAqUCtVNkIqrmBSsqo2cU7WOn3aINAOaqsqiKY17BKOqdz4cH5gGJF0aTAtsR
	y11ynGawUDMEL5i84aG+gsgXLnJDxkoX3cjmDeeWA94hc4vED28aXFytxHjKEu0Ejlvn0UyXFu6xh
	fezS8sOb0BmWX6N3gAwGl2hWf7UIDoAP1YvNXoY2bGnqtqUJ2wkgYJnUm/DjVCZPlVapzYEhcUIXX
	0kkdZ1eeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6zYA-0008Bh-8d; Wed, 26 Feb 2020 16:28:42 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6zY6-0008BF-Qk
 for linux-snps-arc@lists.infradead.org; Wed, 26 Feb 2020 16:28:40 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48SLpC4MDJz1qqlF;
 Wed, 26 Feb 2020 17:28:35 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48SLpC2w9kz1qyDx;
 Wed, 26 Feb 2020 17:28:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 3wyXxcCpgFXk; Wed, 26 Feb 2020 17:28:33 +0100 (CET)
X-Auth-Info: vR39gq1lshATsLiAmGl+gyFvRBiwazVpGktIrqx24MU=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 26 Feb 2020 17:28:32 +0100 (CET)
Date: Wed, 26 Feb 2020 17:28:25 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
Message-ID: <20200226172825.6795d999@jawa>
In-Reply-To: <alpine.DEB.2.21.2002261445500.5707@digraph.polyomino.org.uk>
References: <cover.1578824547.git.alistair.francis@wdc.com>
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
 <20200224111424.33759b2e@jawa> <mvmh7zgxozs.fsf@suse.de>
 <20200224113658.275ea702@jawa>
 <alpine.DEB.2.21.2002242353570.23654@digraph.polyomino.org.uk>
 <20200225123945.10ec1c25@jawa>
 <alpine.DEB.2.21.2002251427240.25788@digraph.polyomino.org.uk>
 <20200226141842.652ebbcc@jawa>
 <alpine.DEB.2.21.2002261445500.5707@digraph.polyomino.org.uk>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_082839_167691_4B7B12BD 
X-CRM114-Status: GOOD (  16.44  )
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
 Andreas Schwab <schwab@suse.de>, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Helmut Grohne <helmutg@debian.org>, Zong Li <zongbox@gmail.com>,
 debian-arm@lists.debian.org, Alistair Francis <alistair.francis@wdc.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "Maciej W. Rozycki" <macro@wdc.com>, Alistair Francis <alistair23@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============3540102991600222047=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============3540102991600222047==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/PLEc7i2++jqscKS6M2C/8=="; protocol="application/pgp-signature"

--Sig_/PLEc7i2++jqscKS6M2C/8==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Joseph,

> On Wed, 26 Feb 2020, Lukasz Majewski wrote:
>=20
> > > > hidden_def (__mq_timedsend)
> > > > weak_alias (__mq_timedsend, mq_timedsend) [**]
> > > > hidden_weak (mq_timedsend)   =20
> > >=20
> > > If you have lib<name>_hidden_weak note you also need a
> > > corresponding lib<name>_hidden_proto, for the name of the weak
> > > alias.  But you probably don't need to have lib<name>_hidden* for
> > > the weak alias at all, just make sure internal calls use the
> > > internal name. =20
> >=20
> > As fair as I can tell the weak_alias () is necessary for correct
> > operation of mq_timedsend when external programs call it. =20
>=20
> I wasn't commenting on the weak_alias call, but on the hidden_weak
> one.

Ach... indeed - sorry for misunderstanding.

>=20
> If you have hidden_weak (mq_timedsend), you also need=20
> lib<name>_hidden_proto (mq_timedsend) in the internal header (and
> vice versa, hidden_proto implies you need hidden_weak).
>=20
> You don't need hidden_weak (mq_timedsend) unless there is an
> *internal call to mq_timedsend from within the same library that
> defines it*.
>=20
> Since such an internal call could just use __mq_timedsend instead,
> you probably don't need hidden_weak / hidden_proto for mq_timedsend.
>=20
> (If you don't have an internal call to __mq_timedsend, you don't need
> the hidden_* for that name either.)
>=20

Thanks for the explanation.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/PLEc7i2++jqscKS6M2C/8==
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl5WnKkACgkQAR8vZIA0
zr2irAf+O0cu/hGJqVHihTf7u6+XnB0uLttBd9kdWPoN3mozOXSuO2CpMMPL2xK8
/5N/iM+tubyeGazI0v11v7c7gSP+P3vW3PqvvgQrPK7kc+GtCbKRbnQB2fbIllOy
px+tbbUKr2wVaLvRk2uBYsTo+7OA+nEqmvNObJFz32eCFXOsgIvtxaq0XfqGxpbo
FbP4zDPOa+Y5tr53AuW3DyXP6nhTS6JfubtZNc/wKX1lurf346t/TZqJ52ipjLbZ
AKQvL0tUBjAgPEo9Q7sYZx//NWghCaccwhkMyPF2ZtwjiB4Y+PXjDi6BQv4FpS5o
hChZsKy/rBsZH6n+mp1CdiVDxhEnuQ==
=cLcV
-----END PGP SIGNATURE-----

--Sig_/PLEc7i2++jqscKS6M2C/8==--


--===============3540102991600222047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============3540102991600222047==--

