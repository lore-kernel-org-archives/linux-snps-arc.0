Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93611C433F5
	for <linux-snps-arc@archiver.kernel.org>; Sat,  8 Oct 2022 00:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FViSr53Kn3YrupM0nkimtelk9freAvd+aI835qqblsM=; b=xbOXByhh3OOxtO
	9EEQwOBcphteN3EVnGLurFTV7LP1h0GciQEbY1AiVhiPsBzRCLr4t4F4ygowwwJpl9IWK/W0og1gz
	LLhesMEFwnvJ+VykEac7tu6P7btoM7Bwct/zxDLakEW0bfYuGuyuTepi/klqKlM0GXIjKPfB3m7Dq
	vBYPQYiKac4C/bhY9xmagBLrDv0p6drw7av127oinU6h7JSwpoR3a9YIufDgw3SJrNYhqBFQ/a0/C
	2pevSnCA0FQOoqYzL3wH6hmGBQjTzAENsyVfD+FS5taVCJQTjyA/sct/XCF5DYWVnu4QoFNmDvo6/
	Bwz07cnxKB4WygwT7+Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogxHH-00B69J-My; Sat, 08 Oct 2022 00:01:15 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogxH1-00B66b-Jy; Sat, 08 Oct 2022 00:01:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F338EB82477;
	Sat,  8 Oct 2022 00:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A529AC43470;
	Sat,  8 Oct 2022 00:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665187255;
	bh=1QNTKASnThQzK9t9YJPKB3S5uW+rMCtzlHpZ4T+ejK4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nbaf5kXNGDwWzlsoB1UwvScZICJk41H+byHZ/oFGC1HHj6G6NNdgI/bP/IrRKpO6m
	 94rwv4rTVMhQbV96xn0vJCT7fMbX7mt3hQFDHQJ6ftHeEGWMgFakkmSVai9FPVvD6M
	 WiD3Hpl3Limwpe7zf5w8xMdKL7Ga+2GnaSLAUSMoSLPyFJGSmV8rrC/fEk1YX8oHkA
	 Gdrs5F9PQiOa3vFSPO3gCYuHspD58Jh6CFy5OkpsvZEI8cIwKKxK2BF/Tt1i4oanwS
	 PvI1HRni+yI/MxkLpx4IdX6IdMaZ0/PTOYJaBbUXT4DpXMXPzcwwsZnKBXgncd1f1B
	 KRwVsi4nDwydA==
Received: by mail-oi1-f176.google.com with SMTP id m130so7248401oif.6;
        Fri, 07 Oct 2022 17:00:55 -0700 (PDT)
X-Gm-Message-State: ACrzQf12jdm21vWJsWfPQCOvjDakOJ9jaXdJA83jKgUvzYZvRz7MzuGa
	EoI6a3yK/xqAlJImaJ02cCVcwqER2Zf4as63nYI=
X-Google-Smtp-Source: AMsMyM43x1xUF8/u4qEx0O4CLZy7PM9HGCWHCoBGuVZwK3v1D/JkfKAVQrBSId34wQKf2vHacT5ZjsmS+8zaB+iFHDo=
X-Received: by 2002:aca:6155:0:b0:353:e740:ce01 with SMTP id
 v82-20020aca6155000000b00353e740ce01mr8672777oib.19.1665187254786; Fri, 07
 Oct 2022 17:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <6c48657c-04df-132d-6167-49ed293dea44@microchip.com> <mhng-8c3bb2e7-e84e-4aaa-bce8-3e8054255a2c@palmer-ri-x1c9>
In-Reply-To: <mhng-8c3bb2e7-e84e-4aaa-bce8-3e8054255a2c@palmer-ri-x1c9>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 8 Oct 2022 08:00:42 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRER75PyqniiTZgeeHjiy5UKVtrr89iPrdx_EzYPUC9Lg@mail.gmail.com>
Message-ID: <CAJF2gTRER75PyqniiTZgeeHjiy5UKVtrr89iPrdx_EzYPUC9Lg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Add STACKLEAK erasing the kernel stack at the end
 of syscalls
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor.Dooley@microchip.com, oleg@redhat.com, vgupta@kernel.org, 
	linux@armlinux.org.uk, monstr@monstr.eu, dinguyen@kernel.org, 
	davem@davemloft.net, Arnd Bergmann <arnd@arndb.de>, shorne@gmail.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, ardb@kernel.org, 
	heiko@sntech.de, daolu@rivosinc.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org, 
	sparclinux@vger.kernel.org, openrisc@lists.librecores.org, 
	xianting.tian@linux.alibaba.com, linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_170059_997787_C6CE06ED 
X-CRM114-Status: GOOD (  31.26  )
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

On Fri, Oct 7, 2022 at 10:31 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 06 Sep 2022 10:35:10 PDT (-0700), Conor.Dooley@microchip.com wrote:
> > On 03/09/2022 17:23, guoren@kernel.org wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>
> >> From: Xianting Tian <xianting.tian@linux.alibaba.com>
> >>
> >> This adds support for the STACKLEAK gcc plugin to RISC-V and disables
> >> the plugin in EFI stub code, which is out of scope for the protection.
> >>
> >> For the benefits of STACKLEAK feature, please check the commit
> >> afaef01c0015 ("x86/entry: Add STACKLEAK erasing the kernel stack at the end of syscalls")
> >>
> >> Performance impact (tested on qemu env with 1 riscv64 hart, 1GB mem)
> >>     hackbench -s 512 -l 200 -g 15 -f 25 -P
> >>     2.0% slowdown
> >>
> >> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> >
> > What changed since Xianting posted it himself a week ago:
> > https://lore.kernel.org/linux-riscv/20220828135407.3897717-1-xianting.tian@linux.alibaba.com/
> >
> > There's an older patch from Du Lao adding STACKLEAK too:
> > https://lore.kernel.org/linux-riscv/20220615213834.3116135-1-daolu@rivosinc.com/
> >
> > But since there's been no activity there since June...
>
> Looks like the only issues were some commit log wording stuff, and that
> there's a test suite that should be run.  It's not clear from the
> commits that anyone has done that, I'm fine with the patch if it passes
> the tests but don't really know how to run them.
>
> Has anyone run the tests?
I'm trying to do that with genric_entry.
https://lore.kernel.org/linux-riscv/20220615213834.3116135-1-daolu@rivosinc.com/

Mark Rutland has found an issue, and I'm solving it.

>
> >
> >> ---
> >>  arch/riscv/Kconfig                    | 1 +
> >>  arch/riscv/include/asm/processor.h    | 4 ++++
> >>  arch/riscv/kernel/entry.S             | 3 +++
> >>  drivers/firmware/efi/libstub/Makefile | 2 +-
> >>  4 files changed, 9 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >> index ed66c31e4655..61fd0dad4463 100644
> >> --- a/arch/riscv/Kconfig
> >> +++ b/arch/riscv/Kconfig
> >> @@ -85,6 +85,7 @@ config RISCV
> >>         select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
> >>         select HAVE_ARCH_THREAD_STRUCT_WHITELIST
> >>         select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
> >> +       select HAVE_ARCH_STACKLEAK
> >>         select HAVE_ASM_MODVERSIONS
> >>         select HAVE_CONTEXT_TRACKING_USER
> >>         select HAVE_DEBUG_KMEMLEAK
> >> diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
> >> index d0537573501e..5e1fc4f82883 100644
> >> --- a/drivers/firmware/efi/libstub/Makefile
> >> +++ b/drivers/firmware/efi/libstub/Makefile
> >> @@ -25,7 +25,7 @@ cflags-$(CONFIG_ARM)          := $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> >>                                    -fno-builtin -fpic \
> >>                                    $(call cc-option,-mno-single-pic-base)
> >>  cflags-$(CONFIG_RISCV)         := $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> >> -                                  -fpic
> >> +                                  -fpic $(DISABLE_STACKLEAK_PLUGIN)
> >>
> >>  cflags-$(CONFIG_EFI_GENERIC_STUB) += -I$(srctree)/scripts/dtc/libfdt
> >>
> >> --
> >> 2.17.1
> >>
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv
> >



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
