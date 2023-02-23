Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22F3C61DA4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Feb 2023 13:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBaQE1nXFCA61QdaaG6p2xban0zo9ntaWgMJEe8wPm4=; b=wL4VqBLcSBmMvy
	0qOnqc7vKM0PyTZy0wjilq8vEFIA2KngcLCCFvsQl15IRG9qzX+shYmH2UZ/D/HlnvojntLcbQWfA
	Ms1TDllvVe5m3fc3hAvw3DLzFrKrNwPTsqOCc8y9se0KvEnUrN7/+Dpgo5toWU0f6O2GC8ZCt0emK
	T29Z4VtB2/V7bD5T9Zkbcnisoc33D6cs3QBWq3UX7j7hlsZuImTcXIgINYzCnZdpHWR8J9tFBEL9K
	3Xsf7QwA0G+i0tVKpUQa2KIDirc7zWRHTOqs3NNyJk3LHPdbhFwco2gSqoh6gJChsd+7HLOhxP9J6
	KU7Mhe3c/wxRF3xZdWqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBOX-00GPoI-3f; Thu, 23 Feb 2023 13:12:21 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBON-00GPlE-9h
	for linux-snps-arc@lists.infradead.org; Thu, 23 Feb 2023 13:12:19 +0000
Received: by mail-wr1-x430.google.com with SMTP id q16so298064wrw.2
        for <linux-snps-arc@lists.infradead.org>; Thu, 23 Feb 2023 05:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tb59OZw0P/9NeiLo7j0/pIIcP5QkKD4A9oJDDcL4MAg=;
        b=hrlRDOKwOAsNkn63EV7n3EEAQ4B9IaQtA8AIfHsOiB4TORHkWY2kK38L935i7RoAkO
         olQa3vClBYmwI8KwEFJB6OPacgNRv5x0BN4vdHf3XCEpriaGT+omA4tS0gMZiZxKcc3F
         KYWPSwsUHx/frhqkq7A+J1wZizAG8ePYV7KvjhBPsnTPCUograCrVBFqcg6srDhRwA+g
         U3yCkqCB9uB9VtPc5hwrVaCL1hVrTXMesQpZ4o6rR2fhIdFruEUpbstEzITPCLTBBZC5
         KBWMT1Y873RFeL8aM322RZ3QoSZitsWNIn2ZjY4a1FDfQORGN+A8UZHYx1nVnn/nmc6t
         CSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tb59OZw0P/9NeiLo7j0/pIIcP5QkKD4A9oJDDcL4MAg=;
        b=zIqx90famD710fW9rG3srRyWECMkuSKQSL/n9N6NHmjGNV2O6QRCZpsjTiSMCpvlLv
         TitvdHvzubKoL2vlaBwGrphSKj9CfUu4BvBjo3pgyEmZv2FBqde+TETm7mTii1t3R+SV
         wJ0bAdChuLXUlCmHutfKoVGZJAJohOAGW+SRNzJJ0VssGCmreeHzl95BiTlikiWBZplv
         lBs1mvLaz3RaYrFwly8CD4by0nIloxNqvFjTm0a4P7qxT7++xVcdW4/NwbqPXLpRX1Ea
         UTLDBoiOv7V1rTWrkm5MVhMYf1uqxo0NlQz+7MR0iSPUz2NLg8v7KfschmUNsoBykY/X
         zY7Q==
X-Gm-Message-State: AO0yUKX0E7SE0LOuxHhuV1sZe8Qlh0H1FzVty5ydMBChaxxkoiahdftc
	DiiXjmhh0QPuQrJlPSloSS5HteG8Db0nmf7s3zn06Q==
X-Google-Smtp-Source: AK7set94r7NGT29eIpH72O39BJhvhcK+eRKfihpjHL0Bl53RKHrn48B3FXlJGKNmfO3t+QnjF/nB7RwGXZWsm1mLo5s=
X-Received: by 2002:a5d:4d0b:0:b0:2c5:532b:cd20 with SMTP id
 z11-20020a5d4d0b000000b002c5532bcd20mr663712wrt.11.1677157925879; Thu, 23 Feb
 2023 05:12:05 -0800 (PST)
MIME-Version: 1.0
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-4-alexghiti@rivosinc.com> <Y+zXIgwO5wteLQZ5@shell.armlinux.org.uk>
 <f3e1585c-0d9d-4709-9b21-74a63d8cc9ac@app.fastmail.com> <CAHVXubgsvjxGbgM6AcxfsHDsHT0iL2pAemGMr5t8KVLKiqC3RA@mail.gmail.com>
 <874b8076-b0d1-4aaa-bcd8-05d523060152@app.fastmail.com>
In-Reply-To: <874b8076-b0d1-4aaa-bcd8-05d523060152@app.fastmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 23 Feb 2023 14:11:55 +0100
Message-ID: <CAHVXubidtBHNi8iFrFAWqRtkxiUBbmzzXFn+=R1DjEd5X0SpQw@mail.gmail.com>
Subject: Re: [PATCH v3 03/24] arm: Remove COMMAND_LINE_SIZE from uapi
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, "David S . Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, 
	Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_051211_343631_1908EC10 
X-CRM114-Status: GOOD (  31.75  )
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

On Thu, Feb 23, 2023 at 2:09 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Feb 23, 2023, at 10:54, Alexandre Ghiti wrote:
> > On Wed, Feb 15, 2023 at 2:05 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >>
> >> On Wed, Feb 15, 2023, at 13:59, Russell King (Oracle) wrote:
> >> > On Tue, Feb 14, 2023 at 08:49:04AM +0100, Alexandre Ghiti wrote:
> >> >> From: Palmer Dabbelt <palmer@rivosinc.com>
> >> >>
> >> >> As far as I can tell this is not used by userspace and thus should not
> >> >> be part of the user-visible API.
> >> >>
> >> >> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> >> >
> >> > Looks good to me. What's the merge plan for this?
> >>
> >> The easiest way is probably if I merge it through the whole
> >> series through the asm-generic tree. The timing is a bit
> >> unfortunate as we're just ahead of the merge window, so unless
> >> we really need this in 6.3, I'd suggest that Alexandre resend
> >> the series to me in two weeks with the Acks added in and I'll
> >> pick it up for 6.4.
> >
> > Sorry for the response delay, I was waiting to see if Palmer would
> > merge my KASAN patchset in 6.3 (which he does): I have to admit that
> > fixing the command line size + the KASAN patchset would allow 6.3 to
> > run on syzkaller, which would be nice.
> >
> > If I don't see this merged in 6.3, I'll send another round as you
> > suggested in 1 week now :)
>
> Hi Alexandre,
>
> I have no plans to still pick up the series for 6.3. The patches
> all look fine to me, but it's clearly too late now. What is the
> actual dependency for KASAN, do you just need a longer command
> line or something else? If it's just the command line size,
> I would suggest that Palmer can still pick up a oneline change
> to increase it and refer to this thread in the changelog as a
> reference for why it is not an actual UAPI break.

Indeed, we only need a longer command line size. I'll ask Palmer to do
that then, thanks!

Alex

>
>      Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
