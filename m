Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251F0C3DA41
	for <linux-snps-arc@archiver.kernel.org>; Wed, 10 Jul 2024 13:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i57hJXzcemr7Mm+xaN+RiBEIJ8A9TH8fhdUGxHxjAmQ=; b=cLyoAsAa0OP+InXQuUwFSRkyQ1
	O6G8mBR4Or8wO2WQGK0SqjXhK1baTBhPvIf9kpnk/yedZBTviezn/rzX1fdlG2jTDAkZy9B3N0B+n
	c9/2by7QyKiL6ozJOnLB30AWKlQHcc/MhQ9UoSGBzIs9lbRtptEU85/5JAjXykzX7o+tN6bFVkgHd
	cvXmHRlc93cokcd+xif/xOhgVeFGTlBGfQmyqPgoIJhqgtIHV+PpGmLEwtRg+qSmsLwx5PZNrWqKt
	UPZhSMUdkwspRPHvlkVTgZFlXikoswKP6d9qpeFw2IOGiQQcy7juJ1EtUusQoBgiI48/aqB8K1CY5
	9Vq0zJ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRX3s-0000000Ab96-2fs7;
	Wed, 10 Jul 2024 13:08:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRX3Z-0000000Ab0O-38NP;
	Wed, 10 Jul 2024 13:08:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4584D6190C;
	Wed, 10 Jul 2024 13:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6311EC32782;
	Wed, 10 Jul 2024 13:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720616905;
	bh=20hAmUQJ5H0dqXfMYq7iNS/LgEwVNBfRSwX6Fbv7Rx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S9hM2atZ5ZFhaUOVjx6PR2HXOtRcW2QNjebxTAoB2FvvbNZ4PvOIsIwpDlPboosKj
	 aUtUzXLMfzd0O5DHyr4sCCAr1JRNez2zaVxXGyiPdJVbKNb37V2ly+VVxzpMDXgG/0
	 yLekhO+MGKNgwADbhYOjSo5b4rpMXYgWwoL2bNSCBQKmOvzvqtC3rwJbQrGVvORCEw
	 J4pHDoVTPveEEH9d10qvcPrL+POj3GC5r8YQvSmPXeVF0PMmlfQ/MZUMEctcHXW0qy
	 0yxxDbGN2tLa8mdEVPGQM3LjZRro94QHKN4+ZoTczDbhEko0b/JGYs5RGeGNJyt6+s
	 scOo6mzmOh59Q==
Date: Wed, 10 Jul 2024 14:08:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, guoren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Dinh Nguyen <dinguyen@kernel.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Christian Brauner <brauner@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
	linux-riscv@lists.infradead.org,
	Aishwarya TCV <Aishwarya.TCV@arm.com>, shuah <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 10/17] arm64: generate 64-bit syscall.tbl
Message-ID: <Zo6Hv18S35K0hH_7@finisterre.sirena.org.uk>
References: <20240704143611.2979589-1-arnd@kernel.org>
 <20240704143611.2979589-11-arnd@kernel.org>
 <c8c882ad-d508-40b7-9af5-b2a2ddf777c1@sirena.org.uk>
 <93c84e97-b307-4486-8dfb-e966c96751a1@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <93c84e97-b307-4486-8dfb-e966c96751a1@app.fastmail.com>
X-Cookie: Your love life will be... interesting.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_060825_922679_A541C805 
X-CRM114-Status: GOOD (  14.59  )
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
Content-Type: multipart/mixed; boundary="===============9055625332685856216=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


--===============9055625332685856216==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LdSnlI4UojlRSCq3"
Content-Disposition: inline


--LdSnlI4UojlRSCq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 10, 2024 at 10:57:25AM +0200, Arnd Bergmann wrote:

> Thanks for the report! I just panicked a bit and thought I had
> done something entirely wrong here, but after having a closer
> look it turned out to be a silly typo:

> -#include <unistd_64.h>
> +#include <asm/unistd_64.h>

Doh, I should've spotted that even from the very quick look I gave it!
Thanks for the quick fix.

> I checked that arm64 is the only architecture that has this
> particular bug, and I tried building kselftest now, which seems
> to work better. There are still a few warnings and errors
> I get doing that, but I suspect those are all preexisting
> issues.

Yeah, not everything there builds cleanly (and there's a bunch of
external deps you need for many of the suites).

--LdSnlI4UojlRSCq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaOh74ACgkQJNaLcl1U
h9CcQgf+N85DM6dZVHX8s5b4IoK8zBscjfKv6tCiwPcVRTNMH1dJqkR5LYNpb1am
KnuwKdCAcqascCbdmTx6ZzWDw52YDXohUbXSLkof3qyp5Js5aEyrs51UQTogwoi4
kW2K0EYgg4Wk0OF5Fe2Iq2ITXeoZ9O++joUeRHwXE9hSesKKiM+kZoHBaKHFQf8G
KDEhNvrFyrB2F9RDVIHcqt7IlySirRkKj8aWx9Dytd3Z8QtLv8rI6mbWZQ17ym4y
zDuDf4710dlhVUmR8eYF+JeHyJGcKQMF1BZAqwIkxQHuuP8uaNfhIR/rSOL1okjv
4LFBmMQqolC9ttdMprhk/DBLuxJAwA==
=NATo
-----END PGP SIGNATURE-----

--LdSnlI4UojlRSCq3--


--===============9055625332685856216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============9055625332685856216==--

