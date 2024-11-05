Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8601AD36108
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Nov 2024 19:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+8YikuPHWUHuE9Mj3111CK54vqrztz8SI0rF/zBGQs=; b=eXQyZLgdY9cn2b
	V+aYKqLat0ejkNr5POaDEsXYF+jB5UrFDYsRH1UCNa5erXmYk+3Mqfr+Akw0ftvNyrRcFsiq8VbSG
	mIK2KyDFe2blx61mHpmv8fX7VM8V4LEkgh+xflKyKCg+dPLrfqzp3CamC4bSSotc44gsK0CQkyleP
	/PbZey66PD/kCMPT1Zc8BK9WVeV2GG+uy472GSPZ2DBXpeed7DCyEVOnQaG0qihP1XiIcg/+iV+4C
	dCOoOcDESVKCfwIt4B62r2y/I9lUhwfXKvOtG1QyZo1qX8RjIpl5dY16A7+thErapxFWmfMSPJWO1
	RGUiYwWugodnlG60VP2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Or0-00000000V6l-3kx2;
	Tue, 05 Nov 2024 19:04:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Oqw-00000000V4V-1WZ3;
	Tue, 05 Nov 2024 19:04:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09E375C4357;
	Tue,  5 Nov 2024 19:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14183C4CECF;
	Tue,  5 Nov 2024 19:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730833472;
	bh=uoF4ZbISUkj3LBJVbm7mjK2pNt272UgYSEG9wAikNJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ndFUDxiZpHd3P71EA4Dtdpamj3S+pD0a2NSCYEIkT703any4R0lrK0H/JhQd4Hv2S
	 hAfH0p9N7ObDyDDis1fM3KZKbcT6xDBcyV1iwhCKpgr5eJTjsn996Jr680vAO44Otj
	 drCVf6YoRKOceIQN9knu/aAssyHKuocecyBZr/vNKZiP9PdCl8g8D3PbpLRYGfT7S3
	 8Jxa1hlnrGJeQdCliPqKl36JEkEIgDaJdtPl3tXojvE85kFpWmMnDAcr4PjH7oX62l
	 V8Za49Z9doiMVqhjlWd7GWzNdgnAXYy87njYhKhjV/rXdMfHzibVSbsFtDSY64+oSA
	 zKXctAOfMY/4A==
Date: Tue, 5 Nov 2024 12:04:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v7 6/8] x86/module: prepare module loading for ROX
 allocations of text
Message-ID: <20241105190427.GA2903209@thelio-3990X>
References: <20241023162711.2579610-1-rppt@kernel.org>
 <20241023162711.2579610-7-rppt@kernel.org>
 <20241104232741.GA3843610@thelio-3990X>
 <ZynDAhW0lKCfOqZl@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZynDAhW0lKCfOqZl@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_110434_527407_99848D15 
X-CRM114-Status: GOOD (  14.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Nov 05, 2024 at 09:02:26AM +0200, Mike Rapoport wrote:
> There's a silly mistake in cfi_rewrite_endbr() in that commit, the patch
> below should fix it. Can you please test?

Yup, that was it! All my machines boot with this diff applied on top of
next-20241105, so with that fixed, I think we are all good here.

Tested-by: Nathan Chancellor <nathan@kernel.org>

> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index 3407efc26528..243843e44e89 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -1241,7 +1241,7 @@ static void cfi_rewrite_endbr(s32 *start, s32 *end, struct module *mod)
>  		void *addr = (void *)s + *s;
>  		void *wr_addr = module_writable_address(mod, addr);
>  
> -		poison_endbr(addr+16, wr_addr, false);
> +		poison_endbr(addr + 16, wr_addr + 16, false);
>  	}
>  }

Cheers,
Nathan

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
