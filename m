Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F6FC636D4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Jan 2023 18:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jiKAU+LhLqHBsBokZwlHQGO+WxxkQcAeTsPIrNAMEw=; b=Nc/ALvpFbPssvU0aGGmmEH5CzZ
	2SbiRGWGC5vuteo32xMM+DoRG0hda7A48wLRNcIbIBzQlp9P6a7sa7McK8sDlC1R1qXFoRKOlXiVD
	KK48ihxtjNYbXuEIa9nqI2vK88fl5OCMWkASXUsGNfVcP+Z15otKpiJ5QgrcS/nmvWXKvmfNT00gl
	IJ65BiIpluMl1m7KXy92/gtxQ5QDT9XUK8pL89pejty3LgbM+o56LWc64IK6LboI/kz9ZowrSvz1d
	ppinLwq589IaVtfphRKL75O3bEyhNyBdaoyUwK8uKu4TsKala97HUIeVbbD5E4pfsYHeLGwGrrESL
	2IrxwLtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMvnA-0092Px-LJ; Tue, 31 Jan 2023 18:55:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMvmr-0092Ig-KX; Tue, 31 Jan 2023 18:55:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B440CB81E69;
	Tue, 31 Jan 2023 18:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249B8C433EF;
	Tue, 31 Jan 2023 18:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675191318;
	bh=bIDjyyvdysd52cz3wo+R2FqIpQuhXwaSP+2JinM77Zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p4r9YCVihzZrIRlizFq96lF4LsuRcYuXyit+cVXFPxJSxGfL99cms2/SSKpvkF2Pp
	 NgIawOhOvw555KfS+LAiMfG5/YT2a/THCQd4ucSFldwug8pgOxrs80vH+lCVDLHIZh
	 fh6CSOEpoCrswZLqAXRWz9pZ9CFIa58ZjTeMXFlgy8V6KmgUqFk322AZ/O2du+jfxI
	 cQP8VEptS2HT9jSp8zZqLDDlrzS+XSn+HUeeyHjnm0LO863o/QOiqT647VANwYetka
	 9TpahVOYB0s8YL82xibnQ7Ggye7lO/va5K0QbIxfYIjwKYESn8Y2//JUV74+mpgZ7e
	 krHdpZB95Rbtg==
Date: Tue, 31 Jan 2023 18:55:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vineet Gupta <vgupta@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH v2 4/4] mm, arch: add generic implementation of
 pfn_valid() for FLATMEM
Message-ID: <Y9lkCz73v7/iyyLj@spud>
References: <20230129124235.209895-1-rppt@kernel.org>
 <20230129124235.209895-5-rppt@kernel.org>
 <Y9lULIIOneBUFE/E@spud>
 <Y9lg7R1Yd931C+y5@kernel.org>
MIME-Version: 1.0
In-Reply-To: <Y9lg7R1Yd931C+y5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_105521_978144_88AD2986 
X-CRM114-Status: GOOD (  29.58  )
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
Content-Type: multipart/mixed; boundary="===============3615069079983918999=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


--===============3615069079983918999==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hiaCFsst32mLBZni"
Content-Disposition: inline


--hiaCFsst32mLBZni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Tue, Jan 31, 2023 at 08:41:49PM +0200, Mike Rapoport wrote:
> On Tue, Jan 31, 2023 at 05:47:24PM +0000, Conor Dooley wrote:
> > On Sun, Jan 29, 2023 at 02:42:35PM +0200, Mike Rapoport wrote:
> > > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > >=20
> > > Every architecture that supports FLATMEM memory model defines its own
> > > version of pfn_valid() that essentially compares a pfn to max_mapnr.
> > >=20
> > > Use mips/powerpc version implemented as static inline as a generic
> > > implementation of pfn_valid() and drop its per-architecture definitio=
ns.
> > >=20
> > > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > > Acked-by: Guo Ren <guoren@kernel.org>		# csky
> > > Acked-by: Huacai Chen <chenhuacai@loongson.cn>	# LoongArch
> > > Acked-by: Stafford Horne <shorne@gmail.com>	# OpenRISC
> >=20
> > Hmm, so this landed in linux-next today and I bisected a boot failure in
> > my CI to it. However, I am not really sure if it is a real issue worth
> > worrying about as the platform it triggered on is supposed to be using
> > SPARSEMEM, but isn't.
> > I had thought that my CI was using a config with SPARSEMEM since that
> > became required for riscv defconfig builds to boot in v6.1-rc1, but I
> > must have just forgotten to add it to my $platform_defconfig builds too.
> > However, those $platform_defconfig builds continued booting without
> > SPARSEMEM enabled until today.
>=20
> The issue seems to be that the generic pfn_valid() does not take into
> account pfn_offset when it compares it with max_mapnr.
> Can you please test with the patch below?
>=20
> diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/mem=
ory_model.h
> index 13d2a844d928..6796abe1900e 100644
> --- a/include/asm-generic/memory_model.h
> +++ b/include/asm-generic/memory_model.h
> @@ -26,7 +26,7 @@ static inline int pfn_valid(unsigned long pfn)
>  	extern unsigned long max_mapnr;
>  	unsigned long pfn_offset =3D ARCH_PFN_OFFSET;
> =20
> -	return pfn >=3D pfn_offset && pfn < max_mapnr;
> +	return pfn >=3D pfn_offset && (pfn - pfn_offset) < max_mapnr;
>  }
>  #define pfn_valid pfn_valid
>  #endif

Gave that a go, board is booting properly again! Feel free to add a:
Tested-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for the prompt fix!


--hiaCFsst32mLBZni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9lkCwAKCRB4tDGHoIJi
0pIDAP9nc8RsXGyfp84b29PfLE6bd1djEIZ71+YYWPrhRbOT0QEAs5hvd2Aq0mES
TzWIEs2xL7+wjwVIWLwPjr1kP0shHA0=
=AQg2
-----END PGP SIGNATURE-----

--hiaCFsst32mLBZni--


--===============3615069079983918999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============3615069079983918999==--

