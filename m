Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0CECAC58E
	for <linux-snps-arc@archiver.kernel.org>; Sat, 13 Sep 2025 06:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EgKfo2xSDIgXZT+gNCtN3Tm7Y+wbj4wNPDgcwHMCLjo=; b=47SzEm5aqFR4+/
	cw3Z9EJqz23Tz5doHRXtFl1UpEzYb+kYJyoML+4ESN7774yvK4/TKkZZFJJD/MWz8iF4qh/VS2Wqs
	VJdCj4qoZV6Mm/O1xX4WRI8BsubC8q4dIgVj514zolFHmcQGZNTLrE1lPvhd1tYDw8FNFSf1RBaRt
	LXrVmBiY9NwCqzL6LcFafxzxg/YcvmnLghTihDyMVfx2G2RimqssJTf2N1JiqWC4A6oShrL7dYA7T
	6tylNacyQYq2dPKbHyST5t5MRyiC1keNXh3CRG+jVNTXDs5cmtq6d/IWKsgdqoW1wQ2G+hVD4RAJg
	ceV7FZObzzRn+DChNakQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxJJh-0000000DRJx-2hGH;
	Sat, 13 Sep 2025 06:00:57 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxJJd-0000000DRHP-3zmB;
	Sat, 13 Sep 2025 06:00:55 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A0B8040E016D;
	Sat, 13 Sep 2025 06:00:50 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5iEw13_6N0hx; Sat, 13 Sep 2025 06:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1757743247; bh=ukCkckAuGMje9cA2p4fcL/eu4iSUrEgrcmTG6KbdR1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M+CzmzEWar56cJJ17KOTR6P8eSnXvk4pSviym3bg7uW6BkqS0j+mtX3BQDzmjsLKN
	 cBfUjtOzG0dtMWCm8gmhsUa3Xxo4FILO/a/EoDcNG+tlw8kR4uStWeJwPdhqSPG8vi
	 dptoTCZKzdi0Lb7IKesUGcadI0V7LIgtuqv7+ljIAgi+MxFM4i8iy5ZzhN+eNcVDkT
	 2U5qJFAQwTYKNKjXv/HnQbujbbxSSpVXj5bVy2aRYmWxFocdRZ21hDbVAksBWj/ayB
	 IyVl/MGqAXPtO85g0YsubzV7s6ahQw9h0Csu9TVUFWQlf+WnPcHv5LpdW2BLaZTSLx
	 MMPWrLyToEYejhS/laszKvXwNVgYIRKtn46zcfAmgWcVrksJjmgrxaFWOjZaf7IcIu
	 69gMcfJR5mcDILFbprN0LrSSpnH27j6cHrFVqj50Pgarn5Z+5kEA74Cuh7F+wkwKag
	 IgiVg9veF2ZWXTokCLUb6KziC0viJ3MFRPeERhFpkN9McnxLf/Lom5CWCUO/GLLsrO
	 Ik0vYi9bLtv3NWaKGrZ5U38zUX6p3F6aTmchXQOEPOWj3S4lIPOayyV2rrbopxaE+l
	 7bAPj5LxiMGFgfJow+wWYdkCpmcS3w+RlVWftduP1hFNqKDXn6mv7Glb2r+ccLg5uk
	 Ktt/rgo0zlxIwboDscbgVlBU=
Received: from zn.tnic (p5de8ed27.dip0.t-ipconnect.de [93.232.237.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 3961D40E015C;
	Sat, 13 Sep 2025 05:59:52 +0000 (UTC)
Date: Sat, 13 Sep 2025 07:59:45 +0200
From: Borislav Petkov <bp@alien8.de>
To: Askar Safin <safinaskar@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org, initramfs@vger.kernel.org,
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>, devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
Subject: Re: [PATCH RESEND 28/62] init: alpha, arc, arm, arm64, csky, m68k,
 microblaze, mips, nios2, openrisc, parisc, powerpc, s390, sh, sparc, um,
 x86, xtensa: rename initrd_{start,end} to
 virt_external_initramfs_{start,end}
Message-ID: <20250913055851.GBaMUIGyF8VhpUsOZg@fat_crate.local>
References: <20250913003842.41944-1-safinaskar@gmail.com>
 <20250913003842.41944-29-safinaskar@gmail.com>
 <20250913054837.GAaMUFtd4YlaPqL2Ov@fat_crate.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250913054837.GAaMUFtd4YlaPqL2Ov@fat_crate.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_230054_150308_9A867357 
X-CRM114-Status: UNSURE (   9.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, Sep 13, 2025 at 07:48:37AM +0200, Borislav Petkov wrote:
> On Sat, Sep 13, 2025 at 12:38:07AM +0000, Askar Safin wrote:
> > Rename initrd_start to virt_external_initramfs_start and
> > initrd_end to virt_external_initramfs_end.
> 
> "virt" as in "virtualization"?

Ooh, now I see it - you have virtual and physical initramfs address things. We
usually call those "va" and "pa". So

initramfs_{va,pa}_{start,end}

perhaps...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
