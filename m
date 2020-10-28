Return-Path: <SRS0=9eah=ED=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C77C4363A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 28 Oct 2020 09:26:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED20424680
	for <linux-snps-arc@archiver.kernel.org>; Wed, 28 Oct 2020 09:26:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FIR7OnZw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED20424680
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ir/7esYlkokDT16X7W+6FCAvcogdXJS3PK9Nn6xIuvE=; b=FIR7OnZwqEvvYcdvrbRkYNWq5
	8Yhplz1PJOeyKsrS9OYu2X1ge0kVGsrE3kS+qbJL+i9riB7uH8ivfZt/5vCF/4ojKrKVKNjQdWl35
	b2ND061/GnNqqHei3b2v1Qz5wnI2MWI6t3VFwbzjqMoKKQLw4tlrruJ6qGraREDp+EHoy/dRo7gnO
	AQfN9f+u3An9oyY0Akh7sz7ntAVMXS/D5lhJz2LY7/ZkEL7XrC53EVLBY8hmvi6BoigsA0tTa3/w9
	hRN5ARSpmr8THgbOeiuLdRSF/0h+msyu5vgAxrRWOVuhO7T5wlXGxCVaOQfILo/VjKZ1NqwXY11tG
	e7lQ1DYTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXhib-00026v-Sa; Wed, 28 Oct 2020 09:26:09 +0000
Received: from mail-oo1-f65.google.com ([209.85.161.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXhiU-00024k-8y; Wed, 28 Oct 2020 09:26:05 +0000
Received: by mail-oo1-f65.google.com with SMTP id f1so1014189oov.1;
 Wed, 28 Oct 2020 02:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+XN02PSejXD+FeqWTrgwKvG1TTSDYTM2yrZb6ygptq8=;
 b=HUBe1rg4EjE5bOuOOqV+Vwe8n7jtioAgLiFGRXF+2Mb4Y/CPeeZg4A9Tt/UV1D10va
 I13AZEec6NvtDTug/guz9BH3sOAxTf1fRyKArz1X4TdhHzrvzk/Xcl6kHpJBfO6lqSRl
 xkgGF/wGKv3dioxjdDabSJEZ26TlXOF3ssqzQfQeKozZdlCmigro23Sl78jxEG+B7gvn
 a3266FRbBoAFTbOaEvpbAO7w83yNyspG09Kt4jOjGXlx3oCXqVW8raq3VlwokstXhyDg
 r6VBJEkaCpiY+juttWR1BU6tme1kEFenOFonwUfDMx6WAKvLubEdG3zhNp/2plfDkHLM
 cCkQ==
X-Gm-Message-State: AOAM5339T0fLYjWnhj15KU4XhK0Vtu1+RfyxWDe6mF9Aaj4FU+nBOvKg
 4/KjXeVCdluiaLKxylHhkK/7bzCm6rbJUExVCho=
X-Google-Smtp-Source: ABdhPJwVZzki+tgZs/Q8WXcxtVj9dxZr8/KAouxapBQlbbCT10SMVoqLjSjBsdSeiewzamwEvqLH3hEqv+123K4FYD8=
X-Received: by 2002:a4a:5d84:: with SMTP id w126mr4993384ooa.1.1603877160928; 
 Wed, 28 Oct 2020 02:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201027112955.14157-1-rppt@kernel.org>
 <20201027112955.14157-12-rppt@kernel.org>
In-Reply-To: <20201027112955.14157-12-rppt@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Oct 2020 10:25:49 +0100
Message-ID: <CAMuHMdU4r4CJ1kBu7gx1jkputjDn2S8Lqkj7RPfa3XUnM1QOFg@mail.gmail.com>
Subject: Re: [PATCH 11/13] m68k/mm: make node data and node setup depend on
 CONFIG_DISCONTIGMEM
To: Mike Rapoport <rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_052602_341568_EC7F7C68 
X-CRM114-Status: GOOD (  17.03  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Linux MM <linux-mm@kvack.org>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michael Schmitz <schmitzmic@gmail.com>, Tony Luck <tony.luck@intel.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Mike,

On Tue, Oct 27, 2020 at 12:31 PM Mike Rapoport <rppt@kernel.org> wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> The pg_data_t node structures and their initialization currently depends on
> !CONFIG_SINGLE_MEMORY_CHUNK. Since they are required only for DISCONTIGMEM
> make this dependency explicit and replace usage of
> CONFIG_SINGLE_MEMORY_CHUNK with CONFIG_DISCONTIGMEM where appropriate.
>
> The CONFIG_SINGLE_MEMORY_CHUNK was implicitly disabled on the ColdFire MMU
> variant, although it always presumed a single memory bank. As there is no
> actual need for DISCONTIGMEM in this case, make sure that ColdFire MMU
> systems set CONFIG_SINGLE_MEMORY_CHUNK to 'y'.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Thanks for your patch!

> ---
>  arch/m68k/Kconfig.cpu           | 6 +++---
>  arch/m68k/include/asm/page_mm.h | 2 +-
>  arch/m68k/mm/init.c             | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)

Is there any specific reason you didn't convert the checks for
CONFIG_SINGLE_MEMORY_CHUNK in arch/m68k/kernel/setup_mm.c
and arch/m68k/include/asm/virtconvert.h?

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
