Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C58C433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Feb 2022 09:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJmzKNHS3+y6vfhesOrigu4GcMTtthR8ETCQVDcRWjU=; b=rFiWSGExH2FUuw
	A5l6NluYkXzQrsYGTfXpXApi/Dl4l5mQ5WBm1SKQXxZoN6WLu+YD+6LPRp6X/ahnZLGI0vKvIV4C+
	bew3YWe5Q66ifE5DB7oOYMYbsFQl/Kd259t7LXkaiVpjAOodCW9w3bMSy1KtLl4E+enLu7JmXegEf
	U/vxH801KFmH8Hky/PTa5GbrT7wtWIwAAElLb2r38DmN+HccNPs/qn/vx4a5ycJ7BtFS7QmF0wjN5
	uHaKylkGKDYXKdXqirYKa6AoFdVdQ4JB+MXagf29Q3Q82O8pB3rlnM+OcElGnsOiQ2GFgaML0VXK+
	MH5UsAyo9jN/P9g/p6Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJuJq-0024Sg-O2; Tue, 15 Feb 2022 09:40:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJuJk-0024Qr-Fw; Tue, 15 Feb 2022 09:40:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7F82AB8180E;
 Tue, 15 Feb 2022 09:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CE0C340EB;
 Tue, 15 Feb 2022 09:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644918014;
 bh=hv8AUuEMkapI1zY2x6Wj+fHd7ew8TaKYgsOBPTPrxmw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VHH7CU79U316XDMWHeHJ8++Eh1MMKITXbQSzlZ0DrA6kWekzDktkCy5KhY7hZLGK7
 gfiQHmPbEC7L4AF+NDTP3++2HyxQqgay+CXVkTp1m9wIZSWiRsxhjEsRH76HB3HAb3
 /5H0IwFoMYLMdcVT0XuD8P6Vw9GPBTkN9xgNY7hhrRN337S5eN73tDcRKRPLMOcNTg
 NXwi07ICMcsXTT77IYOqmuFqUW8m3AaA+2IJmg2fkpra1D1NcZ3zVXZBTrXdEvv5Oq
 0XRwvrersUnw/PUKjeaOsXZQOemvEGElTmz0nKHB8fy3fN/J5cS0vZm5lHkoOpeHoi
 hdacTJ8dWWJzg==
Received: by mail-wm1-f53.google.com with SMTP id o34so7239867wms.1;
 Tue, 15 Feb 2022 01:40:14 -0800 (PST)
X-Gm-Message-State: AOAM532KWGGI1v9QHBYYehOSvqeu4d6osBP245bssgXQ0zmdhBgV00nS
 pzEfisydCnKWKaV3IDSKglKI5Y/CKg1I2ZNnyIU=
X-Google-Smtp-Source: ABdhPJxpFSyo2tIfVZXx6xnWqAN7kXzL0SfiKGeaqLH7fIF3GRmujo8Iug1QC1Z1ypgNgRnGoRSGx0exr14yXtWS6QY=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr2314325wms.82.1644918002508; Tue, 15
 Feb 2022 01:40:02 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-9-arnd@kernel.org>
 <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
 <CAK8P3a2VfvDkueaJNTA9SiB+PFsi_Q17AX+aL46ueooW2ahmQw@mail.gmail.com>
 <CAMj1kXGkG0KMD2rnKAJc3V7X9LP1grbcHTNYMnj_q4GiYfG2pQ@mail.gmail.com>
In-Reply-To: <CAMj1kXGkG0KMD2rnKAJc3V7X9LP1grbcHTNYMnj_q4GiYfG2pQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 15 Feb 2022 10:39:46 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0NTqK_m7q909d8FN6is8k4_u3zeckC9XOrjEi7kqSvmg@mail.gmail.com>
Message-ID: <CAK8P3a0NTqK_m7q909d8FN6is8k4_u3zeckC9XOrjEi7kqSvmg@mail.gmail.com>
Subject: Re: [PATCH 08/14] arm64: simplify access_ok()
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>, 
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, 
 Brian Cain <bcain@codeaurora.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
 Dinh Nguyen <dinguyen@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Helge Deller <deller@gmx.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Rich Felker <dalias@libc.org>, 
 "David S. Miller" <davem@davemloft.net>, Richard Weinberger <richard@nod.at>,
 X86 ML <x86@kernel.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, alpha <linux-alpha@vger.kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-csky@vger.kernel.org, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-ia64@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, 
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>, 
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:S390" <linux-s390@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, 
 "open list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Robin Murphy <robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_014016_887363_9D09CD0F 
X-CRM114-Status: GOOD (  15.10  )
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

On Tue, Feb 15, 2022 at 10:21 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> On Tue, 15 Feb 2022 at 10:13, Arnd Bergmann <arnd@kernel.org> wrote:
>
> arm64 also has this leading up to the range check, and I think we'd no
> longer need it:
>
>     if (IS_ENABLED(CONFIG_ARM64_TAGGED_ADDR_ABI) &&
>         (current->flags & PF_KTHREAD || test_thread_flag(TIF_TAGGED_ADDR)))
>             addr = untagged_addr(addr);

I suspect the expensive part here is checking the two flags, as untagged_addr()
seems to always just add a sbfx instruction. Would this work?

#ifdef CONFIG_ARM64_TAGGED_ADDR_ABI
#define access_ok(ptr, size) __access_ok(untagged_addr(ptr), (size))
#else // the else path is the default, this can be left out.
#define access_ok(ptr, size) __access_ok((ptr), (size))
#endif

       Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
