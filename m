Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92EDC61DA4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 09:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5wyp7XVVjJxXbJ9KVizn6n9xYFCV6gVUcjbusW88tM=; b=PBW2dSUTOE5Lqr
	bXirmziZL7WIbRrJu1jcHLwZgIkgzHXBnc0ZnQvPbV47SvPHnxGyz7fAXqoLmRmR+XxD0dJjtio+8
	HRFHxaMKxLZsS4tgioRtnmL7dwOYuvyqhlKfw2KNmlEGROPaFEWeFpwjXb8AYVunI7bWAC9n7KkHF
	mWuPDG9z3YkH0ca90Mk3iCpZ2LHaMIV3yuK8izgLsYK+y7poQp3/yEmKIOAZ0R+b8NRhQgdfkzA7f
	2tMX8jY3HphggoZevs3L3iFq3TTYmCyPfQJn8alnFbLoRvOV3yZ+bkeWrdLhRkyDBNOGPnDmUYgzR
	zVBqM265OU9O26urC6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrJ3-000esV-95; Tue, 14 Feb 2023 09:08:57 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrIz-000ekq-Sc; Tue, 14 Feb 2023 09:08:55 +0000
Received: by mail-lf1-f42.google.com with SMTP id x40so22503922lfu.12;
        Tue, 14 Feb 2023 01:08:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7mNyenBvavxUdV7/ZOu+dVcpWueC+FqvBBNVPDVl8j0=;
        b=RGc9Nk8nW5DpAI1YMVYtsoqrmTTC+fTYdHrCxdRt1oIHoOsX+0UdA9Tbmua5pQyyCx
         se2wuehLssg3HglM/ECKUjJbB0pL2WC4O/9a1EFSibcPQtKwBAh1cRNAzJmWo0TlpYEY
         LggA78qkfZdhkXYHnLLuOUvFLQbNdJVNSYsJ2EQdwSTBqyb3I3A4fBA1a0TA8aVVfxdX
         7a8vvGqO00duI1MKBr04miMb0gaw0JVo8b/fS1iRF/MVqofZY0cYiQjTRjtFMHZgOKMi
         R+/HgTSqvF7eArz0zERu+k1BGeMua47juSv47PXA5nJ1rSFs7yISqe2l826XN+JIpeLU
         B+dg==
X-Gm-Message-State: AO0yUKX0ofMm5MVWN9SueZUQR39vZ0efEdtAecYhL3E/80yDE+/IfACP
	mABB/SE7MONr7qF4GWVf45+qX7VD4tPvXl8t
X-Google-Smtp-Source: AK7set8LlFgq36Zb0NY6tV5s2Piey2Hw69lWvG8+UyT5l9qrGcDv/9rFrq57SZrc0M9DwCh7q4C6fw==
X-Received: by 2002:ac2:4ad0:0:b0:4bb:8d56:d859 with SMTP id m16-20020ac24ad0000000b004bb8d56d859mr558883lfp.6.1676365720676;
        Tue, 14 Feb 2023 01:08:40 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id r17-20020ac252b1000000b00498f77cfa63sm1046000lfm.280.2023.02.14.01.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:08:40 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id x40so22503854lfu.12;
        Tue, 14 Feb 2023 01:08:40 -0800 (PST)
X-Received: by 2002:a2e:9448:0:b0:293:5264:ad89 with SMTP id
 o8-20020a2e9448000000b002935264ad89mr149587ljh.37.1676365235984; Tue, 14 Feb
 2023 01:00:35 -0800 (PST)
MIME-Version: 1.0
References: <20230214074925.228106-1-alexghiti@rivosinc.com> <20230214074925.228106-6-alexghiti@rivosinc.com>
In-Reply-To: <20230214074925.228106-6-alexghiti@rivosinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Feb 2023 10:00:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWxgRrZqn=Ex4gSSL58gciuHp-6ye+FTR0wgw=jp=4=DA@mail.gmail.com>
Message-ID: <CAMuHMdWxgRrZqn=Ex4gSSL58gciuHp-6ye+FTR0wgw=jp=4=DA@mail.gmail.com>
Subject: Re: [PATCH v3 05/24] m68k: Remove COMMAND_LINE_SIZE from uapi
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
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
	"H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, 
	linux-arch@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_010853_931694_938BE5FF 
X-CRM114-Status: GOOD (  18.73  )
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

On Tue, Feb 14, 2023 at 8:55 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> As far as I can tell this is not used by userspace and thus should not
> be part of the user-visible API.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
