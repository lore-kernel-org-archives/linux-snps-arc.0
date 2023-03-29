Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7C5C6FD18
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Mar 2023 20:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4T0JLNfzfWDX53XgFIlGHtVMg6UYOFtzpiJdE1Utek=; b=WSAsjFmyKOcZiL94hE2TZe4/zh
	hfswe+X5S8JgEUvlkB/utgBObH6r/H4E4vATpRVzphbkrYUJdR28iLJcM4zQMuBOH2DWhbhuvbxNL
	+mjEYFupaoVUVh0WACFnun4xKkfEsUEtI74sA/zI7e9/SbZENOZnRHdWu1rznxbiplCW0lPatCFaw
	sgQ1Qd2WLWjwyylezFTjwLL4/+EdpgpBkyZhPRO6LgyvAO1p7IXGF4rkFzqxIg5oCGJxOjr7c7U2o
	dejHjoquQczjMtv317wmIC/MLCue21RtrZHkan1sbZIbHV5sXdFWwpyqJEkkW498uOllKLU85L8p8
	4Le3bNBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phcDa-001kCN-2c;
	Wed, 29 Mar 2023 20:16:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phcDW-001kBA-1S;
	Wed, 29 Mar 2023 20:16:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0ABA761DEE;
	Wed, 29 Mar 2023 20:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAEB3C433D2;
	Wed, 29 Mar 2023 20:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680120980;
	bh=GQ/BnFe9Q8YTrp9m/Oja+3F+vgOfqDylgmr9jLCscRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P5U564E993rrDoh13ZYMd/KR6rZkNdIdAbkwy4AMMyuaZ2UnsINcIgdKLJGQbZT1R
	 zUAUZnpQCzF0TlpEQXZmdxZiDMl23kcqvk8c8s2jxRsSMekf7FDxCi9gR1oX2Da8hi
	 aag+2sE6WG2TyEHXWa4HzYKbVaDqQKSeZs+SUyrFuRdRhxxhHTm9szdrtMzu032YBF
	 pnLWBxLnUyF1yY234OeM4zx5JvWcQ8+nbW2h2BxGSx1xSG/83/MuR/yVSH7mdi1xg2
	 0jWbdD9E6OkE4eGUQzkyJv6rP5bdfMAHDI8/GyVgtoddbv/rL55kO33CXzMD08MgAw
	 CkixnBQ6Xb9Yw==
Date: Wed, 29 Mar 2023 21:16:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Max Filippov <jcmvbkbc@gmail.com>, Christoph Hellwig <hch@lst.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 09/21] riscv: dma-mapping: skip invalidation before
 bidirectional DMA
Message-ID: <764e8d2f-ed98-49dc-8fdb-112d59359148@spud>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-10-arnd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230327121317.4081816-10-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_131622_586482_53F1E608 
X-CRM114-Status: GOOD (  15.04  )
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
Content-Type: multipart/mixed; boundary="===============3857275007612832951=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


--===============3857275007612832951==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2LJh6dsRB07q9YeN"
Content-Disposition: inline


--2LJh6dsRB07q9YeN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2023 at 02:13:05PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> For a DMA_BIDIRECTIONAL transfer, the caches have to be cleaned
> first to let the device see data written by the CPU, and invalidated
> after the transfer to let the CPU see data written by the device.
>=20
> riscv also invalidates the caches before the transfer, which does
> not appear to serve any purpose.

Rationale makes sense to me..
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for working on all of this Arnd!

--2LJh6dsRB07q9YeN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCScigAKCRB4tDGHoIJi
0jHpAP47kMhf2uxHoGKhD+jHsEYnFgTHptLnAfIJV6N+QeFoOAD/YxG6hd8qhesW
6Tw9EqBEW/4auX2CLsbK7xE8fP5A9wg=
=os1C
-----END PGP SIGNATURE-----

--2LJh6dsRB07q9YeN--


--===============3857275007612832951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============3857275007612832951==--

