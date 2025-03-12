Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063AEC28B28
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Mar 2025 15:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EMYVNKWbmoM2pmFWOtLdIpqkGQWOHbu94/zQ/xVzag=; b=OIlHMNFT1ej+gKSAFcwAyhXvQP
	U6Y/dPQW2+mDAln1Xo1ugaMn/wKqtnrKwfqbYOHT0WWTJiz7ibivSlPfUpDgvofD0H2Vf+Zlfu0Ll
	R8L95DJfllbLO0/prR+TrZfpsW66PztWdRM0rmk5fmAN21T2ieQXOr4v+dFFoB3rR+K6CEFFHS0DN
	QO3N+D72UA83xO1TLmPHmrGghCVm25+Nmefgx72IbLMMdMw/fOJ54PRq/NU56R9Tfs15w3AgfZ73v
	JhLO835932YbBBoxoNsgsou0AMKnWUvEjojeCtAz4BKDPiDwP3TecPs+bcdxKnMTDzrRVMjFNbhaq
	ITtnYZrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNyR-00000008rWb-1kNM;
	Wed, 12 Mar 2025 15:26:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNyO-00000008rVC-1FCu;
	Wed, 12 Mar 2025 15:26:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D5E355C5AEC;
	Wed, 12 Mar 2025 15:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2A9C4CEDD;
	Wed, 12 Mar 2025 15:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741793179;
	bh=Q7awIL7HKUND4G5BgT8sxgfvPYxZ5dldw9MgDhs69ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ky/BCax3DFeowvZEZBaSvHz/FRjz1Ff2w3mZvorveefBQ9QItq7spH+9lPk04kMHc
	 XFcWV+q8BLDxTsMg3kWEEMrJvLlM02Ov9qT4y5J6eushhPAVsWOV5ed7v5on6xpI5H
	 t1Jida96hvmMXnQmaaYU62DS/XhHnkqgw1xy5aAbcXTY7h92ihBZ7RpuPzMnvvZIID
	 4Llux6n6amMPvoDVic/J1BHmAr19Dq0COPgBWULz9Gberd6x0wlqoRfavURfSg5lJv
	 0Xm3eB6wpryKJveHw8pu/I7JXnt8N5CGgjBp/ANgLyo/AFa/GXs+sbZv0RiHoWV9rf
	 Q6NAbrOOruTNw==
Date: Wed, 12 Mar 2025 15:26:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 10/13] arch, mm: set high_memory in free_area_init()
Message-ID: <6d3be692-3dc3-400c-8eeb-3d378adc8dbe@sirena.org.uk>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	Mike Rapoport <rppt@kernel.org>
References: <20250306185124.3147510-1-rppt@kernel.org>
 <20250306185124.3147510-11-rppt@kernel.org>
 <cee346ec-5fa5-4d0b-987b-413ee585dbaa@sirena.org.uk>
 <Z9Cl8JKkRGhaRrgM@kernel.org>
 <5e40219b-f149-4e0f-aa10-c09fa183945e@sirena.org.uk>
 <CAMuHMdUGnBeo69NkYsv35YHp6H9GJSu-hoES2A8_0WhpX1zFhQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUGnBeo69NkYsv35YHp6H9GJSu-hoES2A8_0WhpX1zFhQ@mail.gmail.com>
X-Cookie: You will outgrow your usefulness.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_082620_416411_5C7E9B90 
X-CRM114-Status: GOOD (  14.71  )
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
Content-Type: multipart/mixed; boundary="===============0911864314373240956=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


--===============0911864314373240956==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="auPMsTU3HApbt9PI"
Content-Disposition: inline


--auPMsTU3HApbt9PI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 11, 2025 at 10:41:28PM +0100, Geert Uytterhoeven wrote:
> On Tue, 11 Mar 2025 at 22:33, Mark Brown <broonie@kernel.org> wrote:

> > [    0.000000] efi: UEFI not found.
> > [    0.000000] cma: Reserved 64 MiB at 0x00000000

> > - I'd only been sampling the logs for the physical platforms, none of
> > which had shown anything.

> Hangs that early need "earlycon", which the qemu boot above does have.

Indeed, the physical platforms either don't support earlycon or I just
don't wire it up as standard in my CI.  I see a fix should already be on
the way, but FWIW the physical platforms do seem to have bisected to the
same commit.

--auPMsTU3HApbt9PI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfRp40ACgkQJNaLcl1U
h9ClrAf9FHrCQNmJXN4iyTK9lTj/btaMWsS34HTwQo5atjLix3MlaM4Oe1X8wWdQ
rSJgppPAE2cv7YjUDvJGyXeNJEiBsMtnourIYIcXwHIlSknwUTW93aLuOShlc+KF
iC2gJoynMVm1M0mcCvUSxVXjQXN1rxY3pcXLx99UJqFnR+uWkHqfKq18AdWJzzrD
MwKz6EmBguL6eE0EstxjYPLlpJ3iYWORVdj2/2h3DYrRMLDlV+dm/xW9xGlq5sxJ
c/3bxdgHyKWQqTxjQsPQKSz99U2Amjx1VloV+6yG9htGbdo+yNQv+tUP20dHw9c8
ECZ91Jtf4LTcMPjk/IfIVIr0Hu3V3w==
=0Ulf
-----END PGP SIGNATURE-----

--auPMsTU3HApbt9PI--


--===============0911864314373240956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============0911864314373240956==--

