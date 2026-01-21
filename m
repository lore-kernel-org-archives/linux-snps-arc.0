Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0026C4451A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Jan 2026 11:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vbU7cJO/Ufyg/zGPXkwfFBx+74DslxLZY6q94+/QhrI=; b=coG/jj7ht2azcz
	lzVLj0MqMBlTgB+swvw0kxOd7oacoO8ZENJItBphLMMgukASk/9CUXyvgaB7WielkCoE9m0TwLVGY
	jiWv65BB+EbmMLABMw2liYyTU79Z9bFdJw4vfenQg8wQKV5e2Myia7kepAoFAE6mxNXhe60JZviv3
	/kG0iIUcSPYfgbHH8y0uqQ6iLq3FcyLz9j380kq2VZ1xtGX66ClxUTfTAweC7MjV2okhkvsvm3wzP
	sp973L0LM1pq3jEAEOp3eBoZNtPRf+hNIxbkxwvKnnr2DGVRFgvjymXjUMMo7FoY3P/KYNDSKafGT
	kC4RtRKoILL8k51+lyBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viWUi-00000005MD4-0UII;
	Wed, 21 Jan 2026 11:35:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viWUg-00000005MCd-1aSj;
	Wed, 21 Jan 2026 11:35:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7223160051;
	Wed, 21 Jan 2026 11:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CBD4C116D0;
	Wed, 21 Jan 2026 11:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768995325;
	bh=NHkg/TIhgb1mQJ9wFISUGfia0oHHdxsFKN0Uuze3f/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LcD1Don8IlnIV90pRJxcQxBp+7F4GE7YUJiaIPz3tybiIvvltqpSVfx+6G/yerI7q
	 qPj2x0nrM1z+Aa7uYP8bb+wxZDgiWbXUVJDy838i79VBv8//VMb9vIT4+UrzNgqMM2
	 u3xxVbsFva+l6kKXtj8W6ydSe8NCE/Rz8iXlFh3V6YEl9DQxSrTN9ek3MgMvGfIQ6e
	 +38Brwic0J8OrBepxv6L3E9PmSaje3xcVKQ7m7ofo9KWeqIbMez1MgQb4WguTqHptP
	 bb3OAM2bMaeAWQcN/oJELTbgbHIL8EFtRUiiSvt3KC9K1EeDyvWF4ay4LWLwmDg8ok
	 aaDnx1+D1jd7g==
Date: Wed, 21 Jan 2026 12:10:18 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 1/5] ARC: Always use SWAPE instructions and enable
 ARCH_USE_BUILTIN_BSWAP
Message-ID: <aXC0Gl2GqF0LEQzZ@derry.ads.avm.de>
References: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
 <20260112-headers_install-config-leak-v2-1-4d8084444603@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260112-headers_install-config-leak-v2-1-4d8084444603@linutronix.de>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

[Cc+=3Dlinux-kbuild,nathan]

On Mon, Jan 12, 2026 at 08:58:29AM +0100, Thomas Wei=DFschuh wrote:
> Since commit 67a697e7576 ("ARC: retire ARC750 support") all supported
> CPUs have the 'swape' instruction.

I can't find commit 67a697e7576.  Did you mead =

commit 767a697e7576 instead?

Kind regards,
Nicolas

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
