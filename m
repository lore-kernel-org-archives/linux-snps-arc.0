Return-Path: <SRS0=ka13=4M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE3FC35671
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 11:13:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4038920828
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 11:13:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NEvTaLCI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4038920828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=maYX2pEvNuADKhEBF1bNYZCM0o4HHjUJAgNNGRMLOq0=; b=NEvTaLCIgznWv9SkGSRhPeDbJ
	Yquebk4f1IvIvtOmaB+tRFgIk+vNt8jDJzPI9OpK5SagFMi8uHH5us9EWtSBCOhuVAgjVGHv4KLA0
	5dbA8mph7sUrT+04+WCzQ3TvUSsRo3JR1NFkMwpBl9ICkYQbVeDUGY7D3svN+9eLaYSNHhiZURW92
	DPaRemULUL1KtON9/risHSLEjsrgnKwJabmsnmWUicdVaQnEmsMqeo74FgYqiU71zq8r5ivZYoX3/
	8/QfdwfEnRNGXAX3FzG+ieYRoErbWrm7VNt6ToCiMQeXDLthJGgJlq5V6OiUOU7up095UK0mdNbwz
	bJKg2H7pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6BgC-0005WM-MN; Mon, 24 Feb 2020 11:13:40 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Bg9-0005VP-Uh
 for linux-snps-arc@lists.infradead.org; Mon, 24 Feb 2020 11:13:39 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48Qzvd6df7z1rQBt;
 Mon, 24 Feb 2020 12:13:33 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48Qzvd50pMz1qqkv;
 Mon, 24 Feb 2020 12:13:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id fsm6Gp5WvRpY; Mon, 24 Feb 2020 12:13:31 +0100 (CET)
X-Auth-Info: F1nqPOMo17xLKhZDD/FCWec2jLYqrL4oHeM9gYMq5HM=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 24 Feb 2020 12:13:31 +0100 (CET)
Date: Mon, 24 Feb 2020 12:13:25 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Andreas Schwab <schwab@suse.de>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
Message-ID: <20200224121325.6b2fff1d@jawa>
In-Reply-To: <mvmd0a4xo4w.fsf@suse.de>
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
 <20200224111424.33759b2e@jawa> <mvmh7zgxozs.fsf@suse.de>
 <20200224113658.275ea702@jawa> <mvmd0a4xo4w.fsf@suse.de>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_031338_282496_9677BDC4 
X-CRM114-Status: GOOD (  18.18  )
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
Content-Type: multipart/mixed; boundary="===============0828127883821762319=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============0828127883821762319==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/PTW+25ccp9eC8BV.Ulfvvg."; protocol="application/pgp-signature"

--Sig_/PTW+25ccp9eC8BV.Ulfvvg.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 24 Feb 2020 11:42:23 +0100
Andreas Schwab <schwab@suse.de> wrote:

> On Feb 24 2020, Lukasz Majewski wrote:
>=20
> > On Mon, 24 Feb 2020 11:23:51 +0100
> > Andreas Schwab <schwab@suse.de> wrote:
> > =20
> >> On Feb 24 2020, Lukasz Majewski wrote:
> >>  =20
> >> > If I add those functions as hidden_alias then those would be
> >> > accessible inside glibc without PLT, but will not be exported
> >> > (and redirection for Y2038 will not work).   =20
> >>=20
> >> They aren't?  PLT avoidance is about internal references, and uses
> >> a different name then the exported sybmol.
> >>  =20
> >
> > I'm probably not aware of something - but as done in the following
> > patch:
> >
> > https://github.com/lmajewski/y2038_glibc/commit/c96eeb73175961c4ac80fdd=
3b6adc132805387c9
> >
> > I do need to remove librt_hidden_proto / librt_hidden_def to have
> > proper symbols visible when I do want to use redirections. =20
>=20
> You cannot redirect to GLIBC_PRIVATE symbols, they are not suposed to
> be used by public interfaces.  All public interfaces need to use
> official versioned symbols.
>=20

I've put those symbols to GLIBC_PRIVATE as up till now many more
functions in glibc needs conversion to support 64 bit time. I need
exported symbols to test if the redirection (and Y2038 safeness on ARM
in general) works.

I also do guess that when we will be heading to expose _TIME_BITS=3D=3D64
to outside word I would need to add:

  GLIBC_2.3X {
	clock_settime64;
  }

for clock_settime64

and then:

#ifdef __USE_TIME_BITS64
# if defined(__REDIRECT_NTH)
extern int __REDIRECT_NTH (clock_settime, (clockid_t __clock_id, const
struct timespec *__tp), clock_settime64);
# else
# define clock_settime clock_settime64
# endif
#endif


Am I correct ?

> Andreas.
>=20


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/PTW+25ccp9eC8BV.Ulfvvg.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl5Tr9UACgkQAR8vZIA0
zr3HHAf8DtyF7PEe/85wGYmHN1h+NFvCcUppBJskMb5iqslZrfiIhSMF4Clxcq3s
wf76ZTXYrVXIC+VHrce4XFwQlBSC9sxMpARhTdCItilS/3bH416laMdvSXNmrYpe
R2wzowKPzjCTDOYFANVHs9b0VkR3smxU6IMaGvxpZxMEU79+WjHPsDnEdjHIKo5n
mAOvDjNz7rbeCCHEA/QtHj/z2tWLVpBGjvMsopjhOuwv8QWbcaKwhE9XdszcXscY
SIYh7iXFjTnkiV7R3V/evVEDY2VNUoo3SW3VQ8C/W3CyUbGgFPGyEl98XTZofTt+
mCUglzkbnXy0Isb/jJrv0wgVzOAKNA==
=WMBc
-----END PGP SIGNATURE-----

--Sig_/PTW+25ccp9eC8BV.Ulfvvg.--


--===============0828127883821762319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============0828127883821762319==--

