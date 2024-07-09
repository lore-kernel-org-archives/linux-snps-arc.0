Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7721C3DA42
	for <linux-snps-arc@archiver.kernel.org>; Tue,  9 Jul 2024 17:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WqlH7H2abLvotexfgmwo9GXwe3FoWCwcBoOnVQeBHZw=; b=IhHiwRm3naSaDsa7F5YN99i61g
	9PRjv9xcx8IGmYeUyDuxejabpeFEP915qWEizQJe7tBTNlawQkCSZ2YlRcKAo3zxWOefSKcBhCan0
	CK68eRAy+Ge4T5VvCkuAUKCcJmgd473dnzYCcX6EoZXMlabk0r+HUCHLadegVSwafDEq+mypc6bIM
	8HCSLYBMiia1tHumwqF+cA3TqDpxROJRJftwtEXE9WVOzgJnT74ztldeJOsbLWXV5Ad9W0oGTWGtz
	5/zAJ+4P+LsOHhujlZfw0/3V1QwlxsxrPj0cYecwrgfVtGQwVsZ3FaJAi0GzrivyF9WdFgw5kNiED
	SW/riyuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sREZX-00000008A6O-16zv;
	Tue, 09 Jul 2024 17:24:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sREZF-00000008A1Z-3ydI;
	Tue, 09 Jul 2024 17:23:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 371B4614E4;
	Tue,  9 Jul 2024 17:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73D9C3277B;
	Tue,  9 Jul 2024 17:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720545832;
	bh=6JR7YL5dHcTXqmUfNm6ulP4+0whK4Ux4ulJpM4dDEes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AwPgrXPW3JfSlpe46zAqPpRmk67PjUPgvKmiUQjJg6uvcyMPVWuu5e5QNiuViEwTY
	 umK0995F6a5PS1q171iZzBn7MkFAbMR1M49fRNmmou84XeBTnLTh7hjQxPCMhNugP0
	 VbWdKqpGAMDyQn0ta/D/sfOmUqKMGKYNLbk3Z5s2olmuPoFKKEMbXb0G/0xHKg7MjA
	 SlOvh+HlJkvcRSSYEnGJDIeXCK6ZAL4UTk/eUKUIPXZT1L5reo8onxjdpCvcVwXHSs
	 qIn1Z9HZ6XXUHbOYbnpCKH5HWbVMfRyEEKGUip6ynNrB/i17jwY0/ougN9eXr4Vgun
	 sPm1+k6XgCKXg==
Date: Tue, 9 Jul 2024 18:23:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Dinh Nguyen <dinguyen@kernel.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Christian Brauner <brauner@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	Aishwarya.TCV@arm.com, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 10/17] arm64: generate 64-bit syscall.tbl
Message-ID: <c8c882ad-d508-40b7-9af5-b2a2ddf777c1@sirena.org.uk>
References: <20240704143611.2979589-1-arnd@kernel.org>
 <20240704143611.2979589-11-arnd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240704143611.2979589-11-arnd@kernel.org>
X-Cookie: Your step will soil many countries.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_102354_109324_44D18B61 
X-CRM114-Status: GOOD (  12.85  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6603238686158722420=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


--===============6603238686158722420==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qf0YYqoW3KQMZ1o1"
Content-Disposition: inline


--Qf0YYqoW3KQMZ1o1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2024 at 04:36:04PM +0200, Arnd Bergmann wrote:

>  #define __ARCH_WANT_SYS_CLONE
> +#define __ARCH_WANT_NEW_STAT
> =20
> -#ifndef __COMPAT_SYSCALL_NR
> -#include <uapi/asm/unistd.h>
> -#endif
> +#include <asm/unistd_64.h>

It looks like this is causing widespread build breakage in kselftest in
-next for arm64, there are *many* errors in the form:

In file included from test_signals_utils.c:14:
/build/stage/build-work/usr/include/asm/unistd.h:2:10: fatal error: unistd_=
64.h: No such file or directory
    2 | #include <unistd_64.h>
      |          ^~~~~~~~~~~~~

which obviously looks like it's tied to the above but I've not fully
understood the patch/series yet.  Build log at:

   https://builds.sirena.org.uk/82d01fe6ee52086035b201cfa1410a3b04384257/ar=
m64/defconfig/build.log

A bisect appears to confirm that it's this commit, which is in -next as
6e4a077c0b607c674536908c5b68f1c31e4e26ec.

git bisect start
# status: waiting for both good and bad commits
# bad: [82d01fe6ee52086035b201cfa1410a3b04384257] Add linux-next specific f=
iles for 20240709
git bisect bad 82d01fe6ee52086035b201cfa1410a3b04384257
# status: waiting for good commit(s), bad commit known
# good: [037206cd4cb43d535453723140fde1bcde0b296e] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
git bisect good 037206cd4cb43d535453723140fde1bcde0b296e
# bad: [2ae3e655fc40f1b6620194b90dcf9a4515257918] Merge branch 'master' of =
git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
git bisect bad 2ae3e655fc40f1b6620194b90dcf9a4515257918
# bad: [4f2a367612d46dff2068582feadfbdd8e1c0443f] Merge branch 'fs-next' of=
 linux-next
git bisect bad 4f2a367612d46dff2068582feadfbdd8e1c0443f
# bad: [d3da7ed72840f3660f90966490adfd499d96ea8f] Merge branch 'for-next' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
git bisect bad d3da7ed72840f3660f90966490adfd499d96ea8f
# good: [6355edbb3dfe322f0748b1eb3987973a568bbb42] Merge tag 'v6.11-rockchi=
p-dts64-2' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-r=
ockchip into soc/dt
git bisect good 6355edbb3dfe322f0748b1eb3987973a568bbb42
# good: [2073cda629a47f2ebe2afcd3cb8b3000d5cd13d1] mm: optimization on page=
 allocation when CMA enabled
git bisect good 2073cda629a47f2ebe2afcd3cb8b3000d5cd13d1
# good: [91a2b5b12867f77dc68d2d15ec7381e6e43820cb] Merge branch 'perf-tools=
-next' of git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-nex=
t.git
git bisect good 91a2b5b12867f77dc68d2d15ec7381e6e43820cb
# bad: [b8c38a39b6ee44b02ee563b60439f417fec441ad] Merge branch 'for-next/pe=
rf' of git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git
git bisect bad b8c38a39b6ee44b02ee563b60439f417fec441ad
# good: [c100216635e922f43d9e783da918a749995350ca] Merge branch 'for-next/v=
cpu-hotplug' into for-next/core
git bisect good c100216635e922f43d9e783da918a749995350ca
# bad: [fafb823fc82dfb746cc9043b1573c4b29ef1d52a] Merge branch 'for-next' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/rmk/linux.git
git bisect bad fafb823fc82dfb746cc9043b1573c4b29ef1d52a
# bad: [8d46f9dd06378e346a562c75bc2a260a03abe807] csky: convert to generic =
syscall table
git bisect bad 8d46f9dd06378e346a562c75bc2a260a03abe807
# good: [57029ba74296a4dafe35f147e88d56d8ae7b69da] kbuild: add syscall tabl=
e generation to scripts/Makefile.asm-headers
git bisect good 57029ba74296a4dafe35f147e88d56d8ae7b69da
# good: [ea0130bf3c45f276b1f9e005eeb255a80a10358b] arm64: convert unistd_32=
=2Eh to syscall.tbl format
git bisect good ea0130bf3c45f276b1f9e005eeb255a80a10358b
# bad: [b2595bdb3eb3fe24137d0bd07a51bc622f068a81] arm64: rework compat sysc=
all macros
git bisect bad b2595bdb3eb3fe24137d0bd07a51bc622f068a81
# bad: [6e4a077c0b607c674536908c5b68f1c31e4e26ec] arm64: generate 64-bit sy=
scall.tbl
git bisect bad 6e4a077c0b607c674536908c5b68f1c31e4e26ec
# first bad commit: [6e4a077c0b607c674536908c5b68f1c31e4e26ec] arm64: gener=
ate 64-bit syscall.tbl

--Qf0YYqoW3KQMZ1o1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaNch4ACgkQJNaLcl1U
h9D3rQf8CZ9gPfX054uMomNs1xS6dBXwr9es5isGNpgMC9ccGAhNPLutJvRWDgKW
pl3YBDyLIoQHGQtB/r9DIQuPQg0xF5ZI80itka6yRvmgnCcTovgdRGgBc9Z549Dl
epxlzSquqEILa8rpTPxywHpu8pFGCNaQhZ/e5shUH1gOWDaOE8WU7jI2MDRD9sLa
I5OD24mUtFHH1kpgNBJRESf4bYcVgM7EYm9spMdd0lb8zjIIUqTJiUKyInyKTNIt
qEAIsEdOMoMTi/9FPetku+lxZQgd78juowTgoODixlanZuEnMqVPQYpeX2UZegOe
cpcjrctAmtncTMv6mtWg5YwE3OQSNA==
=WV1l
-----END PGP SIGNATURE-----

--Qf0YYqoW3KQMZ1o1--


--===============6603238686158722420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============6603238686158722420==--

