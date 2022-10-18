Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27ECEC4332F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 Oct 2022 07:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kd75LRUg0bXesP0KOWg4bvyLWchWO781iH4ZJby1CvY=; b=t4kjw4TWbCx5q4
	2LJf7FAwj23fiwHJolf21hGAoRnErsn3cooCH0Wu7F850bCbnOT5a9B5q3J/JqybuzKBXE2NP5+O6
	+A8YBmEEYhyO5iSg4Vr5I2NMz8cIcTHTpjaxEQqjDgSgNDHrJGcwo0x/KTy5mQNSbBOfcjVk5SYB1
	bmQHYlLyfHpFdfOkEtAv+PjXNrwuk4B9XR89HSHZWiQyCF/qgEMP7e4/2ZUjmMeOLjW6SBbArIFJO
	JAlq57BlMpE6djS34V1+tNCLEniHDTmRDicF6PZ6OAG17onls+oTHwphKLwdtPUqqaC1DrTSvTIqB
	aJuU1+nE2VW5eBaWqJjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okh41-003qA4-Kw; Tue, 18 Oct 2022 07:31:01 +0000
Received: from mail-qv1-f51.google.com ([209.85.219.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okh3y-003q7E-Qi; Tue, 18 Oct 2022 07:31:00 +0000
Received: by mail-qv1-f51.google.com with SMTP id g9so8789060qvo.12;
        Tue, 18 Oct 2022 00:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mwq8mRE5qiqVJEFTV8PMaTxlxiFl0HRvXCI1ESDIAgA=;
        b=yitUbMKKMnEQjOJxZwvzFeQ4vQcUj98Sldhh8jCV+pQUTOERde6gLaHq0BycAJR9fi
         YA+yjBnVM8fqsXBxAST/WsplJCU018DbKRiBsFRwhIboSmdZPLlUZ3Nr9pb9EBLxNq8T
         yJ2Ul4YSpeGUS5sB8aFddrzxJYoA6bPLV07FhMSUZ9Qwi0kV56QE4ZHsfc28YaH/XEJL
         hPxBAU6GN5Nz5dg5RZNtWmfGwJ4hv5rdd7vh9G2salbsKiPVwQZJziuDNLCY6DpUpAKK
         IDtI9zvdGLWqvovpffE18/9gtHlaYSKbPjAdWcG03Cak60qWuT0LLZtUZKZyTifowaqM
         iNFA==
X-Gm-Message-State: ACrzQf1JzxAi8UNw85tpJLTPbTpOmqrhDYQ26XokA67S3dKkUIc3VOpN
	aWlIRJByxXuOD2jIFvVjy1ZZRS4tNRk7vTbz
X-Google-Smtp-Source: AMsMyM5BfDcig7+mz/6YfHV7iIGVjz1ImdrXjPh9NJcSvW31S5EjyNZciyJCDjFsI5caPHuKdlVAog==
X-Received: by 2002:a05:6214:c2d:b0:4b3:5d60:f41e with SMTP id a13-20020a0562140c2d00b004b35d60f41emr1061499qvd.37.1666078255700;
        Tue, 18 Oct 2022 00:30:55 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id n12-20020a05620a294c00b006ced5d3f921sm1835295qkp.52.2022.10.18.00.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 00:30:54 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-333a4a5d495so129208757b3.10;
        Tue, 18 Oct 2022 00:30:54 -0700 (PDT)
X-Received: by 2002:a81:848c:0:b0:356:e173:2c7a with SMTP id
 u134-20020a81848c000000b00356e1732c7amr1276352ywf.502.1666078253767; Tue, 18
 Oct 2022 00:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221018074014.185687-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20221018074014.185687-1-wangkefeng.wang@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Oct 2022 09:30:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwAgPkifAkah7MoBKBoyB4tb+HM5cgvenwNFaAfbg+UQ@mail.gmail.com>
Message-ID: <CAMuHMdWwAgPkifAkah7MoBKBoyB4tb+HM5cgvenwNFaAfbg+UQ@mail.gmail.com>
Subject: Re: [PATCH] mm: remove kern_addr_valid() completely
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, 
	linux-fsdevel@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, "David S . Miller" <davem@davemloft.net>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_003058_929856_7FAAB341 
X-CRM114-Status: GOOD (  20.55  )
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

On Tue, Oct 18, 2022 at 9:25 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> Most architectures(except arm64/x86/sparc) simply return 1 for
> kern_addr_valid(), which is only used in read_kcore(), and it
> calls copy_from_kernel_nofault() which could check whether the
> address is a valid kernel address, so no need kern_addr_valid(),
> let's remove unneeded kern_addr_valid() completely.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

>  arch/m68k/include/asm/pgtable_mm.h        |  2 -
>  arch/m68k/include/asm/pgtable_no.h        |  1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> [m68k]

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
