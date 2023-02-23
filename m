Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431A7C61DA4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Feb 2023 09:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGOlxevC2+BWXBRxpYYmf41F0Vb9FBzvDDYQgKkyae0=; b=MhoSP6wVfngULH
	YZ2F8aYbtbu2XsR5uxKuVN6tDrIE7ERf7itDTVins5HUMNsLSXpk1JGg+m6mVBmJQaZJt20scWlGt
	I55DucUyCFcb5UHFRGwtqxQEgIs1dsTRGI4tEpzLVz7Z58O8qCM5XbrJYsyH2rp7ZE29PW6NuNEXX
	1zoF9ClhypTdmj4m16aMfU8oAM7zcXRW9XkpDie6hHZMPnv9gj1XzLQUHtsRstsFCf7NAOuh7EasT
	lnLpMqJ4xrNYhWEPIvMK6BuF81JalpFT+WA1dWUyYm7x6hKuLVBzyQeo6rblwz9cWxJp7Caa0o2aG
	jAWw62oNgceKcQsVQkZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8JH-00Fniv-S4; Thu, 23 Feb 2023 09:54:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8JD-00Fnf5-BN
	for linux-snps-arc@lists.infradead.org; Thu, 23 Feb 2023 09:54:40 +0000
Received: by mail-wm1-x331.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso2302576wmp.4
        for <linux-snps-arc@lists.infradead.org>; Thu, 23 Feb 2023 01:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mAI7GZiBb7iDC4DRNXr8MXcTGzYlBwIWTXO3a37K9fA=;
        b=6rqEsmJobKimBOx+ObGs4Y9oYCoGGA+7PUJSCUc+XzhAJr7k8trhGNeL9l///zHG9h
         zKi4GFdApLZMJxwwGKyAK5T4vZVP0aQ3XXyt/OWPp5oueU3BzBJzSR5QoLC+/Xx2iJgz
         5hm79+32XzmlSgEMuCRgCF6jE20gfyjKVSWE2hFVc6aKlMZQREWTRqXyzaVmSBj/MhzH
         AXlVDuu21E6Hjr/kwbOkk278Lu43ZitZTQ7OHZU1h8q5OpD5tJY9ufRMnPPJf2Rq79nz
         v4bZ2eQSQps7BpX5yAyoX5mS+40xRdAoLwhab6GQ6F1yPaND58wp3xipYKvUJEcT++Q8
         E7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAI7GZiBb7iDC4DRNXr8MXcTGzYlBwIWTXO3a37K9fA=;
        b=cNOD/1i9YnL8XNMD5jkkwf2DE/z0Jo0/jOxaVqydm5XsOOITdjJro22rbXVG97tV9Y
         ZaHI0haxOz6rVoogVdg5jjlsCSbVawPCWK1xpLJkO9LkSVCUs083Ygnuy+WYZHbgiuDt
         mUwMgCPlco2y3+wN0TtHoGA0mFYrTfMHG7qafcngDO9EMZbK9gapQa+ZQZ3aQju07nnx
         JT+EHyKHnwDQhl1HHRqfs5omR3CAapvgHyfoQnMhgRN5nHzjS7DvDVO6Z/n4xtIfxFE5
         hx//jO39rTEkIYTHzjo7WeN8ZwYH3ZjOgPJ3J3qATSNFi6cKFhGjVZ34uBu7kHAxZpHo
         WJpg==
X-Gm-Message-State: AO0yUKVy4S/XnX5speXDjadIq+m3Mbgt3MZzbmnKlOF9ebfU0HhcdzJZ
	1mORGn3V2j8LkPTt87OLUX5RswWOwlroCTdPVBHszQ==
X-Google-Smtp-Source: AK7set+bh83ESZvs/5JP0HBfjTnQ76DE1v1RkcKyYbYV7gCfY3t7LNoC9ir4Jaga+QNOEzC6TCzSn38PMw2DLd3UjM4=
X-Received: by 2002:a05:600c:3b9c:b0:3df:df03:45be with SMTP id
 n28-20020a05600c3b9c00b003dfdf0345bemr826148wms.7.1677146076791; Thu, 23 Feb
 2023 01:54:36 -0800 (PST)
MIME-Version: 1.0
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-4-alexghiti@rivosinc.com> <Y+zXIgwO5wteLQZ5@shell.armlinux.org.uk>
 <f3e1585c-0d9d-4709-9b21-74a63d8cc9ac@app.fastmail.com>
In-Reply-To: <f3e1585c-0d9d-4709-9b21-74a63d8cc9ac@app.fastmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 23 Feb 2023 10:54:26 +0100
Message-ID: <CAHVXubgsvjxGbgM6AcxfsHDsHT0iL2pAemGMr5t8KVLKiqC3RA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230223_015439_398382_1ADF0379 
X-CRM114-Status: GOOD (  18.94  )
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

Hi Arnd,

On Wed, Feb 15, 2023 at 2:05 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Feb 15, 2023, at 13:59, Russell King (Oracle) wrote:
> > On Tue, Feb 14, 2023 at 08:49:04AM +0100, Alexandre Ghiti wrote:
> >> From: Palmer Dabbelt <palmer@rivosinc.com>
> >>
> >> As far as I can tell this is not used by userspace and thus should not
> >> be part of the user-visible API.
> >>
> >> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> >
> > Looks good to me. What's the merge plan for this?
>
> The easiest way is probably if I merge it through the whole
> series through the asm-generic tree. The timing is a bit
> unfortunate as we're just ahead of the merge window, so unless
> we really need this in 6.3, I'd suggest that Alexandre resend
> the series to me in two weeks with the Acks added in and I'll
> pick it up for 6.4.

Sorry for the response delay, I was waiting to see if Palmer would
merge my KASAN patchset in 6.3 (which he does): I have to admit that
fixing the command line size + the KASAN patchset would allow 6.3 to
run on syzkaller, which would be nice.

If I don't see this merged in 6.3, I'll send another round as you
suggested in 1 week now :)

Thanks!

Alex

>
>      Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
