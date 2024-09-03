Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1D6CD37AB
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Sep 2024 18:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Qm2ZcAZdQHG1OqbMySGdgZN0W581oN1YAoCoTXuono=; b=TUo22Ltz23yM19q45ipmnYMGbe
	88/HpJMYsG2bXpm239wRNxbseLl1k2rHiNE7h3kAJLMeLk9SIAZOwcAyGjZpWxUPL+cdejf8NKVcm
	eQ7aBSAAqg5aAb/cVwVWwXCr7pxh9yFubMj9RkHxQ52cSBJgdSvkNpIWYQeAC3kjcTjLm0Xd+TLMZ
	1Qmbzcyt2XLzd/j+0a8ckrFmqrYMtFmMz0iyqVG4C5QxfY7XU6/DLaqKi2nzU17gpSjUiBRSTW0YG
	OF5HwWymElFzTHTju033K9y8+/mDb/pIuhRQfCfAMA0rrr4opQoAHSGT5C+WyZNq1z83iwTp18h1S
	10ykYefA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slY8a-00000001RF2-3pUK;
	Tue, 03 Sep 2024 18:20:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slY8W-00000001RCZ-2zdF;
	Tue, 03 Sep 2024 18:20:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BDADF5C59E4;
	Tue,  3 Sep 2024 18:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05262C4CEC5;
	Tue,  3 Sep 2024 18:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725387614;
	bh=3M41hDuZ2hOv4A0wqx1B4EpRjBwVCpmQ+MYvSeDr0Yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ciUdQG6Ttgi9yvvZQGiq8UopO75eB7vVzLKBng7HwibzPFRnXBalgGP0DHJOhsgYw
	 3uk4X//pO6AWblx6uj2/rrtcfZi8xJ+KLRhTGUIMHNMXYzXGdpl88AE1LNLYhQLrSP
	 DF8KUTdzVN5U6fM8gZroVggjf3verSxfxLuJNEjmcXfbWXBE0OFnt2KZ4iEV5Vhk9j
	 JeNKEHjQ3QpE+rmpaiNn2XI0qgA0oJV7QO0sGId48qZnT0wsdO40PdufRSPzAvFgKn
	 YqlXDkAF0Dp4f65YVZerwA+zsLHpTSAMy3EtYLEl14MtxYmN71YQsS6p8hzMMNF/7p
	 L/5KsXBbyQ2oQ==
Date: Tue, 3 Sep 2024 19:20:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
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
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
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
Message-ID: <3ff7a6dc-a21a-4a53-b3d5-cc8b0b5333fb@sirena.org.uk>
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
 <20240902-mm-generic-shadow-stack-guard-v1-3-9acda38b3dd3@kernel.org>
 <6d91ca85-def3-422c-8fb2-76337136257d@lucifer.local>
MIME-Version: 1.0
In-Reply-To: <6d91ca85-def3-422c-8fb2-76337136257d@lucifer.local>
X-Cookie: Words must be weighed, not counted.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_112016_865355_4ED0DF2A 
X-CRM114-Status: GOOD (  17.49  )
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
Content-Type: multipart/mixed; boundary="===============2323740907146077691=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


--===============2323740907146077691==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o37zrp9IxB4WCgx3"
Content-Disposition: inline


--o37zrp9IxB4WCgx3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 03, 2024 at 06:49:46PM +0100, Lorenzo Stoakes wrote:
> On Mon, Sep 02, 2024 at 08:08:15PM GMT, Mark Brown wrote:

> > On x86 there is a custom arch_get_unmapped_area() which was updated by the
> > above commit to cover this case by specifying a start_gap for allocations
> > with VM_SHADOW_STACK. Both arm64 and RISC-V have equivalent features and
> > use the generic implementation of arch_get_unmapped_area() so let's make
> > the equivalent change there so they also don't get shadow stack pages
> > placed without guard pages.

> Don't you need to unwind that change in x86 now you're doing it in generic code?

No, x86 had a preexisting custom implementation for some other reason
(hence the "updated by the above commit" part above) - the shadow stack
support would most likely have been added in the core in the first place
were it not for that.

--o37zrp9IxB4WCgx3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbXU1EACgkQJNaLcl1U
h9D6cgf/XDZdPu9OMFQe6TQgFZfL0q5O9mqkm+BWBPaJVUsfz+b1eJX8MY/X94i7
isw0bRIKXl4Rdgglf/Mjack/jKZI2dA1nVQtiA0++/6tT814x3Y/iykb6tAbghmy
uinhNXZQlV9/DYrMjNAbBcGeFlMlKmRBSrZEuoHwLuaOsQ3CfzCxB7zqsWtaxrBk
Ct7Jtsia48hr6Df5deBgMHgDTE6xyu7fxb9fDqVippx4fBJzXvjimEBvAG8OWp/z
77YIEDqfJ+JuDQvg3E5YL5EW1xarV++hvLacqfnaffNQFwngWwUWM8TyY7p5C4VK
LKP++oAShrv2wbyvnGgxkpomt/Eb5g==
=xc/U
-----END PGP SIGNATURE-----

--o37zrp9IxB4WCgx3--


--===============2323740907146077691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============2323740907146077691==--

