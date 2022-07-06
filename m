Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F186CCA47C
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Jul 2022 10:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m58dxWv+Y6sou4f/48vyxvirvh2taZ3YaI+KCMAJx3w=; b=vIBMPxOSx1C2Gu
	TEwKkRyRPLSW0sTvVNYnMXkt5Y5p9wJZ4Pq0pNjk32btpI8NokMbQEg3NHLg3KEE52VRA4UIShciK
	S6esI9o85S9VN8tpp6KnxpeSeeNO5ugmqn6YhqFZN8jlJstIT7P8gsHalJcVN1ONOCVkN51yPOryJ
	emrsr4wDdQ2wCPRJZhc7VfNGx4BE79frbcJK48NqpNghkb7yoBBpODUb2yoL880n+dzAHOQWLdfjf
	Jql+8shSYESrVyY5dZvgUEQ4BmSViOFwpDfrnEJbi0X+xDdPDN6hwBSf2mtGoF4kLf6PTmpjK2ZTI
	+ohWES09j+Edo0+N/eCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o923F-008Ggl-LW; Wed, 06 Jul 2022 10:14:33 +0000
Received: from mail-qt1-f179.google.com ([209.85.160.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91th-0087dA-0L; Wed, 06 Jul 2022 10:04:42 +0000
Received: by mail-qt1-f179.google.com with SMTP id l14so17496310qtx.2;
        Wed, 06 Jul 2022 03:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bj57DZQxAwyQ5rJJj/iE7VR9xSo/KE2P6unWd/aXevs=;
        b=bMQbO+mR+HOc3Uc3GJKle8EQCw7F6lq6sLN8EQIlu60dg8IAigwz1AuT1PBjFbwKIZ
         INI19UDLnofBg9y7Dk8+ugd+o1b7P1FGb/hGwlNI4cOsvoPdFC/FceDwlARL/eD31+tV
         AIZDZOaFt1+HZP27haSQ0/OaucGrIkwMlXeMmRC0714w4qqZd8WkHnLDyr/Q6+Ctorm+
         AiXs5iNtYPNE5ClVxQJ+IlAGoceQq7Yv8f65mDDzIXA8JPY7NfC/dGLKIgsy3isOBFdf
         p6opM2ZNl+jIM79uoOwacJKnFOuOYpMcqp5Xf6j+LzdT4d+wXBgnqDeYlQzxa8tQRbys
         Ripg==
X-Gm-Message-State: AJIora9OMXXwfMP/gP7f68SH++WaoykPZmz8AF4V8ZzqQenCHi3ntfVc
	jRmTN9WjU23PjCUXxZY6Dj/Unwn75M8To7Yq
X-Google-Smtp-Source: AGRyM1usROoc+Zd+WlO3yBmMtfcxJ35WlHNyuS5loMGCfCgcgF8/F0qyzhChGcKJHjPzeJDL+jC//A==
X-Received: by 2002:ac8:5949:0:b0:317:bcb6:98ca with SMTP id 9-20020ac85949000000b00317bcb698camr31174000qtz.124.1657101875674;
        Wed, 06 Jul 2022 03:04:35 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id az16-20020a05620a171000b006af4a816963sm22353363qkb.133.2022.07.06.03.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 03:04:35 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 64so17199345ybt.12;
        Wed, 06 Jul 2022 03:04:35 -0700 (PDT)
X-Received: by 2002:a25:2b48:0:b0:668:3b7d:326c with SMTP id
 r69-20020a252b48000000b006683b7d326cmr41431788ybr.380.1657101874906; Wed, 06
 Jul 2022 03:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220630051630.1718927-1-anshuman.khandual@arm.com> <20220630051630.1718927-27-anshuman.khandual@arm.com>
In-Reply-To: <20220630051630.1718927-27-anshuman.khandual@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jul 2022 12:04:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJiS6vm2td-PBH3zpsNZJeeoudS4+yu4JG08sOi+XFdA@mail.gmail.com>
Message-ID: <CAMuHMdVJiS6vm2td-PBH3zpsNZJeeoudS4+yu4JG08sOi+XFdA@mail.gmail.com>
Subject: Re: [PATCH V6 26/26] mm/mmap: Drop ARCH_HAS_VM_GET_PAGE_PROT
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-csky@vger.kernel.org, 
	sparclinux <sparclinux@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Christoph Hellwig <hch@lst.de>, linux-s390 <linux-s390@vger.kernel.org>, 
	"open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, "the arch/x86 maintainers" <x86@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Christoph Hellwig <hch@infradead.org>, 
	arcml <linux-snps-arc@lists.infradead.org>, 
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, linux-um <linux-um@lists.infradead.org>, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>, Openrisc <openrisc@lists.librecores.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Parisc List <linux-parisc@vger.kernel.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_030441_205574_6EBB8AD0 
X-CRM114-Status: GOOD (  19.51  )
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

On Thu, Jun 30, 2022 at 7:20 AM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> Now all the platforms enable ARCH_HAS_GET_PAGE_PROT. They define and export
> own vm_get_page_prot() whether custom or standard DECLARE_VM_GET_PAGE_PROT.
> Hence there is no need for default generic fallback for vm_get_page_prot().
> Just drop this fallback and also ARCH_HAS_GET_PAGE_PROT mechanism.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  arch/m68k/Kconfig       |  1 -

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
