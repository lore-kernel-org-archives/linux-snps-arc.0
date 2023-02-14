Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458D2C64EC7
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 09:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKnbwT23q+VpZDI/BwfVDcU2KhB+gaZayr6zquZXCak=; b=Z9zk9nT3yqULyZ
	/GWC4GjEbkI1Ci14PrS0MPjOM6TqQPDLChtJjd0AYJwB7F8Abj0m9DMqry3JGHikN7G/ptac6qY19
	vjjyzkF1BurzykH60dNxfTFIUKDp4ayrZYRV897O+ljZce2dojijLCy1j/Dy/vI4/RDIzwFs3BqEH
	T8L++RpN4JH/NmSLXlbO0kk6YL0TTIgUqtzZAokNyjRVBwNdco9AjAg6XCVy/REY1wUzqHE2wLFjr
	i34aoQ/NnIsUJziD9W1iW6OxbzJfmnnOxG6o89UHKPy5E5D1+soLwwH+Kj6OIz4TY2gXFMjAUyPH6
	RdRq1kr9DkfYZyogW5mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrCX-000cfJ-2T; Tue, 14 Feb 2023 09:02:13 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrCU-000cdL-Kx; Tue, 14 Feb 2023 09:02:11 +0000
Received: by mail-lf1-f45.google.com with SMTP id x40so22483006lfu.12;
        Tue, 14 Feb 2023 01:02:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vo1pwF0Y3+477kchtQyZldRaytGfE/r9ZXPNmjOtQDY=;
        b=UF8nIWBa8EN7Q3gDxxa7cjUGWabikf/VgpgkXotnSfgVQb7rRpi6EQCp4n8ont25WN
         7EBrRTmmzQ+baKFu1QBxrCOWPVySCRFSQDBZpQ+2mAS5+2frlvvzYrm5Yj3YvVi4MVjL
         JdQZNZrX4+zXQMaKP4UR1QTyy9ICN7dacCJbM2Dv7t/wC/HPWNqqEDqNhA7Ci1ln4iOr
         HOcbJ28NTn9teox7XCPLT54Ipcfz9YL1c3uTSHbxfFJ4Mx9b68ChmVeSGQmymoGp3JJx
         Wn9AWWczfXvymoAfBDk9qptlbnAP0t6S8i81LdNf8jtFtmH/gLpsbgPQLzt2UCPkGQMX
         rOAw==
X-Gm-Message-State: AO0yUKWDlXqa8yQ4MLcJlsuTrvDbGfo79tmnqqQ3gwu1NxahsaiaLQt6
	cnwH7KGMbTm/c0JdrMJMgzJtZrZQGaStgpg8
X-Google-Smtp-Source: AK7set+ppd7kVP1HuM+ly4a1xgzvvJ29+P4SBGQ+uQzAiNzqWAVUQ2haX5VK67zVLs+N/vA7qqBADw==
X-Received: by 2002:ac2:51a6:0:b0:4db:3467:f301 with SMTP id f6-20020ac251a6000000b004db3467f301mr868053lfk.24.1676365323151;
        Tue, 14 Feb 2023 01:02:03 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id u10-20020ac251ca000000b004d5a4f63402sm1034046lfm.213.2023.02.14.01.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:02:00 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id z37so7482466ljq.8;
        Tue, 14 Feb 2023 01:01:59 -0800 (PST)
X-Received: by 2002:a2e:9448:0:b0:293:5264:ad89 with SMTP id
 o8-20020a2e9448000000b002935264ad89mr149971ljh.37.1676365308893; Tue, 14 Feb
 2023 01:01:48 -0800 (PST)
MIME-Version: 1.0
References: <20230214074925.228106-1-alexghiti@rivosinc.com> <20230214074925.228106-16-alexghiti@rivosinc.com>
In-Reply-To: <20230214074925.228106-16-alexghiti@rivosinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Feb 2023 10:01:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQeh4ZqSmVXkNJTOCZ_Ywi0b0JiGpg2EQFRWZXzkNeyw@mail.gmail.com>
Message-ID: <CAMuHMdVQeh4ZqSmVXkNJTOCZ_Ywi0b0JiGpg2EQFRWZXzkNeyw@mail.gmail.com>
Subject: Re: [PATCH v3 15/24] m68k: Remove empty <uapi/asm/setup.h>
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
X-CRM114-CacheID: sfid-20230214_010210_704621_D6C73C68 
X-CRM114-Status: GOOD (  16.15  )
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

On Tue, Feb 14, 2023 at 9:05 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
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
