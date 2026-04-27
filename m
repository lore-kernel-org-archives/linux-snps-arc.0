Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2057BFF8867
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Apr 2026 21:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mozBpLzn8lcZLyU0pYHriWdzScmaiTz8UNbLe7Wk7Mk=; b=r1aEnjpTTn1ac8
	nS9SV3fvrma+QjmsIaKPvD31Z6qMfdMgiJErMIAIDOHm/YuiwgXG7LqOqaqMFBCH/h3qYVoPTT4j5
	iuEJyyvw5MBUftnDH8Djk+ZoSYux+Mg2dPaNCr0s/srraAqqTTi6FrcxutBr0954MLnEAQxHMlba6
	+EJMIGOR8F74BL0OTuJnGjEE+NUcAQPs6KsZuQIOQcd4EQVSj7PnHR7aJ0AU0jKzzyN95Vy/tjzTP
	yty+sefEJALERPnWfI+Ny2/rdvEPnLY8vwTZXg4gJHT6ni2PRHlpqnnyCMOdznq140ZKimqDKcX3V
	tSgvW8gR124/4FpmbM6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTW8-00000000AzM-2ciN;
	Mon, 27 Apr 2026 21:29:24 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTW4-00000000AxO-1ntU
	for linux-snps-arc@lists.infradead.org;
	Mon, 27 Apr 2026 21:29:22 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48909558b3aso107119435e9.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 27 Apr 2026 14:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777325358; x=1777930158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ebg5+i/pOUuQx7xxuERTUppaj1qL6vIxTxgv86V/NC0=;
        b=IMLbRmYEXHk4kUnosshE5P5pf1HqFLf0l7XiDgwKvr7oE5MkpvdH0FTxH9LxckM35l
         Os4ccdgiiqlHRjRvL+RryGdn7oCPjsw6SLFUekQpynSRUqQHJnFXCP4HacqJvlh9iVis
         zGNZ4qYId5So/UVoGJsvJ2dwzmNYcRR49V1njggySedCiI895cCkL8pOoq75Ll5tg6UJ
         gs8U4RZrdEdp2ukJO+287TbmqmdaAnfgJD/SIT9nlPuRmKUl02/Bp4INCRNCNdvLwWsW
         ZotKCyVf/DPyX+Q0XgzSuhekf61ba0R2ykzyXafBvJJhNbQi7bDkg47gbRImxl3ioFqu
         McvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777325358; x=1777930158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ebg5+i/pOUuQx7xxuERTUppaj1qL6vIxTxgv86V/NC0=;
        b=VbJ3gD57wahRHB/EBg4yWOU5zzieNmw3zp8Aye3hm4qm7ep1sUENhYpAiQWPEWlK4F
         xJcEM+aLSKDdphi4OFfWlSsEpnuaz7JKI5lxsfHrR/SftH3z8XymS+Wpb6UBd9GYv+Sf
         44msoRkvE3mM8Dv5c55ovoRQb1rG5Uk0f+zrWW59HfGLshj5XESyD0w/CqTVh6vD63gk
         Vwv1sc8W/MsogQa83DYrl3MAId3M+8/ISd3Emq/Tie5TghpSJkdHtJ0cMWgTbiMeMvWh
         3t3rCqpeZla3vNWDQLQeQ07rYUFiXTtoajV4/AqNj16U+7ml9gXCgCaPtaq+Mhrs75M+
         8AqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+AyHFq4iimPsPVJbrtpuJGmWsHzVgf9yHPJ6kauRjsdhm1T6iDnmK7JQz84gkXJZCswCf+rv+/3PJK0f0WPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEd/M6//y6pNYV6RF12POHJEYJy9kmGytBFEo6snkl4uCMYdXF
	feq5JRKsu2PIKlWwLt8q3qTZDOQCk8JifJj7x2lTundNOFdiwM37hsOO
X-Gm-Gg: AeBDiesG2gQ1gbsa0ArwMEKQ1Clus+bjB/ErmLhiEJANS4ueL+PeYHbtFBukyLn5nQm
	lm2vsd6EY9/TCb4F4bIUzrcx3xWyCoD2ptyVwMA2FHY3tog/2fM+KaYOLmHFikvp/KZNlGF0f5f
	Zv/wliPKCCIg8d+MIdkhXRWpOR9A0xWmjFznQdrg6uhDyx4tRY6HfxtVwaEuTNvkZFrdyLvL+SZ
	1iuJftAS6XzbdkGK7XrkTwb8DboCnMzymQTt4nTkMKoyNHTm0fv0gKNqkxQ0cNOyS0MRcYrEj73
	nUVw9p2KNoeGqbCHK6yiLD83s7oucakgbPqRtw2CW2VQMQ64+N2eek3kYrWn1Ls6B80s9JzFxYv
	2MueQ9w3idfurOAXLg2WizmLpDf1TyFJ5mAtBx52EfeM+id61tfQal3I0dUeornx2g8X2Wz/Yrm
	4PthRBJNA1rfId4ObHy7hKKC4juLPSVQpKc7kATf0Kfc9ZSgHixgutpZ2K/OpoU53SYgfK6SHYK
	AxlToJfH1h/Tw==
X-Received: by 2002:a05:6000:3109:b0:43d:7d6f:f531 with SMTP id ffacd0b85a97d-44649ba1f4amr816127f8f.30.1777325358072;
        Mon, 27 Apr 2026 14:29:18 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463d02f270sm1120515f8f.9.2026.04.27.14.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:29:17 -0700 (PDT)
Date: Mon, 27 Apr 2026 22:29:14 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Yury Norov
 <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, Thomas
 Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 dmaengine@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-x25@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-sound@vger.kernel.org,
 sound-open-firmware@alsa-project.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-arch@vger.kernel.org
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to
 copy_{to/from}_user_partial() when relevant
Message-ID: <20260427222914.1cb2dd3b@pumpkin>
In-Reply-To: <CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com>
References: <cover.1777306795.git.chleroy@kernel.org>
	<289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
	<CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_142920_530582_82B239EA 
X-CRM114-Status: GOOD (  51.17  )
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

On Mon, 27 Apr 2026 12:01:23 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, 27 Apr 2026 at 10:18, Christophe Leroy (CS GROUP)
> <chleroy@kernel.org> wrote:
> >
> > In a subsequent patch, copy_{to/from}_user() will be modified to
> > return -EFAULT when copy fails.  
> 
> Please don't do this.
> 
> This is a maintenance nightmare, and changes pretty much three decades
> of semantics, and will cause *very* subtle backporting issues if
> somebody happens to rely on the old / new behavior.
> 
> I understand the reasoning for the change, but I really don't think
> the pain of creating yet another user copy interface is worth it.
> 
> We already have a lot of different versions of user copies for
> different reasons, and while they all tend to have a good reason (and
> some not-so-good, but historical reasons) for existing, this one
> doesn't seem worth it.
> 
> The main - perhaps only - reason for this "partial" version is that
> you want to do that "automatically inlined and optimized fixed-sized
> case".
> 
> But here's the thing: I think you can already do that. Yes, it
> requires some improvements to unsafe_copy_from_user(), but *that*
> interface doesn't have three decades of history associated with it,
> _and_ you're extending on that one anyway in this series.
> 
> "unsafe_copy_from_user()" is very odd, is meant only for small simple
> copies that can be inlined and it's special-cased for 'objtool' anyway
> (because objtool would have complained about an out-of-line call,
> although it could have been special-cased other ways).
> 
> In other words: unsafe_copy_from_user() is *very* close to what you
> want for that "Oh, I noticed that it's a small fixed-size copy, so I
> want to special-case copy-from-user for that".
> 
> The _only_ issue with unsafe_copy_from_user() is that you can't see
> that there were partial successes. But if *that* was fixed, then this
> whole "create a new copy_from_user interface" issue would just go
> away.
> 
> So please - let's just change unsafe_copy_from_user() to be usable for
> the partial case.
> 
> And the thing is, all the existing unsafe_copy_from_user()
> implementations already effectively *have* the "how much did I not
> copy" internally, and they actually do extra work to hide it, ie they
> have things like that
> 
>         int _i;
> 
> that is "how many bytes have I copied" in the powerpc implementation,
> or the x86 code does
> 
>         size_t __ucu_len = (_len);
> 
> where that "ucu_len" is updated as you go along and is literally the
> "how many bytes are left to copy" return value that is missing from
> this interface.
> 
> So what I would suggest is
> 
>  - introduce a new user accessor helper that is used for *both*
> unsafe_copy_to/from_user() *and* the "inline small constant-sized
> normal copy_to/from_user()" calls
> 
>  - it's the same thing as the existing  unsafe_copy_to/from_user()
> implementation, except it exposes how many bytes are left to be copied
> to the exception label.

I think there is a slight difference in that the normal copy_to_user()
will determine the exact offset of the error by retrying with byte copies.

There is also the issue of misaligned copies.

Then there is the 'bugbear' of hardened user copies.
Chasing down the stack to find whether the kernel buffer crosses
a stack frame is probably more expensive than the copy for the typically
small copies that will use on-stack buffers.

	David

> 
> IOW, it would look something like
> 
>      #define unsafe_copy_to_user_outlen(_dst,_src,_len,label)...
> 
> which is exactly the same as the current unsafe_copy_to_user(),
> *except* it changes "_len" as it does along.
> 
> And then you use that for both the "real" unsafe_copy_user and for the
> "small constant values" case.
> 
> Just as an example, attached is a completely stupid rough draft of a
> patch that does this for x86 and only for unsafe_copy_to_user().
> 
> And I made a very very hacky change to kernel/sys.c to see what the
> code generation looks like.
> 
> This is what it results in on x86 with clang (with all the magic
> .section data edited out):
> 
>         ... edited out the code to generate the times
>         ... this is the actual user copy:
>         # HERE!
>         movabsq $81985529216486895, %rcx        # imm = 0x123456789ABCDEF
>         cmpq    %rcx, %rbx
>         cmovaq  %rcx, %rbx
>         stac
>         movq    %r13, (%rbx)                    # exception to .LBB45_8
>         movq    %r14, 8(%rbx)                   # exception to .LBB45_8
>         movq    %r15, 16(%rbx)                  # exception to .LBB45_8
>         movq    %rax, 24(%rbx)                  # exception to .LBB45_8
>         clac
> .LBB45_6:
>         movq    jiffies(%rip), %rdi
>         callq   jiffies_64_to_clock_t
> .LBB45_7:
>         addq    $16, %rsp
>         popq    %rbx
>         popq    %r12
>         popq    %r13
>         popq    %r14
>         popq    %r15
>         retq
> .LBB45_8:
>         clac
>         movq    $-14, %rax
>         jmp     .LBB45_7
> 
> and notice how the compiler noticed that the 'outlen' isn't actually
> used, and turned the exception label into just a "return -EFAULT" and
> never actually generated any code for updating remaining lengths?
> 
> That actually looks pretty much optimal for a 32-byte user copy.
> 
> And it didn't involve changing the semantics at all.
> 
> Just to check, I changed that "times()" system call to return the
> number of bytes uncopied instead (to emulate the "I actually want to
> know what's left" case), and it generated this:
> 
>         # HERE!
>         movabsq $81985529216486895, %rcx        # imm = 0x123456789ABCDEF
>         cmpq    %rcx, %rbx
>         cmovaq  %rcx, %rbx
>         stac
>         movl    $32, %ecx
>         movq    %r13, (%rbx)                    # exception to .LBB45_7
>         movl    $24, %ecx
>         movq    %r15, 8(%rbx)                   # exception to .LBB45_7
>         movl    $16, %ecx
>         movq    %r14, 16(%rbx)                  # exception to .LBB45_7
>         movl    $8, %ecx
>         movq    %rax, 24(%rbx)                  # exception to .LBB45_7
>         clac
>         xorl    %ecx, %ecx
> .LBB45_8:
>         movq    %rcx, %rax
>         addq    $16, %rsp
>         popq    %rbx
>         popq    %r12
>         popq    %r13
>         popq    %r14
>         popq    %r15
>         retq
> .LBB45_6:
>         movq    jiffies(%rip), %rdi
>         jmp     jiffies_64_to_clock_t           # TAILCALL
> .LBB45_7:
>         clac
>         jmp     .LBB45_8
> 
> so it all seems to work - although obviously the above is *not* the normal case.
> 
> NOTE NOTE NOTE! The attached patch is entirely untested. I obviously
> did some "test code generation" with it, but I only *looked* at the
> result, and maybe it has some fundamental problem that I just didn't
> notice. So treat this as a "how about this approach" patch, not as
> anything more serious than that.
> 
> And the kerrnel/sys.c hack is very obviously just that: a complate
> hack for testing.
> 
> A real patch would do that "for small constant-sized copies, turn
> copy_to_user() automatically into "_small_copy_to_user()".
> 
> The attached is *not* a real patch. Treat it with the contempt it deserves.
> 
>              Linus


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
