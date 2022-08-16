Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF6FC2BB41
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 Aug 2022 06:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BTlf48giPr13ewjk+CT/96Wv/nJkb9UwWAymIbCNTV0=; b=MpF8TRy1MaCrnn
	eSJoNINbemR8T4r2m7G2XKm+Yb/5UJSfJLJi5M3MhuUeyJ8qib91nWx3xfNDPKdeBdAwD4/k3/Sc7
	B/6GDtOoKsnMUEFKaGolSjgTnmmlUex9T+R6iqAe4EJIfE33ynwZhtffzfQUnKUt9v5jZD/hxk5pY
	ingUpkHaABUYWhlS+G9GAG/rot1p9uXEPecfH090f6zt/2N9ZnSDEx4JzssChrJ2WU/cxWSSM6wsh
	+Gukzzuc3RdGwRUc/2XVrDofqiF82w4HkB1w2n2yRhi78uND6pCig5hqUo/y0/b4ZVGa8sYWWsFuM
	i7aztXxpHkqVMe1Drd2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNqLl-00E0MN-OY; Tue, 16 Aug 2022 06:46:53 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNqLi-00E0JF-Li; Tue, 16 Aug 2022 06:46:51 +0000
Received: by mail-ot1-f54.google.com with SMTP id q39-20020a056830442700b0063889adc0ddso5980537otv.1;
        Mon, 15 Aug 2022 23:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=mQKxHhlVCpHcdp8dQEIScJFQsrh06tzn535mwalxKj0=;
        b=i+BBNXpUN7+rwcushLFR4jZsMr4f1xaZdjfIouW7MN7uvC/Dkcrusqi6pwF6ju8yxk
         1VhHwNPfZKYPUxgnh1Cp3ZeqZfNaTEUYBmPtsoK9zYkr068KmQZFrO6tD+3wlFpjcLLm
         ehA5pC5Ubj2CAhu6aW8m1WX04pKB45oULh/Bza6ZeF4rojQjnIksxlRpPUUMy1IWwIOl
         aYYPK+vsaJhEbwBKP7Q4LgLVQx7ePUtnEI6zlu+IOYXi6mWumw7D1paj3tbDK/BHHXZ2
         9VACL+rmTZNsOqrLAt+tj+lXAdVNGmkzdWIvD1wl7O/7t92s6Z0Pn5L8KGy2RMtJ9cSP
         gNUQ==
X-Gm-Message-State: ACgBeo3LINiEjyh3fvI0/bK5eOklb5eNplMuo84A6OZAhv8QLFleL2vS
	V77RC90nuFvgobqHW50zFF8dIWYfzKLs6g==
X-Google-Smtp-Source: AA6agR6FDksTTiNWo6RlQL7eMtB6PqhzxaaMi/LIIXmC1KnjGmrvqNfARfa8zmwPgiGOCYLWPaBrBg==
X-Received: by 2002:a05:6830:10b:b0:636:e86d:ffed with SMTP id i11-20020a056830010b00b00636e86dffedmr7356646otp.245.1660632408409;
        Mon, 15 Aug 2022 23:46:48 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id w21-20020a9d70d5000000b00618fa37308csm2497331otj.35.2022.08.15.23.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 23:46:45 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso6884528otb.6;
        Mon, 15 Aug 2022 23:46:42 -0700 (PDT)
X-Received: by 2002:a05:6902:100a:b0:676:ed53:25b0 with SMTP id
 w10-20020a056902100a00b00676ed5325b0mr13356288ybt.365.1660632391068; Mon, 15
 Aug 2022 23:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220815143959.1511278-1-zi.yan@sent.com>
In-Reply-To: <20220815143959.1511278-1-zi.yan@sent.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Aug 2022 08:46:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWohdUZxi3A=H1wqY4rYrLD-ME6mmhWb6Z-udovd=1BhQ@mail.gmail.com>
Message-ID: <CAMuHMdWohdUZxi3A=H1wqY4rYrLD-ME6mmhWb6Z-udovd=1BhQ@mail.gmail.com>
Subject: Re: [PATCH] arch: mm: rename FORCE_MAX_ZONEORDER to ARCH_FORCE_MAX_ORDER
To: Zi Yan <ziy@nvidia.com>
Cc: Linux MM <linux-mm@kvack.org>, David Hildenbrand <david@redhat.com>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>, 
	John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	Mike Rapoport <rppt@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Mike Rapoport <rppt@linux.ibm.com>, Vineet Gupta <vgupta@synopsys.com>, 
	Shawn Guo <shawnguo@kernel.org>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Qin Jian <qinjian@cqplus1.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, "David S. Miller" <davem@davemloft.net>, 
	Chris Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>, Ley Foon Tan <ley.foon.tan@intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, NXP Linux Team <linux-imx@nxp.com>, 
	arcml <linux-snps-arc@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-oxnas@groups.io, 
	linux-csky@vger.kernel.org, 
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, loongarch@lists.linux.dev, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, 
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_234650_719988_EDA30865 
X-CRM114-Status: GOOD (  18.53  )
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

On Mon, Aug 15, 2022 at 4:40 PM Zi Yan <zi.yan@sent.com> wrote:
> From: Zi Yan <ziy@nvidia.com>
>
> This Kconfig option is used by individual arch to set its desired
> MAX_ORDER. Rename it to reflect its actual use.
>
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Signed-off-by: Zi Yan <ziy@nvidia.com>

>  arch/m68k/Kconfig.cpu                        | 2 +-

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
