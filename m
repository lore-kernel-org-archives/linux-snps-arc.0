Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F49C43334
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Jul 2022 11:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NN+kIQuHJWS+EiZ+33r29ZHQBzj7ZGm74JBANAgbCtw=; b=KRwmAKZBz8fS/m
	nQeM6emyG4GF2fxE2KBPmCAt/5mQkA5dvIxzSm+CnCIYEWuQAcGeE9mU0zAxps9OHMu3P7ElEkTy1
	km5EMlwt1piCnnciVFvWpqQQqk7PNMxZxi2EftX39hoNb8azNiACciNyffmsOGlzgRIwxcJJVegsh
	kEESNX3+F3HoYve2eNOgTRa5yT9TqxdYi/W1hvtM2aCdCQXfiIzy62ZxActQXYGfyegaku529Sk0H
	zPdN/fmVgTXD3WxXeEDHLwpwXAk4VClJpjUatIhjQOownu4CPJx4CnrvqYMTRIXZp3kihkWJ/AeY6
	wuSlK4y7KgCjuPSZlSoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o930x-009K4K-MY; Wed, 06 Jul 2022 11:16:15 +0000
Received: from mail-qk1-f179.google.com ([209.85.222.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91sv-00873T-Ai; Wed, 06 Jul 2022 10:03:55 +0000
Received: by mail-qk1-f179.google.com with SMTP id z16so10638684qkj.7;
        Wed, 06 Jul 2022 03:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=moQR5LBdu+yLzctPNV/vOqPzvGKHHurzxQlNOu9l9Us=;
        b=zyIus2bFF58rkeMMh8/J60l5LlZyrPz305JhA5QdMBQ9BJIrrYrdyHwnbdDe3QDKcW
         tNU+zllcjhQzXj607NRf77SR1WwnwjyujbxJC/BRUVSzj7ZNDSlmEnvFyrq6jJXVlx88
         Dl5I8Gg8Epb0WSympbRbcCuXetb81qcE8Fkkwf6Fc1xI78GRT2EGy302e3y32MeIzelt
         Rx1lzrMp1HEK52JS2sXch9+b5Sprw7sSlj/OLv0fBud/R4TE0eUmLG6Oa1Pvy4aATCTE
         8WcOrLbi/ZzAhZO0BSNwvQxKgjlsls/8SU7ETPWmpfs7LVt3D0QmludB5l8ERKUB2Qgz
         Z26g==
X-Gm-Message-State: AJIora9LDZ6bf7hJmj2Ud/+eFB2hhkd7KZFJEMg+M0e4TfABaeofgiRf
	2elk7zR+V1pLqaeRrjjdrBYEvyWEEZfKYIEc
X-Google-Smtp-Source: AGRyM1st5bgOldurPzv9ren1vBMLPZ6y9sMPfHN9kOsAUC3bOKdkRw+ShD+M0sh9sPBPAmrCGcnzrQ==
X-Received: by 2002:a05:620a:4587:b0:6af:1a0a:4895 with SMTP id bp7-20020a05620a458700b006af1a0a4895mr26500575qkb.742.1657101830121;
        Wed, 06 Jul 2022 03:03:50 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id az8-20020a05620a170800b006b14b303b37sm16805475qkb.102.2022.07.06.03.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 03:03:49 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-31cb2c649f7so60184367b3.11;
        Wed, 06 Jul 2022 03:03:49 -0700 (PDT)
X-Received: by 2002:a0d:c787:0:b0:31b:a963:e1de with SMTP id
 j129-20020a0dc787000000b0031ba963e1demr44581975ywd.283.1657101828958; Wed, 06
 Jul 2022 03:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220630051630.1718927-1-anshuman.khandual@arm.com> <20220630051630.1718927-22-anshuman.khandual@arm.com>
In-Reply-To: <20220630051630.1718927-22-anshuman.khandual@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jul 2022 12:03:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_Ji7dCzzCc3xw5ic6J=0PaPkyzXKpOgUFjjEkR+yJOw@mail.gmail.com>
Message-ID: <CAMuHMdX_Ji7dCzzCc3xw5ic6J=0PaPkyzXKpOgUFjjEkR+yJOw@mail.gmail.com>
Subject: Re: [PATCH V6 21/26] m68k/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-csky@vger.kernel.org, 
	sparclinux <sparclinux@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-s390 <linux-s390@vger.kernel.org>, 
	"open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, "the arch/x86 maintainers" <x86@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Christoph Hellwig <hch@infradead.org>, 
	arcml <linux-snps-arc@lists.infradead.org>, 
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, linux-um <linux-um@lists.infradead.org>, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>, Openrisc <openrisc@lists.librecores.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Parisc List <linux-parisc@vger.kernel.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_030353_512252_87CA2275 
X-CRM114-Status: GOOD (  26.33  )
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

Hi Anshuman,

On Thu, Jun 30, 2022 at 7:19 AM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> This enables ARCH_HAS_VM_GET_PAGE_PROT on the platform and exports standard
> vm_get_page_prot() implementation via DECLARE_VM_GET_PAGE_PROT, which looks
> up a private and static protection_map[] array. Subsequently all __SXXX and
> __PXXX macros can be dropped which are no longer needed.
>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Thanks for your patch!

> --- a/arch/m68k/include/asm/mcf_pgtable.h
> +++ b/arch/m68k/include/asm/mcf_pgtable.h
> @@ -91,60 +91,6 @@
>   * for use. In general, the bit positions are xwr, and P-items are
>   * private, the S-items are shared.
>   */

The comment above should be removed, too.

> -#define __P000         PAGE_NONE
> -#define __P001         __pgprot(CF_PAGE_VALID \
> -                                | CF_PAGE_ACCESSED \
> -                                | CF_PAGE_READABLE)

> --- a/arch/m68k/include/asm/motorola_pgtable.h
> +++ b/arch/m68k/include/asm/motorola_pgtable.h
> @@ -83,28 +83,6 @@ extern unsigned long mm_cachebits;
>  #define PAGE_COPY_C    __pgprot(_PAGE_PRESENT | _PAGE_RONLY | _PAGE_ACCESSED)
>  #define PAGE_READONLY_C        __pgprot(_PAGE_PRESENT | _PAGE_RONLY | _PAGE_ACCESSED)

You might move the *_C definitions above into arch/m68k/mm/motorola.c
as well, as they are only used in the latter.

>
> -/*
> - * The m68k can't do page protection for execute, and considers that the same are read.
> - * Also, write permissions imply read permissions. This is the closest we can get..
> - */
> -#define __P000 PAGE_NONE_C
> -#define __P001 PAGE_READONLY_C
> -#define __P010 PAGE_COPY_C
> -#define __P011 PAGE_COPY_C
> -#define __P100 PAGE_READONLY_C
> -#define __P101 PAGE_READONLY_C
> -#define __P110 PAGE_COPY_C
> -#define __P111 PAGE_COPY_C
> -
> -#define __S000 PAGE_NONE_C
> -#define __S001 PAGE_READONLY_C
> -#define __S010 PAGE_SHARED_C
> -#define __S011 PAGE_SHARED_C
> -#define __S100 PAGE_READONLY_C
> -#define __S101 PAGE_READONLY_C
> -#define __S110 PAGE_SHARED_C
> -#define __S111 PAGE_SHARED_C
> -
>  #define pmd_pgtable(pmd) ((pgtable_t)pmd_page_vaddr(pmd))
>
>  /*
> diff --git a/arch/m68k/include/asm/sun3_pgtable.h b/arch/m68k/include/asm/sun3_pgtable.h
> index 5e4e753f0d24..9d919491765b 100644
> --- a/arch/m68k/include/asm/sun3_pgtable.h
> +++ b/arch/m68k/include/asm/sun3_pgtable.h
> @@ -71,23 +71,6 @@
>   * protection settings, valid (implying read and execute) and writeable. These
>   * are as close as we can get...
>   */

The comment above should be removed, too.

> -#define __P000 PAGE_NONE
> -#define __P001 PAGE_READONLY

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
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
