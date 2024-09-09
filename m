Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8755ECE577
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Sep 2024 16:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15p3l52JT5VtfOf8RYr6Nhvkgx0kmL7yP0iSu7lmWi0=; b=xr+xJ06SKsfnQc3SyYI7Sc/iD7
	A0pR2WWunr2pkTXJlypcxmHhtwsg2z2wbARMeQGvixsQaR/FWpaENWYEZ7ra0a/Xc5oWsJ22p2jiu
	WeRytYZcVPkEHjdkhLOAfmdhPlHqDEYwN3ov3i36P03184aZv3qvzf0kR9bZIU5X5PNq+P8NHLEXx
	o/CA7CRYYRsZ6ONLCnZnYlGlYLulD4+D35LCMfRk5RbNV8g61HztZyEbfuryt7t9oVcKZZfPfiYST
	QZk3mdJ0ZaAf2U7kswzxWcUHHby5oY6qQgQgjY26nPGsRJaocsWgG5WqxD2h2hZQv75xAeLixw5pI
	5Gy6uykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snhHr-00000002feF-1XbE;
	Mon, 09 Sep 2024 16:30:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snhHo-00000002fdt-3VrB
	for linux-snps-arc@lists.infradead.org;
	Mon, 09 Sep 2024 16:30:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 97C7D5C01E9;
	Mon,  9 Sep 2024 16:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2360C4CEC7;
	Mon,  9 Sep 2024 16:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725899443;
	bh=SijMxlPS2d+y1Q8eTo8Td1dmzevGnURxE5EkxDDjDjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iVoKh7BtDABa4TTEUYl0bfbva4OeD+0ythCEfgZUnHLQqMkxLheT263aYiFhhx678
	 pu7Qc++6CJRxThHZeJHmK1YSf4M9dCGtMiFy5mZKLzk0iuljH+/93rd1CWVtCYnyf2
	 KEwAZ1Ydq11k7sUW7+g/eSqldyAsDw9v62mLylhjU/RiirgNxbYAbyBFsbvNc5HS7s
	 sIweFNbnwxMrStZGYnX/ZrzGT/7hcJtH+gS2H6fHmAo3K5AyXe04K/U3+QTv0bTEMG
	 014JGGm1utlAEcv44sVX7kUX0KRetGBwD+6iOoG3d2H0aQ3GNn3uCBPVQ4eMnNz/CS
	 hJQoWv5iGHvcA==
Date: Mon, 9 Sep 2024 17:30:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH 06/15] riscv: migrate to the generic rule for built-in DTB
Message-ID: <20240909-trial-composer-83d5f5cc4fc6@spud>
References: <20240904234803.698424-1-masahiroy@kernel.org>
 <20240904234803.698424-7-masahiroy@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240904234803.698424-7-masahiroy@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_093044_962775_B5360903 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6274041813961125853=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


--===============6274041813961125853==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1zmht3JeO8heTtkb"
Content-Disposition: inline


--1zmht3JeO8heTtkb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2024 at 08:47:42AM +0900, Masahiro Yamada wrote:
> Select GENERIC_BUILTIN_DTB when built-in DTB support is enabled.
>=20
> To keep consistency across architectures, this commit also renames
> CONFIG_BUILTIN_DTB_SOURCE to CONFIG_BUILTIN_DTB_NAME.
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--1zmht3JeO8heTtkb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZt8irgAKCRB4tDGHoIJi
0trhAQDqKRWWntMPCunsAaxopzU2jYVbAtsCUiJEW/z2j58/yAD7BJE6vqDg5O7Y
VqGnVulUhYdkydfA4mgszdVz6GVWzQQ=
=QBvD
-----END PGP SIGNATURE-----

--1zmht3JeO8heTtkb--


--===============6274041813961125853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============6274041813961125853==--

