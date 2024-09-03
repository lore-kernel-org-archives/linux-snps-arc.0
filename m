Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780FACD37AE
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Sep 2024 19:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NA3fTnE3hCq6BGqLavkXMSwgBGqXSK+hZ3VdbFQuLrM=; b=HxSDUTS1tq6drpfIDis9xbwk5h
	m0vJm76ItO3L37ZCHqA9ISSTj7SdESm2kWYcIHaydIIOBHrBwItNPquYeODwfwUSbs0qXkuBLPv75
	+KM7X77uKD/IyjQIxAG5qeLvg2d+NFmydMsEZsrSOJUHMcWim6Sd/JI8mPfv8ah55aZ6xtbNVGB54
	VSOhSbtAZ/JE21d4x3P8gc3GeiRvoAg/qnJyafQcbBdSLpZY9+hmhQqBzl+smBnkqrkyZbbIQ5F9b
	2sHUjcOX5OaqCIzR0eKTePbP0oTjbb+MIVxRGQUL08AOmybBwInMXqJqu0u0XBUgOyhmuuYM7I0uQ
	wE/e9ffQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slZej-00000001gHY-48zW;
	Tue, 03 Sep 2024 19:57:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slZeg-00000001gGV-3djP;
	Tue, 03 Sep 2024 19:57:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F174A5C543B;
	Tue,  3 Sep 2024 19:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C7EC4CEC4;
	Tue,  3 Sep 2024 19:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725393453;
	bh=NTkAihUq8wJ3QQyD2jsoOFW0fG+0732f5lSDZtBgAPI=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=ibTzt+ZgEdTELo0NowH5uGIH2Wtx8O6oChkl1Q28nqiyWxDTqR8tphBxYgCay32pV
	 1hPna6pOCaS45hl+sLTuFw+Pl79mj27SkX+HpLxKECYJlYBG0h7SaAkMmPwDx6njIE
	 2rYYbxd/PvXGm8b5i0aeQaggLGjHy5i+JmHGE7xq/T4LZ5poYfToPT4ar4DwnZ6LFz
	 xUVGuklq6NgdHhkMPsoZgMeus69wEVzDTS4x9rtvNNbP5iGQfDm+My7uvbaZprUrQJ
	 oMpGYNsaV408haO9OPNGCb7dBVZJWkElUMT/UHks93JFjH0pu162EUYzIc/cTsD9Sg
	 qFv2tPt1j4P1g==
Date: Tue, 3 Sep 2024 20:57:20 +0100
From: Mark Brown <broonie@kernel.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Deepak Gupta <debug@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 3/3] mm: Care about shadow stack guard gap when getting
 an unmapped area
Message-ID: <dbaf5653-df46-4e17-bce1-aec7fb168197@sirena.org.uk>
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
 <20240902-mm-generic-shadow-stack-guard-v1-3-9acda38b3dd3@kernel.org>
 <is6ewj3bhtqy3zadj6lbdv6maupx4kmduvhny66ntifkji6hoj@xmhcf5jt4o66>
MIME-Version: 1.0
In-Reply-To: <is6ewj3bhtqy3zadj6lbdv6maupx4kmduvhny66ntifkji6hoj@xmhcf5jt4o66>
X-Cookie: Words must be weighed, not counted.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_125735_063734_FDCCA720 
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
Content-Type: multipart/mixed; boundary="===============3882675818887016776=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


--===============3882675818887016776==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IPVQox5bvuHO+FID"
Content-Disposition: inline


--IPVQox5bvuHO+FID
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 03, 2024 at 03:41:49PM -0400, Liam R. Howlett wrote:
> * Mark Brown <broonie@kernel.org> [240902 15:09]:

> > +static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
> > +{
> > +	if (vm_flags & VM_SHADOW_STACK)
> > +		return PAGE_SIZE;

> Is PAGE_SIZE is enough?

It's what x86 currently uses so it'll be no worse off if it gets moved
to the generic code (there's a comment in the arch code explaing what's
needed there) and it's enough for arm64, we only do single record
pushes/pops or (optionally) writes to unconstrained addresses.

--IPVQox5bvuHO+FID
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbXah8ACgkQJNaLcl1U
h9C2Awf/e7PKpZHkmToVtr07IL4qcZTgpwJkRcA4S8aF/OKy2aVmo+pW2nNnK5sc
/MpaZW0Ms2eiZxaG4R3y3oBshdiHLdMS1qimFTuewZWtDAJ9lE9Zubq1rr+onqIw
z7QLTklFTJhwJLiv4r822HjfHqW872zY7tA8OQKs18OmYzyGFWnMuKcdZwQWf/Wl
S0krgEkvPgYV5FyIP9SeyBVfAnRbH3u2q0dDWORZ7e3pVwZ+0huL1DYzlgP/Nx4a
EUb0rRhFG8tHp5EwazuvDfdaQyfqtytNRDe6NTrqVdsrqXi7QzkjglFsx44oMBFK
rSdl35QkF7WXDFsXE2sd4O+m2ZbJFQ==
=a8UG
-----END PGP SIGNATURE-----

--IPVQox5bvuHO+FID--


--===============3882675818887016776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============3882675818887016776==--

