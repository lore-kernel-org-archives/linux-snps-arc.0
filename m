Return-Path: <SRS0=BbR1=4O=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08747C4BA10
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Feb 2020 13:19:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B61082467D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Feb 2020 13:19:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XIyDgnVQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B61082467D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8cUT4nrxx6sA5uLrmecfUYK72GYj2ZMzQpr3x/UD/dc=; b=XIyDgnVQdQ6/FKE4DSI8r+foN
	2SqQaNZRAGW9/0WO4dChQ+8JrHTy6KIcbqSz5Ti6u2bqhT2MjjrbinTTE2kQZgQxqEM8heomil7N1
	ULDrbqHhAErt1VMDv5oKqrOV1a7U7YhMpqW8Rte59PQ2aQD8+1A6a/1Cn2yg2YvmImGdYzhJ7ZJEE
	WzFluJgU4z3RykZupv9UiT+AlHRLZgzYgCDxFBWWafEQnV8+psffNE8D34XmqWzB1YOzClebJ9IKS
	hMrPySOd4qys8sR1kac2eeI675SOAHzcJbsUQON8JgOXLxypdaU0gcNoSjBU4b9CJfueSkkEYM/C5
	Qce813ZJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6wae-0007F8-BQ; Wed, 26 Feb 2020 13:19:04 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6wab-0007Ef-A3
 for linux-snps-arc@lists.infradead.org; Wed, 26 Feb 2020 13:19:03 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48SGbH3N7Dz1rj66;
 Wed, 26 Feb 2020 14:18:51 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48SGbH1Vtrz1qyDr;
 Wed, 26 Feb 2020 14:18:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 0PgKTKFDofRy; Wed, 26 Feb 2020 14:18:48 +0100 (CET)
X-Auth-Info: q6irsfcOr7jBL7aPgdJwXouKptuNvFf1dp32QfEr338=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 26 Feb 2020 14:18:48 +0100 (CET)
Date: Wed, 26 Feb 2020 14:18:42 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
Message-ID: <20200226141842.652ebbcc@jawa>
In-Reply-To: <alpine.DEB.2.21.2002251427240.25788@digraph.polyomino.org.uk>
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
 <20200224113658.275ea702@jawa>
 <alpine.DEB.2.21.2002242353570.23654@digraph.polyomino.org.uk>
 <20200225123945.10ec1c25@jawa>
 <alpine.DEB.2.21.2002251427240.25788@digraph.polyomino.org.uk>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_051901_655824_C0CE44FE 
X-CRM114-Status: GOOD (  21.08  )
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
Content-Type: multipart/mixed; boundary="===============3856635888143852893=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============3856635888143852893==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/W/n/Gh52yK_3LtKYX5qtGxS"; protocol="application/pgp-signature"

--Sig_/W/n/Gh52yK_3LtKYX5qtGxS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Joseph,

> On Tue, 25 Feb 2020, Lukasz Majewski wrote:
>=20
> > Lets consider for example __mq_timedsend_time64.
> >=20
> > With lib<name>_hidden_def/proto kept (NOT removed as in [1]):
> > GDB:
> > __GI___mq_timedsend_time64   [*]
> >=20
> > (No build errors, linking with test setup works as expected). =20
>=20
> What is the actual testcase, and the exact command line used to
> compile it?

The test case is a separate program [1] compiled with [2] (the
test_y2038 make target)

The glibc under test is installed on rootfs run by QEMU for ARM.

The lack of redirection, when I keep lib<name>_hidden_proto/
lib<name>_hidden_def for __mq_timedsend_time64, is seen when I debug
with GDB the 'test_y2038' program.

The glibc compiles correctly.

>=20
> _TIME_BITS=3D64 redirection is only relevant for programs built with
> glibc, using the installed headers - not for building glibc itself.
>=20
> lib<name>_hidden_proto is only relevant for building glibc, with its=20
> internal headers - not for programs built with glibc.

It seems like not removing lib<name>_hidden_proto/ lib<name>_hidden_def
for __mq_timedsend_time64 in glibc sources prevents the redirection on
installed glibc / headers when 'test_y2038' program is run.

>=20
> If you're talking about a glibc testcase, such tests should be in
> tests not tests-internal, so _ISOMAC is defined when they are built,
> so the glibc internal headers just wrap the public ones without
> defining anything else.  In particular, the asm redirections from
> public headers should be in effect when tests are compiled, but not
> the lib<name>_hidden_proto redirections (but even for internal tests,
> lib<name>_hidden_proto shouldn't do anything because the build
> process knows they are tests not part of libc).

Unfortunately, mine Y2038 tests are a set of compiled programs (it is a
'legacy' code) and have nothing in common with glibc test suite.

The workflow is as follows (standard Yocto/OE):

1. Built the glibc and prepare "package" for other recipes.

2. For tests get the glibc "package" as a prerequisite. Use its
exported headers and libraries to build tests. Prepare test "package"

3. Install both above packages to rootfs

4. Run the rootfs with QEMU.

>=20
> You should look at the preprocessed source from building the test
> with -save-temps and find out why the asm redirection from the public
> header isn't being effective (or if it is effective in the .o file
> for the test, look at what happens afterwards in glibc).  Since
> lib<name>_hidden_proto should not be called in the parts of headers
> included when building a test, its presence or absence should have no
> effect on the preprocessed source of the test.

Ok. I will dig the object files and generated temp files.

>=20
> > hidden_def (__mq_timedsend)
> > weak_alias (__mq_timedsend, mq_timedsend) [**]
> > hidden_weak (mq_timedsend) =20
>=20
> If you have lib<name>_hidden_weak note you also need a corresponding=20
> lib<name>_hidden_proto, for the name of the weak alias.  But you
> probably don't need to have lib<name>_hidden* for the weak alias at
> all, just make sure internal calls use the internal name.

As fair as I can tell the weak_alias () is necessary for correct
operation of mq_timedsend when external programs call it.

Glibc internally defines __mq_timedsend (also for archs with
__WORDSIZE=3D=3D64), but it exports mq_timedsend (and user space programs
call it). One needs an alias (at least a weak one) between mq_timedsend
and __mq_timedsend{_time}. Am I correct?


>=20

Links:

[1] -
https://github.com/lmajewski/y2038-tests/blob/master/test_mq_timedsend.c#L25

[2] - https://github.com/lmajewski/y2038-tests/blob/master/Makefile

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/W/n/Gh52yK_3LtKYX5qtGxS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl5WcDIACgkQAR8vZIA0
zr2FBggAzbU3++V1Vs6n/L6uxpWcuHhIsaEg1h/ZeP7cMdJFfaAA2pA8vq/2/tR2
6yzCCmE7IX71tcrXV+1HnF41XkSbZ785+IqjalK8ZSsgw9W1ClLxizDHOJ5gfDCK
ldGuJ/xNyAjFqSGdQ9r6wZ9l4kQYdlmth5tsKBZFJ2tJRvKNGlDC/X+aiucQ9PCC
y2nVlBpSAbeI1+utk6ZniN3U9k0BwbCrosSehOHTfJgR4PWiplzJoZ4Pncc9Hzb0
cs52dvY6mmZYBgL5Swg713e4vUc1nbL0s+a3tLJUIet7WkeRoBeyCluEzqfQbPTg
6uTTKN498Ji2G54mKEyICTvaXMUFaw==
=p4A5
-----END PGP SIGNATURE-----

--Sig_/W/n/Gh52yK_3LtKYX5qtGxS--


--===============3856635888143852893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============3856635888143852893==--

