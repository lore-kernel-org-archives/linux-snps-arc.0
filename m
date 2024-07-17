Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4D6C3DA42
	for <linux-snps-arc@archiver.kernel.org>; Wed, 17 Jul 2024 08:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x27mKhbM8/90VU6R/pTAfF8LSmL1momhFdFKMs5yQ7M=; b=JHGRamBSfZcGvL
	VVUSV9thBg0RYa2yOVWAXZM4GeEBL2yxHzFBrWTVEax17srU32unZLZiAKUaHzB8iduH47BNuwNjQ
	Z7CVgZyJMtosImnOsgeCBxPi28NBVV47vsL/N/mb4uZKIN2bQVYFdsKu9k/Skp5DoC47jaDv5YCzZ
	R0hHl2oXFq/oaAXysZYyxTwP13o5kYX6dS0NfTyLvesrqVEcJuYvtwjnoOEJKXJ357bMfpdFVvl1k
	UWCeK1e/7As4MbjHiJf1rcxk9kAIea680Hza7th8JqReHPJWdGDBSSHyGuhcyACRe+Uf5WsP4jkc8
	a5rxjkyAzplwYZezDqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTzrQ-0000000D6ZF-1uXg;
	Wed, 17 Jul 2024 08:18:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTzqZ-0000000D6F2-43k8;
	Wed, 17 Jul 2024 08:17:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3591FCE1676;
	Wed, 17 Jul 2024 08:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77758C32782;
	Wed, 17 Jul 2024 08:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721204229;
	bh=rSLQAE5R5XyJVKc3bL13vDnmqk+hn+xn+GeAR87Ppeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vs9bfBuepk0tW64t9UP6JapsBWLgEUwmlAc2KyxVx4NUGCm3YuGnM5hmpwDeUHVd3
	 v4a/qhFqoqRn8LrZSc5qr2WOIy3akxIVyaDrwOHmMcSG++1/H6EmHJ6+HQL+Sa97I2
	 XCM3fMvjsbLDQvOIj9gfmTjrdSulOUGeQfgN1viWZHi2xxiDFLsuZNrhZ6+TTaTs2b
	 hS69zFhzGSEZnoRNaTpQos2uv049YlI0vpcU5Kuv6PTB79BRIrqWYgY3IWOS379p64
	 9spyEkXtHrFY6CWh1Jh6vJHq40b4Ah5aBshIvPxYpgpoH9eCLmLYkTDJYudivKqRA1
	 TdOlhPvTxLW7w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sTzqZ-000000000I0-08bF;
	Wed, 17 Jul 2024 10:17:11 +0200
Date: Wed, 17 Jul 2024 10:17:11 +0200
From: Johan Hovold <johan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [GIT PULL] asm-generic updates for 6.11
Message-ID: <Zpd-Bx3VwrYWVeTs@hovoldconsulting.com>
References: <a662962e-e650-4d99-bed2-aa45f0b2cf19@app.fastmail.com>
 <CAHk-=wibB7SvXnUftBgAt+4-3vEKRpvEgBeDEH=i=j2GvDitoA@mail.gmail.com>
 <d7d6854b-e10d-473f-90c8-5e67cc5d540a@app.fastmail.com>
 <CAHk-=wir5og_Pd6MBSDFS+dL-bxoBix03QyGheySeeWPX82SDw@mail.gmail.com>
 <CAHk-=wjqr_ahprUjddSBdQfSXUtg3Y2dCxHre=-Wa4VGdi7wuw@mail.gmail.com>
 <2b6336d1-34e0-48dd-b901-7b5208045597@app.fastmail.com>
 <ZpdnhhaQum_epcGp@hovoldconsulting.com>
 <be80d8f6-2a1b-4f63-a43e-652fa5328d11@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be80d8f6-2a1b-4f63-a43e-652fa5328d11@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_011712_222065_0F1A7543 
X-CRM114-Status: GOOD (  16.74  )
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

On Wed, Jul 17, 2024 at 10:01:10AM +0200, Arnd Bergmann wrote:
> On Wed, Jul 17, 2024, at 08:41, Johan Hovold wrote:

> > FWIW, I noticed this last Friday as well when I did a few builds of
> > linux-next and every change I made triggered what appeared to be a full
> > rebuild of the tree.
> >
> > This was with a trimmed config [1] and separate build tree (tmpfs).
> 
> Thanks, that makes it quicker to try out. I'm now using
> your config to do more testing. I still don't see it with
> a normal build though.
> 
> I do see that setting the timestamp of syscall.tbl to
> a future date does result in always rebuilding everything,
> but I don't think that is what you are seeing, since that
> also produces a warning from make:
> 
> arnd@studio:~/arm-soc/build/bisect$ touch -t 202501010000 arch/x86/entry/syscalls/syscall_64.tbl 
> arnd@studio:~/arm-soc/build/bisect$ make ARCH=x86 CROSS_COMPILE=x86_64-linux- 
> make[2]: Warning: File 'arch/x86/entry/syscalls/syscall_64.tbl' has modification time 14483017 s in the future
>   SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
>   SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
>   SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
>   SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
> make[2]: warning:  Clock skew detected.  Your build may be incomplete.

Yeah, that's not something I noticed at least (and I assume I would
have). And I only did aarch64 builds on a 6.9 x86_64 host (make 4.4.1).

Johan

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
