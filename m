Return-Path: <SRS0=Frhj=K4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B254C4708F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Jun 2021 11:49:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E328B613AA
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Jun 2021 11:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E328B613AA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8nnCsa6CQDn5zm2fwlo4mDXtCFhHduUXsGmqKhNHul8=; b=J+QEbuUVC7Rm7v
	bzAtG8L61Er+r9GWu2cmp8qdF/NieLKgXgjmX2xJ0J2/GVeoMLya/3Qh1/Vuj3s9jhA2PNEN9YSVo
	kIjtZnm77LYSHTP27BGzRt24fZjhw4SXSMtxPrJIjNUxUuWVbON3H/CYctOrEO2JJXlk3HxFFvve8
	spZJ3a2DGNi8XJn24Y8lacEv0LdIaYUp8Il7mv11RbR0rNWCrA7rmBHytKI+TZznhMCvY4M6gcp0b
	rP2oP7pkv06wgdEeBZHSs79m/fk1AMBNIMd94ysrYv3SPWBPTyrOSvIY+UOggqq/Fd8fxdJkBtgP5
	RDe5xUEnyQy5C5eR+B5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loPMq-003pMy-Vv; Wed, 02 Jun 2021 11:49:00 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loP0D-003j0A-TP; Wed, 02 Jun 2021 11:25:39 +0000
Received: by mail-ua1-f47.google.com with SMTP id m23so1063814uao.12;
 Wed, 02 Jun 2021 04:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AV6hHV9w+Q9HOaDxt1MduQbvvUP04JEJ1UZD5l/XTkY=;
 b=b8CtXmIzhySaSrsTw22u2a3za+vwaYF8bcZdd+lXywMv+udfS8CaDhGKsi53pHsiD1
 M/iImy1bVPyyGitfDBcOaWvFOBRVgxODT6I3KkSbvRZbzqd7QXtFL7MUAvlWVvDQ7DeS
 UBEGjB5AWxk8ryTmj6c2qwIb4HziVq8Vshv8uv0b50JfFv3azyoNegXLJzceRXzwnZUO
 s56TVe+wt9iRSDyMe04stMleeIPC2nWLp/bWn+jqiMaardS1hIuldzqklN921hjSniCY
 tREGmcWvbXYbCQLhyUARDeBBRoHBiN2IuexMh21JRDlR6VDw2aEH5kcy2uda4Cw9USbe
 GCyA==
X-Gm-Message-State: AOAM5339saJi+VH8LhGP4kzeFWORgq/fFjWQSsxxx8/YrXts4l8fALDE
 CD0jZEdWIfUMpbM4QK/uk+Mnp0364pPkTfIDGJQ=
X-Google-Smtp-Source: ABdhPJyzzWa9paQxXHYFBMFScAZBlkmtyILKANDBBOx9rPPA/yxyu03vLu3qpQ9izu7tVqpx2AMkJo4APWbgLQB/p8I=
X-Received: by 2002:ab0:26d8:: with SMTP id b24mr14134972uap.58.1622633136111; 
 Wed, 02 Jun 2021 04:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210602105348.13387-1-rppt@kernel.org>
 <20210602105348.13387-5-rppt@kernel.org>
In-Reply-To: <20210602105348.13387-5-rppt@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Jun 2021 13:25:24 +0200
Message-ID: <CAMuHMdUUzMNcWNXCjwZmH-VBC+jH1ShBpeg6EBCdRXv3mwHxsQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] m68k: remove support for DISCONTIGMEM
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Jonathan Corbet <corbet@lwn.net>, 
 Matt Turner <mattst88@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>, 
 Richard Henderson <rth@twiddle.net>, Vineet Gupta <vgupta@synopsys.com>,
 kexec@lists.infradead.org, 
 alpha <linux-alpha@vger.kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 sparclinux <sparclinux@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_042538_010339_37A3E15F 
X-CRM114-Status: GOOD (  22.18  )
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

Hi Mike,

On Wed, Jun 2, 2021 at 12:54 PM Mike Rapoport <rppt@kernel.org> wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> DISCONTIGMEM was replaced by FLATMEM with freeing of the unused memory map
> in v5.11.
>
> Remove the support for DISCONTIGMEM entirely.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/arch/m68k/include/asm/page_mm.h
> +++ b/arch/m68k/include/asm/page_mm.h
> @@ -126,25 +126,7 @@ static inline void *__va(unsigned long x)
>
>  extern int m68k_virt_to_node_shift;
>
> -#ifndef CONFIG_DISCONTIGMEM
>  #define __virt_to_node(addr)   (&pg_data_map[0])

With pg_data_map[] removed, this definition can go as well.
Seems to be a leftover from 1008a11590b966b4 ("m68k: switch to MEMBLOCK
 + NO_BOOTMEM")

There are a few more:
arch/m68k/include/asm/mmzone.h:extern pg_data_t pg_data_map[];
arch/m68k/include/asm/mmzone.h:#define NODE_DATA(nid)
(&pg_data_map[nid])

> -#else
> -extern struct pglist_data *pg_data_table[];
> -
> -static inline __attribute_const__ int __virt_to_node_shift(void)
> -{
> -       int shift;
> -
> -       asm (
> -               "1:     moveq   #0,%0\n"
> -               m68k_fixup(%c1, 1b)
> -               : "=d" (shift)
> -               : "i" (m68k_fixup_vnode_shift));
> -       return shift;
> -}
> -
> -#define __virt_to_node(addr)   (pg_data_table[(unsigned long)(addr) >> __virt_to_node_shift()])
> -#endif

> --- a/arch/m68k/mm/init.c
> +++ b/arch/m68k/mm/init.c
> @@ -44,28 +44,8 @@ EXPORT_SYMBOL(empty_zero_page);
>
>  int m68k_virt_to_node_shift;
>
> -#ifdef CONFIG_DISCONTIGMEM
> -pg_data_t pg_data_map[MAX_NUMNODES];
> -EXPORT_SYMBOL(pg_data_map);
> -
> -pg_data_t *pg_data_table[65];
> -EXPORT_SYMBOL(pg_data_table);
> -#endif
> -

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
