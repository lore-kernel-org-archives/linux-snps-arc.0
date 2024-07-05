Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C02C30658
	for <linux-snps-arc@archiver.kernel.org>; Fri,  5 Jul 2024 12:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKaAXtrR6xiM+tAhSzi5+HjHWuK055BOMpQps8krT20=; b=tc9ZYPavXXZU9+/4LrAAnFOecf
	1I6NF5QgIuO497AaSB7JPpmxCuBS6NAawOa8Q3GGlIvKfC9sy7qWOM7tvZHI6OBH/JfanTaM1dEaN
	A71SSCogGeNStK7j7aCS63njAV5fRrPWNHvGGgVogKcUK4fcHVyEL0PMC6wDuHwjzCCwTdx8lt3Xa
	lv6LvIjgS0cxR1kzPNolcy1kl/QtZloilFJVk+aLpu+vl6Z1iXLn18br1/KwcSbOy7FVKKiSBwYN0
	z3xlVYd/Ps9cCt6tlt/yoK4eruPCSRlePxPBfbGDkZbeLhaO1vVF9XVt41uhH8TegaAKsveINRNZm
	ZTehCjKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPi1f-0000000FuIE-3nA1;
	Fri, 05 Jul 2024 12:26:55 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPi1P-0000000FuDs-3HnB;
	Fri, 05 Jul 2024 12:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720182391;
	bh=aZeNuP2pelRkI3CSCXzaDUpVS59Y3c8MYTsNt4sB4jk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MbNH/85ZZAmLzPqUmW/KoPjNcWSQUJa5m1sHj4DwaD/Ggp9suzqFFsesZCl9i0j5X
	 JVbctaMNgLWgMP/bGFHZqDnj1IIW7hvpR/uRbno/OxJjv1QanWSpH6FOaOZijgz61I
	 Zol9kCM1ZW6mji0n8O+R1b+o7ClH1Hw814x1Io/hCwfnpz69tRzqI7rZiXaVALAkYH
	 T3sq1bsZYZYctf/nMILRfaHpInxI0sVxnTAUiuwQNJmPn/d69H+rS8STQtquhj6Rls
	 OlFggb8LXFVlFRXHsXFhyjRXI1cYJKQCr2Kg8lNrw5PZ+p+UV/XRyjr/zyRRxJicY0
	 Im6zX8yemoKDQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WFt6K6cs3z4wbh;
	Fri,  5 Jul 2024 22:26:17 +1000 (AEST)
Date: Fri, 5 Jul 2024 22:26:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Masahiro
 Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Dinh Nguyen
 <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, Stefan Kristiansson
 <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Rich Felker
 <dalias@libc.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Christian Brauner
 <brauner@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-openrisc@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 03/17] um: don't generate asm/bpf_perf_event.h
Message-ID: <20240705222616.017b1593@canb.auug.org.au>
In-Reply-To: <20240704143611.2979589-4-arnd@kernel.org>
References: <20240704143611.2979589-1-arnd@kernel.org>
	<20240704143611.2979589-4-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_052640_279189_721D05B4 
X-CRM114-Status: GOOD (  23.41  )
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
Content-Type: multipart/mixed; boundary="===============8711887595763449410=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============8711887595763449410==
Content-Type: multipart/signed; boundary="Sig_/IAaJheb.p6.1G=gRNPNGj_e";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IAaJheb.p6.1G=gRNPNGj_e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Thu,  4 Jul 2024 16:35:57 +0200 Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> If we start validating the existence of the asm-generic side of
> generated headers, this one causes a warning:
>=20
> make[3]: *** No rule to make target 'arch/um/include/generated/asm/bpf_pe=
rf_event.h', needed by 'all'.  Stop.
>=20
> The problem is that the asm-generic header only exists for the uapi
> variant, but arch/um has no uapi headers and instead uses the x86
> userspace API.
>=20
> Add a custom file with an explicit redirect to avoid this.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/um/include/asm/Kbuild           | 1 -
>  arch/um/include/asm/bpf_perf_event.h | 3 +++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>  create mode 100644 arch/um/include/asm/bpf_perf_event.h
>=20
> diff --git a/arch/um/include/asm/Kbuild b/arch/um/include/asm/Kbuild
> index 6fe34779291a..6c583040537c 100644
> --- a/arch/um/include/asm/Kbuild
> +++ b/arch/um/include/asm/Kbuild
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> -generic-y +=3D bpf_perf_event.h
>  generic-y +=3D bug.h
>  generic-y +=3D compat.h
>  generic-y +=3D current.h
> diff --git a/arch/um/include/asm/bpf_perf_event.h b/arch/um/include/asm/b=
pf_perf_event.h
> new file mode 100644
> index 000000000000..0a30420c83de
> --- /dev/null
> +++ b/arch/um/include/asm/bpf_perf_event.h
> @@ -0,0 +1,3 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <asm-generic/bpf_perf_event.h>

Just wondering if that file should have some explanatory comment in it
to prevent it being cleaned up in a few years ... or at least to
explain why it causes the above error when removed.

--=20
Cheers,
Stephen Rothwell

--Sig_/IAaJheb.p6.1G=gRNPNGj_e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaH5mgACgkQAVBC80lX
0GxvyAgAnvriHKpdKWTfcYd3ec6OiQntfWfgTjPlWVORKO3a85cAPDy3acHNxKoW
6Bfh4LWjBSmmqSTbP6rIFpInGlZedDil+cHdDALd7D/dBOCwUJkG1oB7aY7A1HkA
hPQhv7pLSbZkhJ3M0TurrRsFbO9QR1RFnxIxPRPy4gEkjPGnLJ0H1gqh11s5irVU
WGCviIF/qU3Xkj6DjtzAS1lY7y0BGec3kvR02WhKHvoh7SJrquU5M1i5qzLpuw82
0xowL25d77AbRzea52VD6Sv2H614Q8hfDtDQB6rTGdz6Bo7Pu6F50S3NfYe0Uu5y
zmTMyLek7tdd4FU+Gs4HcQFuJNsSeQ==
=SXsw
-----END PGP SIGNATURE-----

--Sig_/IAaJheb.p6.1G=gRNPNGj_e--


--===============8711887595763449410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============8711887595763449410==--

