Return-Path: <SRS0=AhAi=4N=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394B1C35DF5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Feb 2020 11:40:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E21FF20CC7
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Feb 2020 11:40:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RLC33YNM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E21FF20CC7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8kjxBhu9tlAGpg2Kc5tkn5prR3EgJsHopwCeB2BOB4k=; b=RLC33YNMUDqnSpvlyrT3QHgTf
	jjuVG5wJChiJFlxGb1Czus9UdOczyOmxMaR6C293VP9ems/dCP6Who2t7SQf5gVtLAAMyuYsT/7pK
	O7fy2n/zb2latfkueasYEZIsuF/dzgIxvH32ltgJ1Eq8guQWNQY05TmjxDTNuqp+Rtlt4Cb7kyL5G
	wHgSzD9K5eyYGtovaS4TDZGh+Os42Zqlg+17ltMmZbeXU4lf6bA+ildN8tr3Hedev1ntkaLhrI5h+
	UG4WH7npgYzwpjexMpZT60w5czxVzGHTMqPkD1lDfqe4AWKUXtlM8dOXGFRrNx+LTEPvQ1cEUh2Pw
	5/P4WpPrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6YZI-0004gI-0H; Tue, 25 Feb 2020 11:40:04 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6YZE-0004FB-Dz
 for linux-snps-arc@lists.infradead.org; Tue, 25 Feb 2020 11:40:02 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48RcRZ3k7wz1qql6;
 Tue, 25 Feb 2020 12:39:54 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48RcRZ1sw5z1qwyw;
 Tue, 25 Feb 2020 12:39:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id t8H7ovRiH3hh; Tue, 25 Feb 2020 12:39:51 +0100 (CET)
X-Auth-Info: BChuiwR4rAeC2n8nXSl5RLXcHZvEPNaNyAR0EP4moQw=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 25 Feb 2020 12:39:51 +0100 (CET)
Date: Tue, 25 Feb 2020 12:39:45 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
Message-ID: <20200225123945.10ec1c25@jawa>
In-Reply-To: <alpine.DEB.2.21.2002242353570.23654@digraph.polyomino.org.uk>
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
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_034000_771643_412048CB 
X-CRM114-Status: GOOD (  24.03  )
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
Content-Type: multipart/mixed; boundary="===============4183667258922550536=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============4183667258922550536==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/0I9ojUCyT1b_FZf/tZ+iRoZ"; protocol="application/pgp-signature"

--Sig_/0I9ojUCyT1b_FZf/tZ+iRoZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Joseph,

Thanks for the detailed explanation.

> On Mon, 24 Feb 2020, Lukasz Majewski wrote:
>=20
> > I'm probably not aware of something - but as done in the following
> > patch:
> >=20
> > https://github.com/lmajewski/y2038_glibc/commit/c96eeb73175961c4ac80fdd=
3b6adc132805387c9
> >=20
> > I do need to remove librt_hidden_proto / librt_hidden_def to have
> > proper symbols visible when I do want to use redirections. =20
>=20
> You'll need to explain the actual problem you see, because=20
> lib<name>_hidden_proto / lib<name>_hidden_def are correct for any
> symbol that satisfies both of the following properties: (a) it is
> exported from shared lib<name> (whether at a public symbol version or
> version GLIBC_PRIVATE) and (b) it is also used within the library
> that defines it. They are useless but harmless for other symbols.
>=20

Lets consider for example __mq_timedsend_time64.

With lib<name>_hidden_def/proto kept (NOT removed as in [1]):
GDB:
__GI___mq_timedsend_time64   [*]

(No build errors, linking with test setup works as expected).


(gdb) bt
#0  __libc_do_syscall ()
at../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:46
#1  0x76fc2696 in __GI___mq_timedsend_time64 (..)
at../sysdeps/unix/sysv/linux/mq_timedsend.c:33
#2  0x76fc271a in __GI___mq_timedsend (..)
at../sysdeps/unix/sysv/linux/mq_timedsend.c:69
#3  0x76fc2668 in mq_send () at ../sysdeps/unix/sysv/linux/mq_send.c:30

The problem is that __mq_timedsend (32 bit version) is called first -
this means that the redirection for _TIME_BITS=3D=3D64 (which would call
__mq_timedsend_time64) is not working.



With lib<name>_hidden_def/proto removed (as it is now at [1])
#0  __mq_timedsend_time64 (..) at../sysdeps/unix/sysv/linux/mq_timedsend.c33
#1  0x00402bb0 in test_mq_timedsend_onqueue (q=3D3)
						at test_mq_timedsend.c:25
#2 0x00402f28 in test_mq_timedsend () at test_mq_timedsend.c:130

The redirection for _TIME_BITS=3D=3D64 works as expected.




The structure of time conversion patches (details in [2]):
@ include/time.h
#if __TIMESIZE =3D=3D 64
# define __mq_timedsend_time64 __mq_timedsend
#else
# include <bits/types/struct___timespec64.h>
extern int __mq_timedsend_time64 (...);
librt_hidden_proto (__mq_timedsend_time64)
#endif


@sysdeps/unix/sysv/linux/mq_timedsend.c
int __mq_timedsend_time64 (...)
{

}

#if __TIMESIZE !=3D 64
librt_hidden_def (__mq_timedsend_time64)

int __mq_timedsend (..)
{

}
#endif

hidden_def (__mq_timedsend)
weak_alias (__mq_timedsend, mq_timedsend) [**]
hidden_weak (mq_timedsend)


It looks to me like the [**] weak_alias () here is the problem as it
does the aliasing for name, which shall be redirected to
__mq_timedsend_time64.

However, when I remove the line [**] - I do see the error:

| In file included from <command-line>:
| ./../include/libc-symbols.h:552:33: error: '__EI_mq_timedsend'
aliased to undefined symbol '__GI_mq_timedsend'=20


> lib<name>_hidden_proto / lib<name>_hidden_def always need to be used=20
> together, and always need to have <name> matching the name of the
> shared library with the symbol.  In C code, lib<name>_hidden_proto
> causes the function, for both definition and calls, to be redirected
> to an internal, hidden-visibility alias, while lib<name>_hidden_def
> then adds back the exported name as a non-hidden alias to cause it to
> be exported from the shared library in question.

I was not aware of the lib<name>_hidden_def () role to re-export the
symbols again. Thanks for pointing this out.

>=20
> It's true that the redirection from lib<name>_hidden_proto doesn't
> work when there is another redirection for the same symbol in effect,

Please correct me if I'm wrong, but from the above code snippet it
looks like we do have (when _TIME_SIZE=3D=3D64 is defined):


librt_hidden_proto (__mq_timedsend_time64)
librt_hidden_def (__mq_timedsend_time64)

hidden_def (__mq_timedsend)
weak_alias (__mq_timedsend, mq_timedsend)

And in exported headers:

# ifdef __USE_TIME_BITS64
#  if defined(__REDIRECT)
extern int __REDIRECT (mq_timedsend, (..),
     __mq_timedsend_time64);
#  else
#   define mq_timedsend __mq_timedsend_time64
#  endif
# endif


Unfortunately, the final redirection for mq_timedsend symbol is to
__mq_timedsend, not __mq_timedsend_time64.

> but that should not be a concern here (there should be no reason to
> have an asm redirection from __mq_timedreceive_time64 to another
> name, for example).
>=20


Question:

[*] - If I may ask - the __GI_ prefix is for glibc internal symbol? And
in the same vein __EI_ is for external one?

Links:

[1] -
https://github.com/lmajewski/y2038_glibc/commit/06fe0342696d7c6fe6115f82505=
2fb07bb609216

[2] - https://patchwork.ozlabs.org/patch/1237939/


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/0I9ojUCyT1b_FZf/tZ+iRoZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl5VB4EACgkQAR8vZIA0
zr0Dqgf/U6TAdkdkbXHbp0Ges2Vx5+i0h104phJkVzqx/bWWgonNXddFSXozQbov
yPjD2e8sQGHKCFTIgkE+zfQywrBneNkBJDAmL8PZ3ne+hEWQHaVVu5Fx2kVkRSKE
+yj2cvtXv9U8hCGCeF+mF6oPwEhXoxVf+7dYY3lK49BDjpPf1p4aQP/fJ1/9WSyf
0VQ7JUrEXnCNq7R6rfOPW27bVRThxgatiyTix7tibSSTkx9dRZ9uTBlvZVfugB20
+msxJQuYZebqWGEeU+Q9iMMwJGXnv3GB8hWS0pdVz0h4NytCrM1FWzFKnE6FwXoD
Bak57rGgzzKrfaJ3aUAg9hM+n4WuSw==
=eR4F
-----END PGP SIGNATURE-----

--Sig_/0I9ojUCyT1b_FZf/tZ+iRoZ--


--===============4183667258922550536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============4183667258922550536==--

