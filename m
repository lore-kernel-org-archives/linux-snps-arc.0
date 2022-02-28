Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66913C433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Feb 2022 13:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZ1AqY1wAd8AHAJGe3Pr+G2t9M0DYQk2WYDVEKv/4Lg=; b=lDP+rM3Y6IHtqO
	bo3aUoGwPCZWBE+twLooSoCN8hTskImEZnRCb85YuYaB8HRbHcmkVZqHKBAg120shlcL3HucotJsg
	PP6i4U0aHxt9JF77Ijlv0eOV9XFXPj6PXc0a2SKjbbFjsCCYXmx6vQrBJH7PJZK5ZI0Kw1T4PE4ac
	tPtoENM1sKTXav/FIwJnH+h2u55qhYojANKszSZUdUUIDbJlCEsXXUEKWGKxsysebLuADGWhwqnza
	q4+27mUthdEORllD37qoxgG18CmaCooe+pd5/FoI8lNXr8oxpQRatO4AJtJVhgyDv2Z2324ZkC9fM
	JK3yRrN3xJYoR8DlBR/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOgU7-00Chqz-B0; Mon, 28 Feb 2022 13:54:43 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOgOw-00Cg8Z-0D; Mon, 28 Feb 2022 13:49:24 +0000
Received: by mail-vk1-f179.google.com with SMTP id m195so2609855vka.5;
 Mon, 28 Feb 2022 05:49:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ZlhBssXvwBUH+DmkM+uVIB26RD/VtgYSa5UcFW0OSE=;
 b=w2KeJyPlbToh2mVN+TQoHpbKHZ4DDmVM/XsZJmUyRIzmXXVXH78QpYWquy8boISXxi
 aNrJOXpn0Up1mAK2e6MVqJxv/F2795ZCzLtbDO3lmFDMkEgZDuGyQrF3KZ+s8bSzVjIV
 8Mam7IVHEdifLHIGL9bjc7CDOpak8R1Su7K3Sz1vxrf2O4ajF47Bsf9V8YSOZcdr4Noq
 F0VTNxrso7q4EGQdDHcpNrtqBp+sk5bhYirtNge8Z4JfwGYx5Oc/IRcX8lzDG6quKVB1
 EMlSwh0SuFq4YzJCTnzwcat2G9mGmKk8YO7tBCqwIquZ9q/dMJM5/44rQ+0XB/2TeHlD
 NNxQ==
X-Gm-Message-State: AOAM530yMPHbEpwAV3CQSyaKJd8DJ9oYagz0TL1Yeag/9lAiYu6bUOzv
 +zNgeqWkGiNuvJfWOOXJl14jFMWW4RVpGg==
X-Google-Smtp-Source: ABdhPJyP1HtKZ+sPxWSe6XiIiB0etnOr0tkdoDAqBSVKViq0DnvbIN2QWe7VO8l5wdegrAVcoU1jiQ==
X-Received: by 2002:a05:6122:1079:b0:32c:a52c:88a5 with SMTP id
 k25-20020a056122107900b0032ca52c88a5mr8083980vko.19.1646056159646; 
 Mon, 28 Feb 2022 05:49:19 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com.
 [209.85.217.46]) by smtp.gmail.com with ESMTPSA id
 s18-20020a05612204d200b00332f05df61bsm1363559vkn.49.2022.02.28.05.49.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 05:49:18 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id w4so13029669vsq.1;
 Mon, 28 Feb 2022 05:49:18 -0800 (PST)
X-Received: by 2002:a67:af08:0:b0:31b:9451:bc39 with SMTP id
 v8-20020a67af08000000b0031b9451bc39mr7516436vsl.68.1646056157983; Mon, 28 Feb
 2022 05:49:17 -0800 (PST)
MIME-Version: 1.0
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
 <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
In-Reply-To: <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Feb 2022 14:49:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWve8XkqtMJCTB_BH9JRZ8C4f7ynF60D1fvx3hxaK4YzA@mail.gmail.com>
Message-ID: <CAMuHMdWve8XkqtMJCTB_BH9JRZ8C4f7ynF60D1fvx3hxaK4YzA@mail.gmail.com>
Subject: Re: [PATCH V3 09/30] arm/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 sparclinux <sparclinux@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 linux-s390 <linux-s390@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 alpha <linux-alpha@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, 
 arcml <linux-snps-arc@lists.infradead.org>, linux-csky@vger.kernel.org, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 Openrisc <openrisc@lists.librecores.org>,
 linux-um <linux-um@lists.infradead.org>, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, 
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_054922_113284_2EE1FF65 
X-CRM114-Status: GOOD (  25.68  )
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

Hi Russell,

On Mon, Feb 28, 2022 at 11:57 AM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Mon, Feb 28, 2022 at 04:17:32PM +0530, Anshuman Khandual wrote:
> > This defines and exports a platform specific custom vm_get_page_prot() via
> > subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
> > macros can be dropped which are no longer needed.
>
> What I would really like to know is why having to run _code_ to work out
> what the page protections need to be is better than looking it up in a
> table.
>
> Not only is this more expensive in terms of CPU cycles, it also brings
> additional code size with it.
>
> I'm struggling to see what the benefit is.

I was wondering about that as well. But at least for code size on
m68k, this didn't have much impact.  Looking at the generated code,
the increase due to using code for the (few different) cases is offset
by a 16-bit jump table (which is to be credited to the compiler).

In terms of CPU cycles, it's indeed worse than before.

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
