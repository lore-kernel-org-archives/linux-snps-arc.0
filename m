Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E35FECAAD5
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Sep 2022 01:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sgc7AstqWULnQRfnKWYCx8g5bADRaM0JMKjbRZb7r1w=; b=ulnz/Gg6VI9Bgg
	jfT1l3Jzwihb4JGJMNEUBaJWuoC+A/3WAtLgQoVx5oSc2Z4JNp8ANyy9oaM99V1SPY1fbZ8+5so3p
	UpwxNzKLKILJ/K6yLvAoGKg69aQzy0gpOUCyCaZz4MuvWribh7sBBaWw95D4v0rGeSX68CO7Mycp3
	Vm5Yn4m1x0tJlqcEtlet2Q7t0pPPfIYIA6u8jco9uw/14WMWiTB0Lk4fPDEqHb8WKkjRGYpbhhQd8
	Wn4rlgFbTU7S1HvfZsh9OaXbQv1jsZlZl4FH0PG4t8d6v2HUS3OnevtZElwXa7Bq1p7r4P3UnGWS4
	m04wjAFaBPfzepur57Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVkEg-001Pvn-UH; Wed, 07 Sep 2022 01:52:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVkEJ-001Pod-2K; Wed, 07 Sep 2022 01:51:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 62A2F61648;
	Wed,  7 Sep 2022 01:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC431C43470;
	Wed,  7 Sep 2022 01:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662515509;
	bh=ALcTG3mOVuLLio4WhI2L2jJkbp5XvNqkTSaJ5wmwyeM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KD4YkRAGIO3nhCBJBkD2pwrs2ava5BAoX9wtcgu3IFRoQVjrtiZuB4R9MgbpEzsxq
	 KW4AFCVtiUZlgB2+cstExwawru05w/BuMHDhwnpc7WjQGj+QVhkknLUVfBDmKGedGD
	 99jvlAe7BYgLqXHlUmDho9+hJ1g+JDEgK63SfRqWTf36g22O56vOPdF29EpBYq/p8b
	 dtek3UzHb1QYIE+Jy4pecoCJYlNRkpFOMwxlx+Mb+1LMdMCgPvlJIOZQE3xh2MIUwq
	 tR/PZy8WV7Tq4lJxm3DRN05aNFEm2H8PKdO2xzn+gkLKBPu+bFQhwgcCWo9JIcLYAj
	 kJ4OnuZ6o3Ctw==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-11e9a7135easo32644580fac.6;
        Tue, 06 Sep 2022 18:51:49 -0700 (PDT)
X-Gm-Message-State: ACgBeo3KhsiiEmPHQdw8ZvqTiLoV1QvhvEy76r4ksEF8umOx55KUHyw5
	g9Nm3oAp1G6ja9O+SST41+BxpQ88/mG57HdxamY=
X-Google-Smtp-Source: AA6agR5wU71q9oB13ta4xOEzTPcP8MJegkjW8lQNxzqUr3gEPcisWNIZ8cv6sJH9sEHuSDJ+obWgGJ+KHlsomjMI+dE=
X-Received: by 2002:a05:6808:150f:b0:343:3202:91cf with SMTP id
 u15-20020a056808150f00b00343320291cfmr10871221oiw.112.1662515508882; Tue, 06
 Sep 2022 18:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220903162328.1952477-1-guoren@kernel.org> <20220828135407.3897717-1-xianting.tian@linux.alibaba.com>
 <6c48657c-04df-132d-6167-49ed293dea44@microchip.com>
In-Reply-To: <6c48657c-04df-132d-6167-49ed293dea44@microchip.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 7 Sep 2022 09:51:36 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQvPpXwrfS_fTo+Pn=nufeCWE_tCcmPB-YZAZjdt9GbvA@mail.gmail.com>
Message-ID: <CAJF2gTQvPpXwrfS_fTo+Pn=nufeCWE_tCcmPB-YZAZjdt9GbvA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Add STACKLEAK erasing the kernel stack at the end
 of syscalls
To: Conor.Dooley@microchip.com
Cc: oleg@redhat.com, vgupta@kernel.org, linux@armlinux.org.uk, 
	monstr@monstr.eu, dinguyen@kernel.org, palmer@dabbelt.com, 
	davem@davemloft.net, arnd@arndb.de, shorne@gmail.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, ardb@kernel.org, 
	heiko@sntech.de, daolu@rivosinc.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org, 
	sparclinux@vger.kernel.org, openrisc@lists.librecores.org, 
	xianting.tian@linux.alibaba.com, linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_185151_212943_94E13FC3 
X-CRM114-Status: GOOD (  26.10  )
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

Hi all,

How about the generic_entry version:

https://lore.kernel.org/lkml/20220907014809.919979-1-guoren@kernel.org/

On Wed, Sep 7, 2022 at 1:35 AM <Conor.Dooley@microchip.com> wrote:
>
> On 03/09/2022 17:23, guoren@kernel.org wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > From: Xianting Tian <xianting.tian@linux.alibaba.com>
> >
> > This adds support for the STACKLEAK gcc plugin to RISC-V and disables
> > the plugin in EFI stub code, which is out of scope for the protection.
> >
> > For the benefits of STACKLEAK feature, please check the commit
> > afaef01c0015 ("x86/entry: Add STACKLEAK erasing the kernel stack at the end of syscalls")
> >
> > Performance impact (tested on qemu env with 1 riscv64 hart, 1GB mem)
> >     hackbench -s 512 -l 200 -g 15 -f 25 -P
> >     2.0% slowdown
> >
> > Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
>
> What changed since Xianting posted it himself a week ago:
> https://lore.kernel.org/linux-riscv/20220828135407.3897717-1-xianting.tian@linux.alibaba.com/
>
> There's an older patch from Du Lao adding STACKLEAK too:
> https://lore.kernel.org/linux-riscv/20220615213834.3116135-1-daolu@rivosinc.com/
>
> But since there's been no activity there since June...
>
> > ---
> >  arch/riscv/Kconfig                    | 1 +
> >  arch/riscv/include/asm/processor.h    | 4 ++++
> >  arch/riscv/kernel/entry.S             | 3 +++
> >  drivers/firmware/efi/libstub/Makefile | 2 +-
> >  4 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index ed66c31e4655..61fd0dad4463 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -85,6 +85,7 @@ config RISCV
> >         select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
> >         select HAVE_ARCH_THREAD_STRUCT_WHITELIST
> >         select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
> > +       select HAVE_ARCH_STACKLEAK
> >         select HAVE_ASM_MODVERSIONS
> >         select HAVE_CONTEXT_TRACKING_USER
> >         select HAVE_DEBUG_KMEMLEAK
> > diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
> > index d0537573501e..5e1fc4f82883 100644
> > --- a/drivers/firmware/efi/libstub/Makefile
> > +++ b/drivers/firmware/efi/libstub/Makefile
> > @@ -25,7 +25,7 @@ cflags-$(CONFIG_ARM)          := $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> >                                    -fno-builtin -fpic \
> >                                    $(call cc-option,-mno-single-pic-base)
> >  cflags-$(CONFIG_RISCV)         := $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> > -                                  -fpic
> > +                                  -fpic $(DISABLE_STACKLEAK_PLUGIN)
> >
> >  cflags-$(CONFIG_EFI_GENERIC_STUB) += -I$(srctree)/scripts/dtc/libfdt
> >
> > --
> > 2.17.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
