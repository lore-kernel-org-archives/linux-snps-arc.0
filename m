Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E772EC4451C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Jan 2026 11:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hwe3FjJTsvj+I7j68ZE9TUp1tTKndUoauvNJIMRZ1ho=; b=kAZ13NJba7KSM/
	jBQC97re2KgZCcahnq1tH8oJ02c6GyM4SMdHrWttKz3dObVVhQTpvQielMKiYI30JmrXPlH96bT0o
	wghgxiX0Uu+Y2KOaW5y0G+35bzxFGGkdSjF32RAmVHFAOoyOV92d/zs2+rXEOes3SmIhX5t4ztcfP
	YFhc9TKtll3Mfgz4RhfVlCso6JCyAfqXVxn25ZZDeTyt/2pVF01zliwnpAB5uRsW8mPsNVn05VELS
	AJf/3SXbcbYW3sRBBADmTmOlT5WMBbfDKN3ycTh86RaLBm0cuzghTPDd97dkT8mR5LRlPDp8EzR1e
	FSljYqao1FSXyb86KyHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viWUp-00000005MF9-2nzv;
	Wed, 21 Jan 2026 11:35:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viWUj-00000005MD9-1Vd6;
	Wed, 21 Jan 2026 11:35:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D93543B05;
	Wed, 21 Jan 2026 11:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6384C116D0;
	Wed, 21 Jan 2026 11:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768995328;
	bh=AbA4654CpnBYO9FJCyDPqJ9d3LXH3BmWbfyk/n4OCtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dHnrDbhe/3BO7N/BMeiWSE/a2S0KXfWVPeZPn77sXEp3qfXamN0/0dAhknW7hZDAz
	 3ldBU5JVqKhOttTdOsYDNJNxMoQXNTt52jv4Hz0gonCTeCPyQ6B0vwiW5+VUfdu3og
	 io4fAda4cRB+HArx96be+xPv097Ofx27AlZ4XhCUFC6kywY4YvrlzluRjx87S35Do4
	 GHr+Bj77oxwk3C0Ib8+Bwq19lyHRk3zCKwFOWy/+kMX+7zRKvt7YxheJ2jqTiI30F6
	 ppPvyIkRC843W0u8HWo1qOBiMK2z1H1iy+WE9FwcfKc48tYfkouh28TVKG00Lxc239
	 v/okIPh99V8kg==
Date: Wed, 21 Jan 2026 12:17:04 +0100
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
Subject: Re: [PATCH v2 0/5] uapi: fix remaining kconfig leaks in UAPI headers
Message-ID: <aXC1sL5V9oqzT0ey@derry.ads.avm.de>
Mail-Followup-To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org
References: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_033529_444933_70C154DA 
X-CRM114-Status: GOOD (  14.48  )
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

[Cc+=3Dlinux-kbuild, nathan]

On Mon, Jan 12, 2026 at 08:58:28AM +0100, Thomas Wei=DFschuh wrote:
> A few UAPI headers still contained references to kconfig symbols.
> Clean them all up and afterwards remove the now useless exception
> machinery in headers_install.sh.
> =

> Intended to be routed through the kbuild tree.
> =

> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> ---
> Changes in v2:
> - Drop ARC_HAS_SWAPE kconfig option, use ARCH_USE_BUILTIN_BSWAP
> - Drop PSR_ENDSTATE from the ARM ptrace.h header.
> - Drop nios2 uapi asm/swab.h.
> - Link to v1: https://lore.kernel.org/r/20251230-headers_install-config-l=
eak-v1-0-efba5c58073d@linutronix.de
> =

> ---
> Thomas Wei=DFschuh (5):
>       ARC: Always use SWAPE instructions and enable ARCH_USE_BUILTIN_BSWAP
>       ARM: uapi: Drop PSR_ENDSTATE
>       nios2: uapi: Remove custom asm/swab.h from UAPI
>       x86/uapi: Stop leaking kconfig references to userspace
>       scripts: headers_install.sh: Remove config leak ignore machinery
> =

>  arch/arc/Kconfig                         |  6 +-
>  arch/arc/Makefile                        |  3 +-
>  arch/arc/include/uapi/asm/swab.h         | 99 --------------------------=
------
>  arch/arm/include/asm/processor.h         |  3 +-
>  arch/arm/include/uapi/asm/ptrace.h       |  9 ---
>  arch/arm/kernel/signal.c                 |  3 +-
>  arch/nios2/include/{uapi =3D> }/asm/swab.h |  0
>  arch/x86/include/uapi/asm/auxvec.h       |  2 +-
>  scripts/headers_install.sh               | 30 +---------
>  9 files changed, 9 insertions(+), 146 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251229-headers_install-config-leak-b8a9219d8b3c
> =

> Best regards,
> -- =

> Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>

Thanks a lot for the cleanup, much appreciated!

Reviewed-by: Nicolas Schier <nsc@kernel.org> # kbuild

Kind regards,
Nicolas

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
