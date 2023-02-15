Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B26C636CC
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Feb 2023 13:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08+rX7LNUkrnBJigEqmOWmRjSAwprjXggEDemGEgJq0=; b=O2hUoOHvkNjg/l
	JEtq4XDEAbXt0SkHhmLOq/8dRZGxqDIUuSogUA+DRn2AMwWPck+KE6cBUnCMrKT0DFPUwbKeBJaWD
	vYJao7KClJfXHIva0vZzFAygrgksrDkLseWNJay/JxA4nphMIafczb5DR+iSpcvxNklOm3jukH3K9
	fUyAwhjn8GJ5quQs3Zik1ZH19SuguFpwmnU1/mEMzDoFC2nIR5NOs5rdSlLvw7wk/hxFflKgaNtW7
	jS/t8Jo6INtvwS5m/oeZanOTXbwtrv6kqMWtTvrBpqWclzW5yrA10TMBImG8TA4M+Bnku5sURe8u2
	UO28ieZ8H8WJH7f8wSBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHPE-005tl7-EU; Wed, 15 Feb 2023 13:01:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHPB-005ti5-CK; Wed, 15 Feb 2023 13:01:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=T80Dv/pbeHv4yQbIV1WRGowSCcOuo+FwhGVSDYirNyo=; b=typStl4V61M+0LWV6CYl45n1NF
	m4W0eM90AoKd85qmixDcPpthnLk+b95bwsgFFcBvnssjyLxRNyWUkf38MBdHnC5hJMHQXzrAXfE4u
	sjXI9CnPsT2tyWCtaFGJReOhVBJ7C1Ky0fJf6uDeq4qgqxhR8LjP5C0F4+mFpu0QYM/1ri8+MwHzB
	Qf+rKkAOQgWN+tf3cp48UNgtPLftSBYrStzhBTXcXjZymQMX0JdBeGP5uBPfD69mswliqG6fC1C8X
	g8JyK0lQvJ+nNDGbGSfSRKRlMGVdmWQAdYU5t1SmOnXYVevrwp2QWkhQ7cr4d8xZJhXA4l/PEejz+
	YbEfXprg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60068)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pSHNj-0006l6-Uv; Wed, 15 Feb 2023 12:59:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pSHNS-0004uV-TZ; Wed, 15 Feb 2023 12:59:14 +0000
Date: Wed, 15 Feb 2023 12:59:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S . Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-arch@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v3 03/24] arm: Remove COMMAND_LINE_SIZE from uapi
Message-ID: <Y+zXIgwO5wteLQZ5@shell.armlinux.org.uk>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-4-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230214074925.228106-4-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_050101_425985_C7947BC2 
X-CRM114-Status: GOOD (  10.35  )
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

On Tue, Feb 14, 2023 at 08:49:04AM +0100, Alexandre Ghiti wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> As far as I can tell this is not used by userspace and thus should not
> be part of the user-visible API.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me. What's the merge plan for this?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
